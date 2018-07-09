-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: AutoTerminal
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Автобусы`
--

DROP TABLE IF EXISTS `Автобусы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Автобусы` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Марка` varchar(20) NOT NULL,
  `Номер` varchar(20) NOT NULL,
  `Число мест` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Автобусы`
--

LOCK TABLES `Автобусы` WRITE;
/*!40000 ALTER TABLE `Автобусы` DISABLE KEYS */;
INSERT INTO `Автобусы` VALUES (1,'Volvo','А564ПР178',43),(2,'Ford','К648ЛД178',40),(3,'Chevrolet','О934РП78',30),(4,'Iveco','И948ФВ78',10),(5,'Scania','М345СП178',40);
/*!40000 ALTER TABLE `Автобусы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Водители`
--

DROP TABLE IF EXISTS `Водители`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Водители` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(20) NOT NULL,
  `Имя` varchar(20) NOT NULL,
  `Отчество` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Водители`
--

LOCK TABLES `Водители` WRITE;
/*!40000 ALTER TABLE `Водители` DISABLE KEYS */;
INSERT INTO `Водители` VALUES (1,'Кирилллов','Алесандериры','Камекадевич'),(2,'Воронцов','Иван','Антонович '),(3,'Виталя','Букаткин','Сергеевич '),(4,'Ксения','Шалдыбина','Шурикова '),(5,'Симонян','Даниил','Витальевич '),(6,'Шигрилян','Наталья','Алексеевна '),(7,'Алексеева ','Оксана','Фаридова'),(8,'Денисов','Николай','Васильевич '),(9,'Щукин','Иван','Сидельников'),(10,'Антонов','Сергей','Юрьевич ');
/*!40000 ALTER TABLE `Водители` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Дни движения`
--

DROP TABLE IF EXISTS `Дни движения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Дни движения` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `День` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Дни движения`
--

LOCK TABLES `Дни движения` WRITE;
/*!40000 ALTER TABLE `Дни движения` DISABLE KEYS */;
INSERT INTO `Дни движения` VALUES (1,'Будни'),(2,'Выходные');
/*!40000 ALTER TABLE `Дни движения` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Кондуктора`
--

DROP TABLE IF EXISTS `Кондуктора`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Кондуктора` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(20) NOT NULL,
  `Имя` varchar(20) NOT NULL,
  `Отчество` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Кондуктора`
--

