-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qlst
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitietgiohang`
--

DROP TABLE IF EXISTS `chitietgiohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietgiohang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soluong` int NOT NULL,
  `mathang_id` int DEFAULT NULL,
  `giohang_id` int DEFAULT NULL,
  `tongtien` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mathang_id` (`mathang_id`),
  KEY `giohang_id` (`giohang_id`),
  CONSTRAINT `chitietgiohang_ibfk_1` FOREIGN KEY (`mathang_id`) REFERENCES `mathang` (`id`),
  CONSTRAINT `chitietgiohang_ibfk_2` FOREIGN KEY (`giohang_id`) REFERENCES `giohang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietgiohang`
--

LOCK TABLES `chitietgiohang` WRITE;
/*!40000 ALTER TABLE `chitietgiohang` DISABLE KEYS */;
INSERT INTO `chitietgiohang` VALUES (1,2,1,1,30000000),(2,1,2,2,25000000),(3,3,3,3,1500000),(4,1,4,4,12000000),(5,1,5,5,8000000),(6,2,1,6,3000000),(7,3,2,7,4500000),(8,1,3,8,2200000),(9,4,4,9,5800000),(10,1,5,10,3300000);
/*!40000 ALTER TABLE `chitietgiohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tinh` varchar(255) DEFAULT NULL,
  `huyen` varchar(255) DEFAULT NULL,
  `ghichu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` VALUES (2,'Hà Nội','Hà Đông','La Khê'),(3,'Hà Nội','Cầu Giấy','Hồ Tùng Mậu'),(4,'Hà Nội','Cầu Giấy','Hồ Tùng Mậu'),(5,'Hà Nội','Cầu Giấy','Hồ Tùng Mậu'),(6,'Hà Nội','Hà Đông','Văn Phú'),(7,'Hà Nội','Hai Bà Trưng',''),(8,'Hà Nội','Hà Đông','Triều Khúc'),(9,'Nam Định','Trực Ninh','Trực Chính'),(10,'Nam Định','Trực Linh','Cổ Lễ'),(11,'Hà Nội','Hà Đông','Phú Lương'),(12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tongtien` float NOT NULL,
  `KH_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `giohang_ibfk_1` (`KH_id`),
  CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`KH_id`) REFERENCES `thanhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,30000000,6),(2,25000000,7),(3,1500000,6),(4,12000000,8),(5,8000000,6),(6,3000000,7),(7,4500000,8),(8,2200000,7),(9,5800000,6),(10,3300000,6);
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonoff`
--

DROP TABLE IF EXISTS `hoadonoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonoff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngaymua` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `thue` float DEFAULT NULL,
  `NVBH_id` int DEFAULT NULL,
  `giohang_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NVBH_id` (`NVBH_id`),
  KEY `giohang_id` (`giohang_id`),
  CONSTRAINT `hoadonoff_ibfk_1` FOREIGN KEY (`NVBH_id`) REFERENCES `thanhvien` (`id`),
  CONSTRAINT `hoadonoff_ibfk_2` FOREIGN KEY (`giohang_id`) REFERENCES `giohang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonoff`
--

LOCK TABLES `hoadonoff` WRITE;
/*!40000 ALTER TABLE `hoadonoff` DISABLE KEYS */;
INSERT INTO `hoadonoff` VALUES (1,'2024-10-31 17:00:00',0.1,5,6),(2,'2024-11-01 17:00:00',0.05,5,7),(3,'2024-11-04 17:00:00',0.08,5,8),(4,'2024-11-07 17:00:00',0.12,5,9),(5,'2024-11-09 17:00:00',0.07,5,10);
/*!40000 ALTER TABLE `hoadonoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonon`
--

DROP TABLE IF EXISTS `hoadonon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngaymua` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` varchar(255) DEFAULT NULL,
  `ngaygiao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phigiao` float DEFAULT NULL,
  `NVKho_id` int DEFAULT NULL,
  `NVgiaohang_id` int DEFAULT NULL,
  `KH_id` int DEFAULT NULL,
  `giohang_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NVKho_id` (`NVKho_id`),
  KEY `NVgiaohang_id` (`NVgiaohang_id`),
  KEY `KH_id` (`KH_id`),
  KEY `giohang_id` (`giohang_id`),
  CONSTRAINT `hoadonon_ibfk_1` FOREIGN KEY (`NVKho_id`) REFERENCES `thanhvien` (`id`),
  CONSTRAINT `hoadonon_ibfk_2` FOREIGN KEY (`NVgiaohang_id`) REFERENCES `thanhvien` (`id`),
  CONSTRAINT `hoadonon_ibfk_3` FOREIGN KEY (`KH_id`) REFERENCES `thanhvien` (`id`),
  CONSTRAINT `hoadonon_ibfk_4` FOREIGN KEY (`giohang_id`) REFERENCES `giohang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonon`
--

LOCK TABLES `hoadonon` WRITE;
/*!40000 ALTER TABLE `hoadonon` DISABLE KEYS */;
INSERT INTO `hoadonon` VALUES (1,'2024-10-31 17:00:00','Đã giao','2024-11-02 17:00:00',30000,1,3,6,1),(2,'2024-11-04 17:00:00','Chưa giao',NULL,25000,2,NULL,7,2),(3,'2024-11-06 17:00:00','Đang giao','2024-11-07 17:00:00',15000,2,3,6,3),(4,'2024-11-09 17:00:00','Đã giao','2024-11-11 17:00:00',20000,1,4,8,4),(5,'2024-11-11 17:00:00','Chưa giao',NULL,10000,1,NULL,6,5);
/*!40000 ALTER TABLE `hoadonon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoten`
--

DROP TABLE IF EXISTS `hoten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ho` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tendem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoten`
--

LOCK TABLES `hoten` WRITE;
/*!40000 ALTER TABLE `hoten` DISABLE KEYS */;
INSERT INTO `hoten` VALUES (2,'Nguyễn ','Duy ','Hưng'),(3,'Nguyễn ','Thị Hoài','Linh'),(4,'Đinh','Xuân ','Trưởng'),(5,'Nguyễn','Ngọc','Ánh'),(6,'Trịnh ','Phương ','Thảo'),(7,'Nguyễn','Tùng','Dương'),(8,'Nguyễn ','Thúy ','Quỳnh'),(9,'Nguyễn','Phương','Uyên'),(10,'Nguyễn','Việt','Hoàng'),(11,'Nguyễn ','Thị Anh','Thư'),(12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hoten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `gia` float NOT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `nhacungcap_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nhacungcap_id` (`nhacungcap_id`),
  CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`nhacungcap_id`) REFERENCES `nhacungcap` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathang`
--

LOCK TABLES `mathang` WRITE;
/*!40000 ALTER TABLE `mathang` DISABLE KEYS */;
INSERT INTO `mathang` VALUES (1,'Điện thoại',15000000,'Điện thoại thông minh',NULL),(2,'Laptop',25000000,'Máy tính xách tay',NULL),(3,'Tai nghe',500000,'Tai nghe Bluetooth',NULL),(4,'Tivi',12000000,'Tivi 4K UHD',NULL),(5,'Máy giặt',8000000,'Máy giặt cửa ngang',NULL);
/*!40000 ALTER TABLE `mathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhacungcap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `diachi_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diachi_id` (`diachi_id`),
  CONSTRAINT `nhacungcap_ibfk_1` FOREIGN KEY (`diachi_id`) REFERENCES `diachi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhacungcap`
