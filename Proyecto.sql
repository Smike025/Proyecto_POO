CREATE DATABASE IF NOT EXISTS TechniPhone;
USE TechniPhone;

-- 2. Tabla Rol (Para manejar Administrador/Vendedor)
CREATE TABLE Rol (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(50) NOT NULL
);

-- 3. Tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    nombreEmpresa VARCHAR(100),
    nit VARCHAR(20) UNIQUE
);

-- 4. Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    dui VARCHAR(10) UNIQUE,
    direccion TEXT
);

-- 5. Tabla Usuario (Dueño y Empleados)
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    idRol INT,
    FOREIGN KEY (idRol) REFERENCES Rol(idRol)
);

-- 6. Tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    idProveedor INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- 7. Tabla Venta (Maestro)
CREATE TABLE Venta (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    fechaVenta DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    metodoPago VARCHAR(50),
    observaciones TEXT,
    idCliente INT,
    idUsuario INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- 8. Tabla DetalleVenta (Detalle)
CREATE TABLE DetalleVenta (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT,
    idProducto INT,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);