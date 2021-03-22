--Vista
CREATE OR REPLACE VIEW vw_puntaje_postulante AS
SELECT pap.run_postulante,
p.nombres||' '||apaterno||' '||amaterno NOMBRE_POSTULANTE,
pap.edad,
pap.puntaje_edad,
pap.cargas_familiares,
pap.puntaje_cargas_familiares,
pap.estado_civil,
pap.puntaje_estado_civil,
pap.pueblo_ind_orig,
pap.puntaje_pueblo_ind_orig,
pap.monto_ahorro,
pap.puntaje_monto_ahorro,
pap.titulo,
pap.puntaje_titulo,
r.nombre REGION,
pap.puntaje_total-(pap.puntaje_edad+pap.puntaje_cargas_familiares+pap.puntaje_estado_civil+pap.puntaje_pueblo_ind_orig+pap.puntaje_monto_ahorro+pap.puntaje_titulo) PUNTAJE_ZONA_EXTREMA,
pap.puntaje_total,
tv.descripcion TIPO_VIVIENDA_SUBSIDIADA,
v.valor VALOR_VIVIENDA,
v.valor-pap.monto_ahorro MONTO_SUBSIDIO
FROM proc_asig_punt pap
JOIN postulante p ON p.rut_post = pap.run_postulante
JOIN postulacion po ON po.rut_post = p.rut_post
JOIN vivienda v ON v.id_postulacion = po.id_postulacion
JOIN comuna c ON c.id_comuna=v.id_comuna
JOIN region r ON r.id_region = c.id_region
JOIN resolucion re ON re.id_resolucion = v.id_resolucion
JOIN ant_constructivos ac ON ac.id_ant_cons = re.id_ant_cons
JOIN tipo_vivienda tv ON tv.id_tipo = ac.id_tipo
WHERE pap.puntaje_total > (SELECT AVG(puntaje_total) FROM proc_asig_punt)
WITH READ ONLY;

--Consulta ficha anexo E
SELECT pap.run_postulante,
p.nombres||' '||p.apaterno||' '||p.amaterno NOMBRE_POSTULANTE,
p.fecha_nacimiento,
n.nombre,
pap.cargas_familiares,
pap.estado_civil,
pap.pueblo_ind_orig,
pap.titulo,
pap.monto_ahorro,
con.rut_conyu,
con.nombres||' '||con.apaterno||' '||con.amaterno,
d.calle,
d.numero,
d.block,
d.departamento,
d.manzana,
d.sitio,
(SELECT r.nombre FROM region r JOIN comuna c ON c.id_region = r.id_region WHERE d.id_comuna = c.id_comuna) REGION_POSTULANTE,
(SELECT c.nombre FROM comuna c WHERE d.id_comuna = c.id_comuna) COMUNA_POSTULANTE,
co.tel_trabajo,
co.tel_domicilio,
co.tel_movil,
co.codigo_postal,
co.email,
t.nombre,
r.nombre,
c.nombre,
tv.descripcion TIPO_VIVIENDA_SUBSIDIADA,
v.valor VALOR_VIVIENDA,
v.valor-pap.monto_ahorro MONTO_SUBSIDIO,
(SELECT AVG(puntaje_total) FROM proc_asig_punt) PUNTAJE_PROMEDIO,
pap.puntaje_total
FROM proc_asig_punt pap
JOIN postulante p ON p.rut_post = pap.run_postulante
JOIN postulacion po ON po.rut_post = p.rut_post
JOIN vivienda v ON v.id_postulacion = po.id_postulacion
JOIN comuna c ON c.id_comuna=v.id_comuna
JOIN region r ON r.id_region = c.id_region
JOIN resolucion re ON re.id_resolucion = v.id_resolucion
JOIN ant_constructivos ac ON ac.id_ant_cons = re.id_ant_cons
JOIN tipo_vivienda tv ON tv.id_tipo = ac.id_tipo
JOIN nacionalidad_postulante np ON np.rut_post = p.rut_post
JOIN nacionalidad n ON n.id_nacion = np.id_nacion
LEFT JOIN conyuge con ON con.rut_conyu = p.rut_conyu
LEFT JOIN direccion d ON d.id_direccion = p.id_direccion
LEFT JOIN contacto co ON co.rut_post = p.rut_post
JOIN tramo t ON t.id_tramo = po.id_tramo
WHERE pap.run_postulante = RUT;