USE PuroGalactico;

DROP TABLE IF EXISTS tRecibo_Tramite;
DROP TABLE IF EXISTS tTramite;
DROP TABLE IF EXISTS tRecibo;
DROP TABLE IF EXISTS tConcepto;
DROP TABLE IF EXISTS tOficina;
DROP TABLE IF EXISTS tSolicitante;

CREATE TABLE tSolicitante
(
    idS VARCHAR(4) NOT NULL, 
    tipoS VARCHAR(7),
    tipoDocumS VARCHAR(7),
    nroDocumS VARCHAR(15),
    paternoS VARCHAR(50),
    maternoS VARCHAR(50),
    nombresS VARCHAR(50),
    razonSocialS VARCHAR(50),
    celularS VARCHAR(15),
    telefonoS VARCHAR(15),
    dirElectronS VARCHAR(50),
    PRIMARY KEY (idS)
);

INSERT INTO tSolicitante
VALUES('S001','EST', 'carnet','123016101J','Torres', 'Loza','Boris', NULL,'911111111','51-84-221111','123016101J@uandina.edu.pe');
INSERT INTO tSolicitante
VALUES('S002','EST','carnet','123015100A','Pérez','Sánchez','José', NULL,'922222222','51-84-222222','123015100A@uandina.edu.pe');
INSERT INTO tSolicitante
VALUES('S003','EST','carnet','123014200D','Arenas','Campos','Raul', NULL,'933333333','51-84-223333','123014200D@uandina.edu.pe');
INSERT INTO tSolicitante
VALUES('S004','EST','carnet','123015300F','Maldonado', 'Rojas','Jorge', NULL,'944444444','51-84-224444','123015300F@uandina.edu.pe');
INSERT INTO tSolicitante
VALUES('S005','EST', 'carnet','123015300B','Salinas','Valle','Daniel',NULL,'955555555','51-84-225555','123015300B@uandina.edu.pe');
INSERT INTO tSolicitante
VALUES('S006', 'PROF', 'DNI', '01111110','Palomino','Cahuaya', 'Ariadna', NULL,'966666666','51-84-226666', 'apalominoc@uandina.edu');
INSERT INTO tSolicitante
VALUES('S007', 'PROF', 'DNI', '02222220','Espetia','Humanga', 'Hugo', NULL,'966666666','51-84-226666', 'hespetia@uandina.edu.pe');

CREATE TABLE tOficina
(
    idO VARCHAR(4) NOT NULL,
    denominacionO VARCHAR(50),
    ubicacionO VARCHAR(50),
    responsableO VARCHAR(50),
    PRIMARY KEY (idO)
);

INSERT INTO tOficina
VALUES('O001','Rectorado','AG-101 Larapa','Zambrano Ramos, Juan');
INSERT INTO tOficina
VALUES('O002','Dirección de Tecnologías de Información','ING-205 Larapa', 'Torres Campos, César');
INSERT INTO tOficina
VALUES('O003','Dirección del D.A. de Ingeniería de Sistemas','ING-211 Larapa', 'Zamalloa Campos, Gino');
INSERT INTO tOficina
VALUES('O004','Tesorería','E-301 Módulo de entrada - Larapa','Ramírez Tapia, Nohelia');
INSERT INTO tOficina
VALUES('O005','RRHH','Sótano del Paraninfo - Larapa','Martínez Salazar, Dante');
INSERT INTO tOficina
VALUES('O006', 'Decanatura de Ingeniería','ING-214 - Larapa', 'Gamarra Miranda, Javier');

CREATE TABLE tConcepto
(
    idC VARCHAR(4) NOT NULL,
    denominacionC VARCHAR(50),
    costoC DECIMAL(10,2),
    PRIMARY KEY (idC)
);

