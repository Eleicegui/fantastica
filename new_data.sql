ALTER TABLE OrdenCompra ADD estado ENUM('Paga', 'Pendiente', 'Cancelada', 'Entregada');  -- SACARLO
ALTER TABLE DescripcionProducto ADD imagen VARCHAR(100);

INSERT INTO `Proveedor` (`id`, `razon_social`, `cuit`, `telefono`, `direccion`, `email`, `activo`, `fecha_alta`) VALUES
    (2, "Intel Corp.", "20-112458725-7", "411800", "Juan B. Justo 4500, Capital Federal", "contacto@intel.com", 1, "2018-06-20"),
    (3, "AMD Inc.", "20-80118725-7", "431735", "Udaondo 547, Capital Federal", "contacto@amd.com", 1, "2018-06-21");


INSERT INTO `Marca` (`id`, `proveedor_id`, `nombre`) VALUES
    (2, 2, "Intel"),
    (3, 3, "AMD"),
    (4, 3, "Kingston");


INSERT INTO `Categoria` (`id`, `nombre`) VALUES
    (10, "Memoria RAM");


-- CPU's de Intel y AMD
INSERT INTO `Producto` (`id`, `marca_id`, `categoria_id`, `detalle`) VALUES
    (6, 2, 8, "Sin especificar"),
    (7, 3, 8, "Sin especificar"),
    (8, 1, 10, "Sin especificar"),
    (9, 4, 10, "Sin especificar");


INSERT INTO `DescripcionProducto` (`id`, `producto_id`, `fecha_alta`, `modelo`, `descripcion`, `costo`, `precio`, `stock`, `imagen`) VALUES
    (6, 6, '2018-09-07 11:09:02', 'Core i7-9700K', '- 12 MB SmartCache Caché, - 8 Núcleos, - 4.90 GHz Frecuencia turbo máxima', 4500, 13999, 10, 'intel-i7.png'),
    (7, 6, '2018-09-07 11:10:22', 'Core i9-9900K', '- 16 MB SmartCache Caché, - 8 Núcleos, - 5 GHz Frecuencia turbo máxima', 6500, 17999, 5, 'intel-i9.png'),
    (8, 7, '2018-09-07 11:20:18', 'Ryzen™ Threadripper™', '- 80 MB Caché, - 32 Núcleos, - 4.2 GHz Frecuencia turbo máxima', 5500, 16999, 5, 'amd-ryzen.png'),
    (9, 1, '2018-09-10 11:20:18', 'GA-Z170X-Gaming G1', '- Supports 7th / 6th Generation Intel® Core™ Processors, - Dual Channel DDR4, 4 DIMMs', 3500, 12999, 10, 'motherboard_2.png'),
    (10, 1, '2018-09-10 11:22:38', 'GA-X99-SOC Force', '- Supports Intel® Core™ i7 6950X Processor Extreme Edition, - 4 Channel DDR4,8 DIMMs', 4900, 14999, 10, 'motherboard_3.png'),
    (11, 8, '2018-09-10 11:23:38', 'GA 2666MHz', '- DDR4-2666 MHz', 1900, 8000, 7, 'ram_2.png'),
    (12, 8, '2018-09-10 11:24:48', 'GA 2666MHz', '- des', 2900, 10999, 23, 'ram_1.png'),
    (13, 9, '2018-09-10 11:24:48', 'GA 2666MHz', '- des', 1900, 9999, 10, 'ram_3.png');



-- SELECT DescripcionProducto.id, modelo, descripcion, Categoria.nombre AS Categoría, Marca.nombre AS Marca
-- FROM DescripcionProducto, Producto, Categoria, Marca
-- WHERE DescripcionProducto.producto_id=Producto.id AND
--    Categoria.id=Producto.categoria_id AND
--    Marca.id=Producto.marca_id
--    AND Categoria.nombre="CPU";
