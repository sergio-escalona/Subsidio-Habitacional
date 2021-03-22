CREATE SEQUENCE seq_titulo;
CREATE SEQUENCE seq_comuna;
CREATE SEQUENCE seq_libreta;
CREATE SEQUENCE seq_direccion;
CREATE SEQUENCE seq_contacto;
CREATE SEQUENCE seq_acre_pueblo;
CREATE SEQUENCE seq_acre_carga;
CREATE SEQUENCE seq_postulacion;
CREATE SEQUENCE seq_ant_adm;
CREATE SEQUENCE seq_ant_con;
CREATE SEQUENCE seq_est_con;
CREATE SEQUENCE seq_resolucion;
CREATE SEQUENCE seq_error;

INSERT INTO tipo_titulo VALUES (1, 'Técnico');
INSERT INTO tipo_titulo VALUES (2, 'Profesional');

INSERT INTO institucion VALUES (1, 'Duoc UC');
INSERT INTO institucion VALUES (2, 'Universidad de Valparaiso');
INSERT INTO institucion VALUES (3, 'Andres Bello');
INSERT INTO institucion VALUES (4, 'Viña del Mar');
INSERT INTO institucion VALUES (5, 'Inacap');

INSERT INTO estado_civil VALUES (1, 'Casado');
INSERT INTO estado_civil VALUES (2, 'Conviviente Civil');
INSERT INTO estado_civil VALUES (3, 'Soltero');
INSERT INTO estado_civil VALUES (4, 'Divorciado');
INSERT INTO estado_civil VALUES (5, 'Viudo');

INSERT INTO nivel_escolaridad VALUES (1, 'Básica');
INSERT INTO nivel_escolaridad VALUES (2, 'Media');
INSERT INTO nivel_escolaridad VALUES (3, 'Superior');

INSERT INTO nacionalidad VALUES (1, 'Chileno');
INSERT INTO nacionalidad VALUES (2, 'Peruano');
INSERT INTO nacionalidad VALUES (3, 'Argentino');
INSERT INTO nacionalidad VALUES (4, 'Boliviano');
INSERT INTO nacionalidad VALUES (5, 'Ecuatoriano');

INSERT INTO titulo VALUES (seq_titulo.nextval, 1, 1, 'Analista Programador Computacional');
INSERT INTO titulo VALUES (seq_titulo.nextval, 2, 2, 'Medicina');
INSERT INTO titulo VALUES (seq_titulo.nextval, 2, 3, 'Ingeniero Comercial');
INSERT INTO titulo VALUES (seq_titulo.nextval, 2, 4, 'Veterinaia');
INSERT INTO titulo VALUES (seq_titulo.nextval, 1, 5, 'Refrigeración');

INSERT INTO tramo VALUES (1, 'Tramo 1');
INSERT INTO tramo VALUES (2, 'Tramo 2');
INSERT INTO tramo VALUES (3, 'Tramo 3');

INSERT INTO rol_titular VALUES (1, 'Postulante');
INSERT INTO rol_titular VALUES (2, 'Cónyuge');
INSERT INTO rol_titular VALUES (3, 'Conviviente Civil');

INSERT INTO tipo_cuenta VALUES (1, 'Vivienda');
INSERT INTO tipo_cuenta VALUES (2, 'Ahorro a la vista');
INSERT INTO tipo_cuenta VALUES (3, 'Ahorro a plazo giro diferido');
INSERT INTO tipo_cuenta VALUES (4, 'Ahorro con giro incondicional');

INSERT INTO entidad_financiera VALUES (1, 'Banco Estado');
INSERT INTO entidad_financiera VALUES (2, 'Banco Chile');
INSERT INTO entidad_financiera VALUES (3, 'Banco Fallabella');
INSERT INTO entidad_financiera VALUES (4, 'Banco Itau');
INSERT INTO entidad_financiera VALUES (5, 'Banco del Desarrollo');

