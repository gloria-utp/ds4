-- Crear base de datos
CREATE DATABASE GloriaMoreno;
GO

USE GloriaMoreno;
GO

-- Tabla de Abogados (GM_Abogados)
CREATE TABLE GM_Abogados (
    AbogadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100),
    Email VARCHAR(100),
    Telefono VARCHAR(20),
    Estado VARCHAR(20) DEFAULT 'Activo'
);

-- Tabla de Casos (GM_Casos)
CREATE TABLE GM_Casos (
    CasoID INT PRIMARY KEY IDENTITY(1,1),
    NumeroCaso VARCHAR(50) UNIQUE NOT NULL,
    Titulo VARCHAR(200) NOT NULL,
    Descripcion TEXT,
    AbogadoID INT FOREIGN KEY REFERENCES GM_Abogados(AbogadoID),
    ClienteNombre VARCHAR(100),
    FechaInicio DATE,
    FechaVencimiento DATE,
    Estado VARCHAR(50) DEFAULT 'En Proceso',
    PalabraClave1 VARCHAR(50),
    PalabraClave2 VARCHAR(50),
    PalabraClave3 VARCHAR(50),
    DocumentoURL VARCHAR(500),
    UbicacionFisica VARCHAR(200)
);

-- Tabla de Eventos/Calendario (GM_Calendario)
CREATE TABLE GM_Calendario (
    EventoID INT PRIMARY KEY IDENTITY(1,1),
    CasoID INT FOREIGN KEY REFERENCES GM_Casos(CasoID),
    TituloEvento VARCHAR(200) NOT NULL,
    Descripcion TEXT,
    FechaHora DATETIME,
    TipoEvento VARCHAR(50), -- 'Audiencia', 'Reunión', 'Plazo'
    Ubicacion VARCHAR(200),
    Recordatorio BIT DEFAULT 1
);

-- Insertar datos de ejemplo (3 registros cada tabla)

-- Abogados
INSERT INTO GM_Abogados (Nombre, Especialidad, Email, Telefono) VALUES
('Carlos Rodríguez', 'Derecho Penal', 'carlos@bufete.com', '555-0101'),
('Ana Martínez', 'Derecho Civil', 'ana@bufete.com', '555-0102'),
('Luis González', 'Derecho Laboral', 'luis@bufete.com', '555-0103');

-- Casos
INSERT INTO GM_Casos (NumeroCaso, Titulo, Descripcion, AbogadoID, ClienteNombre, 
                     FechaInicio, FechaVencimiento, Estado, 
                     PalabraClave1, PalabraClave2, PalabraClave3,
                     DocumentoURL, UbicacionFisica) VALUES
('C-2024-001', 'Demanda por Incumplimiento Contractual', 
 'Caso contra Constructora XYZ por incumplimiento de contrato', 1, 'Empresa ABC',
 '2024-01-15', '2024-06-30', 'En Proceso',
 'Contrato', 'Incumplimiento', 'Indemnización',
 'https://ftp.bufete.com/docs/contrato001.pdf', 'Anaquel A-1'),
 
('C-2024-002', 'Divorcio Contencioso', 
 'Proceso de divorcio con disputa de bienes', 2, 'María López',
 '2024-02-10', '2024-05-20', 'En Audiencia',
 'Divorcio', 'Bienes', 'Pensión',
 'https://ftp.bufete.com/docs/divorcio002.pdf', 'Anaquel B-3'),
 
('C-2024-003', 'Despido Injustificado', 
 'Demanda laboral por despido sin causa justa', 3, 'Juan Pérez',
 '2024-03-05', '2024-07-15', 'Investigación',
 'Laboral', 'Despido', 'Indemnización',
 'https://ftp.bufete.com/docs/laboral003.pdf', 'Anaquel C-2');

-- Eventos de Calendario
INSERT INTO GM_Calendario (CasoID, TituloEvento, Descripcion, FechaHora, TipoEvento, Ubicacion) VALUES
(1, 'Audiencia Preliminar', 'Primera audiencia con el juez', '2024-04-15 09:00:00', 'Audiencia', 'Juzgado Civil N°5'),
(2, 'Reunión con Cliente', 'Revisión de documentación', '2024-04-20 14:30:00', 'Reunión', 'Oficina Principal'),
(3, 'Vencimiento de Plazo', 'Presentación de pruebas', '2024-04-25 23:59:59', 'Plazo', NULL);

-- Crear índices
CREATE INDEX idx_Casos_Estado ON GM_Casos(Estado);
CREATE INDEX idx_Casos_Abogado ON GM_Casos(AbogadoID);
CREATE INDEX idx_Calendario_Fecha ON GM_Calendario(FechaHora);
CREATE INDEX idx_Calendario_Caso ON GM_Calendario(CasoID);