CREATE TABLE acredita_carga (
    id_acred_carga   NUMBER NOT NULL,
    acredita         CHAR(1) NOT NULL,
    fecha            DATE
);

ALTER TABLE acredita_carga ADD CONSTRAINT acredita_carga_pk PRIMARY KEY ( id_acred_carga );

CREATE TABLE acredita_pueblo (
    id_acred_pueblo   NUMBER NOT NULL,
    acredita          CHAR(1) NOT NULL,
    fecha             DATE,
    id_pueblo         NUMBER NOT NULL
);

ALTER TABLE acredita_pueblo ADD CONSTRAINT acredita_pueblo_pk PRIMARY KEY ( id_acred_pueblo );

CREATE TABLE agrupacion (
    id_agrupacion   NUMBER NOT NULL,
    descripcion     VARCHAR2(20) NOT NULL
);

ALTER TABLE agrupacion ADD CONSTRAINT agrupacion_pk PRIMARY KEY ( id_agrupacion );

CREATE TABLE ant_administrativos (
    id_ant_adm      NUMBER NOT NULL,
    num_permiso     NUMBER NOT NULL,
    fecha_permiso   DATE NOT NULL,
    m2              NUMBER NOT NULL,
    annio_cons      NUMBER NOT NULL,
    num_recepcion   NUMBER NOT NULL,
    fecha_recep     DATE NOT NULL
);

ALTER TABLE ant_administrativos ADD CONSTRAINT ant_administrativos_pk PRIMARY KEY ( id_ant_adm );

CREATE TABLE ant_constructivos (
    id_ant_cons           NUMBER NOT NULL,
    id_tipo               NUMBER NOT NULL,
    pisos                 NUMBER NOT NULL,
    id_agrupacion         NUMBER NOT NULL,
    estar                 CHAR(1) NOT NULL,
    comedor               CHAR(1) NOT NULL,
    cocina                CHAR(1) NOT NULL,
    loggia                CHAR(1) NOT NULL,
    balcon                CHAR(1) NOT NULL,
    dormitorio            NUMBER NOT NULL,
    baño                  NUMBER NOT NULL,
    estacionamiento       CHAR(1) NOT NULL,
    bodega                CHAR(1) NOT NULL,
    otro                  CHAR(1) NOT NULL,
    superficie_vivienda   NUMBER NOT NULL,
    superficie_terreno    NUMBER NOT NULL,
    techumbre             VARCHAR2(30) NOT NULL,
    muros                 VARCHAR2(30) NOT NULL,
    piso                  VARCHAR2(30) NOT NULL
);

ALTER TABLE ant_constructivos ADD CONSTRAINT ant_constructivos_pk PRIMARY KEY ( id_ant_cons );

CREATE TABLE carga_familiar (
    rut_carga         VARCHAR2(10) NOT NULL,
    id_acreditacion   NUMBER NOT NULL,
    apaterno          VARCHAR2(20) NOT NULL,
    amaterno          VARCHAR2(20) NOT NULL,
    nombres           VARCHAR2(50) NOT NULL,
    id_relacion       NUMBER NOT NULL
);

ALTER TABLE carga_familiar ADD CONSTRAINT carga_familiar_pk PRIMARY KEY ( rut_carga );