INSERT INTO receptor VALUES ('5661700-k', 'Alamo', 'Elvira', 'Maria Magdalena');
INSERT INTO receptor VALUES ('11851387-8', 'Prado', 'Caamaño', 'Juan Pedro');
INSERT INTO receptor VALUES ('15651077-7', 'Rocha', 'Bellido', 'Pedro Jesus');
INSERT INTO receptor VALUES ('12759329-9', 'Ruano', 'Castells', 'Lara Elena');
INSERT INTO receptor VALUES ('9488816-6', 'Peralta', 'Fernández', 'Lazaro Orlando');

INSERT INTO region VALUES ('I', 'Tarapacá');
INSERT INTO region VALUES ('II', 'Antofagasta');
INSERT INTO region VALUES ('III', 'Atacama');
INSERT INTO region VALUES ('IV', 'Coquimbo');
INSERT INTO region VALUES ('V', 'Valparaíso');
INSERT INTO region VALUES ('VI', 'Libertador General Bernardo O’Higgins');
INSERT INTO region VALUES ('VII', 'Maule');
INSERT INTO region VALUES ('VIII', 'Biobío');
INSERT INTO region VALUES ('IX', 'La Araucanía');
INSERT INTO region VALUES ('X', 'Los Lagos');
INSERT INTO region VALUES ('XI', 'Aysén del General Carlos Ibáñez del Campo');
INSERT INTO region VALUES ('XII', 'Magallanes y Antártica Chilena');
INSERT INTO region VALUES ('RM', 'Metropolitana de Santiago');
INSERT INTO region VALUES ('XIV', 'Los Ríos');
INSERT INTO region VALUES ('XV', 'Arica y Parinacota');
INSERT INTO region VALUES ('XVI', 'Ñuble');

INSERT INTO comuna VALUES (seq_comuna.nextval, 'Iquique', 'I');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Pica', 'I');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Antofagasta', 'II');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Calama', 'II');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Copiapó', 'III');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Alto del Carmen', 'III');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Coquimbo', 'IV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'La Serena', 'IV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Viña del Mar', 'V');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Valparaíso', 'V');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Rancagua', 'VI');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Pichilemu', 'VI');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Curicó', 'VII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Yerbas Buenas', 'VII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Concepción', 'VIII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Talcahuano', 'VIII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Temuco', 'IX');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Lonquimay', 'IX');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Castro', 'X');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Frutillar', 'X');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Aysén', 'XI');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Coyhaique', 'XI');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Cabo de Hornos', 'XII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Punta Arenas', 'XII');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Santiago', 'RM');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Puente Alto', 'RM');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Futrono', 'XIV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Valdivia', 'XIV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Arica', 'XV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Camaroness', 'XV');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Bulne', 'XVI');
INSERT INTO comuna VALUES (seq_comuna.nextval, 'Ñiquén', 'XVI');

INSERT INTO oficina VALUES (1, 1, 'Patricio Lynch N°50');
INSERT INTO oficina VALUES (2, 10, 'Bellavista N° 120');
INSERT INTO oficina VALUES (3, 22, 'AVENIDA ARTURO PRAT # 575');
INSERT INTO oficina VALUES (4, 8, 'Av. Alemania N° 799,');
INSERT INTO oficina VALUES (5, 30, 'Arturo Prat Nº 80');

INSERT INTO usada VALUES (1, 'Si');
INSERT INTO usada VALUES (2, 'No');

INSERT INTO economica VALUES (1, 'Si');
INSERT INTO economica VALUES (2, 'No');

INSERT INTO categoria VALUES (1, '1ª categoría');
INSERT INTO categoria VALUES (2, '2ª categoría');
INSERT INTO categoria VALUES (3, '3ª categoría');

INSERT INTO consultor VALUES ('8250822-8', 'Pérez', 'Gracia', 'Antonia Teresa', 98672363, 'ant.perez@minvu.cl', 9786, 1);
INSERT INTO consultor VALUES ('14460130-0', 'Sáez', 'Gómez', 'Fernando Alejandro', 23472513, 'fer.saez@minvu.cl', 3297, 2);
INSERT INTO consultor VALUES ('11652917-3', 'Mendoza', 'Fuentes', 'Daniel Carlos', 23151484, 'dan.mendoza@minvu.cl', 3217, 3);
INSERT INTO consultor VALUES ('16152341-0', 'Palacios', 'Hernández', 'Ignacio Antonio', 35672354, 'ign.palacios@minvu.cl', 6634, 2);
INSERT INTO consultor VALUES ('17051764-4', 'Delgado', 'Prieto', 'Javier Salvador', 65635243, 'jav.delgado@minvu.cl',6874, 3);

