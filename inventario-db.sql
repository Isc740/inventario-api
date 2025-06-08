CREATE TABLE Rol (
    RolID INT PRIMARY KEY AUTO_INCREMENT,
    RolNombre VARCHAR(100),
    RolDescripcion VARCHAR(100)
);

CREATE TABLE Ciudad (
    CiuID INT PRIMARY KEY AUTO_INCREMENT,
    CiuNombre VARCHAR(100),
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Iva (
    IvaID INT PRIMARY KEY AUTO_INCREMENT,
    IvaPorcentajeDecimal DECIMAL(5,2),
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE CategoriaProducto (
    CatID INT PRIMARY KEY AUTO_INCREMENT,
    IvaIDFK INT,
    CatDescripcion VARCHAR(100),
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IvaIDFK) REFERENCES Iva(IvaID)
);

CREATE TABLE Marca (
    MarID INT PRIMARY KEY AUTO_INCREMENT,
    MarDescripcion VARCHAR(100),
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Modelo (
    ModID INT PRIMARY KEY AUTO_INCREMENT,
    ModDescripcion VARCHAR(100),
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Producto (
    ProID INT PRIMARY KEY AUTO_INCREMENT,
    ProDescripcion VARCHAR(150),
    ProImagen BLOB,
    CatIDFK INT,
    MarIDFK INT,
    ModIDFK INT,
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CatIDFK) REFERENCES CategoriaProducto(CatID),
    FOREIGN KEY (MarIDFK) REFERENCES Marca(MarID),
    FOREIGN KEY (ModIDFK) REFERENCES Modelo(ModID)
);

CREATE TABLE Cliente (
    CliID INT PRIMARY KEY AUTO_INCREMENT,
    CliNombre VARCHAR(100),
    CliApellido VARCHAR(100),
    CliEmail VARCHAR(100),
    CliContraseña VARCHAR(100),
    RolIDFK INT,
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (RolIDFK) REFERENCES Rol(RolID)
);

CREATE TABLE Proveedores (
    PrvID INT PRIMARY KEY AUTO_INCREMENT,
    PrvRazonSocial VARCHAR(150),
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Lote (
    LotID INT PRIMARY KEY AUTO_INCREMENT,
    LotNumero VARCHAR(50),
    LotDescripcion TEXT,
    LotFecVence DATE,
    Eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Factura (
    FacID INT PRIMARY KEY AUTO_INCREMENT,
    CliIDFK INT,
    CiuIDFK INT,
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CliIDFK) REFERENCES Cliente(CliID),
    FOREIGN KEY (CiuIDFK) REFERENCES Ciudad(CiuID)
);

CREATE TABLE ProLotPrv (
    PlpID INT PRIMARY KEY AUTO_INCREMENT,
    ProIDFK INT,
    LotIDFK INT,
    PrvIDFK INT,
    FOREIGN KEY (ProIDFK) REFERENCES Producto(ProID),
    FOREIGN KEY (LotIDFK) REFERENCES Lote(LotID),
    FOREIGN KEY (PrvIDFK) REFERENCES Proveedores(PrvID)
);

CREATE TABLE FacturaDetalle (
    DetID INT PRIMARY KEY AUTO_INCREMENT,
    DetFecha DATE,
    FacIDFK INT,
    PlpIDFK INT,
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (FacIDFK) REFERENCES Factura(FacID),
    FOREIGN KEY (PlpIDFK) REFERENCES ProLotPrv(PlpID)
);

CREATE TABLE MovimientosCompVentas (
    MovID INT PRIMARY KEY AUTO_INCREMENT,
    MovTipoMovimiento VARCHAR(50),
    MovFecha DATE,
    CompCantidad INT,
    PlpIDFK INT,
    Eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (PlpIDFK) REFERENCES ProLotPrv(PlpID)
);


-- Tabla Rol
INSERT INTO Rol (RolNombre, RolDescripcion) VALUES
('Administrador', 'Acceso total al sistema'),
('Vendedor', 'Acceso a ventas y consultas'),
('Almacenero', 'Gestión de productos y lotes'),
('Cliente', 'Usuario que compra productos'),
('Supervisor', 'Control y revisión general');

-- Tabla Ciudad
INSERT INTO Ciudad (CiuNombre) VALUES
('Barranquilla'),
('Palmar de Varela'),
('Baranoa'),
('Santo Tomás'),
('Soledad');

-- Tabla Iva
INSERT INTO Iva (IvaPorcentajeDecimal) VALUES
(0.00),
(5.00),
(10.00),
(15.00),
(19.00);

-- Tabla CategoriaProducto
INSERT INTO CategoriaProducto (IvaIDFK, CatDescripcion) VALUES
(1, 'Electrodomésticos'),
(2, 'Juguetes'),
(3, 'Ropa'),
(4, 'Alimentos'),
(5, 'Tecnología');

-- Tabla Marca
INSERT INTO Marca (MarDescripcion) VALUES
('Samsung'),
('LG'),
('Sony'),
('Acer'),
('HP');

-- Tabla Modelo
INSERT INTO Modelo (ModDescripcion) VALUES
('Modelo A'),
('Modelo B'),
('Modelo C'),
('Modelo D'),
('Modelo E');

-- Tabla Producto
INSERT INTO Producto (ProDescripcion, CatIDFK, MarIDFK, ModIDFK) VALUES
('Televisor 32 pulgadas', 1, 1, 1),
('Muñeca articulada', 2, 2, 2),
('Camiseta deportiva', 3, 3, 3),
('Paquete arroz 5kg', 4, 4, 4),
('Laptop 15 pulgadas', 5, 5, 5);

-- Tabla Cliente
INSERT INTO Cliente (CliNombre, CliApellido, CliEmail, CliContraseña, RolIDFK) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', 'clave123', 4),
('María', 'Gómez', 'maria.gomez@example.com', 'clave123', 4),
('Carlos', 'Díaz', 'carlos.diaz@example.com', 'clave123', 4),
('Ana', 'Ruiz', 'ana.ruiz@example.com', 'clave123', 4),
('Luis', 'Martínez', 'luis.martinez@example.com', 'clave123', 4);

-- Tabla Proveedores
INSERT INTO Proveedores (PrvRazonSocial) VALUES
('Distribuciones del Norte S.A.S.'),
('Comercializadora Caribeña Ltda.'),
('Proveedor Express S.A.S.'),
('Insumos y Más S.A.S.'),
('Tech Imports S.A.');

-- Tabla Lote
INSERT INTO Lote (LotNumero, LotDescripcion, LotFecVence) VALUES
('L001', 'Primer lote de TVs', '2026-01-15'),
('L002', 'Lote de juguetes importados', '2027-06-10'),
('L003', 'Lote de camisetas deportivas', '2025-12-01'),
('L004', 'Lote de arroz nacional', '2024-11-20'),
('L005', 'Lote de laptops nuevas', '2027-03-30');

-- Tabla Factura
INSERT INTO Factura (CliIDFK, CiuIDFK) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Tabla ProLotPrv
INSERT INTO ProLotPrv (ProIDFK, LotIDFK, PrvIDFK) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Tabla FacturaDetalle
INSERT INTO FacturaDetalle (DetFecha, FacIDFK, PlpIDFK) VALUES
('2025-06-01', 1, 1),
('2025-06-01', 2, 2),
('2025-06-01', 3, 3),
('2025-06-01', 4, 4),
('2025-06-01', 5, 5);

-- Tabla MovimientosCompVentas
INSERT INTO MovimientosCompVentas (MovTipoMovimiento, MovFecha, CompCantidad, PlpIDFK) VALUES
('Venta', '2025-06-01', 3, 1),
('Venta', '2025-06-01', 2, 2),
('Venta', '2025-06-01', 1, 3),
('Venta', '2025-06-01', 5, 4),
('Venta', '2025-06-01', 2, 5);
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (1, 'Jamesborough');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (2, 'West Brian');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (3, 'South Geraldborough');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (4, 'South Julia');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (5, 'North Nathanielville');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (6, 'Patelchester');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (7, 'West Kimberly');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (8, 'Lake Bryan');
INSERT INTO Ciudad (CiuID, CiuNombre) VALUES (9, 'Williamview');
INSERT INTO Ciudad (CiuId, CiuNombre) VALUES (10, 'North Danielle');

INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (1, 'Joseph Turner', 'kelly81@yahoo.com', 8);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (2, 'April Brown', 'djohnson@yahoo.com', 3);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (3, 'Megan Lane', 'katherine20@brown-nguyen.net', 8);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (4, 'Andrew Aguirre', 'davismargaret@garcia.org', 10);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (5, 'Trevor Mcmillan', 'inichols@hotmail.com', 2);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (6, 'Ryan Gomez', 'stephanie21@hubbard.com', 3);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (7, 'Catherine Johnson', 'jonathon81@gmail.com', 2);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (8, 'Cheryl Johnston', 'andrew59@thompson.net', 2);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (9, 'Brad Scott', 'williammccall@woodard.biz', 1);
INSERT INTO Cliente (CliID, CliNombre, CliEmail, CiuIDFK) VALUES (10, 'Renee Rodriguez', 'clarkcaroline@morton.com', 10);

INSERT INTO Administrador (AdmID, AdmNombre) VALUES (1, 'Heather Watson');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (2, 'Deborah Carpenter DDS');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (3, 'Joel Morales');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (4, 'Lauren Hudson');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (5, 'Lawrence Ayers');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (6, 'Benjamin Ho');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (7, 'Jason Mendoza');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (8, 'Michele Sims');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (9, 'Megan Klein');
INSERT INTO Administrador (AdmID, AdmNombre) VALUES (10, 'Lindsey French');

INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (1, 'Leach-Perry');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (2, 'Liu-Hahn');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (3, 'Phillips-Vega');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (4, 'Hamilton Group');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (5, 'Jackson Ltd');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (6, 'Russell Group');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (7, 'Johnson-Vaughan');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (8, 'Baker-Brown');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (9, 'Rodriguez Ltd');
INSERT INTO Proveedores (PrvID, PrvRazonSocial) VALUES (10, 'Brennan and Sons');

INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (1, 13.06);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (2, 16.6);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (3, 14.24);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (4, 12.68);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (5, 18.73);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (6, 14.7);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (7, 18.17);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (8, 7.31);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (9, 6.87);
INSERT INTO IVA (IvaID, IvaPorcentajeDecimal) VALUES (10, 11.34);
j
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (1, 'Account');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (2, 'But');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (3, 'Network');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (4, 'Control');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (5, 'Property');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (6, 'We');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (7, 'Throw');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (8, 'Into');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (9, 'Democratic');
INSERT INTO CategoriaProducto (CatID, CatDescripcion) VALUES (10, 'Stop');

INSERT INTO Marca (MarID, MarDescripcion) VALUES (1, 'Begin');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (2, 'Difficult');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (3, 'Heavy');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (4, 'Management');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (5, 'Own');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (6, 'Bank');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (7, 'Tonight');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (8, 'Really');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (9, 'Anyone');
INSERT INTO Marca (MarID, MarDescripcion) VALUES (10, 'Agree');

INSERT INTO Modelo (ModID, ModDescripcion) VALUES (1, 'Employee');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (2, 'Try');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (3, 'Thank');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (4, 'No');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (5, 'Air');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (6, 'Job');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (7, 'Move');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (8, 'Off');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (9, 'Relationship');
INSERT INTO Modelo (ModID, ModDescripcion) VALUES (10, 'Reality');

INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (1, 'Most', 1, 1, 3, 1);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (2, 'Fund', 3, 2, 9, 3);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (3, 'Whether', 5, 9, 1, 9);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (4, 'End', 5, 4, 7, 7);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (5, 'Really', 5, 9, 8, 3);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (6, 'Concern', 4, 6, 7, 3);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (7, 'Me', 7, 7, 8, 5);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (8, 'Explain', 3, 6, 8, 5);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (9, 'Whose', 1, 1, 4, 9);
INSERT INTO Producto (ProID, ProDescripcion, CatID, MarID, ModID, IvaID) VALUES (10, 'Clearly', 1, 3, 2, 10);

INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (1, 'L403', 'Kid just tonight how television.', '2026-01-23', 9);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (2, 'L344', 'Pressure race.', '2025-09-14', 4);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (3, 'L615', 'Reason small much spend you.', '2025-12-10', 1);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (4, 'L567', 'Arm raise time.', '2026-01-26', 2);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (5, 'L264', 'Consider address more claim.', '2025-09-24', 8);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (6, 'L849', 'Himself make able character pretty.', '2025-10-30', 10);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (7, 'L833', 'State participant buy interesting form.', '2025-09-21', 5);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (8, 'L439', 'Your recognize so.', '2026-04-30', 1);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (9, 'L478', 'A wait woman dinner.', '2026-03-31', 10);
INSERT INTO Lote (LotID, LotNumero, LotDescripcion, LotFecVence, ProID) VALUES (10, 'L087', 'Pass house ability.', '2025-08-28', 6);

INSERT INTO Factura (FacID, CliID) VALUES (1, 2);
INSERT INTO Factura (FacID, CliID) VALUES (2, 9);
INSERT INTO Factura (FacID, CliID) VALUES (3, 9);
INSERT INTO Factura (FacID, CliID) VALUES (4, 8);
INSERT INTO Factura (FacID, CliID) VALUES (5, 5);
INSERT INTO Factura (FacID, CliID) VALUES (6, 4);
INSERT INTO Factura (FacID, CliID) VALUES (7, 3);
INSERT INTO Factura (FacID, CliID) VALUES (8, 6);
INSERT INTO Factura (FacID, CliID) VALUES (9, 8);
INSERT INTO Factura (FacID, CliID) VALUES (10, 5);

INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (1, 8, 8, '2025-03-22');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (2, 8, 5, '2025-03-30');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (3, 5, 4, '2025-05-13');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (4, 9, 10, '2025-03-15');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (5, 1, 8, '2024-12-17');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (6, 10, 8, '2024-10-30');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (7, 6, 8, '2024-06-27');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (8, 3, 7, '2024-06-16');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (9, 3, 1, '2024-12-18');
INSERT INTO FacturaDetalle (DetID, FacID, ProID, DetFecha) VALUES (10, 4, 8, '2024-12-11');

INSERT INTO FacImpuestos (FacID, IvaID) VALUES (9, 4);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (8, 5);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (4, 10);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (9, 7);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (3, 3);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (4, 2);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (4, 10);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (5, 1);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (3, 6);
INSERT INTO FacImpuestos (FacID, IvaID) VALUES (10, 6);

INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (1, 'Entrada', '2025-06-07', 5, 2);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (2, 'Salida', '2025-06-07', 38, 7);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (3, 'Entrada', '2025-06-07', 78, 7);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (4, 'Entrada', '2025-06-07', 74, 8);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (5, 'Salida', '2025-06-07', 63, 4);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (6, 'Salida', '2025-06-07', 71, 9);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (7, 'Salida', '2025-06-07', 8, 7);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (8, 'Entrada', '2025-06-07', 86, 9);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (9, 'Salida', '2025-06-07', 3, 5);
INSERT INTO MovimientosCompVentas (MovID, MovTipoMovimiento, MovFecha, CompCantidad, LotID) VALUES (10, 'Entrada', '2025-06-07', 71, 5);
