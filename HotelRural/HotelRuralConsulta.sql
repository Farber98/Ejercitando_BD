CREATE PROCEDURE `hsp_OcupacionHabitaciones`(pAnio int)
/*
	Vista de las habitaciones y su ocupación dado un año en particular.
    Se recibe el año por parametro.
    
*/
BEGIN
    SELECT c.Nombre AS Responsable ,h.Numero, h.Tipo, r.FechaIni AS Inicio, r.FechaFin AS Fin, r.Costo
    FROM CLIENTES c INNER JOIN RESERVAS r ON c.IdClientes = r.IdClientes INNER JOIN HABITACIONES h 
    ON r.IdHabitaciones = h.IdHabitaciones
    WHERE ((pAnio = YEAR(r.FechaIni) OR pAnio = YEAR(r.FechaFin)) AND (h.Estado = 'O'));
END

