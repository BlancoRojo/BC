-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2016 a las 17:48:20
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `brainchaco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`) VALUES
(1, 'GEOGRAFIA'),
(2, 'HISTORIA'),
(3, 'CULTURA'),
(4, 'ESCULTURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `imagen` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `descripcion`, `idCat`, `imagen`) VALUES
(1, '¿Cuánto Kilómetros esta cubiertos de bosques  la provincia del Chaco  ?', 1, NULL),
(2, '¿Cuántas  hectáreas conforman la Isla del Cerrito conjuntamente con otras las otras más pequeñas?', 1, NULL),
(3, '¿En que localidad se alcanza la máxima altura con respecto al nivel del mar?', 1, NULL),
(4, '¿Cuanto metros es la altura con respecto  al nivel del mar en la localidad de Taco Pozo?', 1, NULL),
(5, '¿Cuanto metros es la altura con respecto  al nivel del mar en la ciudad de Resistencia?', 1, NULL),
(6, '¿Cuál es el tipo de suelo en el Este y en el centro de la provincia?', 1, NULL),
(7, '¿Entre que meses, la temperatura  asciende a promedios mayores de 20 grados en Resistencia?', 1, NULL),
(8, '¿En que estacion del año, la temperatura desciende a promedio de 15 grados en Resistencia?', 1, NULL),
(9, '¿Donde esta ubicada la Laguna Argüello?', 1, NULL),
(10, '¿Donde esta ubicada la Laguna Ávalos?', 1, NULL),
(11, '¿En que paraje se instala el Coronel José Avalos en 1872 ?', 2, NULL),
(12, '¿En qué año se decreta la fundación de Resistencia?', 2, NULL),
(13, '¿En qué fecha desembarca el primer grupo de familias italianas?', 2, NULL),
(14, '¿En qué puerto desembarca el primer grupo de familias italianas?', 2, NULL),
(15, '¿De donde provenían el primer grupo de familias?', 2, NULL),
(17, '¿Donde esta ubicada la Laguna Malha?', 1, NULL),
(18, '¿Donde esta ubicada la Laguna Limpia?', 1, NULL),
(19, '¿En que parte de Resistencia se encuentra la Laguna Argüello?', 1, NULL),
(20, '¿En que parte de Resistencia se encuentra la Laguna Brava?', 1, NULL),
(21, '¿Cada cuanto año se realiza la Bienal?', 3, NULL),
(22, '¿Quienes trabajan para hacer de cada Bienal una celebración?', 3, NULL),
(23, '¿Cómo fue distinguida  la Bienal?', 3, NULL),
(24, '¿En qué año se realizo el Primer Concurso de Escultura en Madera?', 3, NULL),
(25, '¿Dónde se realizo el Primer Concurso de Escultura en Madera?', 3, NULL),
(26, '¿Cómo fue declara la ciudad de Resistencia por el Congreso de la Nación, en octubre de 2006?', 3, NULL),
(27, '¿En qué año fue declarada, Capital Nacional de las Escultura, la ciudad de Resistencia?', 3, NULL),
(28, '¿Entre que calles, se encuentra la Casa de las Culturas?', 3, NULL),
(29, '¿Quien fue el ganador en la Bienal  2014 con la escultura SEMILLAS CUBICAS?', 3, NULL),
(30, '¿ Que obra fue ganadora en la Bienal 2014? ', 3, NULL),
(31, '¿Cuantos habitantes tiene aproximadamente el departamento Almirante Brown?', 1, NULL),
(32, '¿Cuantos habitantes tiene aproximadamente el departamento San Fernando?', 1, NULL),
(33, '¿Cual es el nombre de la siguiente escultura?', 4, '161.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `descJuego` varchar(512) DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `tiempo` time DEFAULT NULL,
  `fecha` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id`, `idUser`, `descJuego`, `puntaje`, `tiempo`, `fecha`) VALUES
(2, 2, 'memoria', 25, NULL, '12/7/2016'),
(3, 2, 'preguntas', 10, '00:00:34', '12/7/2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestapreguntas`
--

CREATE TABLE `respuestapreguntas` (
  `id` int(11) NOT NULL,
  `idPreg` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `opcion` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestapreguntas`
--

INSERT INTO `respuestapreguntas` (`id`, `idPreg`, `descripcion`, `opcion`) VALUES
(1, 1, '60.000 km.', 'F'),
(1, 2, '12.000 ha.', 'V'),
(1, 3, 'Quitilipi', 'F'),
(1, 4, '250 m ', 'V'),
(1, 5, '51,85m\r\n\r\n', 'V'),
(1, 6, 'Arenoso', 'F'),
(1, 7, 'Octubre- Abril', 'V'),
(1, 8, 'Primavera', 'F'),
(1, 9, 'Charata', 'f'),
(1, 10, 'Las Palmas', 'F'),
(1, 11, 'Paraje Fernando', 'V'),
(1, 12, '1878\r\n\r\n', 'V'),
(1, 13, '12 de Octubre', 'F'),
(1, 14, 'Puerto San Fernando', 'V'),
(1, 15, 'Costa Rica', 'F'),
(1, 17, 'Taco Pozo\r\n', 'F'),
(1, 18, 'Resistencia ', 'V'),
(1, 19, 'Noreste', 'V'),
(1, 20, 'Noreste', 'F'),
(1, 21, '1', 'F'),
(1, 22, 'Gobierno de la Provincia del Chaco y Fundacion Urunday', 'V'),
(1, 23, 'Interes turistico\n', 'F'),
(1, 24, '2009', 'F'),
(1, 25, 'Plaza Central', 'V'),
(1, 26, 'Capital Nacional de las Escultura ', 'V'),
(1, 27, 'octubre del 2006', 'V'),
(1, 28, 'Marcelo T.de Alvear y Mitre', 'V'),
(1, 29, 'Ezequiel Vasquez', 'F'),
(1, 30, 'Semillas Cubicas', 'V'),
(1, 31, '32000', 'F'),
(1, 32, '390.000', 'V'),
(1, 33, 'Perro Pinyno', 'F'),
(2, 1, '45.314km', 'V'),
(2, 2, '5.000 ha', 'F'),
(2, 3, 'Tres Isleta', 'F'),
(2, 4, '20 m', 'F'),
(2, 5, '26m.', 'F'),
(2, 6, 'Pedregosos', 'F'),
(2, 7, 'Marzo- junio', 'F'),
(2, 8, 'Invierno', 'V'),
(2, 9, 'Resistencia', 'v'),
(2, 10, 'Resistencia', 'V'),
(2, 11, 'Paraje Tacuara', 'F'),
(2, 12, '1978', 'F'),
(2, 13, '2 de Febrero de 1878', 'V'),
(2, 14, 'Puerto Madero', 'F'),
(2, 15, 'Chile', 'F'),
(2, 17, 'Saenz Peña.', 'F'),
(2, 18, 'Pampa del Indio', 'F'),
(2, 19, 'Sur', 'F'),
(2, 20, 'Sureste', 'V'),
(2, 21, '2', 'V'),
(2, 22, 'El publico en general', 'F'),
(2, 23, 'Interes General', 'F'),
(2, 24, '2016', 'F'),
(2, 25, 'Casas de las Culturas', 'F'),
(2, 26, 'Capital del Carnaval', 'F'),
(2, 27, 'septiembre de 1986', 'F'),
(2, 28, '9 de Julio y Pellegrini', 'F'),
(2, 29, 'Thierry Ferreira.', 'V'),
(2, 30, 'Espejos del cielo', 'F'),
(2, 31, '34000', 'V'),
(2, 32, '350.000', 'F'),
(2, 33, 'Perro Protector', 'F'),
(3, 1, '80.000 km.', 'F'),
(3, 2, '80.000 ha', 'F'),
(3, 3, 'Taco Pozo', 'V'),
(3, 4, '10 m', 'F'),
(3, 5, '67 m', 'F'),
(3, 6, 'Arcilloso', 'V'),
(3, 7, 'Julio- Agosto', 'F'),
(3, 8, 'Verano', 'F'),
(3, 9, 'Saenz Peña', 'F'),
(3, 10, 'Charata', 'F'),
(3, 11, 'Paraje San Sebastian', 'F'),
(3, 12, '1778', 'F'),
(3, 13, '3 de Abril', 'F'),
(3, 14, 'Puerto Tirol', 'F'),
(3, 15, 'Italia', 'V'),
(3, 17, 'Castelli', 'V'),
(3, 18, 'Charata', 'F'),
(3, 19, 'Norte', 'F'),
(3, 20, 'Noreste', 'F'),
(3, 21, '3', 'F'),
(3, 22, 'Organizacion de los Estados Americanos', 'F'),
(3, 23, 'Alto interes artistico y Cultural', 'V'),
(3, 24, '1988', 'V'),
(3, 25, 'Domo ', 'F'),
(3, 26, 'Capital de la Naranja', 'F'),
(3, 27, 'agosto del 1999', 'v'),
(3, 28, 'Av Sarmiento y Juan B. Justo', 'F'),
(3, 29, 'Dennis Arches', 'F'),
(3, 30, 'Sexto sol', 'F'),
(3, 31, '30000', 'F'),
(3, 32, '280.000', 'F'),
(3, 33, 'Perro Fernando', 'V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `correo` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `password`) VALUES
(1, 'facundo', 'facu@gmail.com', '123'),
(2, 'rodrigo', 'rodrigo@gmail.com', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCat__idx` (`idCat`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser__idx` (`idUser`);

--
-- Indices de la tabla `respuestapreguntas`
--
ALTER TABLE `respuestapreguntas`
  ADD PRIMARY KEY (`id`,`idPreg`),
  ADD KEY `idPreg__idx` (`idPreg`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `puntos_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `respuestapreguntas`
--
ALTER TABLE `respuestapreguntas`
  ADD CONSTRAINT `respuestapreguntas_ibfk_1` FOREIGN KEY (`idPreg`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
