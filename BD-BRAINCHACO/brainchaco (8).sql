-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2016 a las 17:32:27
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'GEOGRAFIA'),
(2, 'HISTORIA'),
(3, 'CULTURA'),
(4, 'ESCULTURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `idcat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `descripcion`, `idcat`) VALUES
(1, '¿Cuánto Kilómetros esta cubiertos de bosques  la provincia del Chaco  ?', 1),
(2, '¿Cuántas  hectáreas conforman la Isla del Cerrito conjuntamente con otras las otras más pequeñas?', 1),
(3, '¿En que localidad se alcanza la máxima altura con respecto al nivel del mar?', 1),
(4, '¿Cuanto metros es la altura con respecto  al nivel del mar en la localidad de Taco Pozo?', 1),
(5, '¿Cuanto metros es la altura con respecto  al nivel del mar en la ciudad de Resistencia?', 1),
(6, '¿Cuál es el tipo de suelo en el Este y en el centro de la provincia?', 1),
(7, '¿Entre que meses, la temperatura  asciende a promedios mayores de 20 grados en Resistencia?', 1),
(8, '¿En que estacion del año, la temperatura desciende a promedio de 15 grados en Resistencia?', 1),
(9, '¿Donde esta ubicada la Laguna Argüello?', 1),
(10, '¿Donde esta ubicada la Laguna Ávalos?', 1),
(11, '¿En que paraje se instala el Coronel José Avalos en 1872 ?', 2),
(12, '¿En qué año se decreta la fundación de Resistencia?', 2),
(13, '¿En qué fecha desembarca el primer grupo de familias italianas?', 2),
(14, '¿En qué puerto desembarca el primer grupo de familias italianas?', 2),
(15, '¿De donde provenían el primer grupo de familias?', 2),
(17, '¿Donde esta ubicada la Laguna Malha?', 1),
(18, '¿Donde esta ubicada la Laguna Limpia?', 1),
(19, '¿En que parte de Resistencia se encuentra la Laguna Argüello?', 1),
(20, '¿En que parte de Resistencia se encuentra la Laguna Brava?', 1),
(21, '¿Cada cuanto año se realiza la Bienal?', 3),
(22, '¿Quienes trabajan para hacer de cada Bienal una celebración?', 3),
(23, '¿Cómo fue distinguida  la Bienal?', 3),
(24, '¿En qué año se realizo el Primer Concurso de Escultura en Madera?', 3),
(25, '¿Dónde se realizo el Primer Concurso de Escultura en Madera?', 3),
(26, '¿Cómo fue declara la ciudad de Resistencia por el Congreso de la Nación, en octubre de 2006?', 3),
(27, '¿En qué año fue declarada, Capital Nacional de las Escultura, la ciudad de Resistencia?', 3),
(28, '¿Entre que calles, se encuentra la Casa de las Culturas?', 3),
(29, '¿Quien fue el ganador en la Bienal  2014 con la escultura SEMILLAS CUBICAS?', 4),
(30, '¿ Que obra fue ganadora en la Bienal 2014? ', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje`
--

CREATE TABLE `puntaje` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `descJuego` varchar(512) DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `tiempo` time DEFAULT NULL,
  `fecha` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puntaje`
--

INSERT INTO `puntaje` (`id`, `idUser`, `descJuego`, `puntaje`, `tiempo`, `fecha`) VALUES
(1, 4, 'pregunta', 10, NULL, NULL),
(2, 4, 'pregunta', 50, NULL, NULL),
(3, 4, 'pregunta', 10, NULL, NULL),
(4, 4, 'pregunta', 100, NULL, NULL),
(5, 5, 'pregunta', 100, NULL, NULL),
(6, 5, 'pregunta', 100, NULL, NULL),
(7, 5, 'pregunta', 100, NULL, NULL),
(8, 5, 'pregunta', 5, NULL, NULL),
(9, 5, 'pregunta', 50, NULL, NULL),
(10, 6, 'pregunta', 35, NULL, NULL),
(11, 6, 'pregunta', 40, NULL, NULL),
(12, 6, 'pregunta', 10, NULL, NULL),
(13, 7, 'pregunta', 50, NULL, NULL),
(14, 7, 'pregunta', 15, NULL, NULL),
(15, 7, 'pregunta', 30, NULL, NULL),
(16, 7, 'pregunta', 10, NULL, NULL),
(17, 8, 'pregunta', 15, NULL, NULL),
(18, 8, 'pregunta', 10, NULL, NULL),
(19, 8, 'pregunta', 5, NULL, NULL),
(20, 9, 'pregunta', 100, NULL, NULL),
(21, 6, 'pregunta', 10, NULL, NULL),
(22, 10, 'pregunta', 50, NULL, NULL),
(23, 10, 'pregunta', 15, NULL, NULL),
(24, 11, 'pregunta', 40, NULL, NULL),
(25, 11, 'pregunta', 10, NULL, NULL),
(26, 13, 'pregunta', 15, NULL, NULL),
(27, 13, 'pregunta', 30, NULL, NULL),
(28, 13, 'pregunta', 45, NULL, NULL),
(29, 15, 'pregunta', 400, '00:01:00', NULL),
(30, 16, 'pregunta', 400, '00:01:05', NULL),
(31, 4, 'preguntas', 15, '00:00:00', NULL),
(32, 4, 'preguntas', 5, '00:00:00', NULL),
(33, 4, 'preguntas', 0, '00:00:00', '0000-00-00'),
(34, 4, 'preguntas', 0, '00:00:00', '0000-00-00'),
(35, 4, 'preguntas', 20, '00:00:00', '0000-00-00'),
(36, 4, 'preguntas', 20, '00:00:00', '0000-00-00'),
(37, 4, 'preguntas', 5, '00:00:00', '30/6/2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestapregunta`
--

CREATE TABLE `respuestapregunta` (
  `id` int(11) NOT NULL,
  `idPreg` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `opcion` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestapregunta`
--

INSERT INTO `respuestapregunta` (`id`, `idPreg`, `descripcion`, `opcion`) VALUES
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
(3, 30, 'Sexto sol', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `correo` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`) VALUES
(4, 'facundo', 'facundomierez@gmail.com', '123'),
(5, 'prueba', 'prueba@gmail.com', '123'),
(6, 'alejandro', 'ale@gmail.com', '123'),
(7, 'ruben', 'ruben@hotmail.com', '123'),
(8, 'sandro', 'sandro@gmail.com', '123'),
(9, 'maria', 'maria@gmail.com', '123'),
(10, 'antonella', 'anto@hotmail.com', '123'),
(11, 'juan', 'juan@hotmail.com', '123'),
(12, 'edu', 'edu@gmail.com', '123'),
(13, 'fer', 'fer@hotmail.com', '123'),
(14, 'ana', 'ana@gmail.com', '123'),
(15, 'laura', 'laura@gmail.com', '123'),
(16, 'fernando', 'fer@google.com', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCat__idx` (`idcat`);

--
-- Indices de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser__idx` (`idUser`);

--
-- Indices de la tabla `respuestapregunta`
--
ALTER TABLE `respuestapregunta`
  ADD PRIMARY KEY (`id`,`idPreg`),
  ADD KEY `idPreg__idx` (`idPreg`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD CONSTRAINT `puntaje_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `respuestapregunta`
--
ALTER TABLE `respuestapregunta`
  ADD CONSTRAINT `respuestapregunta_ibfk_1` FOREIGN KEY (`idPreg`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
