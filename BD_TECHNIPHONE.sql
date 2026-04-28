-- CREAR SOLO LA BD SIN NADA MÁS, Y LUEGO DE HABER HECHO CLEAN AND BUILD SE CREARAN LAS TABLAS

CREATE DATABASE IF NOT EXISTS TECHNIPHONE_BD
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE TECHNIPHONE_BD;


-- =============================================
--  TECHNIPHONE_BD - Datos iniciales
--  Ejecutar DESPUES de la primera ejecución del proyecto habiendo verificado la creación de las tablas 
-- =============================================

USE TECHNIPHONE_BD;

INSERT INTO roles (nombre_rol) VALUES ('ROL_ADMIN'), ('ROL_USUARIO');

INSERT INTO usuarios (nombre, telefono, username, password, nivel_acceso, habilitado)
VALUES ('Administrador', '7000-0000', 'admin', 'admin123', 1, true);

INSERT INTO usuario_roles (usuario_id, rol_id)
SELECT u.id, r.id_rol FROM usuarios u, roles r
WHERE u.username = 'admin' AND r.nombre_rol = 'ROL_ADMIN';

INSERT INTO categorias (nombre, descripcion) VALUES
('Accesorios',   'Cables, cargadores, fundas'),
('Repuestos',    'Pantallas, baterias, modulos'),
('Gadgets',      'Audifonos, smartwatches'),
('Herramientas', 'Herramientas de reparacion'),
('Celulares',    'Telefonos nuevos y usados');
