-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 03:32:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Base de datos: `spautp`

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `especialidad`
CREATE TABLE `especialidad` (
  `idespecialidad` int(11) NOT NULL,
  `nomespecial` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `especialidad`
INSERT INTO `especialidad` (`idespecialidad`, `nomespecial`) VALUES
(1, 'Masajista'),
(2, 'Esteticistas'),
(3, 'Terapeuta'),
(4, 'Fisioterapeuta'),
(5, 'cas');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `horarios`
CREATE TABLE `horarios` (
  `idhorario` int(11) NOT NULL,
  `idTecnico` int(11) NOT NULL,
  `numconsultorio` varchar(20) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `dia` varchar(20) NOT NULL,
  `estadoHorario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `horarios`
INSERT INTO `horarios` (`idhorario`, `idTecnico`, `numconsultorio`, `turno`, `dia`, `estadoHorario`) VALUES
(1, 230004, '1', 'tarde', 'lunes', 1),
(2, 230004, '1', 'tarde', 'lunes', 1),
(4, 230004, '1', 'tarde', 'martes', 0);

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `insumos`
CREATE TABLE `insumos` (
  `idinsumo` int(11) NOT NULL,
  `nombreinsumo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `insumos`
INSERT INTO `insumos` (`idinsumo`, `nombreinsumo`) VALUES
(1, 'Shampoo'),
(2, 'Acondicionador');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `persona`
CREATE TABLE `persona` (
  `codigo` int(11) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apelpat` varchar(50) NOT NULL,
  `apelmat` varchar(50) DEFAULT NULL,
  `dni` varchar(9) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `horario` varchar(20) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idespecialidad` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `distrito` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `persona`
INSERT INTO `persona` (`codigo`, `nombres`, `apelpat`, `apelmat`, `dni`, `correo`, `telefono`, `contrasena`, `fnacimiento`, `turno`, `horario`, `estado`, `idrol`, `idespecialidad`, `direccion`, `distrito`) VALUES
(230001, 'Carlos Eiral', 'Llallacachi', 'Ventura', '71650006', 'carlos.lv@gmail.com', '999999999', '12345', '2001-10-15', 'mañana', 'lun mar mier jue vie', 0, 1, 1, 'Auis. Las MAlvinas', 'Cayma'),
(230004, 'Hector', 'Huamani', 'Paxi', '70707070', 'Hector@gmail.com', '+51992386138', '123456', NULL, 'tarde', 'lunes', 1, 1, 2, 'PSJ. Cerrito BelÃ©n mz. K lt. 13', 'Mariano Melgar'),
(230005, 'Erick', 'Pampa', 'Paxi', '70707070', 'ErickPampa@gmail.com', '+51992386138', '123456', NULL, 'tarde', 'lunes', 1, 1, 2, 'PSJ. Cerrito BelÃ©n mz. K lt. 13', 'Mariano Melgar'),
(230006, 'Jose', 'Hugo', 'Paxi', '70707070', 'josehugo@gmail.com', '+51992386138', '123456', NULL, 'tarde', 'lunes', 1, 1, 2, 'PSJ. Cerrito BelÃ©n mz. K lt. 13', 'Mariano Melgar');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `reserva`
CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `codCliente` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `hora` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `reservaservicio`
CREATE TABLE `reservaservicio` (
  `id` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `rol`
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nomrol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `rol`
INSERT INTO `rol` (`idrol`, `nomrol`) VALUES
(1, 'Administrador'),
(2, 'Encargado'),
(3, 'Técnico'),
(4, 'Cliente');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `servicio`
CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL,
  `nomserv` varchar(40) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `idtipo` int(11) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `estadoserv` int(11) NOT NULL,
  `duracion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `servicio`
INSERT INTO `servicio` (`idservicio`, `nomserv`, `descripcion`, `turno`, `precio`, `idtipo`, `imagen`, `estadoserv`, `duracion`) VALUES
(1, 'Masaje Sueco', 'Esta técnica es la más popular de los tipos de masajes que existen, se basa en aplicar una serie de movimientos particulares como el tapotement, fricción, petrissage, percusión, effleurage, nudillares y espirales.', 'mañana', 60, 1, 'choc.jpg', 0, '3h'),
(2, 'Masaje Thai', 'Un método milenario a través del cual se aplica presión y diferentes maniobras en los puntos donde se cruzan las líneas de energía del cuerpo, incluidas las palmas de las manos, brazos, codos y pies. Antes de comenzar con el masaje, se realiza

