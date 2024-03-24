-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: gurtkivets
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `schedule` json DEFAULT NULL,
  `type_class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpx7jv82fpwq7tsbnefime9qxm` (`type_class_id`),
  CONSTRAINT `FKpx7jv82fpwq7tsbnefime9qxm` FOREIGN KEY (`type_class_id`) REFERENCES `type_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Бокс','Секція з боксу',NULL,1),(2,'Програмування C#','Гурток програмування мовою ',NULL,2),(3,'Програмування JAVA','Гурток програмування мовою ',NULL,2),(4,'Програмування C++','Гурток програмування мовою ',NULL,2),(5,'Програмування Python','Гурток програмування мовою ',NULL,2),(6,'Плавання','Гурток з плавання',NULL,1),(7,'Футбол','Гурток з футболу',NULL,1),(8,'Малювання','Гурток з малювання',NULL,3),(9,'Народні танці','Гурток з українських народних танців',NULL,3);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_schedules`
--

DROP TABLE IF EXISTS `classes_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_schedules` (
  `classes_id` int NOT NULL,
  `schedules_id` int NOT NULL,
  PRIMARY KEY (`classes_id`,`schedules_id`),
  KEY `FKhst08jn64psm4li47e81fkpll` (`schedules_id`),
  CONSTRAINT `FKhst08jn64psm4li47e81fkpll` FOREIGN KEY (`schedules_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FKrhk92ljy9xxp113e08q5r4d6p` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_schedules`
--

LOCK TABLES `classes_schedules` WRITE;
/*!40000 ALTER TABLE `classes_schedules` DISABLE KEYS */;
INSERT INTO `classes_schedules` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6),(4,7),(4,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(5,15),(5,16),(7,17),(7,18),(8,19),(8,20),(9,21),(9,22),(9,23),(9,24);
/*!40000 ALTER TABLE `classes_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_staff`
--

DROP TABLE IF EXISTS `classes_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_staff` (
  `classes_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`classes_id`,`staff_id`),
  KEY `FK9w1e2nhwwwg3ffv3hg8mky59b` (`staff_id`),
  CONSTRAINT `FK3kykwhdv6fumg4gnl6f53ibsn` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `FK9w1e2nhwwwg3ffv3hg8mky59b` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_staff`
--

LOCK TABLES `classes_staff` WRITE;
/*!40000 ALTER TABLE `classes_staff` DISABLE KEYS */;
INSERT INTO `classes_staff` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(6,3),(7,4),(8,5),(9,5);
/*!40000 ALTER TABLE `classes_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_student`
--

DROP TABLE IF EXISTS `classes_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_student` (
  `classes_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`classes_id`,`student_id`),
  KEY `FKdyxxitbte3vq0tpd53qgv9fh0` (`student_id`),
  CONSTRAINT `FKdyxxitbte3vq0tpd53qgv9fh0` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKitcy6digryceopg5v8afs7f0b` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_student`
--

