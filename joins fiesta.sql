-- Omar y Diego
USE fiesta_db;
-- 1
select
	p.nombre,
    p.apellido,
    i.metodo_invitacion,
    c.estado,
    a.hora_llegada
from personas p
inner join invitados i on p.id_persona = i.id_persona
inner join confirmaciones c on p.id_persona = c.id_persona
inner join asistentes a on p.id_persona = a.id_persona;

-- 2
select
	p.nombre,
    p.apellido,
    i.metodo_invitacion,
    case
		when a.id_persona is not null then concat('Sí - ', a.hora_llegada)
        else 'No asistió'
	end as asistencia
from personas p
inner join invitados i on p.id_persona = i.id_persona
left join asistentes a on p.id_persona = a.id_persona
order by p.nombre;

-- 3
select
	p.nombre,
    p.apellido,
    a.hora_llegada,
    i.metodo_invitacion
from invitados i
right join asistentes a on i.id_persona = a.id_persona 
inner join personas p on a.id_persona = p.id_persona;

-- 4
select p.nombre, p.apellido, 'Invitado' as tipo
from personas p
inner join invitados i on i.id_persona = i.id_persona
union
select p.nombre, p.apellido, 'Asistente' as tipo
from personas p
inner join asistentes a on p.id_persona = a.id_persona 
order by nombre;

-- 5
select
	p.nombre,
    p.apellido,
    mediodecomunicacion.tipo
from personas p
cross join (
	select 'Whatsapp' as tipo
    union select 'Email'
    union select 'Llamada'
    union select 'En persona'
) as mediodecomunicacion;

-- 6
select 
	p.nombre,
    p.apellido,
    i.metodo_invitacion
from personas p
inner join invitados i on p.id_persona = i.id_persona
left join asistentes a on p.id_persona = a.id_persona
where a.id_persona is null -- No asistieron
order by p.nombre;

-- 7
select
	i1.id_persona as persona1_id,
	i2.id_persona as persona2_id,
	i1.fecha_invitacion as fecha_compartida
from invitados i1
inner join invitados i2 on i1.fecha_invitacion = i2.fecha_invitacion
where i1.id_persona < i2.id_persona
order by i1.fecha_invitacion;