CREATE DATABASE AsistenteFinancieroDB;
GO
USE AsistenteFinancieroDB;
GO


CREATE TABLE Categorias (
    Id INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50)
);

INSERT INTO Categorias VALUES
('Alquiler'),
('Comida'),
('Transporte'),
('Servicios'),
('Internet'),
('Entretenimiento'),
('Salud'),
('Educación'),
('Compras'),
('Otros');

CREATE TABLE Ingresos (
    Id INT IDENTITY PRIMARY KEY,
    Tipo VARCHAR(50), -- Salario / Extra
    Monto DECIMAL(10,2),
    Fecha DATETIME DEFAULT GETDATE()
);

CREATE TABLE Gastos (
    Id INT IDENTITY PRIMARY KEY,
    CategoriaId INT,
    Monto DECIMAL(10,2),
    Fecha DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
);

CREATE TABLE Deudas (
    Id INT IDENTITY PRIMARY KEY,
    Monto DECIMAL(10,2),
    Interes DECIMAL(5,2), -- 24
    Meses INT,
    Fecha DATETIME DEFAULT GETDATE()
);


INSERT INTO Ingresos (Tipo, Monto)
VALUES 
('Salario', 1200),
('Extra', 300);

INSERT INTO Gastos (CategoriaId, Monto)
VALUES
(1, 250),  -- Alquiler
(2, 180),  -- Comida
(3, 90);   -- Transporte