LOCK TABLES `classes_student` WRITE;
/*!40000 ALTER TABLE `classes_student` DISABLE KEYS */;
INSERT INTO `classes_student` VALUES (2,1),(2,2),(3,3),(8,4),(7,5),(1,6),(1,7),(3,8),(7,9),(7,10),(8,11),(3,12),(6,13),(5,14),(4,15),(4,16),(7,17),(6,18),(6,19),(1,20),(5,21),(5,22),(1,23),(7,24),(2,25),(3,26),(4,27),(5,28),(8,29),(7,30),(4,31),(8,32),(6,33),(4,34),(7,35),(4,36),(4,37),(6,38),(9,39),(6,40),(2,41),(2,42),(8,43),(8,44),(4,45),(9,46),(9,47),(1,48),(6,49),(3,50),(8,51),(8,52),(5,53),(9,54),(2,55),(6,56),(5,57),(1,58),(4,59),(7,60),(9,61),(9,62),(8,63),(6,64),(2,65),(9,66),(6,67),(3,68),(2,69),(4,70),(4,71),(2,72),(6,73),(5,74),(5,75),(4,76),(8,77),(7,78),(1,79),(9,80),(3,81),(1,82),(5,83);
/*!40000 ALTER TABLE `classes_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_student_requests`
--

DROP TABLE IF EXISTS `classes_student_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_student_requests` (
  `classes_id` int NOT NULL,
  `student_requests_id` int NOT NULL,
  PRIMARY KEY (`classes_id`,`student_requests_id`),
  KEY `FKc4sc676jcl5sm1cvro9nkxasc` (`student_requests_id`),
  CONSTRAINT `FKacek1k7602u1b2hwpkqpbj46g` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `FKc4sc676jcl5sm1cvro9nkxasc` FOREIGN KEY (`student_requests_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_student_requests`
--

LOCK TABLES `classes_student_requests` WRITE;
/*!40000 ALTER TABLE `classes_student_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_student_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest` (
  `id` int NOT NULL,
  `date_start` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `registration_open` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES (1,'2024-04-15','Футбольний турнір серед школярів','Футбольний турнір',_binary ''),(2,'2024-02-10','Шаховий турнір для учнів','Шаховий турнір',_binary '\0'),(3,'2023-11-20','Конкурс читання \"Золота осінь\"','Конкурс читання',_binary '\0'),(4,'2023-05-05','Весняні стартап-проекти школярів','Стартап-проекти',_binary '\0');
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_contestants`
--

DROP TABLE IF EXISTS `contest_contestants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_contestants` (
  `contest_id` int NOT NULL,
  `contestants_id` int NOT NULL,
  PRIMARY KEY (`contest_id`,`contestants_id`),
  KEY `FK8m0q1at6t2k4s4atibww3s1i9` (`contestants_id`),
  CONSTRAINT `FK8m0q1at6t2k4s4atibww3s1i9` FOREIGN KEY (`contestants_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKsndv9n2m9ysx6gfywl9dbp7go` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_contestants`
--

LOCK TABLES `contest_contestants` WRITE;
/*!40000 ALTER TABLE `contest_contestants` DISABLE KEYS */;
INSERT INTO `contest_contestants` VALUES (2,1),(1,2),(2,2),(4,4),(1,5),(1,7),(4,7),(2,8),(4,8),(2,9),(4,10),(1,11),(1,12),(1,13),(4,13),(1,14),(1,16),(2,16),(4,16),(1,17),(4,18),(2,19),(4,20),(2,21),(2,22),(4,22),(3,29),(4,30),(3,31),(4,32),(4,36),(4,37),(4,40),(4,41),(3,42),(2,43),(4,44),(2,45),(3,46),(4,47),(2,49),(3,52),(4,52),(4,54),(1,55),(3,58),(4,58),(2,60);
/*!40000 ALTER TABLE `contest_contestants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduates`
--

DROP TABLE IF EXISTS `graduates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduates` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `user_id` int NOT NULL,
  `graduation_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK227jp9v0ibibjinvdpi21qq09` (`user_id`),
  CONSTRAINT `FK227jp9v0ibibjinvdpi21qq09` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduates`
--

LOCK TABLES `graduates` WRITE;
/*!40000 ALTER TABLE `graduates` DISABLE KEYS */;
/*!40000 ALTER TABLE `graduates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL,
  `publish_date` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'2023-10-06','Міська виставка робіт з малювання відбудеться 22 червня 2024 року! Запрошуємо усіх!','Міська виставка робіт'),(2,'2023-10-20',' Запрошуємо всіх шанувальників кулінарного мистецтва на навчання від наших професійних кухарів. На заняттях учасники вивчатимуть секрети приготування різноманітних страв з усього світу та дізнаються про основні принципи кулінарної майстерності.','Майстер-клас \"Мистецтво кулінарії\"'),(3,'2023-11-20','Шукаєте шлях до кар\'єрного успіху в IT? Приєднуйтеся до нашого інтенсиву з вивчення мови програмування Python. Наші професійні викладачі допоможуть вам освоїти основи програмування та розробки програмного забезпечення.','Інтенсив з мов програмування Python'),(4,'2023-12-02','Запрошуємо молодь віком від 15 до 18 років долучитися до наших творчих воркшопів з різних напрямків мистецтва. Ви зможете реалізувати свої ідеї у малюнку, скульптурі, фотографії та інших формах виразності.','Творчі воркшопи \"Мрій, створюй, ділися\"'),(6,'2024-01-05','Приглашаємо молодь віком від 12 до 16 років на нашу еко-експедицію в заповідні райони. ','Табір \"Еко-експедиція\"'),(7,'2024-02-03','Мрієте стати актором чи режисером? Приходьте до нашої театральної майстерні! Тут ви зможете вивчити основи акторської майстерності, розвинути емоційну інтелігенцію та виступати на сцені.','Театральна майстерня'),(8,'2024-03-08','Для молодших винахідників! Наша майстерня робототехніки вчить дітей віком від 8 до 12 років створювати та програмувати власних роботів у захоплюючій та дружній атмосфері.','Майстерня робототехніки');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `job_phone` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FKnwsrvdbbw96plk4np0u8uqevx` (`user_id`),
  CONSTRAINT `FKnwsrvdbbw96plk4np0u8uqevx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1,'Mateo','Von','Чоловік','+38099999999','Bernier-Rath','',1),(2,'Eugenia','Kulas','Жінка','09999999','Kerluke Group','',1),(3,'Dillan','Ratke','Жінка','05898072311','Koss, Stanton and Cole','',2),(4,'Enrico','Schamberger','Чоловік','06297277300','Crona, McCullough and Homenick','',2),(5,'Michel','Windler','Жінка','03491645925','Schaden, Sporer and Jones','',3),(6,'Dr.','Abner','Чоловік','07234394877','Yost LLC','',3),(7,'Fritz','Walsh','Жінка','03447415542','Casper, Paucek and Considine','',4),(8,'Mr.','Joe','Чоловік','03896069460','Reilly, Russel and McCullough','',4),(9,'Jacquelyn','Kuhic','Жінка','05281676271','Littel, Bernhard and Schroeder','',5),(10,'Hardy','Walker','Чоловік','01020957142','Ondricka PLC','',5),(11,'Hershel','Bernier','Жінка','04302006484','Murphy, Kuhn and OKon','',6),(12,'Miss','Ericka','Чоловік','02575053656','Rohan-Anderson','',6),(13,'Ibrahim','Schneider','Жінка','05100459511','Stroman Inc','',7),(14,'Aileen','Weissnat','Чоловік','09145936128','Maggio-Emard','',7),(15,'Alvah','Gerhold','Жінка','04701287038','Barton, Osinski and Cummings','',8),(16,'Favian','Romaguera','Чоловік','01769768913','Kertzmann LLC','',8),(17,'Rollin','Simonis','Жінка','01535098678','Ratke LLC','',9),(18,'Prof.','Bette','Чоловік','01498410810','Abernathy, Bailey and Satterfield','',9),(19,'Ewald','DAmore','Жінка','02356611065','Becker, Rippin and Gusikowski','',10),(20,'Mr.','Timothy','Чоловік','08414354082','Bogan Inc','',10),(21,'Morton','Runolfsson','Жінка','07440771982','Jones-Kunze','',11),(22,'Casimer','Wyman','Чоловік','07113891907','Mosciski-Metz','',11),(23,'Crystal','Pacocha','Жінка','04321633325','Goldner-Green','',12),(24,'Wilma','Tillman','Чоловік','08744397941','Friesen, Smitham and Volkman','',12),(25,'Mandy','DAmore','Жінка','06834424842','Parker, Boyer and Von','',13),(26,'Antonio','Jenkins','Чоловік','03896081846','Lynch-Collier','',13),(27,'Eldora','Bechtelar','Жінка','09686168925','Jakubowski-Bins','',14),(28,'Nicholas','Berge','Чоловік','07936533623','Green Ltd','',14),(29,'Willis','Gerlach','Жінка','07769948631','Bednar, Johnson and Ritchie','',15),(30,'Dena','Goyette','Чоловік','02568678199','Lueilwitz-Kozey','',15),(31,'Katelynn','Bayer','Жінка','05476767774','Cartwright-Koss','',16),(32,'Margot','Lang','Чоловік','04377711035','Jacobson, Hackett and Haag','',16),(33,'Vidal','Kautzer','Жінка','07582290733','Smith-Schmidt','',17),(34,'Annamae','Littel','Чоловік','09886975427','Wiza-Wolff','',17),(35,'Moses','Kutch','Жінка','06423710647','Sanford PLC','',18),(36,'Dominic','Blick','Чоловік','04071895670','Davis-Hansen','',18),(37,'Stan','Abbott','Жінка','08178436373','Medhurst-Satterfield','',19),(38,'Arnold','Wuckert','Чоловік','03248112428','Rogahn-Medhurst','',19),(39,'Brigitte','Jacobson','Жінка','01531580395','Welch, Turcotte and Hettinger','',20),(40,'Willow','Ullrich','Чоловік','08585491541','Dibbert-Welch','',20),(41,'Corene','Boyer','Жінка','07879043769','Schimmel Group','',21),(42,'Ruthe','Volkman','Чоловік','07071269160','Willms, Douglas and Muller','',21),(43,'Hattie','Lynch','Жінка','02824059721','Hudson Ltd','',22),(44,'Miss','Lulu','Чоловік','07762572407','Hyatt, Ankunding and Parker','',22),(45,'Carolina','Leffler','Жінка','03452969804','Barton-Stanton','',23),(46,'Keagan','Collier','Чоловік','06446741321','Gusikowski-Huel','',23),(47,'Ferne','Erdman','Жінка','04031207325','Cartwright, Koss and Kihn','',24),(48,'Dr.','Donnie','Чоловік','06030015846','Considine, Heller and Hansen','',24),(49,'Tillman','Stark','Жінка','07531483847','Lemke-Yost','',25),(50,'Eveline','Lubowitz','Чоловік','08162271664','Klocko, Conroy and Wilderman','',25),(51,'Liliana','Casper','Жінка','03498056368','Mueller, Sanford and Botsford','',26),(52,'Jamal','Hayes','Чоловік','09551428897','Rau-Padberg','',26),(53,'Veronica','Friesen','Жінка','04561879180','Connelly-Moen','',27),(54,'Josefina','Dicki','Чоловік','03002004928','Schmidt PLC','',27),(55,'Josue','Lebsack','Жінка','02933813147','Ortiz, Kulas and Rodriguez','',28),(56,'Friedrich','Ryan','Чоловік','03402245344','Luettgen-Hickle','',28),(57,'Murl','Walter','Жінка','04536054285','DAmore-Hayes','',29),(58,'Chanelle','Cronin','Чоловік','08252060906','Bode-Schamberger','',29),(59,'Joshua','Labadie','Жінка','03692980517','Krajcik, Nienow and McClure','',30),(60,'Jeffery','Hettinger','Чоловік','01087736811','Stoltenberg-Miller','',30),(61,'Uriel','McGlynn','Жінка','07156800606','Marks-OHara','',31),(62,'Mr.','Jevon','Чоловік','08553982255','Hilll LLC','',31),(63,'Meghan','Okuneva','Жінка','07671024348','Harber Group','',32),(64,'Cody','Moore','Чоловік','09743226309','Fritsch, Medhurst and Hintz','',32),(65,'Garrett','Kulas','Жінка','04884050059','Abbott, Denesik and Bode','',33),(66,'Dr.','Kristopher','Чоловік','09028663220','Littel Group','',33),(67,'Corene','Casper','Жінка','05774750343','Zboncak-Conn','',34),(68,'Maurice','Lakin','Чоловік','08272842836','Funk, Stanton and Conn','',34);
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `contest_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtm8pb669d23fks1nvl3nkv7sb` (`contest_id`),
  KEY `FK7lk5btagxf1teskhapgwf8pi3` (`student_id`),
  CONSTRAINT `FK7lk5btagxf1teskhapgwf8pi3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKtm8pb669d23fks1nvl3nkv7sb` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,NULL,1,2),(2,NULL,1,5),(3,NULL,1,7),(4,NULL,1,11),(5,NULL,1,12),(6,NULL,1,13),(7,NULL,1,14),(8,NULL,1,16),(9,NULL,1,17),(10,NULL,1,55),(11,' 2',2,21),(12,' 1',2,1),(13,' 3',2,2),(14,' 5',2,49),(15,' 6',2,43),(16,' 7',2,19),(17,'4 ',2,9),(18,' 8',2,22),(19,' 10',2,8),(20,' 11',2,16),(21,'9 ',2,22),(22,' 12',2,60),(23,'13 ',2,45),(24,'14 ',2,21),(25,' 1 місце',3,52),(26,'3 місце',3,42),(27,' Переможець в номінації \"Найкращі Емоції\"',3,31),(28,'2 місце',3,31),(29,' ',3,46),(30,'  ',3,29),(31,'  ',3,58),(32,' 1 місце',4,8),(33,' ',4,13),(34,' ',4,16),(35,' ',4,7),(36,' ',4,4),(37,' ',4,20),(38,' ',4,41),(39,'2 місце',4,54),(40,' ',4,44),(41,' ',4,40),(42,' ',4,32),(43,' ',4,52),(44,'3 місце',4,32),(45,' ',4,47),(46,' ',4,37),(47,' Приз глядацьких симпатій',4,58),(48,' ',4,30),(49,' ',4,18),(50,' ',4,47),(51,' ',4,36),(52,' ',4,52),(53,' ',4,10),(54,' ',4,22);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN'),(3,'ROLE_STAFF');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Актова зала'),(2,'Спортивна зала'),(3,'108'),(4,'109'),(5,'110'),(6,'111'),(7,'112'),(8,'Басейн');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL,
  `day` varchar(45) DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7tq1xwrwg75e8oexk7b6tq012` (`room_id`),
  CONSTRAINT `FK7tq1xwrwg75e8oexk7b6tq012` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'MONDAY','12:00:00','14:00:00',1),(2,'WEDNESDAY','12:00:00','14:00:00',1),(3,'FRIDAY','12:00:00','14:00:00',1),(4,'THURSDAY','17:15:00','19:15:00',5),(5,'SATURDAY','15:00:00','17:00:00',4),(6,'SATURDAY','18:00:00','20:00:00',4),(7,'MONDAY','12:00:00','15:00:00',3),(8,'WEDNESDAY','15:00:00','17:00:00',3),(9,'MONDAY','10:00:00','12:00:00',8),(10,'TUESDAY','10:00:00','12:00:00',8),(11,'WEDNESDAY','10:00:00','12:00:00',8),(12,'THURSDAY','10:00:00','12:00:00',8),(13,'FRIDAY','10:00:00','12:00:00',8),(14,'SATURDAY','10:00:00','12:00:00',8),(15,'TUESDAY','15:00:00','17:00:00',6),(16,'SATURDAY','16:30:00','18:30:00',6),(17,'WEDNESDAY','15:00:00','17:00:00',2),(18,'FRIDAY','15:00:00','17:00:00',2),(19,'SATURDAY','17:00:00','18:00:00',1),(20,'SUNDAY','17:00:00','18:00:00',1),(21,'MONDAY','18:00:00','20:00:00',7),(22,'WEDNESDAY','18:00:00','20:00:00',7),(23,'FRIDAY','18:00:00','20:00:00',7),(24,'SATURDAY','13:00:00','15:00:00',1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `adress` varchar(90) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FKbhogfndgswrqk696i1s2stk2g` (`user_id`),
  CONSTRAINT `FKbhogfndgswrqk696i1s2stk2g` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Naomie','Harvey','786 Haskell Rapids Lake Israelville, LA 52199-6000','7866045906',1),(2,'Alexa','Hand','54055 Lincoln SquaresNew Rozellaview','05112783189',2),(3,'Princess','McLaughlin','67764 Eichmann ValleysPort Kimberlyborough','01097338464',3),(4,'Anais','Denesik','637 Wisoky Lane Suite 742Beaulahstad','02465565132',4),(5,'Toni','Wyman','97399 Zula DaleMaximilianbury','05920926413',5);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adress` varchar(65) DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `form` int DEFAULT NULL,
  `other_classes` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK53i0fn6cdb445wsei7ahnu8ii` (`user_id`),
  CONSTRAINT `FK53i0fn6cdb445wsei7ahnu8ii` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Elda','Gutmann','Жінка','2010-02-12','+38 (095) 521-47-58','720 O\'Conner Trace Suite 432 Lawrencemouth','4 школа',8,'',1),(2,'Nathanael','Bergnaum','Жінка','2015-01-26','04577932117','645 Kuphal Summit Apt. 537Blickside','33',3,'',41),(3,'Krista','Schaden','Жінка','2014-12-29','09642791062','3860 Abbott BypassKellitown','14',4,'',52),(4,'Margarete','Conroy','Жінка','2012-01-03','04790943159','79173 Isac PortPort Faustoton','28',6,'',8),(5,'Shanny','Keebler','Чоловік','2011-12-16','01722039723','1103 Herman Valleys Suite 317Elvaville','23',7,'',18),(6,'Ford','Auer','Жінка','2007-05-03','01121585359','1074 Mosciski JunctionNorth Brennan','15',11,'',32),(7,'Precious','Blanda','Жінка','2007-09-04','06946059838','838 McLaughlin Villages Suite 425Adrianaside','28',11,'',9),(8,'Brenna','Wisoky','Жінка','2011-10-09','02726404080','1351 Juston RampPort Curtfurt','29',7,'',57),(9,'Karlie','Conroy','Чоловік','2012-04-24','06697609015','783 Mireya FlatsNew Madison','34',6,'',30),(10,'Liam','Wiegand','Жінка','2013-08-17','05873940529','07124 Tierra Fields Suite 656West Vicente','29',5,'',27),(11,'Melody','Vandervort','Жінка','2014-03-04','03135605991','046 Harmony Streets Apt. 498South Rheabury','30',4,'',33),(12,'Leonora','Conn','Жінка','2011-09-02','05469434926','038 Paige Union Apt. 703Port Jonas','24',7,'',55),(13,'Jesus','Haley','Чоловік','2015-07-21','04109092444','97634 Marks Green Suite 875Lake Carlee','31',3,'',50),(14,'Eden','Goodwin','Жінка','2009-11-26','09356246732','4201 Tyree CoveNew Kenyamouth','30',9,'',56),(15,'Fredrick','Windler','Жінка','2012-11-25','07775961889','104 Amir DamCorwintown','32',6,'',54),(16,'Norene','Mohr','Жінка','2015-11-18','04799031091','296 Lilla Turnpike Suite 956South Margarete','30',3,'',17),(17,'Eliseo','Kuhn','Жінка','2013-08-30','03882325191','4936 Oberbrunner BurgsProsaccoburgh','18',5,'',60),(18,'Alessandro','Leuschke','Чоловік','2016-05-11','05895170995','60428 Orval Heights Suite 461East Camdenshire','14',2,'',46),(19,'Nina','Fritsch','Чоловік','2012-12-09','08562728462','6950 Lenna Fall Apt. 237Port Magdalenville','11',6,'',28),(20,'Florian','Durgan','Чоловік','2010-09-09','01718134262','36075 Hauck Summit Suite 472New Jaquan','21',8,'',14),(21,'Maya','Hand','Жінка','2014-09-12','06750518551','5387 Kuhic RidgesReganport','17',4,'',16),(22,'Kaley','Erdman','Жінка','2013-12-19','06764530544','2123 Hand LightSandyburgh','30',5,'',7),(23,'Alejandra','Runolfsdottir','Чоловік','2008-02-25','04568047200','529 Okuneva SummitSouth Reggie','34',10,'',41),(24,'Retta','Bernier','Чоловік','2014-09-05','06337860024','32116 Bogan Tunnel Suite 544Larsontown','21',4,'',33),(25,'Tatyana','Ernser','Чоловік','2011-03-11','04998168328','14797 Murray OverpassCassinmouth','5',7,'',33),(26,'Aracely','Ledner','Жінка','2008-10-11','07969370032','693 Reynold Springs Apt. 197Heatherland','9',10,'',10),(27,'Beatrice','McClure','Жінка','2011-08-30','08837767952','8580 Leffler Curve Apt. 256Ludieland','22',7,'',58),(28,'Holly','Kutch','Жінка','2015-05-27','09770025384','064 Stanton Hills Suite 016East Joshuachester','27',3,'',37),(29,'Bennie','Ritchie','Чоловік','2012-09-27','04247670147','6679 Daniel UnionsWest Willy','18',6,'',49),(30,'Devyn','Dietrich','Чоловік','2014-05-11','04557251945','19192 Langosh Track Suite 470West Dominique','15',4,'',57),(31,'Reymundo','Ward','Чоловік','2011-12-08','03186879015','4591 Grady Manors Suite 544Juwanstad','35',7,'',53),(32,'Cristina','Roberts','Жінка','2010-01-31','05263085055','4124 Sawayn StravenueWest Kaylie','18',8,'',63),(33,'Keon','Tillman','Чоловік','2012-08-16','02766097037','725 Domenico JunctionsEast Anastasia','33',6,'',61),(34,'Rosina','Koss','Чоловік','2010-09-01','05675392749','604 Yundt Overpass Apt. 161Wuckertville','32',8,'',55),(35,'Mylene','Schmitt','Чоловік','2007-05-30','02533577802','148 Schamberger PointsLake Patriciaberg','5',11,'',3),(36,'Misael','Roob','Жінка','2015-06-22','02226210102','76720 Beahan Bridge','3',3,'',30),(37,'Sydni','Stracke','Жінка','2015-06-25','03708141941','5626 Kurtis FordsLake Mateo','24',3,'',55),(38,'Reynold','Hermiston','Жінка','2013-12-03','08125440129','146 Smith Port Apt. 809Zemlakmouth','29',5,'',23),(39,'Garland','Kautzer','Чоловік','2011-02-04','02235467911','9843 Cruickshank','23',7,'',10),(40,'Raul','Lynch','Жінка','2014-11-29','03185062273','70633 Amari Expressway Apt. 898Port Theronside','23',4,'',47),(41,'Maya','Stokes','Жінка','2013-03-13','08405023900','7215 Dicki Plains Apt. 984South Isidro','1',5,'',49),(42,'Gust','OKon','Жінка','2008-02-09','06667713912','7059 Megane RunPort Julieborough','2',10,'',5),(43,'Liza','Emmerich','Жінка','2014-09-13','05584028566','2369 Ross ForgesNew Katherynberg','20',4,'',9),(44,'Anne','OConnell','Чоловік','2014-10-13','04963895100','356 Alvis CircleEast Biankaberg','28',4,'',28),(45,'Johann','Kunze','Жінка','2008-09-22','01661462683','340 Macejkovic MountSouth Mollie','2',10,'',55),(46,'Patience','Braun','Жінка','2015-09-28','03672171148','43601 Savanah CommonPort Savannahaven','19',3,'',43),(47,'Emelia','Moore','Жінка','2011-05-24','05526765348','10660 Kyla Squares Suite 040Lake Lempi','5',7,'',50),(48,'Pearlie','Beahan','Жінка','2009-06-12','04067094108','886 Roberts AvenueDarianaside','23',9,'',40),(49,'Leann','Brakus','Чоловік','2012-07-28','02575787177','2816 Koepp Viaduct Suite 067Lindgrenmouth','30',6,'',58),(50,'Cielo','Vandervort','Чоловік','2015-11-30','03712903669','8533 Mayer Forge Suite 088New Tyrese','8',3,'',17),(51,'Bryce','Cartwright','Чоловік','2007-11-16','03620380613','5074 Horace LightsGloverstad','12',11,'',51),(52,'Amiya','OKon','Чоловік','2007-11-18','03847441574','21662 Robel Stravenue Apt. 381South Ebba','15',11,'',45),(53,'Noah','Swaniawski','Чоловік','2014-10-16','05306549560','89171 Gusikowski Curve','1',4,'',27),(54,'Dariana','Murray','Чоловік','2010-01-25','09996796220','34067 Savanah SummitMooreview','11',8,'',58),(55,'Maud','Gleichner','Чоловік','2013-08-14','05445687432','1460 Bruce RowFeeneyview','8',5,'',31),(56,'Gonzalo','Klocko','Чоловік','2012-09-11','08346176716','2668 Darlene Shores Apt. 484Douglasside','2',6,'',52),(57,'Kolby','Stark','Жінка','2016-08-22','06090202763','9773 Ophelia PassZelmashire','22',2,'',11),(58,'Keely','Kerluke','Жінка','2007-06-09','04384590051','21460 Stiedemann OrchardLake Faustinoshire','10',11,'',4),(59,'Mose','Jacobi','Чоловік','2010-05-31','07994923794','951 Roberts Common Suite 374West Ottisbury','6',8,'',23),(60,'Wilson','Murphy','Чоловік','2009-04-30','03772905877','867 Muller Mountain Suite 238South Kristopher','30',9,'',64),(61,'Idella','Rath','Жінка','2015-12-03','09028294531','337 Neoma Forge Suite 180South Loramouth','19',3,'',50),(62,'Mekhi','Veum','Чоловік','2015-06-26','06868292298','7035 Evelyn Crossroad Apt. 514West Evangeline','19',3,'',24),(63,'Macie','Effertz','Жінка','2013-07-24','05345731844','54012 Jena FlatsPort Mablemouth','8',5,'',14),(64,'Brianne','Vandervort','Жінка','2010-09-14','07723066108','354 Wendell Turnpike Suite 396Wilhelmville','35',8,'',23),(65,'Marisol','Veum','Чоловік','2008-10-22','09272688013','01985 Beer Place Suite 375Lake Esmeraldamouth','34',10,'',8),(66,'Freddie','Kohler','Жінка','2014-10-17','07252302941','13119 Daniel Corners Apt. 116Herminiafort','18',4,'',64),(67,'Stewart','Trantow','Жінка','2015-02-05','06628599169','21397 Kara SpringWest Caleigh','31',3,'',7),(68,'Cale','Bode','Жінка','2008-02-07','08489795660','12800 Bobby StationNorth Leila','30',10,'',35),(69,'Duane','Smith','Чоловік','2009-04-14','05907284751','01398 Runte Station Suite 862Amybury','12',9,'',31),(70,'Serena','Lemke','Чоловік','2015-02-24','09158031194','301 Barrows StationAmelieville','11',3,'',34),(71,'Idell','Hammes','Жінка','2007-09-23','08528477436','74218 Effertz Plains Suite 321Schusterfort','13',11,'',19),(72,'Kolby','Lebsack','Жінка','2012-06-16','01941247146','70460 Lemke Park Apt. 004Port Waylonhaven','15',6,'',8),(73,'Rashad','Simonis','Чоловік','2011-01-18','08491234892','7670 Kertzmann Branch Apt. 291Danielleburgh','35',7,'',34),(74,'Maegan','Medhurst','Жінка','2009-01-07','07102316661','3042 Isidro Loaf Apt. 483DuBuquestad','21',9,'',28),(75,'Jerrell','Lueilwitz','Чоловік','2011-10-04','03299283715','056 Weimann Stravenue Suite 254North Kelvinmouth','29',7,'',6),(76,'Roel','Murazik','Жінка','2012-11-19','03060984950','42236 Ferry Bypass Apt. 180Lake Estellehaven','24',6,'',54),(77,'Marilou','Okuneva','Жінка','2013-03-13','09554976371','68048 Feil Fort Apt. 405West Granville','17',5,'',48),(78,'Jodie','Donnelly','Чоловік','2014-04-14','05063711494','863 Yost Mountains Apt. 217Kallietown','22',4,'',23),(79,'Payton','Jerde','Жінка','2007-08-19','07647439262','21351 Boehm OverpassNew Estelton','28',11,'',63),(80,'Joy','Smitham','Чоловік','2007-01-03','01861616064','520 Alexa Neck Suite 214Gusikowskiview','11',11,'',36),(81,'Yasmin','Lubowitz','Чоловік','2015-11-24','04979721612','79377 Elwin Lodge Suite 052West Max','14',3,'',42),(82,'Brigitte','Ratke','Чоловік','2007-08-23','03336168985','57022 Jennie Locks Apt. 749Effertzchester','13',11,'',62),(83,'Tracey','Braun','Чоловік','2008-04-14','09086463748','970 Hillary Bridge Suite 832South Holden','13',10,'',29);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_class`
--

DROP TABLE IF EXISTS `type_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_class` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_class`
--

LOCK TABLES `type_class` WRITE;
/*!40000 ALTER TABLE `type_class` DISABLE KEYS */;
INSERT INTO `type_class` VALUES (1,'Спортивні'),(2,'Наукові'),(3,'Художні');
/*!40000 ALTER TABLE `type_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$YIG5THDeV4qd5mFNeFHLQOiXkDcURDgSePXcT8s3iOxj.F4w3UvpK','admin@admin.admin',_binary ''),(2,'delfinaglover','$2b$14$XAVvS4298Zj1s1AqezHjK.JNzo0CPiTuRZUYsZjjJdsLBsT0kM9a.','keeling.valenti@sabdestore.xyz',_binary ''),(3,'freichert','$2b$14$c0dxFbVVoEp1HrnoD5ntH.nK2FF8MIK5J0m/kZUy2NDew8Q1TT8dS','kyler.quigley@villastream.xyz',_binary ''),(4,'melvinrempel','$2b$14$9dBKf9.vPbkKR7WCBE.rVecWnKqoVZqWU8rFq.sXzumlLX.p.rc2m','crona.roel@princehotel-bkk.com',_binary ''),(5,'lstamm','$2b$14$wUnGuQ7/i1XpC3Twbwmpz.iLtXbtlbDs0i6MF/XQDPeZsRuOBU8zy','marques.lind@stickypk.shop',_binary ''),(6,'lupe28','$2b$14$OFixWXI32J0ZHcVlhGb6QOGxLk01v3XrMATy7eKSf7Zjcl54FYsvq','orin.gerhold@cuocsongmoi2019.online',_binary ''),(7,'bbernhard','$2b$14$4vei8MLssM/Qf00kEI.6hOBFIj1mQLTOrEXhh6Q96qvHQZKNPBFOS','muller.katelynn@mistemail.com',_binary ''),(8,'carmeloabbott','$2b$14$ZDy6Yoe0TPL7KMqJuyswJuILX6z9OlT9WK2T79QVWewWStytJJOkK','wgutkowski@uniqueimportbrasil.com',_binary ''),(9,'sstroman','$2b$14$NBBb8RFISFCnkWpdIvVwxeqEkeUKrbfo7fMrFogzb3PIfThPwfe52','gracie19@khacdauquoctien.com',_binary ''),(10,'croninkaren','$2b$14$Mz8zreQcuBQduie4JUeR3Oo0xnDF3UaD5uytSJEIZkg3D.DvIpgrG','abrakus@salemmohmed.cloud',_binary ''),(11,'waelchicody','$2b$14$MkbYz6LUhZrnI.Xq8jcj5uXxb2NqD0xof1crRuTclgfuHdfM5UzCe','ansel.murray@sabdestore.xyz',_binary ''),(12,'ndietrich','$2b$14$16WVNBeR4XZDSRty0uQ7sOm/9he.QLT1rDz/GBF6nv.7s3ez7ZHnm','mertz.miracle@travelpricedeals.com',_binary ''),(13,'lbarton','$2b$14$/EorxkcuAI1g1/xuFfCaY.Y2UsinGYlGdPVWmxVElQjO/uE.mxNVy','ygislason@mainetaxicab.com',_binary ''),(14,'starkprincess','$2b$14$cYxJvWCk.sOqyTD5wL45IOMfPWoGlvo3fBHnbekJM72jaEZUQTVX6','tmurray@khacdauquoctien.com',_binary ''),(15,'wlemke','$2b$14$XWU.5PgMONpYOlcBnfYYSe41aMdYTgtqjXGNh0vGoM2ZQKEKlUK9C','chanel.heller@khacdauquoctien.com',_binary ''),(16,'eroberts','$2b$14$LjJMUdJ9Fzyzp4PtUyueieQNHd0Dh.LRKGoojHpkxJYZiO/EJ8JrK','breinger@mastermoh.website',_binary ''),(17,'rkirlin','$2b$14$fGp1.kc3sOjayfa.MEM2qOGmiApqKCOKDXPjtbqrFFdBGLWcR88SW','zieme.kurt@uniqueanalyzing.site',_binary ''),(18,'soledadkrajcik','$2b$14$JZ5u2OEYYwZblVKF/osPQ.q7aGOWeCCVH6MHQtdfJogXY3AuUe6E.','lacey39@hotmail.red',_binary ''),(19,'stephanygoyette','$2b$14$eIwnTYY7xOSKihshuSCEvOQlF0k5g3aD/d9lvrTI2LYRJFSLGg0PC','tony.johns@oposte.xyz',_binary ''),(20,'ernestozboncak','$2b$14$n.K9fnCoYi1Rb9T8C9ZAOOv3HpdnjVR6WaUT0pITPR3hS0BKhvC7m','suzanne14@acrobate-d.com',_binary ''),(21,'koeppemily','$2b$14$RZ8a17iDGN7X4TxXSKEZkeLYtf/waxFG7LIfIJySqgdLu4oSv1T/S','lula70@thaibanvia.online',_binary ''),(22,'stephanie75','$2b$14$0MG1jQRz83clx6gCBZ2ejeW/g03WyKeXzvNkEk1y55Q3Qmw4L4rV6','therese73@bankcommon.com',_binary ''),(23,'okris','$2b$14$5u.yUxiG1fHkGMcMu4UPbOMijTnv6OTN9Wax4bQgOQvkPO9elEdJC','parker.gusikows@accurates.online',_binary ''),(24,'xrippin','$2b$14$5DjjzkDoVwnaxaWu9MKIn.YGPX8ioYdl9G/kO7FcMhvOkI0EN0RVy','bsteuber@misodiservicios.com',_binary ''),(25,'pgutmann','$2b$14$SkffK2ZwQyHVaHxwV6T.v.NaCOlVBdYpj697j7kqTNDeBy0gKms5i','alanna.pacocha@thaibanvia.online',_binary ''),(26,'padberghenri','$2b$14$y2wUMLFr/sZV2ojLdx6Lz.9sEj9AfmMdYqGlgjA1hdAkKTYlozbsm','farmstrong@oposte.xyz',_binary ''),(27,'bennielueilwitz','$2b$14$Hx4EclZxK766hATKgw./WOm2PjKPm7sIAccLpJ0USJnup33h.44.a','kertzmann.keyon@joycehp.online',_binary ''),(28,'edubuque','$2b$14$BXaHJLoCWTnXuv8vF06OsudOEMttAlOwTmSU33w5vypgPqIhi9sNK','celine02@vbmail.top',_binary ''),(29,'idaniel','$2b$14$pESuZmS72ov7yQ7bPV4.7OcyNnOTvjCvUlESIz3cbqtZhJNMcE61G','ari05@acrobate-d.com',_binary ''),(30,'marquardtparis','$2b$14$sE8A32pGD8jZfCqC62q3vOMIpjKEhFZtzo0kwOdu/f4eGQopVR5mm','dave.dicki@owageskuo.com',_binary ''),(31,'watson06','$2b$14$wc6DrZ4H8embrGAZiiPsuOKcpX1hK7GYNRxh/rcIqr/.hQJXAl842','ahowell@brittishkustoms.com',_binary ''),(32,'nyah46','$2b$14$2hCDiJ89XtG4uo6ZNyeE9.hn5HoKVnSMquJjMQNAaPq9JIO5P7wRi','macejkovic.adal@misodiservicios.com',_binary ''),(33,'eribertoritchie','$2b$14$R1dwzAhG3zjvsTjXXn6W0O3FXm5v7K0ofzUw8aWUnAKtQPMsKMXkW','reuben47@acrobate-d.com',_binary ''),(34,'breanne97','$2b$14$DB6GI86tdelSGuu9IxUb3.66q/PAL.4XLGBJeOXvYK2Uc8irwkwbG','kilback.osvaldo@uniqueanalyzing.site',_binary ''),(35,'quitzonjessica','$2b$14$5cRQFriSb1ce0D9X5Otxg.CH2uD80VoYkz/Fh/sqznNaFhSLw0MTq','arielle16@guesthousenation.com',_binary ''),(36,'florianmorisset','$2b$14$phY.78nmhqlF1DeMBTEA4u4/eL6/Ix78Oz2oGYSFHreGd5Lkzcpwu','zbeatty@dodoco.me',_binary ''),(37,'gwiegand','$2b$14$4F6D/Xa2c.zS2dkLNopajutqkDYgVmYsRjBZebXO14YcBBULWKFVO','ebert.gwen@bankcommon.com',_binary ''),(38,'rolando41','$2b$14$SjYB3IxRfW29GwHRC1Gk2.WWAGJxx8axhaX2WIMSrk46GQplbCNwG','xrussel@ecohut.xyz',_binary ''),(39,'shanny92','$2b$14$.PEVRjlg1bs9rdCjB.fMveQ3fvoKLk.g308RSc/DbDoG.0nFFc01y','kuvalis.harold@thaibanvia.online',_binary ''),(40,'kim16','$2b$14$rWTaVDTv1aenl2OB7M69e.lpZ6/mwS6hy88nX2ZReNPjZrX/HhTyu','curtis.larson@tijdelijke.email',_binary ''),(41,'qromaguera','$2b$14$Rm4FebwNQ/yleOzkOt55Tu/wp/vk87T6pNPEu67ifCZ5pwBJrtTE.','genesis.walter@thaibanvia.online',_binary ''),(42,'alanamccullough','$2b$14$Td5aD2hPlzYvMPr9h8rts.huvn/C881bNIbdkLMYTYp29y1l6.LnW','crona.dewitt@cellonemail.com',_binary ''),(43,'jared09','$2b$14$qiAkGi0RhIdzKAaSLPgaRu16eqVHgesoQzFeAyiYiaJTwxf1FIqJG','schroeder.lelia@ecohut.xyz',_binary ''),(44,'morgangleason','$2b$14$dPFqI1u4A6bApZVMw/C/w.1S5.8ouUJHd001eEwN9Ohj5Cne2VSsa','rosa.hessel@mistomail.com',_binary ''),(45,'linnie91','$2b$14$QOKjF/U5lrXXPFRMURBsyuGZknxN9LQjkSMMb4mdxC4rRX4CBBIIq','zreilly@dodoco.me',_binary ''),(46,'josephinejacobi','$2b$14$/yFC/DPi8HJkS7IszA97ceR0g0S0vZrebKWNJ3y.diNusIOM7ZwmO','turner.rafaela@disarpecorp.com',_binary ''),(47,'kwunsch','$2b$14$28/G/vX6Y7F7apJSSGi1Z.oifBFyhVEtBQbvmWoBH4EqC7PBKAx9C','alicia35@acrobate-d.com',_binary ''),(48,'earnestine61','$2b$14$cOeY9V2yJRegdYxSbOC5kupR.90IVVxE3ufNaXFc0z8berBUjDSg2','hettinger.kobe@bankcommon.com',_binary ''),(49,'boylereva','$2b$14$d.JfF4HyHztojIOcYXS4r.Mx5JGuVhN613HRUoB6oR6PG4nzlLx82','colleen89@trsdfyim.boats',_binary ''),(50,'delilah18','$2b$14$I/plO9sWfF/SZC4hfLBXXerCRQ84lsCckmU5rJdGczfqsBTyV9RVG','hahn.wava@tijdelijke.email',_binary ''),(51,'rueckernatalia','$2b$14$dA4aiFLNc97jxL8eWJic4uxw789sdcXcR6mNeEZJwiogdGY0iSBBu','kuphal.lionel@acrobate-d.com',_binary ''),(52,'kian93','$2b$14$/L52IS3WEKcTBQjekujn3.5vuavoBHp0AXfoJiv05RbOsrh/DAaKm','ressie37@trumvia.online',_binary ''),(53,'heaneybrenna','$2b$14$Wmv58gz4Kapw3QQHoxoBie.ssNGQ9RRqkv.gMgqJRqMH9QrWk2Rm2','thalia.robel@macam-ber.uk',_binary ''),(54,'cassandre70','$2b$14$uXt3i3IXS6ms8.jD/5q57eXh52643vV2fgrdbTUBE4acvzTxNAsYG','albin05@hotmail.red',_binary ''),(55,'carmella52','$2b$14$YZj1Pd6EtwyIWE9ZsB.RS.bk/RsSpZ3v5Vp.GoYncNcfoNy8q94Ai','towne.adaline@suryayudha.com',_binary ''),(56,'crooksrene','$2b$14$5KK7w558rpswXVF2aeWijO66O/NagBw5A32H3MF/f7QCvY9x.fWZ6','ahills@wavisitorcentre.com',_binary ''),(57,'rahul07','$2b$14$UpXqt0H7XIgwpRmcRgy6SOUGylK9aHi/5WsC6/MmKIspSFkxIqDyu','rosa.mills@docbao7.com',_binary ''),(58,'travis91','$2b$14$4eShJHSjhjz41Zj6f0LWfuqEYiynM3Vf4qmOGXXVvsACzCg3/Wxmm','kbechtelar@guilhermeminare.com',_binary ''),(59,'kenyabashirian','$2b$14$z3vIYVTbRLShFALEM91hWuwJyMaFEfP0fL/aGZ1rLs4.ZVwZ0FyTu','yhickle@viewappadsvideopage.com',_binary ''),(60,'croninotho','$2b$14$nP8nBKWsVHo4kY0P8XBU1..NVvy6iawUvlW29ObsquIcXGt8jGiR6','hassan92@niceminute.com',_binary ''),(61,'hesselyazmin','$2b$14$vU8iVGe9CpGAob.1zQLoKOxpDOnlWWkct3lQk.I8h1VCxC1T21U/K','bergnaum.johath@mainetaxicab.com',_binary ''),(62,'danialgreen','$2b$14$d0zXOI5pxRKPD1IxljZy2eTURzwtke1o6s.i2K7njsgd8KmvtN9fC','nikolaus.maritz@h0tmal.com',_binary ''),(63,'ydonnelly','$2b$14$HUAzgi.DSYtjofqigwfqB.q/qeMkOHYKDtYnBMrwcTJ8tCx4wpEqi','effie.padberg@chantellegribbon.com',_binary ''),(64,'conradokuneva','$2b$14$I3d2XjUxFsJs3DETAOzNoudj6DL4LlQXek4E6lC8rjCy1VqPilXQ.','karine33@inkworlds.com',_binary ''),(65,'vcarroll','$2b$14$2rIBDAE0A4xH90nheOOW3.2.W8p.B8nNHp9KckWsFEKmKdpW8rlOy','unique14@gbcmail.win',_binary ''),(66,'roger32','$2b$14$hkc.GEt9uIZpP3FwUE79H.FIg3SpMLYODQr2KnfORhaXgDz7/dY5a','shanahan.montan@ps372.org',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(1,2),(1,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_tokens`
--

DROP TABLE IF EXISTS `verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_tokens` (
  `id` int NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnoled469hi2uuqjqfsegbuxp5` (`user_id`),
  CONSTRAINT `FKnoled469hi2uuqjqfsegbuxp5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_tokens`
--

LOCK TABLES `verification_tokens` WRITE;
/*!40000 ALTER TABLE `verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 17:21:41
