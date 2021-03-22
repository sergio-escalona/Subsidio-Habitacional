--Usar usuario admin

--Usuario Subsidio
CREATE USER SUBSIDIO IDENTIFIED BY SUBSIDIO;
GRANT CONNECT TO SUBSIDIO;
GRANT RESOURCE TO SUBSIDIO;
GRANT DBA TO SUBSIDIO;
GRANT CREATE VIEW TO SUBSIDIO;
CREATE OR REPLACE DIRECTORY DIR_POSTULANTES AS 'C:\postulantes';
GRANT READ, WRITE ON DIRECTORY DIR_POSTULANTES TO SUBSIDIO;

--Sinonimo para la vista
CREATE PUBLIC SYNONYM sym_vista_puntaje FOR subsidio.vw_puntaje_postulante;
CREATE OR REPLACE PUBLIC SYNONYM sym_calculo_puntaje FOR subsidio.pkg_asig_puntaje;

--Usuario consultor
CREATE USER CONSULTOR IDENTIFIED BY CONSULTOR;
CREATE ROLE rol_consulta;
GRANT SELECT ON sym_vista_puntaje TO rol_consulta;
GRANT EXECUTE ON sym_calculo_puntaje TO rol_consulta;
GRANT rol_consulta TO CONSULTOR;

--Usuario administrador
CREATE USER ADMINISTRADOR IDENTIFIED BY ADMINISTRADOR;
CREATE ROLE rol_administra;
GRANT SELECT ON sym_vista_puntaje TO rol_administra;
GRANT EXECUTE ON sym_calculo_puntaje TO rol_administra;
GRANT rol_administra TO ADMINISTRADOR;


--Dar consulta y alterar tablas del usuario subsidio
--Usar usuario subsidio

--Select en rol consultor
DECLARE
    CURSOR cur_tablas IS
        SELECT table_name FROM user_tables;
v_grant VARCHAR2(200);
BEGIN
    FOR reg_tablas IN cur_tablas LOOP
        v_grant := 'GRANT SELECT ON '||reg_tablas.table_name||' TO rol_consulta';
        EXECUTE IMMEDIATE v_grant;
    END LOOP;
END;

--Select y modificar en rol administrador
DECLARE
    CURSOR cur_tablas IS
        SELECT table_name FROM user_tables;
v_grant VARCHAR2(200);
BEGIN
    FOR reg_tablas IN cur_tablas LOOP
        v_grant := 'GRANT SELECT, UPDATE, DELETE  ON '||reg_tablas.table_name||' TO rol_administra';
        EXECUTE IMMEDIATE v_grant;
    END LOOP;
END;