INSERT INTO relacion VALUES (1, 'Cónyuge');
INSERT INTO relacion VALUES (2, 'Hijo');
INSERT INTO relacion VALUES (3, 'Hijo Adoptivo');
INSERT INTO relacion VALUES (4, 'Nieto');
INSERT INTO relacion VALUES (5, 'Bisnieto');

INSERT INTO pueblo_orig_ind VALUES (1, 'Mapuche');
INSERT INTO pueblo_orig_ind VALUES (2, 'Atacameño');
INSERT INTO pueblo_orig_ind VALUES (3, 'Diaguita');
INSERT INTO pueblo_orig_ind VALUES (4, 'Rapanui');
INSERT INTO pueblo_orig_ind VALUES (5, 'Aymara');

INSERT INTO propietario VALUES ('6338361-9', 'Núñez', 'Torres', 'Miguel Antonio', 85167931, 'migue123@gmail.com');
INSERT INTO propietario VALUES ('8896424-1', 'Mora', 'Pérez', 'Paula Laura', 32634106, 'pau123@gmail.com');
INSERT INTO propietario VALUES ('7272437-2', 'Gutiérrez', 'Ruiz', 'David Manuel', 42879190, 'david123@gmail.com');
INSERT INTO propietario VALUES ('5233421-7', 'Carrión', 'Rico', 'María Ángeles', 95045633, 'mary123@gmail.com');
INSERT INTO propietario VALUES ('17689303-6', 'Plaza', 'Oliva', 'Juan Carlos', 40814762, 'juan123@gmail.com');
INSERT INTO propietario VALUES ('16655918-9', 'Moreira', 'Matas', 'Manuel Tomas', 16372137, 'manu123@gmail.com');
INSERT INTO propietario VALUES ('9220638-6', 'Pulido', 'Ávila', 'Francisco Javier', 38097509, 'fran123@gmail.com');
INSERT INTO propietario VALUES ('16738854-k', 'Rodríguez', 'Rodríguez', 'María José', 57486789, 'maryjo123@gmail.com');

INSERT INTO direccion (id_direccion, calle, numero, poblacion, id_comuna) VALUES (seq_direccion.nextval, 'Praza Marcos', 54, 'Raya del Mirador', 10);
INSERT INTO direccion (id_direccion, calle, numero, poblacion, id_comuna) VALUES (seq_direccion.nextval, 'Carrer Jiménez', 119, 'Suárez del Mirador', 24);
INSERT INTO direccion (id_direccion, calle, numero, poblacion, id_comuna) VALUES (seq_direccion.nextval, 'Passeig Marina', 95, 'Vicente del Vallès', 1);
INSERT INTO direccion (id_direccion, calle, numero, poblacion, id_comuna) VALUES (seq_direccion.nextval, 'Travesía Mireles', 10, 'Alonso Alta', 20);
INSERT INTO direccion (id_direccion, calle, numero, poblacion, id_comuna) VALUES (seq_direccion.nextval, 'Avenida Sofía', 809, 'O Hernando', 30);

INSERT INTO conyuge VALUES ('8607336-6', TO_DATE('22/12/60', 'DD/MM/RR'), 'Puertas', 'Candel', 'Rafael Eduardo');
INSERT INTO conyuge VALUES ('9516045-k', TO_DATE('05/01/64', 'DD/MM/RR'), 'Sánchez', 'Cano', 'Francisca Manuela');
INSERT INTO conyuge VALUES ('16629449-5', TO_DATE('20/09/87', 'DD/MM/RR'), 'Beltrán', 'Rojas', 'María Pilar');

INSERT INTO nacionalidad_conyuge VALUES ('8607336-6', 1);
INSERT INTO nacionalidad_conyuge VALUES ('9516045-k', 1);
INSERT INTO nacionalidad_conyuge VALUES ('16629449-5', 1);
INSERT INTO nacionalidad_conyuge VALUES ('16629449-5', 3);

