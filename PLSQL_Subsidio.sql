CREATE OR REPLACE TRIGGER tgr_mult_region
    BEFORE INSERT ON proc_asig_punt
    FOR EACH ROW
    DECLARE
    v_postulacion postulacion.id_postulacion%TYPE;
    v_region comuna.id_region%TYPE;
    v_contador NUMBER;
    v_reg comuna.id_region%TYPE;
    v_porcentaje porc_region.porcentaje%TYPE;
    BEGIN 
        SELECT id_postulacion INTO v_postulacion FROM postulacion WHERE rut_post = :new.run_postulante;
        SELECT c.id_region, COUNT(c.id_region) INTO v_region, v_contador FROM vivienda v JOIN comuna c ON c.id_comuna=v.id_comuna WHERE v.id_postulacion=v_postulacion GROUP BY c.id_region;
        
        IF v_region IN ('XV', 'I', 'XI', 'XII') THEN
            SELECT porcentaje INTO v_porcentaje FROM porc_region WHERE id_region=v_region;
            :new.puntaje_total:=:new.puntaje_total*v_porcentaje;
        END IF;
    END tgr_mult_region;

CREATE OR REPLACE PACKAGE pkg_asig_puntaje IS
    v_subprograma errores_proc_asig_puntaje.subprograma%TYPE;
    v_id_est_civil estado_civil.id_est_civ%TYPE;
    v_men_err errores_proc_asig_puntaje.mensaje%TYPE;
    v_postulacion postulacion.id_postulacion%TYPE;
    
    
    FUNCTION fn_edad(nacimiento DATE) RETURN NUMBER;
    FUNCTION fn_total_carga(postulacion NUMBER) RETURN NUMBER;
    FUNCTION fn_est_civil(rut VARCHAR2) RETURN VARCHAR2;
    PROCEDURE sp_asig_puntaje;
    
END pkg_asig_puntaje;

