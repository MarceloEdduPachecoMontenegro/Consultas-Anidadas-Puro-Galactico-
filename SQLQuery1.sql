
USE BDPuroGalactico;
GO

-- Tabla de Oficinas
CREATE TABLE tOficina (
    idO INT PRIMARY KEY IDENTITY(1,1),
    denominacionO VARCHAR(100) NOT NULL,
    ubicacionO VARCHAR(255) NOT NULL,
    responsableO VARCHAR(100) NOT NULL
);

-- Tabla de Solicitantes
CREATE TABLE tSolicitante (
    idS INT PRIMARY KEY IDENTITY(1,1),
    tipoS VARCHAR(50),
    tipoDocumS VARCHAR(50),
    nroDocumS VARCHAR(50),
    paternoS VARCHAR(50),
    maternoS VARCHAR(50),
    nombresS VARCHAR(100),
    razonSocialS VARCHAR(255),
    celularS VARCHAR(20),
    telefonoS VARCHAR(20),
    dirElectronS VARCHAR(255)
);

-- Tabla de Trámites
CREATE TABLE tTramite (
    idT INT PRIMARY KEY IDENTITY(1,1),
    fechaHoraT DATETIME DEFAULT GETDATE(),
    nombreT VARCHAR(100) NOT NULL,
    cantidadFoliosT INT,
    idS INT NOT NULL,
    idO INT NOT NULL,
    FOREIGN KEY (idS) REFERENCES tSolicitante(idS),
    FOREIGN KEY (idO) REFERENCES tOficina(idO)
);

-- Tabla de Conceptos
CREATE TABLE tConcepto (
    idC INT PRIMARY KEY IDENTITY(1,1),
    denominacionC VARCHAR(100) NOT NULL,
    costoC DECIMAL(10,2) NOT NULL
);

-- Tabla de Recibos
CREATE TABLE tRecibo (
    idR INT PRIMARY KEY IDENTITY(1,1),
    fechaHoraR DATETIME DEFAULT GETDATE(),
    cantidadR INT NOT NULL,
    totalR DECIMAL(10,2) NOT NULL,
    idC INT NOT NULL,
    idS INT NOT NULL,
    FOREIGN KEY (idC) REFERENCES tConcepto(idC),
    FOREIGN KEY (idS) REFERENCES tSolicitante(idS)
);

-- Tabla intermedia para la relación entre Recibos y Trámites (muchos a muchos)
CREATE TABLE tRecibo_Tramite (
    idRT INT PRIMARY KEY IDENTITY(1,1),
    idT INT NOT NULL,
    idR INT NOT NULL,
    FOREIGN KEY (idT) REFERENCES tTramite(idT),
    FOREIGN KEY (idR) REFERENCES tRecibo(idR)
);
}