INSERT INTO postulante VALUES ('6448070-7', EMPTY_BLOB(), 1, 3, 1, TO_DATE('12/10/53', 'DD/MM/RR'), 'Fernández', 'Díaz', 'Alejandro Raúl', '9516045-k', 1);
INSERT INTO postulante VALUES ('7287254-1', EMPTY_BLOB(), 1, 3, 2, TO_DATE('30/07/56', 'DD/MM/RR'), 'Ruiz', 'Hernández', 'Sonia Teresa', '8607336-6', 2);
INSERT INTO postulante VALUES ('17765510-4', EMPTY_BLOB(), 3, 3, 3, TO_DATE('02/07/91', 'DD/MM/RR'), 'Marín', 'Molina', 'José María', NULL, 3);
INSERT INTO postulante VALUES ('18329298-6', EMPTY_BLOB(), 1, 3, 4, TO_DATE('27/05/93', 'DD/MM/RR'), 'Higueras', 'Guillen', 'Mario Alejandro', '16629449-5', 4);
INSERT INTO postulante VALUES ('11977715-1', EMPTY_BLOB(), 5, 3, 5, TO_DATE('13/03/72', 'DD/MM/RR'), 'Maldonado', 'Vázquez', 'Raúl Javier', NULL, 5);

INSERT INTO nacionalidad_postulante VALUES (1, '6448070-7');
INSERT INTO nacionalidad_postulante VALUES (1, '7287254-1');
INSERT INTO nacionalidad_postulante VALUES (5, '7287254-1');
INSERT INTO nacionalidad_postulante VALUES (1, '17765510-4');
INSERT INTO nacionalidad_postulante VALUES (1, '18329298-6');
INSERT INTO nacionalidad_postulante VALUES (1, '11977715-1');
INSERT INTO nacionalidad_postulante VALUES (3, '11977715-1');

INSERT INTO contacto VALUES (seq_contacto.nextval, NULL, NULL, 23188344, 6792, 'alefer@gmail.com', '6448070-7');
INSERT INTO contacto VALUES (seq_contacto.nextval, NULL, 13089026, 50811412, 4283, 'sonrui@gmail.com', '7287254-1');
INSERT INTO contacto VALUES (seq_contacto.nextval, 95096641, 68458681, 23188344, 7541, 'josemar@gmail.com', '17765510-4');
INSERT INTO contacto VALUES (seq_contacto.nextval, 66085266, NULL, 23188344, 2827, 'marhig@gmail.com', '18329298-6');
INSERT INTO contacto VALUES (seq_contacto.nextval, NULL, NULL, 23188344, 8956, 'raulmal@gmail.com', '11977715-1');

INSERT INTO libreta_ahorro VALUES (seq_libreta.nextval, 1, '6448070-7', 55203278, TO_DATE('21/11/93', 'DD/MM/RR'), 8000000, 1, 1);
INSERT INTO libreta_ahorro VALUES (seq_libreta.nextval, 2, '7287254-1', 14444182, TO_DATE('01/02/85', 'DD/MM/RR'), 12000000, 1, 1);
INSERT INTO libreta_ahorro VALUES (seq_libreta.nextval, 3, '17765510-4', 03567478, TO_DATE('23/09/16', 'DD/MM/RR'), 9950000, 2, 1);
INSERT INTO libreta_ahorro VALUES (seq_libreta.nextval, 4, '16629449-5', 79440774, TO_DATE('17/12/17', 'DD/MM/RR'), 8500000, 3, 2);
INSERT INTO libreta_ahorro VALUES (seq_libreta.nextval, 5, '11977715-1', 01815696, TO_DATE('09/11/05', 'DD/MM/RR'), 8300000, 4, 1);

INSERT INTO acredita_pueblo VALUES (seq_acre_pueblo.nextval, 'S', TO_DATE('03/03/20', 'DD/MM/RR'), 1);
INSERT INTO acredita_pueblo VALUES (seq_acre_pueblo.nextval, 'S', TO_DATE('09/03/20', 'DD/MM/RR'), 4);

