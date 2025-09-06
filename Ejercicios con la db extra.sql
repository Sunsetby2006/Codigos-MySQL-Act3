show databases;
use restaurant_db;
-- (Para ir viendo todo, solo hay que quitar los comentarios 
-- uno  a uno y regresarlos para que no se solapen las tablas)

-- select * from clientes;
-- select * from mesas;
-- select * from reservas;
-- select * from asignaciones_mesas;

-- select * from reservas where date(fecha_reserva) = '2025-09-20';
-- select * from reservas where time(hora_reserva) < '21:00:00';
-- select year(fecha_reserva), count(*) from reservas group by year(fecha_reserva);

-- Join
SELECT r.*, m.* FROM reservas r
INNER JOIN asignaciones_mesas am ON r.id_reserva = am.id_reserva
INNER JOIN mesas m ON am.id_mesa = m.id_mesa
WHERE m.capacidad < 4;