INSERT INTO tConcepto
VALUES('C001','Convalidación de sílabos',9);
INSERT INTO tConcepto
VALUES('C002','Constancia de seguimiento de estudios',20);
INSERT INTO tConcepto
VALUES('C003','Certificado de estudios',30);
INSERT INTO tConcepto
VALUES('C004', 'Bachillerato I.S.',750);
INSERT INTO tConcepto
VALUES('C005', 'Trámite',10);
INSERT INTO tConcepto
VALUES('C006', 'Carta de presentación para prácticas',12);
INSERT INTO tConcepto
VALUES('C007', 'Título de Ingeniero de Sistemas',900);

CREATE TABLE tRecibo
(
    idR VARCHAR(4) NOT NULL, 
    fechaHoraR DATETIME,
    cantidadR INT,
    totalR DECIMAL(10,2),
    idC VARCHAR(4),
    PRIMARY KEY (idR),
    FOREIGN KEY (idC) REFERENCES tConcepto(idC),
    idS VARCHAR(4),
    FOREIGN KEY (idS) REFERENCES tSolicitante(idS)
);

INSERT INTO tRecibo
VALUES('R002','2017-06-27 11:30:00',9,NULL, 'C001', 'S001');
INSERT INTO tRecibo
VALUES('R003', '2017-07-25 12:30:00',1,NULL, 'C002', 'S002');
INSERT INTO tRecibo
VALUES('R004', '2017-07-26 09:45:00',1,NULL, 'C003', 'S003');
INSERT INTO tRecibo
VALUES('R005', '2017-08-01 09:55:00',1,NULL, 'C004', 'S004');
INSERT INTO tRecibo
VALUES('R006','2017-08-03 09:56:00',1,NULL, 'C005', 'S004');
INSERT INTO tRecibo
VALUES('R007', '2017-08-04 12:00:00',1,NULL, 'C006', 'S005');

CREATE TABLE tTramite
( 
    idT VARCHAR(4) NOT NULL, 
    fechaHoraT DATETIME,
    nombreT VARCHAR(70),
    cantidadFoliosT INT,
    idS VARCHAR(4),
    PRIMARY KEY (idT),
    FOREIGN KEY (idS) REFERENCES tSolicitante(idS),
    idO VARCHAR(4),
    FOREIGN KEY (idO) REFERENCES tOficina(idO)
);

CREATE TABLE tRecibo_Tramite
(
    idRT VARCHAR(4) NOT NULL,
    PRIMARY KEY (idRT),
    idT VARCHAR(4),
    FOREIGN KEY (idT) REFERENCES tTramite(idT),
    idR VARCHAR(4),
    FOREIGN KEY (idR) REFERENCES tRecibo(idR)
);

INSERT INTO tTramite
VALUES('T001','2027-06-25 10:15:00','Licencia por 2 días',2,'S006','O005');
INSERT INTO tTramite
VALUES('T002','2017-06-27 12:00:00','Convalidación de sílabos de I.S.',2,'S001','O006');
INSERT INTO tTramite
VALUES('T003','2017-07-25 12:50:00','Constancia de seg. estudios',2,'S002','O006');
INSERT INTO tTramite
VALUES('T004','2017-07-26 10:00:00','Certificado de estudios del 2017-I',2,'S003','O006');
INSERT INTO tTramite
VALUES('T005','2017-08-01 10:05:00','Bachillerato',11,'S004','O006');
INSERT INTO tTramite
VALUES('T006','2017-08-03 12:30:00','Carta presentación práct EGEMSA 1-sep al 1 mar 2017',2,'S005','O006');
INSERT INTO tTramite
VALUES('T007','2017-08-04 08:30:00','Permiso por salud 5 días',2,'S007','O005');

INSERT INTO tRecibo_Tramite
VALUES('RT01','T002','R002');
INSERT INTO tRecibo_Tramite
VALUES('RT02','T003','R003');
INSERT INTO tRecibo_Tramite
VALUES('RT03','T004','R004');
INSERT INTO tRecibo_Tramite
VALUES('RT04','T005','R005');
INSERT INTO tRecibo_Tramite
VALUES('RT05','T005','R006');
INSERT INTO tRecibo_Tramite
VALUES('RT06','T006','R007');