INSERT INTO acredita_carga VALUES (seq_acre_carga.nextval, 'S', TO_DATE('03/03/20', 'DD/MM/RR'));
INSERT INTO acredita_carga VALUES (seq_acre_carga.nextval, 'S', TO_DATE('06/03/20', 'DD/MM/RR'));
INSERT INTO acredita_carga VALUES (seq_acre_carga.nextval, 'S', TO_DATE('04/03/20', 'DD/MM/RR'));
INSERT INTO acredita_carga VALUES (seq_acre_carga.nextval, 'S', TO_DATE('11/03/20', 'DD/MM/RR'));

INSERT INTO carga_familiar VALUES ('9516045-k', 1, 'Sánchez', 'Cano', 'Francisca Manuela', 1);
INSERT INTO carga_familiar VALUES ('22977715-7', 1, 'Blanco', 'Fernández', 'María Dolores', 4);
INSERT INTO carga_familiar VALUES ('8607336-6', 2, 'Puertas', 'Candel', 'Rafael Eduardo', 1);
INSERT INTO carga_familiar VALUES ('25724140', 3, 'Marín', 'Navarro', 'Carlos Ángel', 2);
INSERT INTO carga_familiar VALUES ('16629449-5', 4, 'Beltrán', 'Rojas', 'María Pilar', 1);
INSERT INTO carga_familiar VALUES ('24017187-2', 4, 'Higueras', 'Beltrán', 'María Pilar', 2);
INSERT INTO carga_familiar VALUES ('26226214-6', 4, 'Higueras', 'Beltrán', 'Raúl Javier', 2);
INSERT INTO carga_familiar VALUES ('25160743-5', 4, 'Higueras', 'Beltrán', 'Marta Rocío', 3);

INSERT INTO postulacion VALUES (seq_postulacion.nextval, 1, 1, 1, TO_DATE('03/03/20', 'DD/MM/RR'), '6448070-7', '5661700-k', 1, 1);
INSERT INTO postulacion VALUES (seq_postulacion.nextval, 3, 2, 2, TO_DATE('06/03/20', 'DD/MM/RR'), '7287254-1', '11851387-8', 2, NULL);
INSERT INTO postulacion VALUES (seq_postulacion.nextval, 4, 1, 3, TO_DATE('04/03/20', 'DD/MM/RR'), '17765510-4', '12759329-9', 3, 2);
INSERT INTO postulacion VALUES (seq_postulacion.nextval, 2, 3, 4, TO_DATE('11/03/20', 'DD/MM/RR'), '18329298-6', '9488816-6', 4, NULL);
INSERT INTO postulacion VALUES (seq_postulacion.nextval, 5, 2, 5, TO_DATE('03/03/20', 'DD/MM/RR'), '11977715-1', '15651077-7', NULL, NULL);

INSERT INTO agrupacion VALUES (1, 'Aislada');
INSERT INTO agrupacion VALUES (2, 'Pareada');
INSERT INTO agrupacion VALUES (3, 'Continua');
INSERT INTO agrupacion VALUES (4, 'Edif. en Altura');

INSERT INTO tipo_vivienda VALUES (1, 'Casa');
INSERT INTO tipo_vivienda VALUES (2, 'Departamento');

INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 9107, TO_DATE('23/04/98', 'DD/MM/RR'), 60, 1999, 1821, TO_DATE('16/09/01', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 6495, TO_DATE('08/12/07', 'DD/MM/RR'), 48, 2008, 1502, TO_DATE('11/11/10', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 5452, TO_DATE('30/03/12', 'DD/MM/RR'), 89, 2012, 4066, TO_DATE('24/02/13', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 7062, TO_DATE('29/07/99', 'DD/MM/RR'), 50, 1999, 2886, TO_DATE('06/09/00', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 7613, TO_DATE('03/04/03', 'DD/MM/RR'), 90, 2003, 4509, TO_DATE('09/08/04', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 4628, TO_DATE('03/04/87', 'DD/MM/RR'), 63, 1987, 5323, TO_DATE('18/02/90', 'DD/MM/RR'));
INSERT INTO ant_administrativos VALUES (seq_ant_adm.nextval, 3239, TO_DATE('18/11/16', 'DD/MM/RR'), 72, 2017, 2666, TO_DATE('17/07/18', 'DD/MM/RR'));

INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 1, 1, 2, 'S', 'S', 'S', 'N', 'N', 3, 1, 'S', 'N', 'N', 55, 60, 'Acrilica', 'Concreto', 'Madera');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 2, 1, 4, 'S', 'S', 'S', 'N', 'S', 2, 1, 'S', 'S', 'N', 48, 48, 'Acrilica', 'Concreto', 'Loza');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 1, 2, 1, 'S', 'S', 'S', 'S', 'S', 5, 2, 'S', 'S', 'S', 75, 89, 'Policarbonato', 'Concreto', 'Piso Flotante');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 1, 2, 3, 'S', 'S', 'S', 'N', 'S', 4, 1, 'S', 'S', 'N', 42, 50, 'PVC', 'Ladrillo', 'Madera');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 1, 2, 1, 'S', 'S', 'S', 'S', 'S', 6, 2, 'S', 'S', 'S', 80, 90, 'Teja', 'Concreto', 'Piso Flotante');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 2, 1, 4, 'S', 'S', 'S', 'S', 'S', 3, 2, 'S', 'S', 'N', 63, 63, 'Acrilica', 'Concreto', 'Loza');
INSERT INTO ant_constructivos VALUES (seq_ant_con.nextval, 1, 2, 2, 'S', 'S', 'S', 'S', 'S', 4, 1, 'S', 'S', 'N', 66, 72, 'Acrilica', 'Concreto', 'Madera');

INSERT INTO estado_general VALUES (1, 'Bueno');
INSERT INTO estado_general VALUES (2, 'Regular');
INSERT INTO estado_general VALUES (3, 'Malo');

INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'S', 'S', 'N', 'S', 'S', 'S', 'N', 'N', 'S', 'Deplorable estado');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Excelente estado');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Excelente estado');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 3, 'N', 'S', 'N', 'N', 'S', 'N', 'S', 'N', 'S', 'N', 'S', 'S', 'N', 'S', 'N', 'S', 'S', 'N', 'S', 'Muy mal estado');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Muy buena');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'S', 'S', 'S', 'N', 'S', 'N', 'N', 'S', 'Facil de reparar');
INSERT INTO estado_conservacion VALUES (seq_est_con.nextval, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'S', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Casi Perfecta');

INSERT INTO resolucion VALUES (seq_resolucion.nextval, 1, 1, 1, 'S', TO_DATE('12/04/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 2, 2, 2, 'S', TO_DATE('16/05/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 3, 3, 3, 'S', TO_DATE('25/04/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 4, 4, 4, 'S', TO_DATE('06/04/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 5, 5, 5, 'S', TO_DATE('18/06/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 6, 6, 6, 'S', TO_DATE('31/03/20', 'DD/MM/RR'));
INSERT INTO resolucion VALUES (seq_resolucion.nextval, 7, 7, 7, 'S', TO_DATE('26/04/20', 'DD/MM/RR'));

INSERT INTO consultor_resolucion VALUES ('8250822-8', 1);
INSERT INTO consultor_resolucion VALUES ('16152341-0', 1);
INSERT INTO consultor_resolucion VALUES ('14460130-0', 2);
INSERT INTO consultor_resolucion VALUES ('11652917-3', 2);
INSERT INTO consultor_resolucion VALUES ('8250822-8', 3);
INSERT INTO consultor_resolucion VALUES ('17051764-4', 3);
INSERT INTO consultor_resolucion VALUES ('17051764-4', 4);
INSERT INTO consultor_resolucion VALUES ('11652917-3', 4);
INSERT INTO consultor_resolucion VALUES ('16152341-0', 5);
INSERT INTO consultor_resolucion VALUES ('8250822-8', 5);
INSERT INTO consultor_resolucion VALUES ('8250822-8', 6);
INSERT INTO consultor_resolucion VALUES ('14460130-0', 6);
INSERT INTO consultor_resolucion VALUES ('17051764-4', 7);
INSERT INTO consultor_resolucion VALUES ('16152341-0', 7);

INSERT INTO vivienda VALUES ('01770-704', 1, 1, 2, 1, 'Alvaro Cunqueiro, 31 41110', NULL, NULL, 'Bollullos de la Mitación', '6338361-9', 2, 50000000);
INSERT INTO vivienda VALUES ('05417-049', 2, 2, 10, 2, 'Puerto Lugar, 68', 03, 15, 'Árchez', '8896424-1', 1, 680000000);
INSERT INTO vivienda VALUES ('09589-889', 3, 3, 28, 1, 'Carrer Ureña, 2', NULL, NULL, 'Las Arreola', '7272437-2', 1, 90000000);
INSERT INTO vivienda VALUES ('11836-010', 3, 4, 28, 1, 'Passeig Francisco Javier, 7', NULL, NULL, 'Los Salas', '5233421-7', 1, 30000000);
INSERT INTO vivienda VALUES ('00236-438', 4, 5, 31, 1, 'Praza Samaniego, 56', NULL, NULL, 'Perea de San Pedro', '17689303-6', 1, 85000000);
INSERT INTO vivienda VALUES ('44178-151', 5, 6, 22, 1, 'Travessera Aaron, 3º', 15, 06, 'Espinal Baja', '16655918-9', 1, 75000000);
INSERT INTO vivienda VALUES ('03584-040', 5, 7, 22, 1, 'Rúa Hinojosa, 890', NULL, NULL, 'As Valle del Vallès', '9220638-6', 1, 60000000);

INSERT INTO puntaje_ahorro VALUES (1, 8000000, 8999999, 200);
INSERT INTO puntaje_ahorro VALUES (2, 9000000, 10000000, 400);
INSERT INTO puntaje_ahorro VALUES (3, 10000001, 1000000000, 500);

INSERT INTO puntaje_cargas VALUES (1, 0, 1, 50);
INSERT INTO puntaje_cargas VALUES (2, 2, 4, 100);
INSERT INTO puntaje_cargas VALUES (3, 5, 99, 200);

INSERT INTO puntaje_edad VALUES (1, 0, 29, 200);
INSERT INTO puntaje_edad VALUES (2, 30, 40, 150);
INSERT INTO puntaje_edad VALUES (3, 41, 150, 100);

INSERT INTO puntaje_est_civ VALUES (1, 1, 100);
INSERT INTO puntaje_est_civ VALUES (2, 2, 80);
INSERT INTO puntaje_est_civ VALUES (3, 3, 60);
INSERT INTO puntaje_est_civ VALUES (4, 4, 40);
INSERT INTO puntaje_est_civ VALUES (5, 5, 20);

INSERT INTO puntaje_pueblo VALUES (1, 'S', 500);
INSERT INTO puntaje_pueblo VALUES (2, 'N', 0);

INSERT INTO puntaje_titulo VALUES (1, 1, 100);
INSERT INTO puntaje_titulo VALUES (2, 2, 200);

INSERT INTO porc_region VALUES (1, 'XV', 1.5);
INSERT INTO porc_region VALUES (2, 'I', 1.3);
INSERT INTO porc_region VALUES (3, 'XI', 2);
INSERT INTO porc_region VALUES (4, 'XII', 2.3);

DECLARE
CURSOR cur_postulante IS
    SELECT rut_post FROM postulante;
v_blob postulante.fotografia%TYPE;
v_nom_archivo VARCHAR2(30);
v_bfile BFILE;
BEGIN
    FOR reg_postulante IN cur_postulante LOOP
        SELECT fotografia
            INTO v_blob
            FROM postulante
            WHERE rut_post = reg_postulante.rut_post
            FOR UPDATE;
                
            v_nom_archivo:= reg_postulante.rut_post||'.jpg';
            v_bfile:= BFILENAME('DIR_POSTULANTES',v_nom_archivo);
                
            DBMS_LOB.OPEN(v_bfile,DBMS_LOB.LOB_READONLY);
            DBMS_LOB.LOADFROMFILE(v_blob,v_bfile,DBMS_LOB.GETLENGTH(v_bfile));
            DBMS_LOB.CLOSE(v_bfile);
    END LOOP;
END;

COMMIT;