--

LOCK TABLES `nhacungcap` WRITE;
/*!40000 ALTER TABLE `nhacungcap` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhacungcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (9,'hung304','123456'),(10,'hung','123456'),(11,'hung1','123'),(12,'hung2','123'),(13,'hung4','123'),(14,'hung6','123'),(15,'hung7','123'),(16,'hung8','123'),(17,'hung10','123'),(18,'B21DCAT098','123'),(19,'hung12','123');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhvien`
--

DROP TABLE IF EXISTS `thanhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sdt` varchar(255) DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `taikhoan_id` int DEFAULT NULL,
  `hoten_id` int DEFAULT NULL,
  `diachi_id` int DEFAULT NULL,
  `vitri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taikhoan_id` (`taikhoan_id`),
  KEY `hoten_id` (`hoten_id`),
  KEY `diachi_id` (`diachi_id`),
  CONSTRAINT `thanhvien_ibfk_1` FOREIGN KEY (`taikhoan_id`) REFERENCES `taikhoan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thanhvien_ibfk_2` FOREIGN KEY (`hoten_id`) REFERENCES `hoten` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thanhvien_ibfk_3` FOREIGN KEY (`diachi_id`) REFERENCES `diachi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhvien`
--

LOCK TABLES `thanhvien` WRITE;
/*!40000 ALTER TABLE `thanhvien` DISABLE KEYS */;
INSERT INTO `thanhvien` VALUES (1,'0375298044','leessang304@gmail.com',NULL,9,2,2,'NV Kho'),(2,'0375298044','leessang304@gmail.com',NULL,10,3,3,'NV Kho'),(3,'0375298044','leessang304@gmail.com',NULL,11,4,4,'NV Giao hàng'),(4,'0375298044','leessang304@gmail.com',NULL,12,5,5,'NV Giao hàng'),(5,'0375298044','leessang304@gmail.com',NULL,13,6,6,'NV Bán hàng'),(6,'0375298044','leessang304@gmail.com',NULL,14,7,7,'Khách hàng'),(7,'0375298044','leessang304@gmail.com',NULL,15,8,8,'Khách hàng'),(8,'0375298044','leessang304@gmail.com',NULL,16,9,9,'Khách hàng'),(9,'0375298044','leessang304@gmail.com',NULL,17,10,10,'NV Quản lý'),(10,'0375298044','leessang304@gmail.com',NULL,18,11,11,'Khách hàng'),(11,'0375298044','HungND.B21AT098@stu.ptit.edu.vn',NULL,19,12,12,'Người dùng');
/*!40000 ALTER TABLE `thanhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23  6:45:22