CREATE TABLE categoria (
    id_categoria   NUMBER NOT NULL,
    descripcion    VARCHAR2(20) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE comuna (
    id_comuna   NUMBER NOT NULL,
    nombre      VARCHAR2(30) NOT NULL,
    id_region   VARCHAR2(5) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE consultor (
    rut_cons       VARCHAR2(10) NOT NULL,
    apaterno       VARCHAR2(20) NOT NULL,
    amaterno       VARCHAR2(20) NOT NULL,
    nombres        VARCHAR2(50) NOT NULL,
    telefono       NUMBER NOT NULL,
    correo         VARCHAR2(50) NOT NULL,
    rol            NUMBER NOT NULL,
    id_categoria   NUMBER NOT NULL
);

ALTER TABLE consultor ADD CONSTRAINT consultor_pk PRIMARY KEY ( rut_cons );

CREATE TABLE consultor_resolucion (
    rut_cons        VARCHAR2(10) NOT NULL,
    id_resolucion   NUMBER NOT NULL
);

ALTER TABLE consultor_resolucion ADD CONSTRAINT relation_57_pk PRIMARY KEY ( rut_cons,
                                                                             id_resolucion );

CREATE TABLE contacto (
    id_contacto     NUMBER NOT NULL,
    tel_trabajo     NUMBER,
    tel_domicilio   NUMBER,
    tel_movil       NUMBER NOT NULL,
    codigo_postal   NUMBER NOT NULL,
    email           VARCHAR2(50) NOT NULL,
    rut_post        VARCHAR2(10) NOT NULL
);

CREATE UNIQUE INDEX contacto__idx ON
    contacto (
        rut_post
    ASC );

ALTER TABLE contacto ADD CONSTRAINT contacto_pk PRIMARY KEY ( id_contacto );

CREATE TABLE conyuge (
    rut_conyu          VARCHAR2(10) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    apaterno           VARCHAR2(20) NOT NULL,
    amaterno           VARCHAR2(20) NOT NULL,
    nombres            VARCHAR2(30) NOT NULL
);

ALTER TABLE conyuge ADD CONSTRAINT conyuge_pk PRIMARY KEY ( rut_conyu );

CREATE TABLE direccion (
    id_direccion   NUMBER NOT NULL,
    calle          VARCHAR2(100) NOT NULL,
    numero         NUMBER NOT NULL,
    block          VARCHAR2(10),
    departamento   NUMBER,
    manzana        VARCHAR2(20),
    sitio          VARCHAR2(20),
    localidad      VARCHAR2(20),
    poblacion      VARCHAR2(20) NOT NULL,
    id_comuna      NUMBER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( id_direccion );

CREATE TABLE economica (
    id_economica   NUMBER NOT NULL,
    descripcion    VARCHAR2(2) NOT NULL
);

ALTER TABLE economica ADD CONSTRAINT economica_pk PRIMARY KEY ( id_economica );

CREATE TABLE entidad_financiera (
    id_entidad   NUMBER NOT NULL,
    nombre       VARCHAR2(30) NOT NULL
);

ALTER TABLE entidad_financiera ADD CONSTRAINT entidad_financiera_pk PRIMARY KEY ( id_entidad );

CREATE TABLE errores_proc_asig_puntaje (
    id_error      NUMBER NOT NULL,
    subprograma   VARCHAR2(50) NOT NULL,
    mensaje       VARCHAR2(100) NOT NULL
);

ALTER TABLE errores_proc_asig_puntaje ADD CONSTRAINT errores_proc_asig_puntaje_pk PRIMARY KEY ( id_error );

CREATE TABLE estado_civil (
    id_est_civ    NUMBER NOT NULL,
    descripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE estado_civil ADD CONSTRAINT estado_civil_pk PRIMARY KEY ( id_est_civ );

CREATE TABLE estado_conservacion (
    id_est_con            NUMBER NOT NULL,
    id_estado             NUMBER NOT NULL,
    terreno               CHAR(1) NOT NULL,
    plagas                CHAR(1) NOT NULL,
    fundaciones           CHAR(1) NOT NULL,
    muros                 CHAR(1) NOT NULL,
    entrepiso             CHAR(1) NOT NULL,
    estructura            CHAR(1) NOT NULL,
    red_agua              CHAR(1) NOT NULL,
    red_alcantarilla      CHAR(1) NOT NULL,
    red_electricidad      CHAR(1) NOT NULL,
    red_gas               CHAR(1) NOT NULL,
    humedad               CHAR(1) NOT NULL,
    radier                CHAR(1) NOT NULL,
    tabique               CHAR(1) NOT NULL,
    revest_ext            CHAR(1) NOT NULL,
    revest_int            CHAR(1) NOT NULL,
    puertas_ventanas      CHAR(1) NOT NULL,
    cubierta              CHAR(1) NOT NULL,
    artefacto_agua        CHAR(1) NOT NULL,
    artefacto_electrico   CHAR(1) NOT NULL,
    observaciones         VARCHAR2(100) NOT NULL
);

ALTER TABLE estado_conservacion ADD CONSTRAINT estado_conservacion_pk PRIMARY KEY ( id_est_con );

CREATE TABLE estado_general (
    id_estado     NUMBER NOT NULL,
    descripcion   VARCHAR2(10) NOT NULL
);

ALTER TABLE estado_general ADD CONSTRAINT estado_general_pk PRIMARY KEY ( id_estado );

CREATE TABLE institucion (
    id_institucion   NUMBER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL
);

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( id_institucion );

CREATE TABLE libreta_ahorro (
    id_libreta       NUMBER NOT NULL,
    id_entidad       NUMBER NOT NULL,
    rut_titular      VARCHAR2(10) NOT NULL,
    num_cuenta       NUMBER NOT NULL,
    fecha_apertura   DATE NOT NULL,
    ahorro           NUMBER NOT NULL,
    id_tipo          NUMBER NOT NULL,
    id_rol           NUMBER NOT NULL
);

ALTER TABLE libreta_ahorro ADD CONSTRAINT libreta_ahorro_pk PRIMARY KEY ( id_libreta );

CREATE TABLE nacionalidad (
    id_nacion   NUMBER NOT NULL,
    nombre      VARCHAR2(30) NOT NULL
);

ALTER TABLE nacionalidad ADD CONSTRAINT nacionalidad_pk PRIMARY KEY ( id_nacion );

CREATE TABLE nacionalidad_conyuge (
    rut_conyu   VARCHAR2(10) NOT NULL,
    id_nacion   NUMBER NOT NULL
);

ALTER TABLE nacionalidad_conyuge ADD CONSTRAINT relation_45_pk PRIMARY KEY ( rut_conyu,
                                                                             id_nacion );

CREATE TABLE nacionalidad_postulante (
    id_nacion   NUMBER NOT NULL,
    rut_post    VARCHAR2(10) NOT NULL
);

ALTER TABLE nacionalidad_postulante ADD CONSTRAINT relation_40_pk PRIMARY KEY ( id_nacion,
                                                                                rut_post );

CREATE TABLE nivel_escolaridad (
    id_escolaridad   NUMBER NOT NULL,
    descripcion      VARCHAR2(20) NOT NULL
);

ALTER TABLE nivel_escolaridad ADD CONSTRAINT nivel_esc_pk PRIMARY KEY ( id_escolaridad );

CREATE TABLE oficina (
    id_oficina   NUMBER NOT NULL,
    id_comuna    NUMBER NOT NULL,
    direccion    VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX oficina__idx ON
    oficina (
        id_comuna
    ASC );

ALTER TABLE oficina ADD CONSTRAINT oficina_pk PRIMARY KEY ( id_oficina );

CREATE TABLE porc_region (
    id_porcentaje   NUMBER NOT NULL,
    id_region       VARCHAR2(5) NOT NULL,
    porcentaje      NUMBER NOT NULL
);

ALTER TABLE porc_region ADD CONSTRAINT porc_region_pk PRIMARY KEY ( id_porcentaje );

CREATE TABLE postulacion (
    id_postulacion    NUMBER NOT NULL,
    id_oficina        NUMBER NOT NULL,
    id_tramo          NUMBER NOT NULL,
    id_libreta        NUMBER NOT NULL,
    fecha             DATE NOT NULL,
    rut_post          VARCHAR2(10) NOT NULL,
    rut_recep         VARCHAR2(10) NOT NULL,
    id_acred_carga    NUMBER,
    id_acred_pueblo   NUMBER
);

CREATE UNIQUE INDEX postulacion__idx ON
    postulacion (
        rut_post
    ASC );

CREATE UNIQUE INDEX postulacion__idxv1 ON
    postulacion (
        id_libreta
    ASC );

CREATE UNIQUE INDEX postulacion__idxv2 ON
    postulacion (
        id_acred_carga
    ASC );

CREATE UNIQUE INDEX postulacion__idxv3 ON
    postulacion (
        id_acred_pueblo
    ASC );

ALTER TABLE postulacion ADD CONSTRAINT postulacion_pk PRIMARY KEY ( id_postulacion );

CREATE TABLE postulante (
    rut_post           VARCHAR2(10) NOT NULL,
    fotografia         BLOB NOT NULL,
    id_est_civ         NUMBER NOT NULL,
    id_escolaridad     NUMBER NOT NULL,
    id_titulo          NUMBER,
    fecha_nacimiento   DATE NOT NULL,
    apaterno           VARCHAR2(30) NOT NULL,
    amaterno           VARCHAR2(30) NOT NULL,
    nombres            VARCHAR2(30) NOT NULL,
    rut_conyu          VARCHAR2(10),
    id_direccion       NUMBER NOT NULL
);

CREATE UNIQUE INDEX postulante__idx ON
    postulante (
        rut_conyu
    ASC );

CREATE UNIQUE INDEX postulante__idxv1 ON
    postulante (
        id_direccion
    ASC );

ALTER TABLE postulante ADD CONSTRAINT postulante_pk PRIMARY KEY ( rut_post );

CREATE TABLE proc_asig_punt (
    run_postulante              VARCHAR2(10) NOT NULL,
    edad                        NUMBER NOT NULL,
    puntaje_edad                NUMBER NOT NULL,
    cargas_familiares           NUMBER NOT NULL,
    puntaje_cargas_familiares   NUMBER NOT NULL,
    estado_civil                VARCHAR2(20) NOT NULL,
    puntaje_estado_civil        NUMBER NOT NULL,
    pueblo_ind_orig             VARCHAR2(30) NOT NULL,
    puntaje_pueblo_ind_orig     NUMBER NOT NULL,
    monto_ahorro                NUMBER NOT NULL,
    puntaje_monto_ahorro        NUMBER NOT NULL,
    titulo                      VARCHAR2(50) NOT NULL,
    puntaje_titulo              NUMBER NOT NULL,
    puntaje_total               NUMBER NOT NULL
);

ALTER TABLE proc_asig_punt ADD CONSTRAINT proc_asig_punt_pk PRIMARY KEY ( run_postulante );

CREATE TABLE propietario (
    rut_prop   VARCHAR2(10) NOT NULL,
    apaterno   VARCHAR2(20) NOT NULL,
    amaterno   VARCHAR2(20) NOT NULL,
    nombres    VARCHAR2(50) NOT NULL,
    telefono   NUMBER NOT NULL,
    correo     VARCHAR2(50) NOT NULL
);

ALTER TABLE propietario ADD CONSTRAINT propietario_pk PRIMARY KEY ( rut_prop );

CREATE TABLE pueblo_orig_ind (
    id_pueblo     NUMBER NOT NULL,
    descripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE pueblo_orig_ind ADD CONSTRAINT pueblo_orig_ind_pk PRIMARY KEY ( id_pueblo );

CREATE TABLE puntaje_ahorro (
    id_puntaje   NUMBER NOT NULL,
    ahorro_inf   NUMBER NOT NULL,
    ahorro_sup   NUMBER NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_ahorro ADD CONSTRAINT puntaje_ahorro_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE puntaje_cargas (
    id_puntaje   NUMBER NOT NULL,
    carga_inf    NUMBER NOT NULL,
    carga_sup    NUMBER NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_cargas ADD CONSTRAINT puntaje_cargas_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE puntaje_edad (
    id_puntaje   NUMBER NOT NULL,
    edad_inf     NUMBER NOT NULL,
    edad_sup     NUMBER NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_edad ADD CONSTRAINT puntaje_edad_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE puntaje_est_civ (
    id_puntaje   NUMBER NOT NULL,
    id_estado    NUMBER NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_est_civ ADD CONSTRAINT puntaje_est_civ_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE puntaje_pueblo (
    id_puntaje   NUMBER NOT NULL,
    acredita     CHAR(1) NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_pueblo ADD CONSTRAINT puntaje_pueblo_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE puntaje_titulo (
    id_puntaje   NUMBER NOT NULL,
    id_tipo      NUMBER NOT NULL,
    puntaje      NUMBER NOT NULL
);

ALTER TABLE puntaje_titulo ADD CONSTRAINT puntaje_titulo_pk PRIMARY KEY ( id_puntaje );

CREATE TABLE receptor (
    rut_recep   VARCHAR2(10) NOT NULL,
    apaterno    VARCHAR2(20) NOT NULL,
    amaterno    VARCHAR2(20) NOT NULL,
    nombres     VARCHAR2(50) NOT NULL
);

ALTER TABLE receptor ADD CONSTRAINT receptor_pk PRIMARY KEY ( rut_recep );

CREATE TABLE region (
    id_region   VARCHAR2(5) NOT NULL,
    nombre      VARCHAR2(50) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE relacion (
    id_relacion   NUMBER NOT NULL,
    descripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE relacion ADD CONSTRAINT relacion_pk PRIMARY KEY ( id_relacion );

CREATE TABLE resolucion (
    id_resolucion   NUMBER NOT NULL,
    id_est_con      NUMBER NOT NULL,
    id_ant_cons     NUMBER NOT NULL,
    id_ant_adm      NUMBER NOT NULL,
    conclusion      CHAR(1) NOT NULL,
    fecha           DATE NOT NULL
);

CREATE UNIQUE INDEX resolucion__idx ON
    resolucion (
        id_est_con
    ASC );

CREATE UNIQUE INDEX resolucion__idxv1 ON
    resolucion (
        id_ant_cons
    ASC );

CREATE UNIQUE INDEX resolucion__idxv2 ON
    resolucion (
        id_ant_adm
    ASC );

ALTER TABLE resolucion ADD CONSTRAINT resolucion_pk PRIMARY KEY ( id_resolucion );

CREATE TABLE rol_titular (
    id_rol        NUMBER NOT NULL,
    descripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE rol_titular ADD CONSTRAINT rol_titular_pk PRIMARY KEY ( id_rol );

CREATE TABLE tipo_cuenta (
    id_tipo       NUMBER NOT NULL,
    descripcion   VARCHAR2(30) NOT NULL
);

ALTER TABLE tipo_cuenta ADD CONSTRAINT tipo_cuenta_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tipo_titulo (
    id_tipo       NUMBER NOT NULL,
    descripcion   VARCHAR2(11) NOT NULL
);

ALTER TABLE tipo_titulo ADD CONSTRAINT tipo_titulo_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tipo_vivienda (
    id_tipo       NUMBER NOT NULL,
    descripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE tipo_vivienda ADD CONSTRAINT tipo_vivienda_pk PRIMARY KEY ( id_tipo );

CREATE TABLE titulo (
    id_titulo        NUMBER NOT NULL,
    id_tipo          NUMBER NOT NULL,
    id_institucion   NUMBER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL
);

ALTER TABLE titulo ADD CONSTRAINT titulo_pk PRIMARY KEY ( id_titulo );

CREATE TABLE tramo (
    id_tramo   NUMBER NOT NULL,
    nombre     VARCHAR2(10) NOT NULL
);

ALTER TABLE tramo ADD CONSTRAINT tramo_pk PRIMARY KEY ( id_tramo );

CREATE TABLE usada (
    id_uso        NUMBER NOT NULL,
    descripcion   VARCHAR2(2) NOT NULL
);

ALTER TABLE usada ADD CONSTRAINT usada_pk PRIMARY KEY ( id_uso );

CREATE TABLE vivienda (
    rol              VARCHAR2(15) NOT NULL,
    id_postulacion   NUMBER NOT NULL,
    id_resolucion    NUMBER NOT NULL,
    id_comuna        NUMBER NOT NULL,
    id_uso           NUMBER NOT NULL,
    direccion        VARCHAR2(50) NOT NULL,
    depto            NUMBER,
    piso             NUMBER,
    poblacion        VARCHAR2(50) NOT NULL,
    rut_prop         VARCHAR2(10) NOT NULL,
    id_economica     NUMBER NOT NULL,
    valor            NUMBER NOT NULL
);

ALTER TABLE vivienda ADD CONSTRAINT vivienda_pk PRIMARY KEY ( rol );

ALTER TABLE postulacion
    ADD CONSTRAINT acredita_carga_fk FOREIGN KEY ( id_acred_carga )
        REFERENCES acredita_carga ( id_acred_carga );

ALTER TABLE carga_familiar
    ADD CONSTRAINT acredita_carga_fkv2 FOREIGN KEY ( id_acreditacion )
        REFERENCES acredita_carga ( id_acred_carga );

ALTER TABLE postulacion
    ADD CONSTRAINT acredita_pueblo_fk FOREIGN KEY ( id_acred_pueblo )
        REFERENCES acredita_pueblo ( id_acred_pueblo );

ALTER TABLE resolucion
    ADD CONSTRAINT administrativos_fk FOREIGN KEY ( id_ant_adm )
        REFERENCES ant_administrativos ( id_ant_adm );

ALTER TABLE ant_constructivos
    ADD CONSTRAINT agrupacion_fk FOREIGN KEY ( id_agrupacion )
        REFERENCES agrupacion ( id_agrupacion );

ALTER TABLE consultor
    ADD CONSTRAINT categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE oficina
    ADD CONSTRAINT comuna_fk FOREIGN KEY ( id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE direccion
    ADD CONSTRAINT comuna_fkv2 FOREIGN KEY ( id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE vivienda
    ADD CONSTRAINT comuna_fkv3 FOREIGN KEY ( id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE resolucion
    ADD CONSTRAINT conservacion_fk FOREIGN KEY ( id_est_con )
        REFERENCES estado_conservacion ( id_est_con );

ALTER TABLE resolucion
    ADD CONSTRAINT constructivos_fk FOREIGN KEY ( id_ant_cons )
        REFERENCES ant_constructivos ( id_ant_cons );

ALTER TABLE consultor_resolucion
    ADD CONSTRAINT consultor_fk FOREIGN KEY ( rut_cons )
        REFERENCES consultor ( rut_cons );

ALTER TABLE contacto
    ADD CONSTRAINT contacto_fk FOREIGN KEY ( rut_post )
        REFERENCES postulante ( rut_post );

ALTER TABLE postulante
    ADD CONSTRAINT conyuge_fk FOREIGN KEY ( rut_conyu )
        REFERENCES conyuge ( rut_conyu );

ALTER TABLE nacionalidad_conyuge
    ADD CONSTRAINT conyuge_fkv2 FOREIGN KEY ( rut_conyu )
        REFERENCES conyuge ( rut_conyu );

ALTER TABLE postulante
    ADD CONSTRAINT direccion_fk FOREIGN KEY ( id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE vivienda
    ADD CONSTRAINT economica_fk FOREIGN KEY ( id_economica )
        REFERENCES economica ( id_economica );

ALTER TABLE libreta_ahorro
    ADD CONSTRAINT entidad_financiera_fk FOREIGN KEY ( id_entidad )
        REFERENCES entidad_financiera ( id_entidad );

ALTER TABLE postulante
    ADD CONSTRAINT estado_civil_fk FOREIGN KEY ( id_est_civ )
        REFERENCES estado_civil ( id_est_civ );

ALTER TABLE estado_conservacion
    ADD CONSTRAINT estado_general_fk FOREIGN KEY ( id_estado )
        REFERENCES estado_general ( id_estado );

ALTER TABLE titulo
    ADD CONSTRAINT institucion_fk FOREIGN KEY ( id_institucion )
        REFERENCES institucion ( id_institucion );

ALTER TABLE postulacion
    ADD CONSTRAINT libreta_ahorro_fk FOREIGN KEY ( id_libreta )
        REFERENCES libreta_ahorro ( id_libreta );

ALTER TABLE nacionalidad_postulante
    ADD CONSTRAINT nacionalidad_fk FOREIGN KEY ( id_nacion )
        REFERENCES nacionalidad ( id_nacion );

ALTER TABLE nacionalidad_conyuge
    ADD CONSTRAINT nacionalidad_fkv2 FOREIGN KEY ( id_nacion )
        REFERENCES nacionalidad ( id_nacion );

ALTER TABLE postulante
    ADD CONSTRAINT nivel_esco_fk FOREIGN KEY ( id_escolaridad )
        REFERENCES nivel_escolaridad ( id_escolaridad );

ALTER TABLE postulacion
    ADD CONSTRAINT oficina_fk FOREIGN KEY ( id_oficina )
        REFERENCES oficina ( id_oficina );

ALTER TABLE vivienda
    ADD CONSTRAINT postulacion_fk FOREIGN KEY ( id_postulacion )
        REFERENCES postulacion ( id_postulacion );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_receptor_fk FOREIGN KEY ( rut_recep )
        REFERENCES receptor ( rut_recep );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_tramo_fk FOREIGN KEY ( id_tramo )
        REFERENCES tramo ( id_tramo );

ALTER TABLE nacionalidad_postulante
    ADD CONSTRAINT postulante_fk FOREIGN KEY ( rut_post )
        REFERENCES postulante ( rut_post );

ALTER TABLE postulacion
    ADD CONSTRAINT postulante_fkv2 FOREIGN KEY ( rut_post )
        REFERENCES postulante ( rut_post );

ALTER TABLE vivienda
    ADD CONSTRAINT propietario_fk FOREIGN KEY ( rut_prop )
        REFERENCES propietario ( rut_prop );

ALTER TABLE acredita_pueblo
    ADD CONSTRAINT pueblo_orig_ind_fk FOREIGN KEY ( id_pueblo )
        REFERENCES pueblo_orig_ind ( id_pueblo );

ALTER TABLE comuna
    ADD CONSTRAINT region_fk FOREIGN KEY ( id_region )
        REFERENCES region ( id_region );

ALTER TABLE carga_familiar
    ADD CONSTRAINT relacion_fk FOREIGN KEY ( id_relacion )
        REFERENCES relacion ( id_relacion );

ALTER TABLE consultor_resolucion
    ADD CONSTRAINT resolucion_fkv2 FOREIGN KEY ( id_resolucion )
        REFERENCES resolucion ( id_resolucion );

ALTER TABLE vivienda
    ADD CONSTRAINT resolucion_fkv4 FOREIGN KEY ( id_resolucion )
        REFERENCES resolucion ( id_resolucion );

ALTER TABLE libreta_ahorro
    ADD CONSTRAINT rol_titular_fk FOREIGN KEY ( id_rol )
        REFERENCES rol_titular ( id_rol );

ALTER TABLE libreta_ahorro
    ADD CONSTRAINT tipo_cuenta_fk FOREIGN KEY ( id_tipo )
        REFERENCES tipo_cuenta ( id_tipo );

ALTER TABLE titulo
    ADD CONSTRAINT tipo_titulo_fk FOREIGN KEY ( id_tipo )
        REFERENCES tipo_titulo ( id_tipo );

ALTER TABLE ant_constructivos
    ADD CONSTRAINT tipo_vivienda_fk FOREIGN KEY ( id_tipo )
        REFERENCES tipo_vivienda ( id_tipo );

ALTER TABLE postulante
    ADD CONSTRAINT titulo_fk FOREIGN KEY ( id_titulo )
        REFERENCES titulo ( id_titulo );

ALTER TABLE vivienda
    ADD CONSTRAINT vivienda_usada_fk FOREIGN KEY ( id_uso )
        REFERENCES usada ( id_uso );