CREATE OR REPLACE PACKAGE BODY pkg_asig_puntaje IS
    
    PROCEDURE sp_errores(correlativo NUMBER, subprograma VARCHAR2, mensaje VARCHAR2) IS
        BEGIN
            EXECUTE IMMEDIATE 'INSERT INTO errores_proc_asig_puntaje VALUES (:cor, :sub, :men)' USING correlativo, subprograma, mensaje;
    END sp_errores;
    
    FUNCTION fn_edad(nacimiento DATE) RETURN NUMBER IS
    BEGIN
        v_subprograma:='Cálculo edad (fn_edad)';
        RETURN TRUNC(MONTHS_BETWEEN(sysdate, nacimiento)/12);
    END fn_edad;
    
    FUNCTION fn_total_carga(postulacion NUMBER) RETURN NUMBER IS
    v_cont_carga NUMBER;
    BEGIN
        v_subprograma:='Cálculo cantidad de cargas (fn_total_carga)';
        EXECUTE IMMEDIATE 'SELECT COUNT(cf.rut_carga) FROM carga_familiar cf JOIN acredita_carga ac ON ac.id_acred_carga=cf.id_acreditacion JOIN postulacion p ON p.id_acred_carga=ac.id_acred_carga WHERE p.id_postulacion=:post' 
        INTO v_cont_carga USING postulacion;
        RETURN v_cont_carga;
    END fn_total_carga;
    
    FUNCTION fn_est_civil(rut VARCHAR2) RETURN VARCHAR2 IS
    v_est_civil estado_civil.descripcion%TYPE;
    BEGIN
        v_subprograma:='Descripción estado civil (fn_est_civil)';
        SELECT ec.descripcion INTO v_est_civil FROM estado_civil ec JOIN postulante p ON p.id_est_civ=ec.id_est_civ WHERE p.rut_post=rut;
        RETURN v_est_civil;
    END fn_est_civil;
    
    FUNCTION fn_punt_carga(cargas NUMBER) RETURN NUMBER IS
        v_punt_carga puntaje_cargas.puntaje%type;
        BEGIN
            v_subprograma:='Cálculo puntaje carga (fn_punt_carga)';
            SELECT puntaje INTO v_punt_carga FROM puntaje_cargas WHERE cargas BETWEEN carga_inf AND carga_sup;
            RETURN v_punt_carga;
    END fn_punt_carga;
    
    FUNCTION fn_punt_ahorro(ahorro NUMBER) RETURN NUMBER IS
        v_punt_ahorro puntaje_ahorro.puntaje%TYPE;
        BEGIN
            v_subprograma:='Cálculo puntaje ahorro (fn_punt_ahorro)';
            EXECUTE IMMEDIATE 'SELECT puntaje FROM puntaje_ahorro WHERE :aho BETWEEN ahorro_inf AND ahorro_sup' INTO v_punt_ahorro USING ahorro;
            RETURN v_punt_ahorro;
    END fn_punt_ahorro;
    
    PROCEDURE sp_asig_puntaje IS
        CURSOR cur_postulante IS
            SELECT rut_post, fecha_nacimiento, id_est_civ, id_titulo FROM postulante;
                
        v_acred_pueblo postulacion.id_acred_pueblo%TYPE;
        v_libreta postulacion.id_libreta%TYPE;        
        v_edad proc_asig_punt.edad%TYPE;
        v_punt_edad proc_asig_punt.puntaje_edad%TYPE;
        v_cargas proc_asig_punt.cargas_familiares%TYPE;
        v_punt_carga proc_asig_punt.puntaje_cargas_familiares%TYPE;
        v_est_civil proc_asig_punt.estado_civil%TYPE;
        v_punt_civ proc_asig_punt.puntaje_estado_civil%TYPE;
        v_ap acredita_carga.acredita%TYPE;
        v_pueblo proc_asig_punt.pueblo_ind_orig%TYPE;
        v_punt_pueblo proc_asig_punt.puntaje_pueblo_ind_orig%TYPE;
        v_ahorro proc_asig_punt.monto_ahorro%TYPE;
        v_punt_ahorro proc_asig_punt.puntaje_monto_ahorro%TYPE;
        v_titulo proc_asig_punt.titulo%TYPE;
        v_tipo_titulo tipo_titulo.id_tipo%TYPE;
        v_punt_titulo proc_asig_punt.puntaje_titulo%TYPE;
        v_punt_total proc_asig_punt.puntaje_total%TYPE;
        
        BEGIN
            EXECUTE IMMEDIATE 'TRUNCATE TABLE proc_asig_punt DROP STORAGE';
            
            FOR reg_postulante IN cur_postulante LOOP
                BEGIN
                    
                   SELECT id_postulacion, id_acred_pueblo, id_libreta INTO v_postulacion, v_acred_pueblo, v_libreta FROM postulacion WHERE rut_post = reg_postulante.rut_post;
                   
                    --Calculo edad y puntaje
                    v_edad:=fn_edad(reg_postulante.fecha_nacimiento);
                    SELECT puntaje INTO v_punt_edad FROM puntaje_edad WHERE v_edad BETWEEN edad_inf AND edad_sup;
                    
                    --Cálculo cargas y puntaje
                    v_cargas:=fn_total_carga(v_postulacion);
                    v_punt_carga:=fn_punt_carga(v_cargas);
                    
                    --Estado civil con puntaje
                    v_est_civil:=fn_est_civil(reg_postulante.rut_post);
                    SELECT puntaje INTO v_punt_civ FROM puntaje_est_civ WHERE id_estado=reg_postulante.id_est_civ;
                    
                    --Pueblo originario con puntaje
                    BEGIN
                        SELECT ap.acredita, descripcion INTO v_ap, v_pueblo FROM acredita_pueblo ap JOIN pueblo_orig_ind poi ON poi.id_pueblo=ap.id_pueblo WHERE id_acred_pueblo = v_acred_pueblo;
                   EXCEPTION 
                        WHEN OTHERS THEN
                            v_ap:='N';
                            v_pueblo:='No';
                    END;
                    SELECT puntaje INTO v_punt_pueblo FROM puntaje_pueblo WHERE acredita = v_ap;
                    --Ahorro con puntaje
                    SELECT ahorro INTO v_ahorro FROM libreta_ahorro WHERE id_libreta = v_libreta;
                    SELECT puntaje INTO v_punt_ahorro FROM puntaje_ahorro WHERE v_ahorro BETWEEN ahorro_inf AND ahorro_sup;
                    
                    --Titulo con puntaje
                    SELECT nombre, id_tipo INTO v_titulo, v_tipo_titulo FROM titulo WHERE id_titulo=reg_postulante.id_titulo;
                    SELECT puntaje INTO v_punt_titulo FROM puntaje_titulo WHERE id_tipo=v_tipo_titulo;
                    
                    --Puntaje total
                    v_punt_total:=v_punt_edad+v_punt_carga+v_punt_civ+v_punt_pueblo+v_punt_ahorro+v_punt_titulo;
                    
                    --Insertar datos
                    INSERT INTO proc_asig_punt VALUES(reg_postulante.rut_post, v_edad, v_punt_edad, v_cargas, v_punt_carga, v_est_civil, v_punt_civ, v_pueblo, v_punt_pueblo, v_ahorro, v_punt_ahorro, v_titulo, v_punt_titulo, v_punt_total);
                
                EXCEPTION
                    WHEN OTHERS THEN
                        v_men_err:=SQLERRM;
                        sp_errores(seq_error.nextval, v_subprograma, v_men_err);
                END;
            END LOOP;
    END sp_asig_puntaje;
    
END pkg_asig_puntaje;