LOCK TABLES `Кондуктора` WRITE;
/*!40000 ALTER TABLE `Кондуктора` DISABLE KEYS */;
INSERT INTO `Кондуктора` VALUES (1,'Навальный','Алексей','Анатольевич'),(2,'Михайлова','Анастосия','Валерьевна'),(4,'Анашкена','Яна','Алексеевна'),(5,'Павлович','Александр','Юрьевич'),(6,'Федоровна','Мария','Вячеславовна'),(7,'Петровна','Елизовета','Викторовна'),(8,'Паутов','Владимир','Тихонович'),(9,'Пиксаев','Максим','Никитьевич'),(10,'Долженко','Андрей ','Алексеевич ');
/*!40000 ALTER TABLE `Кондуктора` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Маршруты`
--

DROP TABLE IF EXISTS `Маршруты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Маршруты` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Пункт отправления` varchar(30) NOT NULL,
  `Пункт назначения` int(11) NOT NULL,
  `День` int(11) NOT NULL,
  `Время в пути` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Пункт назначения` (`Пункт назначения`),
  KEY `День` (`День`),
  CONSTRAINT `маршруты_ibfk_1` FOREIGN KEY (`Пункт назначения`) REFERENCES `Пункты назначения` (`id`),
  CONSTRAINT `маршруты_ibfk_2` FOREIGN KEY (`День`) REFERENCES `Дни движения` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Маршруты`
--

LOCK TABLES `Маршруты` WRITE;
/*!40000 ALTER TABLE `Маршруты` DISABLE KEYS */;
INSERT INTO `Маршруты` VALUES (1,'Малая Балканская',1,1,'01:25:00'),(8,'МАЛАЯ БАЛКАНСКАЯ УЛ.',1,2,'13:51:00'),(9,'Октябрьская д.51',1,1,'00:30:00'),(10,'Метро Ломоносовская',1,2,'02:00:00'),(11,'Ж.-Д. СТАНЦИЯ \"ОБУХОВО\"',1,2,'01:00:00');
/*!40000 ALTER TABLE `Маршруты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Остановки`
--

DROP TABLE IF EXISTS `Остановки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Остановки` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Остановка` varchar(100) NOT NULL,
  `Маршрут` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Маршрут` (`Маршрут`),
  CONSTRAINT `остановки_ibfk_1` FOREIGN KEY (`Маршрут`) REFERENCES `Маршруты` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Остановки`
--

LOCK TABLES `Остановки` WRITE;
/*!40000 ALTER TABLE `Остановки` DISABLE KEYS */;
INSERT INTO `Остановки` VALUES (1,'МАЛАЯ БАЛКАНСКАЯ УЛ.',1),(4,'ЗАГРЕБСКИЙ БУЛЬВАР',1),(5,'БУДАПЕШТСКАЯ УЛ. УГ. М. БАЛКАНСКОЙ УЛ.',1),(6,'БУДАПЕШТСКАЯ УЛ.',1),(7,'БУДАПЕШТСКАЯ УЛ.Д.104',1),(8,'УЛ. Я. ГАШЕКА,УГ. БУДАПЕШТСКОЙ УЛ.',1),(9,'КУПЧИНСКАЯ УЛ. (ПО УЛ. Я. ГАШЕКА)',1),(10,'МАЛАЯ БАЛКАНСКАЯ УЛ. ПО УЛ. Я. ГАШЕКА',1),(11,'СТ. МЕТРО \"КУПЧИНО\"',1),(12,'УЛ. О. ДУНДИЧА,УГ. МАЛОЙ БАЛКАНСКОЙ УЛ.',1),(13,'КУПЧИНСКАЯ УЛ.',1),(14,'БУДАПЕШТСКАЯ УЛ.',1),(15,'ЗАГРЕБСКИЙ БУЛЬВАР',1),(16,'БУХАРЕСТСКАЯ УЛ. УГ. УЛ. О. ДУНДИЧА',1),(17,'УЛ. Я. ГАШЕКА ПО БУХАРЕСТСКОЙ УЛ.',1),(18,'ДУНАЙСКИЙ ПР.,ПО БУХАРЕСТСКОЙ УЛ.',1),(19,'БУХАРЕСТСКАЯ УЛ. 118',1),(20,'УЛ. ДИМИТРОВА',1),(21,'АЛЬПИЙСКИЙ ПЕР.',1),(22,'БУХАРЕСТСКАЯ УЛ.',1),(23,'ПРАЖСКАЯ УЛ.',1),(24,'СОФИЙСКАЯ УЛ.',1),(25,'УЛ. СЕДОВА',1),(26,'УЛ. БАБУШКИНА,УГ. УЛ. ИВАНОВСКАЯ',1),(73,'УЛ. БАБУШКИНА,УГ. УЛ. ИВАНОВСКАЯ',1),(74,'УЛ. БАБУШКИНА, УГ. БУЛЬВАРА КРАСНЫХ ЗОРЬ',1),(75,'ИВАНОВСКАЯ УЛ. УГ. УЛ. БАБУШКИНА',1),(76,'УЛ. СЕДОВА',1),(77,'ПР. СЛАВЫ,УГ. БУХАРЕСТСКОЙ УЛ.',1),(78,'ПРАЖСКАЯ УЛ.',1),(79,'АЛЬПИЙСКИЙ ПЕР.',1),(80,'УЛ. ДИМИТРОВА',1),(81,'БУХАРЕСТСКАЯ УЛ. 118',1),(82,'ДУНАЙСКИЙ ПР.,ПО БУХАРЕСТСКОЙ УЛ.',1),(83,'УЛ. Я. ГАШЕКА ПО БУХАРЕСТСКОЙ УЛ.',1),(84,'БУХАРЕСТСКАЯ УЛ. УГ. УЛ. О. ДУНДИЧА',1),(85,'ЗАГРЕБСКИЙ БУЛЬВАР',1),(86,'УЛ. О. ДУНДИЧА,УГ. БУДАПЕШТСКОЙ УЛ.',1),(87,'КУПЧИНСКАЯ УЛ. ПО УЛ. О. ДУНДИЧА',1),(88,'МАЛАЯ БАЛКАНСКАЯ УЛ. УГ. УЛ. О. ДУНДИЧА',1),(89,'СТ. МЕТРО \"КУПЧИНО\"',1),(90,'МАЛАЯ БАЛКАНСКАЯ УЛ. ПО УЛ. Я. ГАШЕКА',1),(91,'КУПЧИНСКАЯ УЛ. (ПО УЛ. Я. ГАШЕКА)',1),(92,'УЛ. Я. ГАШЕКА,УГ. БУДАПЕШТСКОЙ УЛ.',1),(93,'УЛ. О. ДУНДИЧА,УГ. БУДАПЕШТСКОЙ УЛ.',1),(94,'БУДАПЕШТСКАЯ УЛ. УГ. М. БАЛКАНСКОЙ УЛ.',1),(95,'ЗАГРЕБСКИЙ БУЛЬВАР',1),(96,'А.С. \"МАЛАЯ БАЛКАНСКАЯ УЛ.\" (ВЫСАДКИ И ПОСАДКИ НЕТ)',1),(98,'fd',1),(101,'Октябрьская д.51',8),(103,'Танкистов (ул. Пролетарская)',8),(104,'Петро-Славянка',8),(105,'Загребский бульвар (Дунайский проспект)',8),(106,'Купчинская (ул. Ярослава Гашека)',8),(107,'Метро Купчино',8),(108,'Метро Ломоносовская',10),(109,'Седова (ул. Ивановская)',10),(110,'Пражская (проспект Славы)',10),(111,'Бухарестская д.118',10),(112,'Малая Балканская (ул. Олеко Дундича)',10),(113,'Ярослава Гашека (ул. Будапештская)',10),(114,'Будапештская (ул. Олеко Дундича)',10),(115,'ул. Малая Балканская',10),(116,'Ж.-Д. СТАНЦИЯ \"ОБУХОВО\"',11),(117,'ГРУЗОВОЙ ПРОЕЗД',11),(118,' М.КАРПАТСКАЯ УЛ.',11),(119,' ЗАГРЕБСКИЙ БУЛЬВАР',11),(120,'КУПЧИНСКАЯ УЛ. ПО УЛ. О. ДУНДИЧА',11),(121,'МАЛАЯ БАЛКАНСКАЯ УЛ.',11);
/*!40000 ALTER TABLE `Остановки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Пункты назначения`
--

DROP TABLE IF EXISTS `Пункты назначения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Пункты назначения` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Пункт назначения` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Пункты назначения`
--

LOCK TABLES `Пункты назначения` WRITE;
/*!40000 ALTER TABLE `Пункты назначения` DISABLE KEYS */;
INSERT INTO `Пункты назначения` VALUES (1,'МАЛАЯ БАЛКАНСКАЯ УЛ.');
/*!40000 ALTER TABLE `Пункты назначения` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Рейсы`
--

DROP TABLE IF EXISTS `Рейсы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Рейсы` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Время отправления` time NOT NULL,
  `Время прибытия` time NOT NULL,
  `Маршрут` int(11) NOT NULL,
  `Автобус` int(11) NOT NULL,
  `Цена` int(11) NOT NULL,
  `Водитель` int(11) NOT NULL,
  `Кондуктор` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Маршрут` (`Маршрут`),
  KEY `Автобус` (`Автобус`),
  KEY `Водитель` (`Водитель`),
  KEY `Кондуктор` (`Кондуктор`),
  CONSTRAINT `рейсы_ibfk_1` FOREIGN KEY (`Маршрут`) REFERENCES `Маршруты` (`id`),
  CONSTRAINT `рейсы_ibfk_2` FOREIGN KEY (`Автобус`) REFERENCES `Автобусы` (`id`),
  CONSTRAINT `рейсы_ibfk_3` FOREIGN KEY (`Водитель`) REFERENCES `Водители` (`id`),
  CONSTRAINT `рейсы_ibfk_4` FOREIGN KEY (`Кондуктор`) REFERENCES `Кондуктора` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Рейсы`
--

LOCK TABLES `Рейсы` WRITE;
/*!40000 ALTER TABLE `Рейсы` DISABLE KEYS */;
INSERT INTO `Рейсы` VALUES (2,'14:00:00','15:25:00',1,1,40,1,1),(3,'10:30:00','14:00:00',9,5,50,4,6),(4,'03:00:00','12:00:00',8,3,100,5,2),(5,'12:00:00','23:00:00',10,1,25,6,7),(6,'05:40:00','16:35:00',11,3,34,10,8);
/*!40000 ALTER TABLE `Рейсы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `4` int(11) NOT NULL,
  PRIMARY KEY (`4`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-26 22:07:40
