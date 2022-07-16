-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: fci4
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` mediumint unsigned NOT NULL,
  `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` mediumint unsigned NOT NULL,
  `country_code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '2014-01-01 01:01:01',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  PRIMARY KEY (`id`),
  KEY `cities_test_ibfk_1` (`state_id`),
  KEY `cities_test_ibfk_2` (`country_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emoji` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emojiU` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `code` varchar(45) NOT NULL,
  `name_arabic` varchar(255) DEFAULT NULL,
  `name_english` varchar(255) DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `lec_hours` decimal(10,2) DEFAULT NULL,
  `lab_hours` int DEFAULT NULL,
  `Desc` varchar(250) DEFAULT NULL,
  `programs_id` int NOT NULL,
  `Pre_course` varchar(45) DEFAULT NULL,
  `Force` int DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `fk_course_programs1_idx` (`programs_id`),
  KEY `fk_course_course1_idx` (`Pre_course`),
  CONSTRAINT `fk_course_course1` FOREIGN KEY (`Pre_course`) REFERENCES `course` (`code`),
  CONSTRAINT `fk_course_programs1` FOREIGN KEY (`programs_id`) REFERENCES `programs` (`id`),
  CONSTRAINT `FKh2gsm3ut0m16xywm5pybwxxfw` FOREIGN KEY (`Pre_course`) REFERENCES `course` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_has_department`
--

DROP TABLE IF EXISTS `course_has_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_department` (
  `course_code` varchar(45) NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`course_code`,`department_id`),
  KEY `fk_course_has_department_department1_idx` (`department_id`),
  KEY `fk_course_has_department_course1_idx` (`course_code`),
  CONSTRAINT `fk_course_has_department_course1` FOREIGN KEY (`course_code`) REFERENCES `course` (`code`),
  CONSTRAINT `fk_course_has_department_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_english` varchar(45) DEFAULT NULL,
  `name_arabic` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `Graduation_Project_hours` int DEFAULT NULL,
  `Graduation_hours` int DEFAULT NULL,
  `min_terms` int DEFAULT NULL,
  `max_degree_on_fail` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lab_day` int DEFAULT NULL,
  `lab_time` int DEFAULT NULL,
  `max_student` int DEFAULT NULL,
  `student_cnt` int DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `course_in_term_id` bigint DEFAULT NULL,
  `teaching_staff_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labs`
--

DROP TABLE IF EXISTS `labs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Term_has_course_id` int NOT NULL,
  `lab_day` int DEFAULT NULL,
  `lab_time` int DEFAULT NULL,
  `Teaching_staff_id` int NOT NULL,
  `student_cnt` int DEFAULT '0',
  `max_student` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_labs_Term_has_course1_idx` (`Term_has_course_id`),
  KEY `fk_labs_Teaching_staff1_idx` (`Teaching_staff_id`),
  CONSTRAINT `fk_labs_Teaching_staff1` FOREIGN KEY (`Teaching_staff_id`) REFERENCES `teaching_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_labs_Term_has_course1` FOREIGN KEY (`Term_has_course_id`) REFERENCES `term_has_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `point_system`
--

DROP TABLE IF EXISTS `point_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_system` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_english` varchar(45) DEFAULT NULL,
  `name_arabic` varchar(45) DEFAULT NULL,
  `degree_low` int DEFAULT NULL,
  `degree_high` int DEFAULT NULL,
  `Points` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `degree_UNIQUE` (`degree_low`,`degree_high`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_levels`
--

DROP TABLE IF EXISTS `program_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_english` varchar(45) DEFAULT NULL,
  `name_arabic` varchar(45) DEFAULT NULL,
  `min_hours` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_arabic` varchar(45) DEFAULT NULL,
  `name_english` varchar(45) DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `under_requirement` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programs_programs1_idx` (`under_requirement`),
  CONSTRAINT `fk_programs_programs1` FOREIGN KEY (`under_requirement`) REFERENCES `programs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regular_term_rules`
--

DROP TABLE IF EXISTS `regular_term_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regular_term_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gpa_low` int NOT NULL,
  `gpa_high` int NOT NULL,
  `hour_min` int NOT NULL,
  `hour_max` int NOT NULL,
  `hour_sp_min` int NOT NULL,
  `hour_sp_max` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gpa_UNIQUE` (`gpa_low`,`gpa_high`),
  UNIQUE KEY `hour_UNIQUE` (`hour_min`,`hour_max`),
  UNIQUE KEY `hour_sp_UNIQUE` (`hour_sp_min`,`hour_sp_max`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_has_privileges`
--

DROP TABLE IF EXISTS `roles_has_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_privileges` (
  `roles_id` int NOT NULL,
  `Privileges_id` int NOT NULL,
  PRIMARY KEY (`roles_id`,`Privileges_id`),
  KEY `fk_roles_has_Privileges_Privileges1_idx` (`Privileges_id`),
  KEY `fk_roles_has_Privileges_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_roles_has_Privileges_Privileges1` FOREIGN KEY (`Privileges_id`) REFERENCES `privileges` (`id`),
  CONSTRAINT `fk_roles_has_Privileges_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKiia1s49vfu1mkvdqn0jitcvrv` FOREIGN KEY (`Privileges_id`) REFERENCES `privileges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` mediumint unsigned NOT NULL,
  `country_code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fips_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  PRIMARY KEY (`id`),
  KEY `country_region` (`country_id`),
  CONSTRAINT `country_region_final` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4860 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_arabic` varchar(100) DEFAULT NULL,
  `name_english` varchar(100) DEFAULT NULL,
  `img` MEDIUMBLOB,
  `nationality` varchar(45) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `Religion` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `National_id` varchar(45) DEFAULT NULL,
  `Guardian_name` varchar(100) DEFAULT NULL,
  `Guardian_job` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sec_school` varchar(45) DEFAULT NULL,
  `pre_qualfication` varchar(45) DEFAULT 'Math Secondary',
  `quilification_year` date DEFAULT NULL,
  `degrees` decimal(10,0) DEFAULT NULL,
  `student_info_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `guide_id` int DEFAULT NULL,
  `department_id` int NOT NULL DEFAULT '1',
  `city_id` mediumint unsigned NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Student_student_info1_idx` (`student_info_id`),
  KEY `fk_student_teaching_staff1_idx` (`guide_id`),
  KEY `fk_student_users1_idx` (`user_id`),
  KEY `fk_student_department1_idx` (`department_id`),
  KEY `fk_student_cities1_idx` (`city_id`),
  CONSTRAINT `fk_student_cities1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_student_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_Student_student_info1` FOREIGN KEY (`student_info_id`) REFERENCES `student_info` (`id`),
  CONSTRAINT `fk_student_teaching_staff1` FOREIGN KEY (`guide_id`) REFERENCES `teaching_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_has_course_in_term`
--

DROP TABLE IF EXISTS `student_has_course_in_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_course_in_term` (
  `Student_id` int NOT NULL,
  `course_in_Term_id` int NOT NULL,
  `lab_attend` int DEFAULT NULL,
  `lec_attend` int DEFAULT NULL,
  `midterm` int DEFAULT NULL,
  `final` int DEFAULT NULL,
  `degree` int DEFAULT NULL,
  `points` decimal(10,0) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `status` enum('registered','Success','Fail','withdrawn') DEFAULT 'registered',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `quiz-1` int,
  `quiz-2` int,
  `project` int,
  `practice` int,
  PRIMARY KEY (`Student_id`,`course_in_Term_id`),
  KEY `fk_Student_has_Term_has_course_Term_has_course1_idx` (`course_in_Term_id`),
  KEY `fk_Student_has_Term_has_course_Student1_idx` (`Student_id`),
  CONSTRAINT `fk_Student_has_Term_has_course_Student1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_Student_has_Term_has_course_Term_has_course1` FOREIGN KEY (`course_in_Term_id`) REFERENCES `term_has_course` (`id`),
  CONSTRAINT `FKp9htymbigpvaqtwyl1fd6104h` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_in_term`
--

DROP TABLE IF EXISTS `student_in_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_in_term` (
  `Student_id` int NOT NULL,
  `Term_id` int NOT NULL,
  PRIMARY KEY (`Student_id`,`Term_id`),
  KEY `fk_Student_has_Term_Term2_idx` (`Term_id`),
  KEY `fk_Student_has_Term_Student2_idx` (`Student_id`),
  CONSTRAINT `fk_Student_has_Term_Student2` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_Student_has_Term_Term2` FOREIGN KEY (`Term_id`) REFERENCES `term` (`id`),
  CONSTRAINT `FKojliaerd5yv479fgr69pn2vi0` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKowck81juselgqpkyuvaq2g49u` FOREIGN KEY (`Term_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Total_hours` int DEFAULT NULL,
  `GPA` decimal(10,0) DEFAULT NULL,
  `gpa2_cnt` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `summer_term_rules`
--

DROP TABLE IF EXISTS `summer_term_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summer_term_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gpa_low` int NOT NULL,
  `gpa_high` int NOT NULL,
  `hour_min` int NOT NULL,
  `hour_max` int NOT NULL,
  `hour_sp_min` int NOT NULL,
  `hour_sp_max` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gpa_UNIQUE` (`gpa_low`,`gpa_high`),
  UNIQUE KEY `hour_UNIQUE` (`hour_min`,`hour_max`),
  UNIQUE KEY `hour_sp_UNIQUE` (`hour_sp_min`,`hour_sp_max`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teaching_staff`
--

DROP TABLE IF EXISTS `teaching_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching_staff` (
  `id` int NOT NULL,
  `name_english` varchar(45) DEFAULT NULL,
  `name_arabic` varchar(45) DEFAULT NULL,
  `img` blob,
  `nationality` varchar(45) NOT NULL,
  `gender` int DEFAULT NULL,
  `Religion` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `national_id` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `PHD_degree` varchar(45) DEFAULT NULL,
  `users_id` int DEFAULT NULL,
  `city_id` mediumint unsigned DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Teaching_staff_users1_idx` (`users_id`),
  KEY `fk_Teaching_staff_cities1_idx` (`city_id`),
  CONSTRAINT `fk_Teaching_staff_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term` (
  `id` int NOT NULL,
  `name_english` varchar(45) DEFAULT NULL,
  `name_arabic` varchar(45) DEFAULT NULL,
  `Term_type` enum('regular','summer') DEFAULT 'regular',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `start_registration` date DEFAULT NULL,
  `end_registration` date DEFAULT NULL,
  `start_updating` date DEFAULT NULL,
  `end_updating` date DEFAULT NULL,
  `start_withdrawn` date DEFAULT NULL,
  `end_withdrawn` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_has_course`
--

DROP TABLE IF EXISTS `term_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_has_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Term_idTerm` int NOT NULL,
  `course_code` varchar(45) NOT NULL,
  `Teaching_staff_id` int NOT NULL,
  `lecture_day` int DEFAULT NULL,
  `lecture_time` int DEFAULT NULL,
  `lab_or_groub` enum('Lab','group') DEFAULT 'group',
  `student_cnt` int DEFAULT '0',
  `min_student` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `compiste_UNIQUE` (`Term_idTerm`,`course_code`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Term_has_course_course1_idx` (`course_code`),
  KEY `fk_Term_has_course_Term1_idx` (`Term_idTerm`),
  KEY `fk_Term_has_course_Teaching_staff1_idx` (`Teaching_staff_id`),
  CONSTRAINT `fk_Term_has_course_course1` FOREIGN KEY (`course_code`) REFERENCES `course` (`code`),
  CONSTRAINT `fk_Term_has_course_Teaching_staff1` FOREIGN KEY (`Teaching_staff_id`) REFERENCES `teaching_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Term_has_course_Term1` FOREIGN KEY (`Term_idTerm`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `Student_id` int NOT NULL,
  `Term_id` int NOT NULL,
  `couse_cnt` int DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `bill_no` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `id` bigint NOT NULL,
  `course_cnt` int DEFAULT NULL,
  PRIMARY KEY (`Student_id`,`Term_id`),
  KEY `fk_Student_has_Term_Term1_idx` (`Term_id`),
  KEY `fk_Student_has_Term_Student1_idx` (`Student_id`),
  CONSTRAINT `FK5fusnusdgp0pp4ycunwa2i47` FOREIGN KEY (`Term_id`) REFERENCES `term` (`id`),
  CONSTRAINT `FK8klpun9u3aoqpyaaxjk36j1bd` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_Student_has_Term_Student1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_Student_has_Term_Term1` FOREIGN KEY (`Term_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_roles`
--

DROP TABLE IF EXISTS `users_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_roles` (
  `users_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `fk_users_has_roles_roles1_idx` (`roles_id`),
  KEY `fk_users_has_roles_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_roles_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-06 18:22

DROP TABLE IF EXISTS `lecture`;
create table `lecture` (
`course_code` varchar(45) NOT NULL,
`title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
`Desc` varchar(250) DEFAULT NULL,
`create_time` datetime DEFAULT NULL,
`file` LONGBLOB,
CONSTRAINT `fk_lecture_course_code` FOREIGN KEY (`course_code`) REFERENCES `course` (`code`)
);