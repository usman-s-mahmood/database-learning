-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: class_assignment_schema
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `department`
--

create database assignment3;
use assignment3;
DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DEPARTMENT_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_NAME` text,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',0,1700),(130,'Corporate Tax',0,1700),(140,'Control And Credit',0,1700),(150,'Shareholder Services',0,1700),(160,'Benefits',0,1700),(170,'Manufacturing',0,1700),(180,'Construction',0,1700),(190,'Contracting',0,1700),(200,'Operations',0,1700),(210,'IT Support',0,1700),(220,'NOC',0,1700),(230,'IT Helpdesk',0,1700),(240,'Government Sales',0,1700),(250,'Retail Sales',0,1700),(260,'Recruiting',0,1700),(270,'Payroll',0,1700);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `FIRST_NAME` text,
  `LAST_NAME` text,
  `EMAIL` text,
  `PHONE_NUMBER` text,
  `HIRE_DATE` text,
  `JOB_ID` text,
  `SALARY` int(11) DEFAULT NULL,
  `COMMISSION_PCT` int(11) DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven','King','SKING','515.123.4567','6/17/1987','AD_PRES',24000,0,0,90),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','6/18/1987','AD_VP',17000,0,100,90),(102,'Lex','De Haan','LDEHAAN','515.123.4569','6/19/1987','AD_VP',17000,0,100,90),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','6/20/1987','IT_PROG',9000,0,102,60),(104,'Bruce','Ernst','BERNST','590.423.4568','6/21/1987','IT_PROG',6000,0,103,60),(105,'David','Austin','DAUSTIN','590.423.4569','6/22/1987','IT_PROG',4800,0,103,60),(106,'Valli','Pataballa','VPATABAL','590.423.4560','6/23/1987','IT_PROG',4800,0,103,60),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','6/24/1987','IT_PROG',4200,0,103,60),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','6/25/1987','FI_MGR',12000,0,101,100),(109,'Daniel','Faviet','DFAVIET','515.124.4169','6/26/1987','FI_ACCOUNT',9000,0,108,100),(110,'John','Chen','JCHEN','515.124.4269','6/27/1987','FI_ACCOUNT',8200,0,108,100),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','6/28/1987','FI_ACCOUNT',7700,0,108,100),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','6/29/1987','FI_ACCOUNT',7800,0,108,100),(113,'Luis','Popp','LPOPP','515.124.4567','6/30/1987','FI_ACCOUNT',6900,0,108,100),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','7/1/1987','PU_MAN',11000,0,100,30),(115,'Alexander','Khoo','AKHOO','515.127.4562','7/2/1987','PU_CLERK',3100,0,114,30),(116,'Shelli','Baida','SBAIDA','515.127.4563','7/3/1987','PU_CLERK',2900,0,114,30),(117,'Sigal','Tobias','STOBIAS','515.127.4564','7/4/1987','PU_CLERK',2800,0,114,30),(118,'Guy','Himuro','GHIMURO','515.127.4565','7/5/1987','PU_CLERK',2600,0,114,30),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','7/6/1987','PU_CLERK',2500,0,114,30),(120,'Matthew','Weiss','MWEISS','650.123.1234','7/7/1987','ST_MAN',8000,0,100,50),(121,'Adam','Fripp','AFRIPP','650.123.2234','7/8/1987','ST_MAN',8200,0,100,50),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','7/9/1987','ST_MAN',7900,0,100,50),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','7/10/1987','ST_MAN',6500,0,100,50),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','7/11/1987','ST_MAN',5800,0,100,50),(125,'Julia','Nayer','JNAYER','650.124.1214','7/12/1987','ST_CLERK',3200,0,120,50),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','7/13/1987','ST_CLERK',2700,0,120,50),(127,'James','Landry','JLANDRY','650.124.1334','7/14/1987','ST_CLERK',2400,0,120,50),(128,'Steven','Markle','SMARKLE','650.124.1434','7/15/1987','ST_CLERK',2200,0,120,50),(129,'Laura','Bissot','LBISSOT','650.124.5234','7/16/1987','ST_CLERK',3300,0,121,50),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','7/17/1987','ST_CLERK',2800,0,121,50),(131,'James','Marlow','JAMRLOW','650.124.7234','7/18/1987','ST_CLERK',2500,0,121,50),(132,'TJ','Olson','TJOLSON','650.124.8234','7/19/1987','ST_CLERK',2100,0,121,50),(133,'Jason','Mallin','JMALLIN','650.127.1934','7/20/1987','ST_CLERK',3300,0,122,50),(134,'Michael','Rogers','MROGERS','650.127.1834','7/21/1987','ST_CLERK',2900,0,122,50),(135,'Ki','Gee','KGEE','650.127.1734','7/22/1987','ST_CLERK',2400,0,122,50),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','7/23/1987','ST_CLERK',2200,0,122,50),(137,'Renske','Ladwig','RLADWIG','650.121.1234','7/24/1987','ST_CLERK',3600,0,123,50),(138,'Stephen','Stiles','SSTILES','650.121.2034','7/25/1987','ST_CLERK',3200,0,123,50),(139,'John','Seo','JSEO','650.121.2019','7/26/1987','ST_CLERK',2700,0,123,50),(140,'Joshua','Patel','JPATEL','650.121.1834','7/27/1987','ST_CLERK',2500,0,123,50),(141,'Trenna','Rajs','TRAJS','650.121.8009','7/28/1987','ST_CLERK',3500,0,124,50),(142,'Curtis','Davies','CDAVIES','650.121.2994','7/29/1987','ST_CLERK',3100,0,124,50),(143,'Randall','Matos','RMATOS','650.121.2874','7/30/1987','ST_CLERK',2600,0,124,50),(144,'Peter','Vargas','PVARGAS','650.121.2004','7/31/1987','ST_CLERK',2500,0,124,50),(145,'John','Russell','JRUSSEL','011.44.1344.429268','8/1/1987','SA_MAN',14000,0,100,80),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','8/2/1987','SA_MAN',13500,0,100,80),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','8/3/1987','SA_MAN',12000,0,100,80),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','8/4/1987','SA_MAN',11000,0,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','8/5/1987','SA_MAN',10500,0,100,80),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','8/6/1987','SA_REP',10000,0,145,80),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','8/7/1987','SA_REP',9500,0,145,80),(152,'Peter','Hall','PHALL','011.44.1344.478968','8/8/1987','SA_REP',9000,0,145,80),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','8/9/1987','SA_REP',8000,0,145,80),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','8/10/1987','SA_REP',7500,0,145,80),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','8/11/1987','SA_REP',7000,0,145,80),(156,'Janette','King','JKING','011.44.1345.429268','8/12/1987','SA_REP',10000,0,146,80),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','8/13/1987','SA_REP',9500,0,146,80),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','8/14/1987','SA_REP',9000,0,146,80),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','8/15/1987','SA_REP',8000,0,146,80),(160,'Louise','Doran','LDORAN','011.44.1345.629268','8/16/1987','SA_REP',7500,0,146,80),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','8/17/1987','SA_REP',7000,0,146,80),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','8/18/1987','SA_REP',10500,0,147,80),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','8/19/1987','SA_REP',9500,0,147,80),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','8/20/1987','SA_REP',7200,0,147,80),(165,'David','Lee','DLEE','011.44.1346.529268','8/21/1987','SA_REP',6800,0,147,80),(166,'Sundar','Ande','SANDE','011.44.1346.629268','8/22/1987','SA_REP',6400,0,147,80),(167,'Amit','Banda','ABANDA','011.44.1346.729268','8/23/1987','SA_REP',6200,0,147,80),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','8/24/1987','SA_REP',11500,0,148,80),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','8/25/1987','SA_REP',10000,0,148,80),(170,'Tayler','Fox','TFOX','011.44.1343.729268','8/26/1987','SA_REP',9600,0,148,80),(171,'William','Smith','WSMITH','011.44.1343.629268','8/27/1987','SA_REP',7400,0,148,80),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','8/28/1987','SA_REP',7300,0,148,80),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','8/29/1987','SA_REP',6100,0,148,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267','8/30/1987','SA_REP',11000,0,149,80),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','8/31/1987','SA_REP',8800,0,149,80),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','9/1/1987','SA_REP',8600,0,149,80),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','9/2/1987','SA_REP',8400,0,149,80),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','9/3/1987','SA_REP',7000,0,149,0),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','9/4/1987','SA_REP',6200,0,149,80),(180,'Winston','Taylor','WTAYLOR','650.507.9876','9/5/1987','SH_CLERK',3200,0,120,50),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','9/6/1987','SH_CLERK',3100,0,120,50),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','9/7/1987','SH_CLERK',2500,0,120,50),(183,'Girard','Geoni','GGEONI','650.507.9879','9/8/1987','SH_CLERK',2800,0,120,50),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','9/9/1987','SH_CLERK',4200,0,121,50),(185,'Alexis','Bull','ABULL','650.509.2876','9/10/1987','SH_CLERK',4100,0,121,50),(186,'Julia','Dellinger','JDELLING','650.509.3876','9/11/1987','SH_CLERK',3400,0,121,50),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','9/12/1987','SH_CLERK',3000,0,121,50),(188,'Kelly','Chung','KCHUNG','650.505.1876','9/13/1987','SH_CLERK',3800,0,122,50),(189,'Jennifer','Dilly','JDILLY','650.505.2876','9/14/1987','SH_CLERK',3600,0,122,50),(190,'Timothy','Gates','TGATES','650.505.3876','9/15/1987','SH_CLERK',2900,0,122,50),(191,'Randall','Perkins','RPERKINS','650.505.4876','9/16/1987','SH_CLERK',2500,0,122,50),(192,'Sarah','Bell','SBELL','650.501.1876','9/17/1987','SH_CLERK',4000,0,123,50),(193,'Britney','Everett','BEVERETT','650.501.2876','9/18/1987','SH_CLERK',3900,0,123,50),(194,'Samuel','McCain','SMCCAIN','650.501.3876','9/19/1987','SH_CLERK',3200,0,123,50),(195,'Vance','Jones','VJONES','650.501.4876','9/20/1987','SH_CLERK',2800,0,123,50),(196,'Alana','Walsh','AWALSH','650.507.9811','9/21/1987','SH_CLERK',3100,0,124,50),(197,'Kevin','Feeney','KFEENEY','650.507.9822','9/22/1987','SH_CLERK',3000,0,124,50),(198,'Donald','OConnell','DOCONNEL','650.507.9833','9/23/1987','SH_CLERK',2600,0,124,50),(199,'Douglas','Grant','DGRANT','650.507.9844','9/24/1987','SH_CLERK',2600,0,124,50),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','9/25/1987','AD_ASST',4400,0,101,10),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','9/26/1987','MK_MAN',13000,0,100,20),(202,'Pat','Fay','PFAY','603.123.6666','9/27/1987','MK_REP',6000,0,201,20),(203,'Susan','Mavris','SMAVRIS','515.123.7777','9/28/1987','HR_REP',6500,0,101,40),(204,'Hermann','Baer','HBAER','515.123.8888','9/29/1987','PR_REP',10000,0,101,70),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','9/30/1987','AC_MGR',12000,0,101,110),(206,'William','Gietz','WGIETZ','515.123.8181','10/1/1987','AC_ACCOUNT',8300,0,205,110),(0,'-------------','-------------','----------','--------------------','-----------','------------',0,0,0,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `JOB_ID` text,
  `JOB_TITLE` text,
  `MIN_SALARY` int(11) DEFAULT NULL,
  `MAX_SALARY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AD_PRES','President',20000,40000),('AD_VP','Administration Vice President',15000,30000),('AD_ASST','Administration Assistant',3000,6000),('FI_MGR','Finance Manager',8200,16000),('FI_ACCOUNT','Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AC_ACCOUNT','Public Accountant',4200,9000),('SA_MAN','Sales Manager',10000,20000),('SA_REP','Sales Representative',6000,12000),('PU_MAN','Purchasing Manager',8000,15000),('PU_CLERK','Purchasing Clerk',2500,5500),('ST_MAN','Stock Manager',5500,8500),('ST_CLERK','Stock Clerk',2000,5000),('SH_CLERK','Shipping Clerk',2500,5500),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('HR_REP','Human Resources Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) DEFAULT NULL,
  `street_address` text,
  `postal_code` int(11) DEFAULT NULL,
  `city` text,
  `state_province` text,
  `country_id` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1000,'1297 Via Cola di Rie',989,'Roma','','IT'),(1100,'93091 Calle della Te',10934,'Venice','','IT'),(1200,'2017 Shinjuku-ku',1689,'Tokyo','Tokyo Prefectu','JP'),(1300,'9450 Kamiya-cho',6823,'Hiroshima','','JP'),(1400,'2014 Jabberwocky Rd',26192,'Southlake','Texas','US'),(1500,'2011 Interiors Blvd',99236,'South San','California','US'),(1600,'2007 Zagora St',50090,'South Brun','New Jersey','US'),(1700,'2004 Charade Rd',98199,'Seattle','Washington','US'),(1800,'147 Spadina Ave',0,'Toronto','Ontario','CA'),(1900,'6092 Boxwood St',0,'Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen',190518,'Beijing','','CN'),(2100,'1298 Vileparle (E)',490231,'Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Stree',2901,'Sydney','New South Wale','AU'),(2300,'198 Clementi North',540198,'Singapore','','SG'),(2400,'8204 Arthur St',0,'London','','UK'),(2500,'Magdalen Centre, The',0,'Oxford','Oxford','UK'),(2600,'9702 Chester Road',2147483647,'Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 703',80925,'Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360',1307,'Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Sai',1730,'Geneva','Geneve','CH'),(3000,'Murtenstrasse 921',3095,'Bern','BE','CH'),(3100,'Pieter Breughelstraa',3029,'Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 999',11932,'Mexico Cit','Distrito Feder','MX');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 14:07:00