-------------------------------------
-- Consulta para listar los trámites de un solicitante:
USE PuroGalactico;

DROP PROCEDURE IF EXISTS spListarTramitesSolicitante;

DELIMITER $$

CREATE PROCEDURE spListarTramitesSolicitante(IN CodSolicitante VARCHAR(4))
BEGIN
    SELECT 
        T.idT AS TramiteID,
        CONCAT(S.paternoS, ' ', S.maternoS, ' ', S.nombresS) AS DatosSolicitante,
        O.denominacionO AS Oficina,
        T.nombreT AS NombreTramite,
        T.fechaHoraT AS FechaHora
    FROM tTramite T
    WHERE T.idS IN (
        SELECT idS
        FROM tSolicitante S
        WHERE S.idS = CodSolicitante
    )
    AND T.idO IN (
        SELECT idO
        FROM tOficina O
        WHERE O.idO = T.idO
    )
    ORDER BY T.fechaHoraT DESC;
END $$

DELIMITER ;

CALL spListarTramitesSolicitante('S001');


--------------------------------------------------

-- Consulta que lista todos los trámites con sus solicitantes y oficinas
USE PuroGalactico;

SELECT 
    T.idT AS TramiteID,
    S.paternoS + ' ' + S.maternoS + ' ' + S.nombresS AS DatosSolicitante,
    O.denominacionO AS Oficina,
    T.nombreT AS NombreTramite,
    T.fechaHoraT AS FechaHora
FROM tTramite T
JOIN tSolicitante S ON T.idS = S.idS
JOIN tOficina O ON T.idO = O.idO
ORDER BY T.fechaHoraT DESC;



---------------------------------------------------

-- Procedimiento para listar solicitantes con sus respectivos recibos

USE PuroGalactico;

DROP PROCEDURE IF EXISTS spListarSolicitantesRecibos;

DELIMITER $$

CREATE PROCEDURE spListarSolicitantesRecibos(IN CodSolicitante VARCHAR(4))
BEGIN
    SELECT 
        S.nombresS + ' ' + S.paternoS + ' ' + S.maternoS AS DatosSolicitante,
        C.denominacionC AS Concepto,
        R.cantidadR AS Cantidad,
        R.totalR AS Total
    FROM tSolicitante S
    JOIN tRecibo R ON S.idS = R.idS
    JOIN tConcepto C ON R.idC = C.idC
    WHERE S.idS = CodSolicitante
    ORDER BY S.nombresS;
END $$

DELIMITER ;

CALL spListarSolicitantesRecibos('S001');


------------------------------------------------

-- Procedimiento para listar solicitantes con un concepto específico

USE PuroGalactico;

DROP PROCEDURE IF EXISTS splistarSolicitanteConcepto;

DELIMITER $$

CREATE PROCEDURE splistarSolicitanteConcepto(IN CodConcepto VARCHAR(4))
BEGIN
    SELECT 
        S.paternoS + ' ' + S.maternoS + ' ' + S.nombresS AS DatosSolicitante,
        C.denominacionC AS Concepto
    FROM tSolicitante S
    JOIN tRecibo R ON S.idS = R.idS
    JOIN tConcepto C ON R.idC = C.idC
    WHERE C.idC = CodConcepto
    ORDER BY DatosSolicitante;
END $$

DELIMITER ;

CALL splistarSolicitanteConcepto('C007');

---------------------------------------------------

-- Consulta para listar todos los solicitantes con los conceptos (relacionados con los recibos)

USE PuroGalactico;

SELECT 
    S.paternoS + ' ' + S.maternoS + ' ' + S.nombresS AS DatosSolicitante,
    C.denominacionC AS Concepto
FROM tSolicitante S
JOIN tRecibo R ON S.idS = R.idS
JOIN tConcepto C ON R.idC = C.idC
ORDER BY DatosSolicitante;

