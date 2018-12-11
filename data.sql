DELETE FROM DescripcionOrden;
DELETE FROM OrdenCompra;
DELETE FROM DescripcionProducto;
DELETE FROM Producto;
DELETE FROM Categoria;
DELETE FROM Marca;
DELETE FROM Cliente;
DELETE FROM Proveedor;


INSERT INTO `Proveedor` (`id`, `razon_social`, `cuit`, `telefono`, `direccion`, `email`, `activo`, `fecha_alta`) VALUES
    (1, "Mayorista Burns", "20-15245625-0", "456456", "Av. San Martín 200, Capital Federal", "burns@gmail.com", 1, "2017-05-15");


INSERT INTO `Marca` (`id`, `proveedor_id`, `nombre`) VALUES
    (1, 1, "GIGABYTE");


INSERT INTO `Categoria` (`id`, `nombre`) VALUES
    (1, "Motherboard"),
    (2, "Tarjeta de video"),
    (3, "Tarjeta de sonido"),
    (4, "Disco rígido"),
    (5, "Teclado"),
    (6, "Mouse"),
    (7, "Monitor"),
    (8, "CPU"),
    (9, "Gabinete");


INSERT INTO `Producto` (`id`, `marca_id`, `categoria_id`, `detalle`) VALUES
    (1, 1, 1, "Sin especificar"),
    (2, 1, 2, "Sin especificar"),
    (3, 1, 6, "Sin especificar"),
    (4, 1, 5, "Sin especificar"),
    (5, 1, 9, "Sin especificar");


INSERT INTO `DescripcionProducto` (`id`, `producto_id`, `fecha_alta`, `modelo`, `descripcion`, `costo`, `precio`, `stock`) VALUES
    (1, 1, '2017-08-26 11:00:00', 'GTX100', '- Socket Intel', 2000, 9870, 5),
    (2, 2, '2017-08-27 12:30:00', 'GTX1050', '- 2GB DDR5', 1500, 5360, 4),
    (3, 3, '2017-08-27 12:30:00', 'AORUS M5', '- 16000 DPI', 300, 1200, 10),
    (4, 4, '2017-08-27 12:30:00', 'FORCE K81', '- Mecanico', 500, 2000, 8),
    (5, 5, '2018-10-18 09:23:34', 'AC300W', '- RGB Fusion-16.7M Customizable RGB Lighting', 990, 4499, 9);


INSERT INTO `Cliente` (`id`, `nombre`, `direccion`, `cuil`, `fecha_alta`) VALUES
    (1, 'Hernán Valdez', 'Calle 18 esq 11, 6360, General Pico, La Pampa, Argentina', '20-37825523-0', '2018-02-25'),
    (2, 'Esteban Lopez', 'Calle 15 Nº 1030, 6360, General Pico, La Pampa, Argentina', '20-35222523-0', '2018-02-27'),
    (3, 'Claudia Garcia', 'Av. Siempreviva Nº 746, 6300, Santa Rosa, La Pampa, Argentina', '27-25222523-0', '2018-03-10');


-- INSERT INTO `OrdenCompra` (`id`, `cliente_id`, `fecha`, `activa`) VALUES
--     (1, 1, '2018-02-26 15:40:20', 0),
--     (2, 3, '2018-03-11 16:03:10', 1),
--     (3, 1, '2018-03-13 11:00:37', 1);


-- INSERT INTO `DescripcionOrden` (`id`, `descripcionProducto_id`, `ordenCompra_id`, `costo`, `precio`, `cantidad`) VALUES
--     (1, 1, 1, 2000, 9870, 1),
--     (2, 1, 2, 2000, 9870, 1),
--     (3, 1, 3, 2000, 9870, 2),
--     (4, 2, 3, 1500, 5360, 1);
