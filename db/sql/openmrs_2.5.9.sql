-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openmrs_core
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

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
-- Table structure for table `address_hierarchy_address_to_entry_map`
--

DROP TABLE IF EXISTS `address_hierarchy_address_to_entry_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_address_to_entry_map` (
  `address_to_entry_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_to_entry_map_id`),
  KEY `address_id_to_person_address_table` (`address_id`),
  KEY `entry_id_to_address_hierarchy_table` (`entry_id`),
  CONSTRAINT `entry_id_to_address_hierarchy_table` FOREIGN KEY (`entry_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `address_id_to_person_address_table` FOREIGN KEY (`address_id`) REFERENCES `person_address` (`person_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_address_to_entry_map`
--

LOCK TABLES `address_hierarchy_address_to_entry_map` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_entry`
--

DROP TABLE IF EXISTS `address_hierarchy_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_entry` (
  `address_hierarchy_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_generated_id` varchar(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_hierarchy_entry_id`),
  KEY `address_hierarchy_entry_name_idx` (`name`),
  KEY `level_name` (`level_id`,`name`),
  KEY `parent_name` (`parent_id`,`name`),
  CONSTRAINT `parent-to-parent` FOREIGN KEY (`parent_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `level_to_level` FOREIGN KEY (`level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_entry`
--

LOCK TABLES `address_hierarchy_entry` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_level`
--

DROP TABLE IF EXISTS `address_hierarchy_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_level` (
  `address_hierarchy_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `parent_level_id` int(11) DEFAULT NULL,
  `address_field` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_hierarchy_level_id`),
  UNIQUE KEY `parent_level_id` (`parent_level_id`),
  KEY `address_field_unique` (`address_field`),
  CONSTRAINT `parent_level` FOREIGN KEY (`parent_level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_level`
--

LOCK TABLES `address_hierarchy_level` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergy` (
  `allergy_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `severity_concept_id` int(11) DEFAULT NULL,
  `coded_allergen` int(11) NOT NULL,
  `non_coded_allergen` varchar(255) DEFAULT NULL,
  `allergen_type` varchar(50) NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`allergy_id`),
  UNIQUE KEY `allergy_id` (`allergy_id`),
  KEY `allergy_patient_id_fk` (`patient_id`),
  KEY `allergy_coded_allergen_fk` (`coded_allergen`),
  KEY `allergy_severity_concept_id_fk` (`severity_concept_id`),
  KEY `allergy_creator_fk` (`creator`),
  KEY `allergy_changed_by_fk` (`changed_by`),
  KEY `allergy_voided_by_fk` (`voided_by`),
  KEY `allergy_encounter_id_fk` (`encounter_id`),
  CONSTRAINT `allergy_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `allergy_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `allergy_coded_allergen_fk` FOREIGN KEY (`coded_allergen`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `allergy_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `allergy_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `allergy_severity_concept_id_fk` FOREIGN KEY (`severity_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `allergy_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy_reaction`
--

DROP TABLE IF EXISTS `allergy_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergy_reaction` (
  `allergy_reaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `allergy_id` int(11) NOT NULL,
  `reaction_concept_id` int(11) NOT NULL,
  `reaction_non_coded` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`allergy_reaction_id`),
  UNIQUE KEY `allergy_reaction_id` (`allergy_reaction_id`),
  KEY `allergy_reaction_allergy_id_fk` (`allergy_id`),
  KEY `allergy_reaction_reaction_concept_id_fk` (`reaction_concept_id`),
  CONSTRAINT `allergy_reaction_reaction_concept_id_fk` FOREIGN KEY (`reaction_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `allergy_reaction_allergy_id_fk` FOREIGN KEY (`allergy_id`) REFERENCES `allergy` (`allergy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy_reaction`
--

LOCK TABLES `allergy_reaction` WRITE;
/*!40000 ALTER TABLE `allergy_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergy_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_component_state`
--

DROP TABLE IF EXISTS `appframework_component_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_component_state` (
  `component_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `component_id` varchar(255) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`component_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_component_state`
--

LOCK TABLES `appframework_component_state` WRITE;
/*!40000 ALTER TABLE `appframework_component_state` DISABLE KEYS */;
INSERT INTO `appframework_component_state` VALUES (1,'4bfa09c8-c887-484a-8802-b47339352f81','registrationapp.basicRegisterPatient','APP',1),(2,'8ba8efbf-fa91-4cbf-b3d7-cd675e6150cb','coreapps.awaitingAdmission','APP',0);
/*!40000 ALTER TABLE `appframework_component_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_user_app`
--

DROP TABLE IF EXISTS `appframework_user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_user_app` (
  `app_id` varchar(50) NOT NULL,
  `json` mediumtext NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_user_app`
--

LOCK TABLES `appframework_user_app` WRITE;
/*!40000 ALTER TABLE `appframework_user_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `appframework_user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot_id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `appointment_type_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_creator` (`creator`),
  KEY `appointment_changed_by` (`changed_by`),
  KEY `appointment_voided_by` (`voided_by`),
  KEY `appointment_time_slot_id` (`time_slot_id`),
  KEY `appointment_appointment_type_id` (`appointment_type_id`),
  KEY `appointment_visit_id` (`visit_id`),
  KEY `appointment_patient_id` (`patient_id`),
  CONSTRAINT `appointment_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`),
  CONSTRAINT `appointment_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_time_slot_id` FOREIGN KEY (`time_slot_id`) REFERENCES `appointmentscheduling_time_slot` (`time_slot_id`),
  CONSTRAINT `appointment_visit_id` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `appointment_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment`
--

LOCK TABLES `appointmentscheduling_appointment` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_block`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_block` (
  `appointment_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_block_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_block_creator` (`creator`),
  KEY `appointment_block_changed_by` (`changed_by`),
  KEY `appointment_block_voided_by` (`voided_by`),
  KEY `appointment_block_location_id` (`location_id`),
  KEY `appointment_block_provider_id` (`provider_id`),
  CONSTRAINT `appointment_block_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_block_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_block_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `appointment_block_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_block_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_block`
--

LOCK TABLES `appointmentscheduling_appointment_block` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_request`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_request` (
  `appointment_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `appointment_type_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `requested_on` datetime NOT NULL,
  `min_time_frame_value` int(11) DEFAULT NULL,
  `min_time_frame_units` varchar(255) DEFAULT NULL,
  `max_time_frame_value` int(11) DEFAULT NULL,
  `max_time_frame_units` varchar(255) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_request_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_request_creator` (`creator`),
  KEY `appointment_request_changed_by` (`changed_by`),
  KEY `appointment_request_voided_by` (`voided_by`),
  KEY `appointment_request_appointment_type_id` (`appointment_type_id`),
  KEY `appointment_request_patient_id` (`patient_id`),
  KEY `appointment_request_provider_id` (`provider_id`),
  KEY `appointment_request_requested_by` (`requested_by`),
  CONSTRAINT `appointment_request_requested_by` FOREIGN KEY (`requested_by`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_request_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`),
  CONSTRAINT `appointment_request_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_request_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_request_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_request_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_request_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_request`
--

LOCK TABLES `appointmentscheduling_appointment_request` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_status_history`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_status_history` (
  `appointment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`appointment_status_history_id`),
  KEY `appointment_status_history_appointment` (`appointment_id`),
  CONSTRAINT `appointment_status_history_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointmentscheduling_appointment` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_status_history`
--

LOCK TABLES `appointmentscheduling_appointment_status_history` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_type`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_type` (
  `appointment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `confidential` tinyint(1) NOT NULL DEFAULT '0',
  `visit_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`appointment_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_type_creator` (`creator`),
  KEY `appointment_type_changed_by` (`changed_by`),
  KEY `appointment_type_retired_by` (`retired_by`),
  KEY `appointment_type_visit_type_id` (`visit_type_id`),
  CONSTRAINT `appointment_type_visit_type_id` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `appointment_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_type`
--

LOCK TABLES `appointmentscheduling_appointment_type` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_block_type_map`
--

DROP TABLE IF EXISTS `appointmentscheduling_block_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_block_type_map` (
  `appointment_type_id` int(11) NOT NULL,
  `appointment_block_id` int(11) NOT NULL,
  PRIMARY KEY (`appointment_type_id`,`appointment_block_id`),
  KEY `appointment_block_type_map_appointment_block_id` (`appointment_block_id`),
  CONSTRAINT `appointment_block_type_map_appointment_block_id` FOREIGN KEY (`appointment_block_id`) REFERENCES `appointmentscheduling_appointment_block` (`appointment_block_id`),
  CONSTRAINT `appointment_block_type_map_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_block_type_map`
--

LOCK TABLES `appointmentscheduling_block_type_map` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_block_type_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_block_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_provider_schedule`
--

DROP TABLE IF EXISTS `appointmentscheduling_provider_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_provider_schedule` (
  `provider_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_schedule_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_schedule_creator` (`creator`),
  KEY `provider_schedule_changed_by` (`changed_by`),
  KEY `provider_schedule_voided_by` (`voided_by`),
  KEY `provider_schedule_location_id` (`location_id`),
  KEY `provider_schedule_provider_id` (`provider_id`),
  CONSTRAINT `provider_schedule_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_schedule_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_schedule_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_schedule_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `provider_schedule_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_provider_schedule`
--

LOCK TABLES `appointmentscheduling_provider_schedule` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_provider_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_provider_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_provider_type_map`
--

DROP TABLE IF EXISTS `appointmentscheduling_provider_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_provider_type_map` (
  `appointment_type_id` int(11) NOT NULL,
  `provider_schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`appointment_type_id`,`provider_schedule_id`),
  KEY `appointmentscheduling_provider_type_map_provider_schedule_id` (`provider_schedule_id`),
  CONSTRAINT `appointmentscheduling_provider_type_map_provider_schedule_id` FOREIGN KEY (`provider_schedule_id`) REFERENCES `appointmentscheduling_provider_schedule` (`provider_schedule_id`),
  CONSTRAINT `appointmentscheduling_provider_type_map_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_provider_type_map`
--

LOCK TABLES `appointmentscheduling_provider_type_map` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_provider_type_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_provider_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_time_slot`
--

DROP TABLE IF EXISTS `appointmentscheduling_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_time_slot` (
  `time_slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_block_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_slot_creator` (`creator`),
  KEY `appointment_slot__changed_by` (`changed_by`),
  KEY `appointment_slot_voided_by` (`voided_by`),
  KEY `appointment_slot_appointment_block_id` (`appointment_block_id`),
  CONSTRAINT `appointment_slot_appointment_block_id` FOREIGN KEY (`appointment_block_id`) REFERENCES `appointmentscheduling_appointment_block` (`appointment_block_id`),
  CONSTRAINT `appointment_slot_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_slot_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_slot__changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_time_slot`
--

LOCK TABLES `appointmentscheduling_time_slot` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_time_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculation_registration`
--

DROP TABLE IF EXISTS `calculation_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculation_registration` (
  `calculation_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `calculation_name` varchar(512) NOT NULL,
  `configuration` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`calculation_registration_id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculation_registration`
--

LOCK TABLES `calculation_registration` WRITE;
/*!40000 ALTER TABLE `calculation_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculation_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_setting`
--

DROP TABLE IF EXISTS `care_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_setting` (
  `care_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `care_setting_type` varchar(50) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`care_setting_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `care_setting_creator` (`creator`),
  KEY `care_setting_retired_by` (`retired_by`),
  KEY `care_setting_changed_by` (`changed_by`),
  CONSTRAINT `care_setting_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_setting`
--

LOCK TABLES `care_setting` WRITE;
/*!40000 ALTER TABLE `care_setting` DISABLE KEYS */;
INSERT INTO `care_setting` VALUES (1,'Outpatient','Out-patient care setting','OUTPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'6f0c9a92-6f24-11e3-af88-005056821db0'),(2,'Inpatient','In-patient care setting','INPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'c365e560-c3ec-11e3-9c1a-0800200c9a66');
/*!40000 ALTER TABLE `care_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clob_datatype_storage`
--

DROP TABLE IF EXISTS `clob_datatype_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clob_datatype_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `clob_datatype_storage_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clob_datatype_storage`
--

LOCK TABLES `clob_datatype_storage` WRITE;
/*!40000 ALTER TABLE `clob_datatype_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `clob_datatype_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `cohort_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`cohort_id`),
  UNIQUE KEY `cohort_uuid_index` (`uuid`),
  KEY `user_who_changed_cohort` (`changed_by`),
  KEY `cohort_creator` (`creator`),
  KEY `user_who_voided_cohort` (`voided_by`),
  CONSTRAINT `cohort_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_cohort` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_cohort` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort_member`
--

DROP TABLE IF EXISTS `cohort_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort_member` (
  `cohort_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `cohort_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`cohort_member_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `member_patient` (`patient_id`),
  KEY `cohort_member_creator` (`creator`),
  KEY `parent_cohort` (`cohort_id`),
  CONSTRAINT `cohort_member_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `member_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `parent_cohort` FOREIGN KEY (`cohort_id`) REFERENCES `cohort` (`cohort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort_member`
--

LOCK TABLES `cohort_member` WRITE;
/*!40000 ALTER TABLE `cohort_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept` (
  `concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `form_text` text,
  `datatype_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE KEY `concept_uuid_index` (`uuid`),
  KEY `user_who_changed_concept` (`changed_by`),
  KEY `concept_classes` (`class_id`),
  KEY `concept_creator` (`creator`),
  KEY `concept_datatypes` (`datatype_id`),
  KEY `user_who_retired_concept` (`retired_by`),
  CONSTRAINT `concept_classes` FOREIGN KEY (`class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `concept_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_datatypes` FOREIGN KEY (`datatype_id`) REFERENCES `concept_datatype` (`concept_datatype_id`),
  CONSTRAINT `user_who_changed_concept` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept`
--

LOCK TABLES `concept` WRITE;
/*!40000 ALTER TABLE `concept` DISABLE KEYS */;
INSERT INTO `concept` VALUES (1,0,'','',NULL,4,11,0,1,'2016-07-07 08:14:50',NULL,NULL,NULL,NULL,NULL,NULL,'d57ee217-fabe-4577-bf8f-285fb6120e21'),(2,0,'','',NULL,4,11,0,1,'2016-07-07 08:14:50',NULL,NULL,NULL,NULL,NULL,NULL,'9e43bcca-66e7-4ecb-b1b6-75d2d5cc271c'),(3,0,NULL,NULL,NULL,13,7,0,2,'2023-10-25 10:23:28',NULL,2,'2023-10-25 10:23:28',NULL,NULL,NULL,'42ed45fd-f3f6-44b6-bfc2-8bde1bb41e00'),(4,0,NULL,NULL,NULL,13,7,0,2,'2023-10-25 10:23:28',NULL,2,'2023-10-25 10:23:28',NULL,NULL,NULL,'7cac8397-53cd-4f00-a6fe-028e8d743f8e');
/*!40000 ALTER TABLE `concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_answer`
--

DROP TABLE IF EXISTS `concept_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_answer` (
  `concept_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `answer_concept` int(11) DEFAULT NULL,
  `answer_drug` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE KEY `concept_answer_uuid_index` (`uuid`),
  KEY `answer` (`answer_concept`),
  KEY `answers_for_concept` (`concept_id`),
  KEY `answer_creator` (`creator`),
  KEY `answer_answer_drug_fk` (`answer_drug`),
  CONSTRAINT `answer` FOREIGN KEY (`answer_concept`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answers_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk` FOREIGN KEY (`answer_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `answer_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_answer`
--

LOCK TABLES `concept_answer` WRITE;
/*!40000 ALTER TABLE `concept_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_attribute`
--

DROP TABLE IF EXISTS `concept_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_attribute` (
  `concept_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `concept_attribute_concept_fk` (`concept_id`),
  KEY `concept_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `concept_attribute_creator_fk` (`creator`),
  KEY `concept_attribute_changed_by_fk` (`changed_by`),
  KEY `concept_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `concept_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `concept_attribute_type` (`concept_attribute_type_id`),
  CONSTRAINT `concept_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_concept_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `concept_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_attribute`
--

LOCK TABLES `concept_attribute` WRITE;
/*!40000 ALTER TABLE `concept_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_attribute_type`
--

DROP TABLE IF EXISTS `concept_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_attribute_type` (
  `concept_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `concept_attribute_type_creator_fk` (`creator`),
  KEY `concept_attribute_type_changed_by_fk` (`changed_by`),
  KEY `concept_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `concept_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_attribute_type`
--

LOCK TABLES `concept_attribute_type` WRITE;
/*!40000 ALTER TABLE `concept_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_class`
--

DROP TABLE IF EXISTS `concept_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_class` (
  `concept_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE KEY `concept_class_uuid_index` (`uuid`),
  KEY `concept_class_retired_status` (`retired`),
  KEY `concept_class_creator` (`creator`),
  KEY `user_who_retired_concept_class` (`retired_by`),
  KEY `concept_class_name_index` (`name`),
  KEY `concept_class_changed_by` (`changed_by`),
  CONSTRAINT `concept_class_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_class_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_class` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_class`
--

LOCK TABLES `concept_class` WRITE;
/*!40000 ALTER TABLE `concept_class` DISABLE KEYS */;
INSERT INTO `concept_class` VALUES (1,'Test','Acq. during patient encounter (vitals, labs, etc.)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4907b2-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(2,'Procedure','Describes a clinical procedure',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d490bf4-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(3,'Drug','Drug',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d490dfc-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(4,'Diagnosis','Conclusion drawn through findings',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4918b0-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(5,'Finding','Practitioner observation/finding',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491a9a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(6,'Anatomy','Anatomic sites / descriptors',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491c7a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(7,'Question','Question (eg, patient history, SF36 items)',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491e50-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(8,'LabSet','Term to describe laboratory sets',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492026-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(9,'MedSet','Term to describe medication sets',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4923b4-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(10,'ConvSet','Term to describe convenience sets',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492594-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(11,'Misc','Terms which don\'t fit other categories',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492774-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(12,'Symptom','Patient-reported observation',1,'2004-10-04 00:00:00',0,NULL,NULL,NULL,'8d492954-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(13,'Symptom/Finding','Observation that can be reported from patient or found on exam',1,'2004-10-04 00:00:00',0,NULL,NULL,NULL,'8d492b2a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(14,'Specimen','Body or fluid specimen',1,'2004-12-02 00:00:00',0,NULL,NULL,NULL,'8d492d0a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(15,'Misc Order','Orderable items which aren\'t tests or drugs',1,'2005-02-17 00:00:00',0,NULL,NULL,NULL,'8d492ee0-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL);
/*!40000 ALTER TABLE `concept_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_complex`
--

DROP TABLE IF EXISTS `concept_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_complex` (
  `concept_id` int(11) NOT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_complex`
--

LOCK TABLES `concept_complex` WRITE;
/*!40000 ALTER TABLE `concept_complex` DISABLE KEYS */;
INSERT INTO `concept_complex` VALUES (3,'DefaultAttachmentHandler'),(4,'ImageAttachmentHandler');
/*!40000 ALTER TABLE `concept_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_datatype`
--

DROP TABLE IF EXISTS `concept_datatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_datatype` (
  `concept_datatype_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE KEY `concept_datatype_uuid_index` (`uuid`),
  KEY `concept_datatype_retired_status` (`retired`),
  KEY `concept_datatype_creator` (`creator`),
  KEY `user_who_retired_concept_datatype` (`retired_by`),
  KEY `concept_datatype_name_index` (`name`),
  CONSTRAINT `concept_datatype_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_datatype` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_datatype`
--

LOCK TABLES `concept_datatype` WRITE;
/*!40000 ALTER TABLE `concept_datatype` DISABLE KEYS */;
INSERT INTO `concept_datatype` VALUES (1,'Numeric','NM','Numeric value, including integer or float (e.g., creatinine, weight)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4488-c2cc-11de-8d13-0010c6dffd0f'),(2,'Coded','CWE','Value determined by term dictionary lookup (i.e., term identifier)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a48b6-c2cc-11de-8d13-0010c6dffd0f'),(3,'Text','ST','Free text',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4ab4-c2cc-11de-8d13-0010c6dffd0f'),(4,'N/A','ZZ','Not associated with a datatype (e.g., term answers, sets)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4c94-c2cc-11de-8d13-0010c6dffd0f'),(5,'Document','RP','Pointer to a binary or text-based document (e.g., clinical document, RTF, XML, EKG, image, etc.) stored in complex_obs table',1,'2004-04-15 00:00:00',0,NULL,NULL,NULL,'8d4a4e74-c2cc-11de-8d13-0010c6dffd0f'),(6,'Date','DT','Absolute date',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a505e-c2cc-11de-8d13-0010c6dffd0f'),(7,'Time','TM','Absolute time of day',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a591e-c2cc-11de-8d13-0010c6dffd0f'),(8,'Datetime','TS','Absolute date and time',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a5af4-c2cc-11de-8d13-0010c6dffd0f'),(10,'Boolean','BIT','Boolean value (yes/no, true/false)',1,'2004-08-26 00:00:00',0,NULL,NULL,NULL,'8d4a5cca-c2cc-11de-8d13-0010c6dffd0f'),(11,'Rule','ZZ','Value derived from other data',1,'2006-09-11 00:00:00',0,NULL,NULL,NULL,'8d4a5e96-c2cc-11de-8d13-0010c6dffd0f'),(12,'Structured Numeric','SN','Complex numeric values possible (ie, <5, 1-10, etc.)',1,'2005-08-06 00:00:00',0,NULL,NULL,NULL,'8d4a606c-c2cc-11de-8d13-0010c6dffd0f'),(13,'Complex','ED','Complex value.  Analogous to HL7 Embedded Datatype',1,'2008-05-28 12:25:34',0,NULL,NULL,NULL,'8d4a6242-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `concept_datatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_description`
--

DROP TABLE IF EXISTS `concept_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_description` (
  `concept_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE KEY `concept_description_uuid_index` (`uuid`),
  KEY `user_who_changed_description` (`changed_by`),
  KEY `description_for_concept` (`concept_id`),
  KEY `user_who_created_description` (`creator`),
  CONSTRAINT `description_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_description` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_description` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_description`
--

LOCK TABLES `concept_description` WRITE;
/*!40000 ALTER TABLE `concept_description` DISABLE KEYS */;
INSERT INTO `concept_description` VALUES (1,3,'Concept complex for \'default attachment\' complex obs.','en',2,'2023-10-25 10:23:28',NULL,NULL,'9ce35a1f-9ee9-4933-9304-db84bd260e91'),(2,4,'Concept complex for \'image attachments with thumbnails\' complex obs.','en',2,'2023-10-25 10:23:28',NULL,NULL,'d7714667-ca51-4166-b0ce-aaa37c089185');
/*!40000 ALTER TABLE `concept_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_map_type`
--

DROP TABLE IF EXISTS `concept_map_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_map_type` (
  `concept_map_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator_concept_map_type` (`creator`),
  KEY `mapped_user_changed_concept_map_type` (`changed_by`),
  KEY `mapped_user_retired_concept_map_type` (`retired_by`),
  CONSTRAINT `mapped_user_changed_concept_map_type` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_concept_map_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired_concept_map_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_map_type`
--

LOCK TABLES `concept_map_type` WRITE;
/*!40000 ALTER TABLE `concept_map_type` DISABLE KEYS */;
INSERT INTO `concept_map_type` VALUES (1,'SAME-AS',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'35543629-7d8c-11e1-909d-c80aa9edcf4e'),(2,'NARROWER-THAN',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'43ac5109-7d8c-11e1-909d-c80aa9edcf4e'),(3,'BROADER-THAN',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'4b9d9421-7d8c-11e1-909d-c80aa9edcf4e'),(4,'Associated finding',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'55e02065-7d8c-11e1-909d-c80aa9edcf4e'),(5,'Associated morphology',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'605f4a61-7d8c-11e1-909d-c80aa9edcf4e'),(6,'Associated procedure',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'6eb1bfce-7d8c-11e1-909d-c80aa9edcf4e'),(7,'Associated with',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'781bdc8f-7d8c-11e1-909d-c80aa9edcf4e'),(8,'Causative agent',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'808f9e19-7d8c-11e1-909d-c80aa9edcf4e'),(9,'Finding site',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'889c3013-7d8c-11e1-909d-c80aa9edcf4e'),(10,'Has specimen',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'929600b9-7d8c-11e1-909d-c80aa9edcf4e'),(11,'Laterality',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'999c6fc0-7d8c-11e1-909d-c80aa9edcf4e'),(12,'Severity',NULL,1,'2016-07-07 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'a0e52281-7d8c-11e1-909d-c80aa9edcf4e'),(13,'Access',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f9e90b29-7d8c-11e1-909d-c80aa9edcf4e'),(14,'After',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'01b60e29-7d8d-11e1-909d-c80aa9edcf4e'),(15,'Clinical course',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5f7c3702-7d8d-11e1-909d-c80aa9edcf4e'),(16,'Component',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'67debecc-7d8d-11e1-909d-c80aa9edcf4e'),(17,'Direct device',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'718c00da-7d8d-11e1-909d-c80aa9edcf4e'),(18,'Direct morphology',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7b9509cb-7d8d-11e1-909d-c80aa9edcf4e'),(19,'Direct substance',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'82bb495d-7d8d-11e1-909d-c80aa9edcf4e'),(20,'Due to',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'8b77f7d3-7d8d-11e1-909d-c80aa9edcf4e'),(21,'Episodicity',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'94a81179-7d8d-11e1-909d-c80aa9edcf4e'),(22,'Finding context',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'9d23c22e-7d8d-11e1-909d-c80aa9edcf4e'),(23,'Finding informer',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'a4524368-7d8d-11e1-909d-c80aa9edcf4e'),(24,'Finding method',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'af089254-7d8d-11e1-909d-c80aa9edcf4e'),(25,'Has active ingredient',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b65aa605-7d8d-11e1-909d-c80aa9edcf4e'),(26,'Has definitional manifestation',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'c2b7b2fa-7d8d-11e1-909d-c80aa9edcf4'),(27,'Has dose form',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'cc3878e6-7d8d-11e1-909d-c80aa9edcf4e'),(28,'Has focus',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'d67c5840-7d8d-11e1-909d-c80aa9edcf4e'),(29,'Has intent',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'de2fb2c5-7d8d-11e1-909d-c80aa9edcf4e'),(30,'Has interpretation',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'e758838b-7d8d-11e1-909d-c80aa9edcf4e'),(31,'Indirect device',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'ee63c142-7d8d-11e1-909d-c80aa9edcf4e'),(32,'Indirect morphology',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f4f36681-7d8d-11e1-909d-c80aa9edcf4e'),(33,'Interprets',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'fc7f5fed-7d8d-11e1-909d-c80aa9edcf4e'),(34,'Measurement method',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'06b11d79-7d8e-11e1-909d-c80aa9edcf4e'),(35,'Method',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'0efb4753-7d8e-11e1-909d-c80aa9edcf4e'),(36,'Occurrence',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'16e7b617-7d8e-11e1-909d-c80aa9edcf4e'),(37,'Part of',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'1e82007b-7d8e-11e1-909d-c80aa9edcf4e'),(38,'Pathological process',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'2969915e-7d8e-11e1-909d-c80aa9edcf4e'),(39,'Priority',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'32d57796-7d8e-11e1-909d-c80aa9edcf4e'),(40,'Procedure context',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'3f11904c-7d8e-11e1-909d-c80aa9edcf4e'),(41,'Procedure device',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'468c4aa3-7d8e-11e1-909d-c80aa9edcf4e'),(42,'Procedure morphology',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5383e889-7d8e-11e1-909d-c80aa9edcf4e'),(43,'Procedure site',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5ad2655d-7d8e-11e1-909d-c80aa9edcf4e'),(44,'Procedure site - Direct',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'66085196-7d8e-11e1-909d-c80aa9edcf4e'),(45,'Procedure site - Indirect',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7080e843-7d8e-11e1-909d-c80aa9edcf4e'),(46,'Property',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'76bfb796-7d8e-11e1-909d-c80aa9edcf4e'),(47,'Recipient category',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7e7d00e4-7d8e-11e1-909d-c80aa9edcf4e'),(48,'Revision status',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'851e14c1-7d8e-11e1-909d-c80aa9edcf4e'),(49,'Route of administration',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'8ee5b13d-7d8e-11e1-909d-c80aa9edcf4e'),(50,'Scale type',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'986acf48-7d8e-11e1-909d-c80aa9edcf4e'),(51,'Specimen procedure',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'a6937642-7d8e-11e1-909d-c80aa9edcf4e'),(52,'Specimen source identity',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b1d6941e-7d8e-11e1-909d-c80aa9edcf4e'),(53,'Specimen source morphology',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b7c793c1-7d8e-11e1-909d-c80aa9edcf4e'),(54,'Specimen source topography',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'be9f9eb8-7d8e-11e1-909d-c80aa9edcf4e'),(55,'Specimen substance',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'c8f2bacb-7d8e-11e1-909d-c80aa9edcf4e'),(56,'Subject of information',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'d0664c4f-7d8e-11e1-909d-c80aa9edcf4e'),(57,'Subject relationship context',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'dace9d13-7d8e-11e1-909d-c80aa9edcf4e'),(58,'Surgical approach',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'e3cd666d-7d8e-11e1-909d-c80aa9edcf4e'),(59,'Temporal context',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'ed96447d-7d8e-11e1-909d-c80aa9edcf4e'),(60,'Time aspect',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f415bcce-7d8e-11e1-909d-c80aa9edcf4e'),(61,'Using access device',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'fa9538a9-7d8e-11e1-909d-c80aa9edcf4e'),(62,'Using device',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'06588655-7d8f-11e1-909d-c80aa9edcf4e'),(63,'Using energy',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'0c2ae0bc-7d8f-11e1-909d-c80aa9edcf4e'),(64,'Using substance',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'13d2c607-7d8f-11e1-909d-c80aa9edcf4e'),(65,'IS A',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'1ce7a784-7d8f-11e1-909d-c80aa9edcf4e'),(66,'MAY BE A',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'267812a3-7d8f-11e1-909d-c80aa9edcf4e'),(67,'MOVED FROM',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'2de3168e-7d8f-11e1-909d-c80aa9edcf4e'),(68,'MOVED TO',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'32f0fd99-7d8f-11e1-909d-c80aa9edcf4e'),(69,'REPLACED BY',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'3b3b9a7d-7d8f-11e1-909d-c80aa9edcf4e'),(70,'WAS A',NULL,1,'2016-07-07 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'41a034da-7d8f-11e1-909d-c80aa9edcf4e');
/*!40000 ALTER TABLE `concept_map_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name`
--

DROP TABLE IF EXISTS `concept_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name` (
  `concept_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(50) NOT NULL DEFAULT '',
  `locale_preferred` tinyint(1) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_name_type` varchar(50) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_name_id`),
  UNIQUE KEY `concept_name_uuid_index` (`uuid`),
  KEY `name_of_concept` (`name`),
  KEY `name_for_concept` (`concept_id`),
  KEY `user_who_created_name` (`creator`),
  KEY `user_who_voided_this_name` (`voided_by`),
  KEY `concept_name_changed_by` (`changed_by`),
  KEY `concept_name_duplicate` (`name`,`locale`,`voided`),
  CONSTRAINT `concept_name_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `name_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_this_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name`
--

LOCK TABLES `concept_name` WRITE;
/*!40000 ALTER TABLE `concept_name` DISABLE KEYS */;
INSERT INTO `concept_name` VALUES (1,1,'Vero','it',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'e0ff857f-0813-4352-b87d-5399ed62642a',NULL,NULL),(2,1,'Sì','it',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'0cb29656-4572-4d7f-98b3-7aa095944a17',NULL,NULL),(3,1,'Verdadeiro','pt',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'5c623ecc-c63c-4753-8e5e-178933b79351',NULL,NULL),(4,1,'Sim','pt',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'998a49c7-e74f-43b5-9cdb-f8ba84705cf7',NULL,NULL),(5,1,'Vrai','fr',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'52b6f620-d68c-4fdd-bb5f-e6d1af800d35',NULL,NULL),(6,1,'Oui','fr',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'87d9f2a5-8393-4a2d-a8a7-eb9409e151fa',NULL,NULL),(7,1,'True','en',1,1,'2016-07-07 08:14:50','FULLY_SPECIFIED',0,NULL,NULL,NULL,'b52447e4-5980-46f6-bc1a-3862fe6e3840',NULL,NULL),(8,1,'Yes','en',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'e7973d60-7698-49c2-a8d7-cda2a9621926',NULL,NULL),(9,1,'Verdadero','es',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'2c39345f-a099-4816-8ac2-7ad1424898c3',NULL,NULL),(10,1,'Sí','es',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'f3d6b4b1-b5be-4c98-8e5a-1bc15585ed7c',NULL,NULL),(11,2,'Falso','it',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'9aacada7-48db-4938-baef-b282fb162f76',NULL,NULL),(12,2,'No','it',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'331de197-4b1f-4a07-af88-90b00b54da14',NULL,NULL),(13,2,'Falso','pt',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'7937a109-24b5-4908-b78b-e6f39d490194',NULL,NULL),(14,2,'Não','pt',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'69f96b20-ad2b-4ec1-abfd-1c911dd57478',NULL,NULL),(15,2,'Faux','fr',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'6367664c-9307-468d-a1a3-31fd1e14c2e4',NULL,NULL),(16,2,'Non','fr',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'c59177e6-3ba2-4888-a277-db3bd01d3bcd',NULL,NULL),(17,2,'False','en',1,1,'2016-07-07 08:14:50','FULLY_SPECIFIED',0,NULL,NULL,NULL,'b53bb5a7-6b36-43bf-bc75-21d72c8c73d2',NULL,NULL),(18,2,'No','en',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'81528cfc-cbae-4216-a977-4d28415a86b2',NULL,NULL),(19,2,'Falso','es',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'dcb944aa-7eb4-498c-a770-42417a533a6a',NULL,NULL),(20,2,'No','es',0,1,'2016-07-07 08:14:50',NULL,0,NULL,NULL,NULL,'bad743b8-2573-4100-bd27-18cbc28aac1e',NULL,NULL),(21,3,'ATT DEFAULT ATTACHMENT','en',1,2,'2023-10-25 10:23:28','FULLY_SPECIFIED',0,NULL,NULL,NULL,'36795a2a-8892-4eed-8a29-d3e8517e0f10',NULL,NULL),(22,4,'ATT IMAGE ATTACHMENT','en',1,2,'2023-10-25 10:23:28','FULLY_SPECIFIED',0,NULL,NULL,NULL,'e2c1017f-ff59-4f5b-bbfa-b4a5fedbc970',NULL,NULL);
/*!40000 ALTER TABLE `concept_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag`
--

DROP TABLE IF EXISTS `concept_name_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag` (
  `concept_name_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_unique_tags` (`tag`),
  UNIQUE KEY `concept_name_tag_uuid_index` (`uuid`),
  KEY `user_who_created_name_tag` (`creator`),
  KEY `user_who_voided_name_tag` (`voided_by`),
  KEY `concept_name_tag_changed_by` (`changed_by`),
  CONSTRAINT `concept_name_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag`
--

LOCK TABLES `concept_name_tag` WRITE;
/*!40000 ALTER TABLE `concept_name_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag_map`
--

DROP TABLE IF EXISTS `concept_name_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag_map` (
  `concept_name_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_name` (`concept_name_id`),
  KEY `mapped_concept_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `mapped_concept_name_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag_map`
--

LOCK TABLES `concept_name_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_name_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_numeric`
--

DROP TABLE IF EXISTS `concept_numeric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_numeric` (
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `hi_absolute` double DEFAULT NULL,
  `hi_critical` double DEFAULT NULL,
  `hi_normal` double DEFAULT NULL,
  `low_absolute` double DEFAULT NULL,
  `low_critical` double DEFAULT NULL,
  `low_normal` double DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `allow_decimal` tinyint(1) DEFAULT NULL,
  `display_precision` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_numeric`
--

LOCK TABLES `concept_numeric` WRITE;
/*!40000 ALTER TABLE `concept_numeric` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_numeric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal`
--

DROP TABLE IF EXISTS `concept_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal` (
  `concept_proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `original_text` varchar(255) NOT NULL DEFAULT '',
  `final_text` varchar(255) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `obs_concept_id` int(11) DEFAULT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'UNMAPPED',
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE KEY `concept_proposal_uuid_index` (`uuid`),
  KEY `user_who_changed_proposal` (`changed_by`),
  KEY `concept_for_proposal` (`concept_id`),
  KEY `user_who_created_proposal` (`creator`),
  KEY `encounter_for_proposal` (`encounter_id`),
  KEY `proposal_obs_concept_id` (`obs_concept_id`),
  KEY `proposal_obs_id` (`obs_id`),
  CONSTRAINT `concept_for_proposal` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id` FOREIGN KEY (`obs_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_changed_proposal` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_proposal` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal`
--

LOCK TABLES `concept_proposal` WRITE;
/*!40000 ALTER TABLE `concept_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal_tag_map`
--

DROP TABLE IF EXISTS `concept_proposal_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal_tag_map` (
  `concept_proposal_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_proposal_tag` (`concept_name_tag_id`),
  KEY `mapped_concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal` FOREIGN KEY (`concept_proposal_id`) REFERENCES `concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal_tag_map`
--

LOCK TABLES `concept_proposal_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_proposal_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_map`
--

DROP TABLE IF EXISTS `concept_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_map` (
  `concept_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_reference_term_id` int(11) NOT NULL,
  `concept_map_type_id` int(11) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_map_id`),
  UNIQUE KEY `concept_reference_map_uuid_id` (`uuid`),
  KEY `map_for_concept` (`concept_id`),
  KEY `map_creator` (`creator`),
  KEY `mapped_concept_map_type` (`concept_map_type_id`),
  KEY `mapped_user_changed_ref_term` (`changed_by`),
  KEY `mapped_concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_concept_map_type` FOREIGN KEY (`concept_map_type_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_concept_reference_term` FOREIGN KEY (`concept_reference_term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_map`
--

LOCK TABLES `concept_reference_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_source`
--

DROP TABLE IF EXISTS `concept_reference_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_source` (
  `concept_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hl7_code` varchar(50) DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `unique_id` varchar(250) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE KEY `concept_reference_source_uuid_id` (`uuid`),
  UNIQUE KEY `concept_source_unique_hl7_codes` (`hl7_code`),
  UNIQUE KEY `concept_reference_source_unique_id_unique` (`unique_id`),
  KEY `unique_hl7_code` (`hl7_code`),
  KEY `concept_source_creator` (`creator`),
  KEY `user_who_retired_concept_source` (`retired_by`),
  KEY `concept_reference_source_changed_by` (`changed_by`),
  KEY `concept_reference_source_name` (`name`),
  CONSTRAINT `concept_reference_source_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_source`
--

LOCK TABLES `concept_reference_source` WRITE;
/*!40000 ALTER TABLE `concept_reference_source` DISABLE KEYS */;
INSERT INTO `concept_reference_source` VALUES (1,'org.openmrs.module.emrapi','Source used to tag concepts used in the EMR API module',NULL,2,'2023-10-25 10:23:28',0,NULL,NULL,NULL,'edd52713-8887-47b7-ba9e-6e1148824ca4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `concept_reference_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term`
--

DROP TABLE IF EXISTS `concept_reference_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term` (
  `concept_reference_term_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_source_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator` (`creator`),
  KEY `mapped_user_changed` (`changed_by`),
  KEY `mapped_user_retired` (`retired_by`),
  KEY `mapped_concept_source` (`concept_source_id`),
  KEY `idx_code_concept_reference_term` (`code`),
  KEY `concept_reference_term_code` (`concept_source_id`,`code`),
  CONSTRAINT `mapped_concept_source` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `mapped_user_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term`
--

LOCK TABLES `concept_reference_term` WRITE;
/*!40000 ALTER TABLE `concept_reference_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term_map`
--

DROP TABLE IF EXISTS `concept_reference_term_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term_map` (
  `concept_reference_term_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_a_id` int(11) NOT NULL,
  `term_b_id` int(11) NOT NULL,
  `a_is_to_b_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_term_a` (`term_a_id`),
  KEY `mapped_term_b` (`term_b_id`),
  KEY `mapped_concept_map_type_ref_term_map` (`a_is_to_b_id`),
  KEY `mapped_user_creator_ref_term_map` (`creator`),
  KEY `mapped_user_changed_ref_term_map` (`changed_by`),
  CONSTRAINT `mapped_concept_map_type_ref_term_map` FOREIGN KEY (`a_is_to_b_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_term_a` FOREIGN KEY (`term_a_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_term_b` FOREIGN KEY (`term_b_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_ref_term_map` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term_map`
--

LOCK TABLES `concept_reference_term_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_term_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_term_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_set`
--

DROP TABLE IF EXISTS `concept_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_set` (
  `concept_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `concept_set` int(11) NOT NULL DEFAULT '0',
  `sort_weight` double DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE KEY `concept_set_uuid_index` (`uuid`),
  KEY `idx_concept_set_concept` (`concept_id`),
  KEY `has_a` (`concept_set`),
  KEY `user_who_created` (`creator`),
  CONSTRAINT `has_a` FOREIGN KEY (`concept_set`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_set`
--

LOCK TABLES `concept_set` WRITE;
/*!40000 ALTER TABLE `concept_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_state_conversion`
--

DROP TABLE IF EXISTS `concept_state_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_state_conversion` (
  `concept_state_conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT '0',
  `program_workflow_id` int(11) DEFAULT '0',
  `program_workflow_state_id` int(11) DEFAULT '0',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE KEY `concept_state_conversion_uuid_index` (`uuid`),
  UNIQUE KEY `unique_workflow_concept_in_conversion` (`program_workflow_id`,`concept_id`),
  KEY `concept_triggers_conversion` (`concept_id`),
  KEY `conversion_to_state` (`program_workflow_state_id`),
  CONSTRAINT `concept_triggers_conversion` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state` FOREIGN KEY (`program_workflow_state_id`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_state_conversion`
--

LOCK TABLES `concept_state_conversion` WRITE;
/*!40000 ALTER TABLE `concept_state_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_state_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_stop_word`
--

DROP TABLE IF EXISTS `concept_stop_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_stop_word` (
  `concept_stop_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE KEY `Unique_StopWord_Key` (`word`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_stop_word`
--

LOCK TABLES `concept_stop_word` WRITE;
/*!40000 ALTER TABLE `concept_stop_word` DISABLE KEYS */;
INSERT INTO `concept_stop_word` VALUES (1,'A','en','f5f45540-e2a7-11df-87ae-18a905e044dc'),(2,'AND','en','f5f469ae-e2a7-11df-87ae-18a905e044dc'),(3,'AT','en','f5f47070-e2a7-11df-87ae-18a905e044dc'),(4,'BUT','en','f5f476c4-e2a7-11df-87ae-18a905e044dc'),(5,'BY','en','f5f47d04-e2a7-11df-87ae-18a905e044dc'),(6,'FOR','en','f5f4834e-e2a7-11df-87ae-18a905e044dc'),(7,'HAS','en','f5f48a24-e2a7-11df-87ae-18a905e044dc'),(8,'OF','en','f5f49064-e2a7-11df-87ae-18a905e044dc'),(9,'THE','en','f5f496ae-e2a7-11df-87ae-18a905e044dc'),(10,'TO','en','f5f49cda-e2a7-11df-87ae-18a905e044dc');
/*!40000 ALTER TABLE `concept_stop_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `additional_detail` varchar(255) DEFAULT NULL,
  `previous_version` int(11) DEFAULT NULL,
  `condition_coded` int(11) DEFAULT NULL,
  `condition_non_coded` varchar(255) DEFAULT NULL,
  `condition_coded_name` int(11) DEFAULT NULL,
  `clinical_status` varchar(50) NOT NULL,
  `verification_status` varchar(50) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`condition_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `condition_previous_version_fk` (`previous_version`),
  KEY `condition_condition_coded_fk` (`condition_coded`),
  KEY `condition_condition_coded_name_fk` (`condition_coded_name`),
  KEY `condition_creator_fk` (`creator`),
  KEY `condition_changed_by_fk` (`changed_by`),
  KEY `condition_voided_by_fk` (`voided_by`),
  KEY `condition_patient_fk` (`patient_id`),
  KEY `conditions_encounter_id_fk` (`encounter_id`),
  CONSTRAINT `conditions_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `condition_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `condition_condition_coded_fk` FOREIGN KEY (`condition_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `condition_condition_coded_name_fk` FOREIGN KEY (`condition_coded_name`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `condition_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `condition_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `condition_previous_version_fk` FOREIGN KEY (`previous_version`) REFERENCES `conditions` (`condition_id`),
  CONSTRAINT `condition_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_attribute`
--

DROP TABLE IF EXISTS `diagnosis_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis_attribute` (
  `diagnosis_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `diagnosis_attribute_diagnosis_fk` (`diagnosis_id`),
  KEY `diagnosis_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `diagnosis_attribute_creator_fk` (`creator`),
  KEY `diagnosis_attribute_changed_by_fk` (`changed_by`),
  KEY `diagnosis_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `diagnosis_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `diagnosis_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `diagnosis_attribute_type` (`diagnosis_attribute_type_id`),
  CONSTRAINT `diagnosis_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `diagnosis_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `diagnosis_attribute_diagnosis_fk` FOREIGN KEY (`diagnosis_id`) REFERENCES `encounter_diagnosis` (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_attribute`
--

LOCK TABLES `diagnosis_attribute` WRITE;
/*!40000 ALTER TABLE `diagnosis_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_attribute_type`
--

DROP TABLE IF EXISTS `diagnosis_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis_attribute_type` (
  `diagnosis_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`diagnosis_attribute_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `diagnosis_attribute_type_creator_fk` (`creator`),
  KEY `diagnosis_attribute_type_changed_by_fk` (`changed_by`),
  KEY `diagnosis_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `diagnosis_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `diagnosis_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `diagnosis_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_attribute_type`
--

LOCK TABLES `diagnosis_attribute_type` WRITE;
/*!40000 ALTER TABLE `diagnosis_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `combination` tinyint(1) NOT NULL DEFAULT '0',
  `dosage_form` int(11) DEFAULT NULL,
  `maximum_daily_dose` double DEFAULT NULL,
  `minimum_daily_dose` double DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `strength` varchar(255) DEFAULT NULL,
  `dose_limit_units` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `drug_uuid_index` (`uuid`),
  KEY `primary_drug_concept` (`concept_id`),
  KEY `drug_creator` (`creator`),
  KEY `drug_changed_by` (`changed_by`),
  KEY `dosage_form_concept` (`dosage_form`),
  KEY `drug_retired_by` (`retired_by`),
  KEY `route_concept` (`route`),
  KEY `drug_dose_limit_units_fk` (`dose_limit_units`),
  CONSTRAINT `drug_dose_limit_units_fk` FOREIGN KEY (`dose_limit_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `dosage_form_concept` FOREIGN KEY (`dosage_form`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `primary_drug_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `route_concept` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_ingredient`
--

DROP TABLE IF EXISTS `drug_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_ingredient` (
  `drug_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `strength` double DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`,`ingredient_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_ingredient_units_fk` (`units`),
  KEY `drug_ingredient_ingredient_id_fk` (`ingredient_id`),
  CONSTRAINT `drug_ingredient_ingredient_id_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_ingredient_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_ingredient_units_fk` FOREIGN KEY (`units`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_ingredient`
--

LOCK TABLES `drug_ingredient` WRITE;
/*!40000 ALTER TABLE `drug_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_order`
--

DROP TABLE IF EXISTS `drug_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `drug_inventory_id` int(11),
  `dose` double DEFAULT NULL,
  `as_needed` tinyint(1) DEFAULT NULL,
  `dosing_type` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `as_needed_condition` varchar(255) DEFAULT NULL,
  `num_refills` int(11) DEFAULT NULL,
  `dosing_instructions` text,
  `duration` int(11) DEFAULT NULL,
  `duration_units` int(11) DEFAULT NULL,
  `quantity_units` int(11) DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `dose_units` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `dispense_as_written` tinyint(1) NOT NULL DEFAULT '0',
  `drug_non_coded` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `inventory_item` (`drug_inventory_id`),
  KEY `drug_order_duration_units_fk` (`duration_units`),
  KEY `drug_order_quantity_units` (`quantity_units`),
  KEY `drug_order_route_fk` (`route`),
  KEY `drug_order_dose_units` (`dose_units`),
  KEY `drug_order_frequency_fk` (`frequency`),
  CONSTRAINT `drug_order_dose_units` FOREIGN KEY (`dose_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_duration_units_fk` FOREIGN KEY (`duration_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `drug_order_quantity_units` FOREIGN KEY (`quantity_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_route_fk` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `extends_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `inventory_item` FOREIGN KEY (`drug_inventory_id`) REFERENCES `drug` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_order`
--

LOCK TABLES `drug_order` WRITE;
/*!40000 ALTER TABLE `drug_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_reference_map`
--

DROP TABLE IF EXISTS `drug_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_reference_map` (
  `drug_reference_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `concept_map_type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`drug_reference_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_for_drug_reference_map` (`drug_id`),
  KEY `concept_reference_term_for_drug_reference_map` (`term_id`),
  KEY `concept_map_type_for_drug_reference_map` (`concept_map_type`),
  KEY `user_who_changed_drug_reference_map` (`changed_by`),
  KEY `drug_reference_map_creator` (`creator`),
  KEY `user_who_retired_drug_reference_map` (`retired_by`),
  CONSTRAINT `user_who_retired_drug_reference_map` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_map_type_for_drug_reference_map` FOREIGN KEY (`concept_map_type`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `concept_reference_term_for_drug_reference_map` FOREIGN KEY (`term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `drug_for_drug_reference_map` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_reference_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_drug_reference_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_reference_map`
--

LOCK TABLES `drug_reference_map` WRITE;
/*!40000 ALTER TABLE `drug_reference_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `encounter_datetime` datetime NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE KEY `encounter_uuid_index` (`uuid`),
  KEY `encounter_datetime_idx` (`encounter_datetime`),
  KEY `encounter_ibfk_1` (`creator`),
  KEY `encounter_type_id` (`encounter_type`),
  KEY `encounter_form` (`form_id`),
  KEY `encounter_location` (`location_id`),
  KEY `encounter_patient` (`patient_id`),
  KEY `user_who_voided_encounter` (`voided_by`),
  KEY `encounter_changed_by` (`changed_by`),
  KEY `encounter_visit_id_fk` (`visit_id`),
  CONSTRAINT `encounter_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `encounter_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `user_who_voided_encounter` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_diagnosis`
--

DROP TABLE IF EXISTS `encounter_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_diagnosis` (
  `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_coded` int(11) DEFAULT NULL,
  `diagnosis_non_coded` varchar(255) DEFAULT NULL,
  `diagnosis_coded_name` int(11) DEFAULT NULL,
  `encounter_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `condition_id` int(11) DEFAULT NULL,
  `certainty` varchar(255) NOT NULL,
  `dx_rank` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_diagnosis_encounter_id_fk` (`encounter_id`),
  KEY `encounter_diagnosis_condition_id_fk` (`condition_id`),
  KEY `encounter_diagnosis_creator_fk` (`creator`),
  KEY `encounter_diagnosis_voided_by_fk` (`voided_by`),
  KEY `encounter_diagnosis_changed_by_fk` (`changed_by`),
  KEY `encounter_diagnosis_coded_fk` (`diagnosis_coded`),
  KEY `encounter_diagnosis_coded_name_fk` (`diagnosis_coded_name`),
  KEY `encounter_diagnosis_patient_fk` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_diagnosis_coded_fk` FOREIGN KEY (`diagnosis_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_diagnosis_coded_name_fk` FOREIGN KEY (`diagnosis_coded_name`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `encounter_diagnosis_condition_id_fk` FOREIGN KEY (`condition_id`) REFERENCES `conditions` (`condition_id`),
  CONSTRAINT `encounter_diagnosis_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_diagnosis_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_diagnosis_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_diagnosis`
--

LOCK TABLES `encounter_diagnosis` WRITE;
/*!40000 ALTER TABLE `encounter_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_provider`
--

DROP TABLE IF EXISTS `encounter_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_provider` (
  `encounter_provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `encounter_role_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_id_fk` (`encounter_id`),
  KEY `provider_id_fk` (`provider_id`),
  KEY `encounter_role_id_fk` (`encounter_role_id`),
  KEY `encounter_provider_creator` (`creator`),
  KEY `encounter_provider_changed_by` (`changed_by`),
  KEY `encounter_provider_voided_by` (`voided_by`),
  CONSTRAINT `encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_provider_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_id_fk` FOREIGN KEY (`encounter_role_id`) REFERENCES `encounter_role` (`encounter_role_id`),
  CONSTRAINT `provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_provider`
--

LOCK TABLES `encounter_provider` WRITE;
/*!40000 ALTER TABLE `encounter_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_role`
--

DROP TABLE IF EXISTS `encounter_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_role` (
  `encounter_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `encounter_role_unique_name` (`name`),
  KEY `encounter_role_creator_fk` (`creator`),
  KEY `encounter_role_changed_by_fk` (`changed_by`),
  KEY `encounter_role_retired_by_fk` (`retired_by`),
  CONSTRAINT `encounter_role_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_role`
--

LOCK TABLES `encounter_role` WRITE;
/*!40000 ALTER TABLE `encounter_role` DISABLE KEYS */;
INSERT INTO `encounter_role` VALUES (1,'Unknown','Unknown encounter role for legacy providers with no encounter role set',1,'2011-08-18 14:00:00',NULL,NULL,0,NULL,NULL,NULL,'a0b03050-c99b-11e0-9572-0800200c9a66');
/*!40000 ALTER TABLE `encounter_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `view_privilege` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_unique_name` (`name`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  KEY `encounter_type_retired_status` (`retired`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `privilege_which_can_view_encounter_type` (`view_privilege`),
  KEY `privilege_which_can_edit_encounter_type` (`edit_privilege`),
  KEY `encounter_type_changed_by` (`changed_by`),
  CONSTRAINT `encounter_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit_encounter_type` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `privilege_which_can_view_encounter_type` FOREIGN KEY (`view_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_type`
--

LOCK TABLES `encounter_type` WRITE;
/*!40000 ALTER TABLE `encounter_type` DISABLE KEYS */;
INSERT INTO `encounter_type` VALUES (1,'Attachment Upload','Encounters used to record uploads of attachments.',2,'2023-10-25 10:23:28',0,NULL,NULL,NULL,'5021b1a1-e7f6-44b4-ba02-da2f2bcf8718',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `encounter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_concept_source`
--

DROP TABLE IF EXISTS `fhir_concept_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_concept_source` (
  `fhir_concept_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_source_id` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  PRIMARY KEY (`fhir_concept_source_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_concept_source_concept_reference_source_fk` (`concept_source_id`),
  KEY `fhir_concept_source_creator_fk` (`creator`),
  KEY `fhir_concept_source_changed_by_fk` (`changed_by`),
  KEY `fhir_concept_source_retired_by_fk` (`retired_by`),
  CONSTRAINT `fhir_concept_source_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_concept_source_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_concept_source_concept_reference_source_fk` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `fhir_concept_source_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_concept_source`
--

LOCK TABLES `fhir_concept_source` WRITE;
/*!40000 ALTER TABLE `fhir_concept_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_concept_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_diagnostic_report`
--

DROP TABLE IF EXISTS `fhir_diagnostic_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_diagnostic_report` (
  `diagnostic_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `concept_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `issued` datetime DEFAULT NULL,
  PRIMARY KEY (`diagnostic_report_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_diagnostic_report_creator` (`creator`),
  KEY `fhir_diagnostic_report_changed_by` (`changed_by`),
  KEY `fhir_diagnostic_report_voided_by` (`voided_by`),
  KEY `fhir_diagnostic_report_code` (`concept_id`),
  KEY `fhir_diagnostic_report_subject` (`subject_id`),
  KEY `fhir_diagnostic_report_encounter` (`encounter_id`),
  CONSTRAINT `fhir_diagnostic_report_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_diagnostic_report_code` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `fhir_diagnostic_report_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_diagnostic_report_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `fhir_diagnostic_report_subject` FOREIGN KEY (`subject_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fhir_diagnostic_report_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_diagnostic_report`
--

LOCK TABLES `fhir_diagnostic_report` WRITE;
/*!40000 ALTER TABLE `fhir_diagnostic_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_diagnostic_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_diagnostic_report_performers`
--

DROP TABLE IF EXISTS `fhir_diagnostic_report_performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_diagnostic_report_performers` (
  `diagnostic_report_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`diagnostic_report_id`,`provider_id`),
  KEY `fhir_diagnostic_report_performers_reference` (`provider_id`),
  CONSTRAINT `fhir_diagnostic_report_performers_reference` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `fhir_diagnostic_report_performers_diagnostic_report` FOREIGN KEY (`diagnostic_report_id`) REFERENCES `fhir_diagnostic_report` (`diagnostic_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_diagnostic_report_performers`
--

LOCK TABLES `fhir_diagnostic_report_performers` WRITE;
/*!40000 ALTER TABLE `fhir_diagnostic_report_performers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_diagnostic_report_performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_diagnostic_report_results`
--

DROP TABLE IF EXISTS `fhir_diagnostic_report_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_diagnostic_report_results` (
  `diagnostic_report_id` int(11) NOT NULL,
  `obs_id` int(11) NOT NULL,
  PRIMARY KEY (`diagnostic_report_id`,`obs_id`),
  KEY `fhir_diagnostic_report_results_reference` (`obs_id`),
  CONSTRAINT `fhir_diagnostic_report_results_reference` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `fhir_diagnostic_report_results_diagnostic_report` FOREIGN KEY (`diagnostic_report_id`) REFERENCES `fhir_diagnostic_report` (`diagnostic_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_diagnostic_report_results`
--

LOCK TABLES `fhir_diagnostic_report_results` WRITE;
/*!40000 ALTER TABLE `fhir_diagnostic_report_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_diagnostic_report_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_encounter_class_map`
--

DROP TABLE IF EXISTS `fhir_encounter_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_encounter_class_map` (
  `encounter_class_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `encounter_class` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`encounter_class_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_encounter_class_map_creator` (`creator`),
  KEY `fhir_encounter_class_map_changed_by` (`changed_by`),
  KEY `fhir_encounter_class_map_retired_by` (`retired_by`),
  KEY `fhir_encounter_class_map_location` (`location_id`),
  CONSTRAINT `fhir_encounter_class_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fhir_encounter_class_map_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_encounter_class_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_encounter_class_map_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_encounter_class_map`
--

LOCK TABLES `fhir_encounter_class_map` WRITE;
/*!40000 ALTER TABLE `fhir_encounter_class_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_encounter_class_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_observation_category_map`
--

DROP TABLE IF EXISTS `fhir_observation_category_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_observation_category_map` (
  `observation_category_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_class_id` int(11) DEFAULT NULL,
  `observation_category` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`observation_category_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_observation_category_map_creator` (`creator`),
  KEY `fhir_observation_category_map_changed_by` (`changed_by`),
  KEY `fhir_observation_category_map_retired_by` (`retired_by`),
  KEY `fhir_observation_category_map_concept_class` (`concept_class_id`),
  KEY `fhir_observation_category_map_observation_category` (`observation_category`),
  CONSTRAINT `fhir_observation_category_map_concept_class` FOREIGN KEY (`concept_class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `fhir_observation_category_map_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_observation_category_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_observation_category_map_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_observation_category_map`
--

LOCK TABLES `fhir_observation_category_map` WRITE;
/*!40000 ALTER TABLE `fhir_observation_category_map` DISABLE KEYS */;
INSERT INTO `fhir_observation_category_map` VALUES (1,1,'laboratory',1,'2023-10-25 10:22:01',NULL,NULL,0,NULL,NULL,NULL,'92852420-730f-11ee-8af3-201e88d10416'),(2,2,'procedure',1,'2023-10-25 10:22:01',NULL,NULL,0,NULL,NULL,NULL,'92857950-730f-11ee-8af3-201e88d10416'),(3,5,'exam',1,'2023-10-25 10:22:01',NULL,NULL,0,NULL,NULL,NULL,'9285c468-730f-11ee-8af3-201e88d10416');
/*!40000 ALTER TABLE `fhir_observation_category_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_patient_identifier_system`
--

DROP TABLE IF EXISTS `fhir_patient_identifier_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_patient_identifier_system` (
  `fhir_patient_identifier_system_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_identifier_type_id` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  PRIMARY KEY (`fhir_patient_identifier_system_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_patient_identifier_system_patient_identifier_type_fk` (`patient_identifier_type_id`),
  KEY `fhir_patient_identifier_system_creator_fk` (`creator`),
  KEY `fhir_patient_identifier_system_changed_by_fk` (`changed_by`),
  KEY `fhir_patient_identifier_system_retired_by_fk` (`retired_by`),
  CONSTRAINT `fhir_patient_identifier_system_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_patient_identifier_system_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_patient_identifier_system_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_patient_identifier_system_patient_identifier_type_fk` FOREIGN KEY (`patient_identifier_type_id`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_patient_identifier_system`
--

LOCK TABLES `fhir_patient_identifier_system` WRITE;
/*!40000 ALTER TABLE `fhir_patient_identifier_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_patient_identifier_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_reference`
--

DROP TABLE IF EXISTS `fhir_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_reference` (
  `reference_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  `target_uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`reference_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_reference_creator_fk` (`creator`),
  KEY `fhir_reference_changed_by_fk` (`changed_by`),
  KEY `fhir_reference_retired_by_fk` (`retired_by`),
  CONSTRAINT `fhir_reference_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_reference_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_reference_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_reference`
--

LOCK TABLES `fhir_reference` WRITE;
/*!40000 ALTER TABLE `fhir_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_task`
--

DROP TABLE IF EXISTS `fhir_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'UNKNOWN',
  `status_reason` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `intent` varchar(255) NOT NULL,
  `owner_reference_id` int(11) DEFAULT NULL,
  `encounter_reference_id` int(11) DEFAULT NULL,
  `for_reference_id` int(11) DEFAULT NULL,
  `based_on` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `location_reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `task_creator` (`creator`),
  KEY `task_changed_by` (`changed_by`),
  KEY `fhir_task_retired_by_fk` (`retired_by`),
  KEY `task_owner_reference_fk` (`owner_reference_id`),
  KEY `task_for_reference_fk` (`for_reference_id`),
  KEY `task_encounter_reference_fk` (`encounter_reference_id`),
  KEY `task_location_reference_fk` (`location_reference_id`),
  CONSTRAINT `task_location_reference_fk` FOREIGN KEY (`location_reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `fhir_task_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `task_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `task_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `task_encounter_reference_fk` FOREIGN KEY (`encounter_reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `task_for_reference_fk` FOREIGN KEY (`for_reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `task_owner_reference_fk` FOREIGN KEY (`owner_reference_id`) REFERENCES `fhir_reference` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_task`
--

LOCK TABLES `fhir_task` WRITE;
/*!40000 ALTER TABLE `fhir_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_task_based_on_reference`
--

DROP TABLE IF EXISTS `fhir_task_based_on_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_task_based_on_reference` (
  `task_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  UNIQUE KEY `reference_id` (`reference_id`),
  KEY `task_based_on_fk` (`task_id`),
  CONSTRAINT `reference_based_on_fk` FOREIGN KEY (`reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `task_based_on_fk` FOREIGN KEY (`task_id`) REFERENCES `fhir_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_task_based_on_reference`
--

LOCK TABLES `fhir_task_based_on_reference` WRITE;
/*!40000 ALTER TABLE `fhir_task_based_on_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_task_based_on_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_task_input`
--

DROP TABLE IF EXISTS `fhir_task_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_task_input` (
  `task_input_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_text` varchar(255) DEFAULT NULL,
  `value_reference_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  PRIMARY KEY (`task_input_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_task_input_creator_fk` (`creator`),
  KEY `fhir_task_input_changed_by_fk` (`changed_by`),
  KEY `fhir_task_input_retired_by_fk` (`retired_by`),
  KEY `input_type_fk` (`type_id`),
  KEY `input_reference_fk` (`value_reference_id`),
  KEY `input_task_fk` (`task_id`),
  CONSTRAINT `input_task_fk` FOREIGN KEY (`task_id`) REFERENCES `fhir_task` (`task_id`),
  CONSTRAINT `fhir_task_input_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_task_input_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_task_input_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `input_reference_fk` FOREIGN KEY (`value_reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `input_type_fk` FOREIGN KEY (`type_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_task_input`
--

LOCK TABLES `fhir_task_input` WRITE;
/*!40000 ALTER TABLE `fhir_task_input` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_task_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fhir_task_output`
--

DROP TABLE IF EXISTS `fhir_task_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fhir_task_output` (
  `task_output_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_text` varchar(255) DEFAULT NULL,
  `value_reference_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  PRIMARY KEY (`task_output_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fhir_task_output_creator_fk` (`creator`),
  KEY `fhir_task_output_changed_by_fk` (`changed_by`),
  KEY `fhir_task_output_retired_by_fk` (`retired_by`),
  KEY `output_type_fk` (`type_id`),
  KEY `output_reference_fk` (`value_reference_id`),
  KEY `output_task_fk` (`task_id`),
  CONSTRAINT `output_task_fk` FOREIGN KEY (`task_id`) REFERENCES `fhir_task` (`task_id`),
  CONSTRAINT `fhir_task_output_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_task_output_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fhir_task_output_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `output_reference_fk` FOREIGN KEY (`value_reference_id`) REFERENCES `fhir_reference` (`reference_id`),
  CONSTRAINT `output_type_fk` FOREIGN KEY (`type_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fhir_task_output`
--

LOCK TABLES `fhir_task_output` WRITE;
/*!40000 ALTER TABLE `fhir_task_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `fhir_task_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `field_type` int(11) DEFAULT NULL,
  `concept_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  `default_value` text,
  `select_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `field_uuid_index` (`uuid`),
  KEY `field_retired_status` (`retired`),
  KEY `user_who_changed_field` (`changed_by`),
  KEY `concept_for_field` (`concept_id`),
  KEY `user_who_created_field` (`creator`),
  KEY `type_of_field` (`field_type`),
  KEY `user_who_retired_field` (`retired_by`),
  CONSTRAINT `concept_for_field` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `type_of_field` FOREIGN KEY (`field_type`) REFERENCES `field_type` (`field_type_id`),
  CONSTRAINT `user_who_changed_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_field` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_answer`
--

DROP TABLE IF EXISTS `field_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_answer` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_id`,`answer_id`),
  UNIQUE KEY `field_answer_uuid_index` (`uuid`),
  KEY `field_answer_concept` (`answer_id`),
  KEY `user_who_created_field_answer` (`creator`),
  CONSTRAINT `answers_for_field` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `field_answer_concept` FOREIGN KEY (`answer_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_field_answer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_answer`
--

LOCK TABLES `field_answer` WRITE;
/*!40000 ALTER TABLE `field_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type`
--

DROP TABLE IF EXISTS `field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type` (
  `field_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_type_id`),
  UNIQUE KEY `field_type_uuid_index` (`uuid`),
  KEY `user_who_created_field_type` (`creator`),
  CONSTRAINT `user_who_created_field_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type`
--

LOCK TABLES `field_type` WRITE;
/*!40000 ALTER TABLE `field_type` DISABLE KEYS */;
INSERT INTO `field_type` VALUES (1,'Concept','',0,1,'2005-02-22 00:00:00','8d5e7d7c-c2cc-11de-8d13-0010c6dffd0f'),(2,'Database element','',0,1,'2005-02-22 00:00:00','8d5e8196-c2cc-11de-8d13-0010c6dffd0f'),(3,'Set of Concepts','',1,1,'2005-02-22 00:00:00','8d5e836c-c2cc-11de-8d13-0010c6dffd0f'),(4,'Miscellaneous Set','',1,1,'2005-02-22 00:00:00','8d5e852e-c2cc-11de-8d13-0010c6dffd0f'),(5,'Section','',1,1,'2005-02-22 00:00:00','8d5e86fa-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `xslt` text,
  `template` text,
  `description` text,
  `encounter_type` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_created_form` (`creator`),
  KEY `form_encounter_type` (`encounter_type`),
  KEY `user_who_retired_form` (`retired_by`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `form_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `field_number` int(11) DEFAULT NULL,
  `field_part` varchar(5) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `parent_form_field` int(11) DEFAULT NULL,
  `min_occurs` int(11) DEFAULT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE KEY `form_field_uuid_index` (`uuid`),
  KEY `user_who_last_changed_form_field` (`changed_by`),
  KEY `user_who_created_form_field` (`creator`),
  KEY `field_within_form` (`field_id`),
  KEY `form_containing_field` (`form_id`),
  KEY `form_field_hierarchy` (`parent_form_field`),
  CONSTRAINT `field_within_form` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `form_containing_field` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `form_field_hierarchy` FOREIGN KEY (`parent_form_field`) REFERENCES `form_field` (`form_field_id`),
  CONSTRAINT `user_who_created_form_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_resource`
--

DROP TABLE IF EXISTS `form_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_resource` (
  `form_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value_reference` text NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unique_form_and_name` (`form_id`,`name`),
  KEY `form_resource_changed_by` (`changed_by`),
  CONSTRAINT `form_resource_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `form_resource_form_fk` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_resource`
--

LOCK TABLES `form_resource` WRITE;
/*!40000 ALTER TABLE `form_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_property`
--

DROP TABLE IF EXISTS `global_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_property` (
  `property` varchar(255) NOT NULL DEFAULT '',
  `property_value` text,
  `description` text,
  `uuid` char(38) NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`property`),
  UNIQUE KEY `global_property_uuid_index` (`uuid`),
  KEY `global_property_property_index` (`property`),
  KEY `global_property_changed_by` (`changed_by`),
  CONSTRAINT `global_property_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_property`
--

LOCK TABLES `global_property` WRITE;
/*!40000 ALTER TABLE `global_property` DISABLE KEYS */;
INSERT INTO `global_property` VALUES ('addresshierarchy.addressToEntryMapUpdaterLastStartTime',NULL,'The module uses this field to store when the AddressToEntryMapUpdater task was last started; DO NOT MODIFY','f6ad0d37-5992-49d8-b2c2-5002c1e1c31b',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.allowFreetext','true','Valid values: true/false. When overriding the address portlet, allow the entry of free text for address fields associated with the address hierarchy by providing an \"Other\" option','ef02d8d7-ff93-4ed1-a896-066aee04676a',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.enableOverrideOfAddressPortlet','true','Valid values: true/false. When enabled, the existing \"edit\" component of the address portlet is overridden by the new functionality provided by the address hierarchy module','afe40b37-4e9f-4b3c-8235-c69ba7881470',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.initializeAddressHierarchyCacheOnStartup','true','Sets whether to initialize the address hierarchy in-memory cache (which is used to speed up address hierarchy searches.\nGenerally, you want to set this to \"true\", though developers may want to set it to false during development\nto speed module start-up.','95385359-652e-4df4-ab91-f42b973a6b44',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.mandatory','false','true/false whether or not the addresshierarchy module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','5360b57a-b395-463f-a719-b0c327cd9e99',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.soundexProcessor',NULL,'If the Name Phonetics module is installed, this defines the name of a soundex algorithm used by the getPossibleFullAddresses service method.','744b1fec-4aaf-415f-8bb8-7e8a859690d6',NULL,NULL,NULL,NULL,NULL,NULL),('addresshierarchy.started','true','DO NOT MODIFY. true/false whether or not the addresshierarchy module has been started.  This is used to make sure modules that were running  prior to a restart are started again','b200ecef-03fa-4004-85ba-d92ece08847e',NULL,NULL,NULL,NULL,NULL,NULL),('adminui.mandatory','false','true/false whether or not the adminui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','1d065cc7-b53e-4b3a-a2d9-529f62571fb8',NULL,NULL,NULL,NULL,NULL,NULL),('adminui.started','true','DO NOT MODIFY. true/false whether or not the adminui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','e31855a5-ba0a-4065-b7ee-5425e8e5c75b',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.allergen.ConceptClasses','Drug,MedSet','A comma-separated list of the allowed concept classes for the allergen field of the allergy dialog','c96a6ed0-61d8-4530-98b0-6565197be870',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.allergen.drug','162552AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the drug allergens concept','025e1ba8-3141-42f9-9d5d-d0938937e18e',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.allergen.environment','162554AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the environment allergens concept','60abe528-01df-46ff-802c-e2c9007d1675',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.allergen.food','162553AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the food allergens concept','79b1813a-6ffc-4c0c-bd0a-5b36c21dc9c1',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.otherNonCoded','5622AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the allergy other non coded concept','1e54456d-5a32-4538-bbf4-c9085fd93cb1',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.reactions','162555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the allergy reactions concept','9f843152-1bfa-4e15-9b82-f420800635c1',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.severity.mild','1498AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the MILD severity concept','4ca9c6ee-38d1-41bc-9add-741dfeb5e37a',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.severity.moderate','1499AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the MODERATE severity concept','56d4c0eb-0aa3-4aa9-996e-a7833331cd34',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.severity.severe','1500AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the SEVERE severity concept','e106b029-3aad-4da2-b8b3-1e8a9984c789',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.concept.unknown','1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','UUID for the allergy unknown concept','39a06c3a-e8cb-4711-bf11-1f8300a9281f',NULL,NULL,NULL,NULL,NULL,NULL),('allergy.reaction.ConceptClasses','Symptom','A comma-separated list of the allowed concept classes for the reaction field of the allergy dialog','f31c3aec-3019-4352-870c-e242a3ed22ef',NULL,NULL,NULL,NULL,NULL,NULL),('allergyui.mandatory','false','true/false whether or not the allergyui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','fd35f066-9981-4343-95f0-df374418eff3',NULL,NULL,NULL,NULL,NULL,NULL),('allergyui.started','true','DO NOT MODIFY. true/false whether or not the allergyui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','4c3d571c-9874-44d4-8a9e-35794377916b',NULL,NULL,NULL,NULL,NULL,NULL),('appframework.mandatory','false','true/false whether or not the appframework module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','116db4a7-5a07-4b90-b476-2d6f2a91846c',NULL,NULL,NULL,NULL,NULL,NULL),('appframework.started','true','DO NOT MODIFY. true/false whether or not the appframework module has been started.  This is used to make sure modules that were running  prior to a restart are started again','88c76b50-e8c4-4d0f-ab66-4fa133ec0d3d',NULL,NULL,NULL,NULL,NULL,NULL),('application.name','OpenMRS','The name of this application, as presented to the user, for example on the login and welcome pages.','2720b841-bf4e-426f-9817-dc0118185fb5',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.cleanOpenAppointmentScheduler','false','Clean open appointments at end of the day.','3a224f23-d18e-4d84-ba36-453daab6174c',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.defaultTimeSlotDuration','60','Default Time Slot Duration. (In Minutes)','b5aaf6c3-7edb-40bd-a006-275931929fd5',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.defaultVisitType','1','Default Visit Type for the in consultation state change.','eb18fe41-c8f8-493a-a22c-2382aad5865b',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.hideEndVisitButtons','true','Hide \"End Visit\" buttons on the patient dashboard.','137ff101-0158-4eb2-9ed1-a83adee7b1ec',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.manageAppointmentsFormTimout','60','Refresh the manage appointments page after this number of seconds. (60 Seconds Minimum,-1 to Disable auto Refresh)','e316853e-b89e-46aa-b315-b100df3f4d3f',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.mandatory','false','true/false whether or not the appointmentscheduling module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','bd5d52ad-e9ab-424c-b240-80d749913501',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.phoneNumberPersonAttributeTypeId','8','Person attribute type id for the phone number.','91bd2b25-189a-4b40-89c1-20856419ff24',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentscheduling.started','true','DO NOT MODIFY. true/false whether or not the appointmentscheduling module has been started.  This is used to make sure modules that were running  prior to a restart are started again','305c6713-6b39-4ed9-a8ec-cb2a8ff21705',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentschedulingui.includeWeekends','false','Defines whether the calendar should include weekends','57149e36-c76b-4fe4-9fb7-94dd201eb30b',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentschedulingui.mandatory','false','true/false whether or not the appointmentschedulingui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','97d676bc-7b80-4cf8-9104-47713c16d1cf',NULL,NULL,NULL,NULL,NULL,NULL),('appointmentschedulingui.started','true','DO NOT MODIFY. true/false whether or not the appointmentschedulingui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','a0fce95e-4be7-4010-925b-76039d4c475d',NULL,NULL,NULL,NULL,NULL,NULL),('appui.mandatory','false','true/false whether or not the appui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','2856738b-7652-4db0-bb33-e7cbdd63f36a',NULL,NULL,NULL,NULL,NULL,NULL),('appui.started','true','DO NOT MODIFY. true/false whether or not the appui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','7d03e55e-c5d3-4590-bcbc-ed971242321b',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.allowNoCaption','false','Set this property to \'true\' to allow empty attachments\ncaptions','0becb7b3-d786-4712-b01c-5832cacc9475',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.allowWebcam','true','Set this property to \'true\' to allow the use of the\nwebcam for file\nuploads','dc6b9479-c347-4cc9-a1d6-af7296f62ae5',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.associateWithVisit','true','If set false, then when uploading an attachment via the \"Attachments Controller\", the visit context will\n*not* be included (and therefore the attachment will not be associated with that visit)','9eadb5d6-71ad-4235-b2f4-4a8b9d01d63a',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.conceptComplexUuidList','[\"7cac8397-53cd-4f00-a6fe-028e8d743f8e\",\"42ed45fd-f3f6-44b6-bfc2-8bde1bb41e00\"]','List of concept complex UUIDs that are used in queries\nfor viewing\ndocuments','014d7e9f-e46b-42b7-80a9-1710f08e53ba',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.conceptComplexUuidMap','{\"IMAGE\":\"7cac8397-53cd-4f00-a6fe-028e8d743f8e\",\"OTHER\":\"42ed45fd-f3f6-44b6-bfc2-8bde1bb41e00\"}','Mapping between content families and concept complex\nUUIDs, this is used for\nsaving files based on their MIME type','11f9a101-dc02-4a69-be1e-3c2f4be34268',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.dashboardThumbnailCount','4','Number of thumbnails to display on the dashboard widget','217ccbd6-4f27-4ddd-8035-d09701748a47',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.defaultConceptComplexUuid','42ed45fd-f3f6-44b6-bfc2-8bde1bb41e00','UUID of the (question) concept complex for \'other\'\npatient files, this is\nused as the default when the MIME type is not\nmatched','f60d8bd0-7ccb-4ea7-93c8-86aa96f5f999',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.encounterSavingFlow',NULL,'Set this property to \'unique\' to have only one encounter\nper visit','c78ebd71-b699-42e4-804c-31cc894608aa',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.encounterTypeUuid','5021b1a1-e7f6-44b4-ba02-da2f2bcf8718','UUID of the encounter type used to upload attachments','65dd8ecd-f463-4e70-a449-16a7cf002d79',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.mandatory','false','true/false whether or not the attachments module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','b98153a9-19e6-46fe-a52b-e5a42ceb3621',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.maxStorageFileSize','1.2','Maximum size (in Megabytes) allowed for the storage of an attachment','1156d861-d183-4f9a-a832-d90559eefe55',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.maxUploadFileSize','5.0','Maximum size (in Megabytes) allowed for an attachment\nfile upload','fa1d3ea1-2ba9-406a-82d8-1c1319d54cee',NULL,NULL,NULL,NULL,NULL,NULL),('attachments.started','true','DO NOT MODIFY. true/false whether or not the attachments module has been started.  This is used to make sure modules that were running  prior to a restart are started again','715acf77-ad3e-45fa-b8f1-b04d4e1943ba',NULL,NULL,NULL,NULL,NULL,NULL),('calculation.mandatory','false','true/false whether or not the calculation module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7ad4bbfd-d19d-44f6-a0e1-d75439fdad50',NULL,NULL,NULL,NULL,NULL,NULL),('calculation.started','true','DO NOT MODIFY. true/false whether or not the calculation module has been started.  This is used to make sure modules that were running  prior to a restart are started again','00c622dc-dbf1-42d6-a56b-340eb917649c',NULL,NULL,NULL,NULL,NULL,NULL),('concept.causeOfDeath','5002','Concept id of the concept defining the CAUSE OF DEATH concept','35a0b3cd-a0a1-41d9-8d41-ba9d0d68a720',NULL,NULL,NULL,NULL,NULL,NULL),('concept.defaultConceptMapType','NARROWER-THAN','Default concept map type which is used when no other is set','cf2f8f45-9643-4ba8-9ae9-3f8a205db591',NULL,NULL,NULL,NULL,NULL,NULL),('concept.false','2','Concept id of the concept defining the FALSE boolean concept','de4df46b-d909-4b46-a4a7-d697583400e3',NULL,NULL,NULL,NULL,NULL,NULL),('concept.height','5090','Concept id of the concept defining the HEIGHT concept','436fd51c-cdec-4830-9d23-fc1b0b73b768',NULL,NULL,NULL,NULL,NULL,NULL),('concept.medicalRecordObservations','1238','The concept id of the MEDICAL_RECORD_OBSERVATIONS concept.  This concept_id is presumed to be the generic grouping (obr) concept in hl7 messages.  An obs_group row is not created for this concept.','2e72b3bc-d5fb-4b67-85d2-06d169de6c5d',NULL,NULL,NULL,NULL,NULL,NULL),('concept.none','1107','Concept id of the concept defining the NONE concept','b6e81798-dad7-4ea5-8a04-b456ad8fbe80',NULL,NULL,NULL,NULL,NULL,NULL),('concept.otherNonCoded','5622','Concept id of the concept defining the OTHER NON-CODED concept','cf9cb0aa-5c54-453c-9021-96257ef08a01',NULL,NULL,NULL,NULL,NULL,NULL),('concept.patientDied','1742','Concept id of the concept defining the PATIENT DIED concept','4328fe1f-4065-4368-ab85-606d2f73169a',NULL,NULL,NULL,NULL,NULL,NULL),('concept.problemList','1284','The concept id of the PROBLEM LIST concept.  This concept_id is presumed to be the generic grouping (obr) concept in hl7 messages.  An obs_group row is not created for this concept.','5821d12f-dc07-4d4a-b255-804917b15913',NULL,NULL,NULL,NULL,NULL,NULL),('concept.reasonExitedCare',NULL,'Concept id of the concept defining the REASON EXITED CARE concept','31ea6495-642c-4951-b1e4-d8b7853a894c',NULL,NULL,NULL,NULL,NULL,NULL),('concept.reasonOrderStopped','1812','Concept id of the concept defining the REASON ORDER STOPPED concept','fb74e000-4f43-4f84-972a-7704721b0f99',NULL,NULL,NULL,NULL,NULL,NULL),('concept.true','1','Concept id of the concept defining the TRUE boolean concept','b2b0b49c-7999-4f26-b8c6-fe0723b0dfee',NULL,NULL,NULL,NULL,NULL,NULL),('concept.weight','5089','Concept id of the concept defining the WEIGHT concept','9e8771ad-f05b-4dc0-9860-1aae4b33ffeb',NULL,NULL,NULL,NULL,NULL,NULL),('conceptDrug.dosageForm.conceptClasses',NULL,'A comma-separated list of the allowed concept classes for the dosage form field of the concept drug management form.','c80aea2f-cccc-4299-9fe5-541fcc179f8d',NULL,NULL,NULL,NULL,NULL,NULL),('conceptDrug.route.conceptClasses',NULL,'A comma-separated list of the allowed concept classes for the route field of the concept drug management form.','27f9bcc5-1042-4851-8f26-4f5239f38547',NULL,NULL,NULL,NULL,NULL,NULL),('concepts.locked','false','if true, do not allow editing concepts','39bbd058-6634-4bf7-97e1-17772f62636a','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('concept_map_type_management.enable','false','Enables or disables management of concept map types','6fbdee26-ba1e-4a7e-a587-0914fd2ebc1d','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('conditionList.endReasonConceptSetUuid',NULL,'UUID of end reason concept set','0ef7ea93-30df-4a7d-b3b7-ed06e7a4e755',NULL,NULL,NULL,NULL,NULL,NULL),('conditionList.nonCodedUuid',NULL,'UUID of non coded concept','5c93539b-6262-4e24-9a89-564cb19fd61a',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.allowChangingVisitTime','false','Be able to change the start time of a visit.','bfc3813f-cc1b-4a0e-a2ef-1e58b695ae92',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.conceptStickyNote','CIEL:165095','Mapping of the concept used for the Sticky Note. In the form of SOURCE:CODE.','34c4103e-cafe-4352-9112-cbb63c83d145',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.conditionListClasses','8d4918b0-c2cc-11de-8d13-0010c6dffd0f','List of concept uuid\'s which limits the answers for condition list','a0a1d368-1885-4ae1-8792-55702069209b',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.dashboardUrl','/coreapps/clinicianfacing/patient.page?patientId={{patientId}}','Allows one to override the default dashboard url','6718bd4d-a876-4cd0-ab1a-03f8fc749a5b',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.deceasedDateUsingTime','false','Deceased date using time component or only date.','4b2c1c3d-d30b-486f-8026-ae8fc66feffb',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.defaultPatientIdentifierLocation',NULL,'When adding a new patient identifier via the patient dashboard, the location to use if not specified (and the identifier type requires a location)','821c4197-ea60-4802-8149-f5a56927fb6c',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.mandatory','false','true/false whether or not the coreapps module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','185f1f54-2cb2-4aca-9f45-e353db5a4339',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.patientDashboardEncounterCount','100','Maximum number of encounters to be loaded and displayed at once on the patient dashboard.','e7bfa39f-a5a8-4c81-bffb-4b7acaad12a7',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.recentDiagnosisPeriodInDays',NULL,'Number of days to consider diagnosis as recent','6caa1fb9-4703-41ab-9a75-5badb126bdf6',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.searchDelayLong','1000','Time, in milliseconds, that the patient search waits for an additional keystroke if only 1 or 2 characters have been entered','8d581cc5-fbe5-4c7d-896f-c2b8e3d9c26e',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.searchDelayShort','300','Default time, in milliseconds, that the patient search waits for an additional keystroke before performed a search','4dd66d2c-9680-434f-b031-db9a949e179f',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.showVisitTypeOnPatientHeaderSection','false','On the active status and patient header sections, display inpatient/outpatient (based on whether\n            a visit has an admission encounter) or the associated visit type.','62d6bfcb-28d1-4e4b-82c7-09963c1e3d59',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.started','true','DO NOT MODIFY. true/false whether or not the coreapps module has been started.  This is used to make sure modules that were running  prior to a restart are started again','f4a31052-9781-4036-8005-862b40abe62c',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.transferEncounterUuid',NULL,'Set encounter uuid if you would like to create a transfer encounter when visit type is changed','b4bdc23e-c2df-4ade-8093-68be7567096c',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.visitsPageUrl','/coreapps/patientdashboard/patientDashboard.page?patientId={{patientId}}#visits','Allows one to override the default general patient visits page','0357cec0-f760-4626-8aae-cbc02d61886e',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.visitsPageWithSpecificVisitUrl','/coreapps/patientdashboard/patientDashboard.page?patientId={{patientId}}&visitId={{visit.id}}#','Allows one to override the default page that displays the details of a specific patient visit','6374765f-d33d-436c-a4f9-254767f6b353',NULL,NULL,NULL,NULL,NULL,NULL),('coreapps.visitTypeColors',NULL,'Set visit type colors in JSON-like format. Syntax\n            [\n                {\"uuid\":\"visit_type1_uuid\", \"color\":\"red\", \"shortName\":\"inpatient\"},\n                {\"uuid\":\"visit_type2_uuid\", \"color\":\"blue\", \"shortName\":\"oper_theater\"}\n            ]','25b52df5-69ab-4217-8fa4-55a14e59330c',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.maximumNumberToShow',NULL,'An integer which, if specified, would determine the maximum number of encounters to display on the encounter tab of the patient dashboard.','137d6a22-0808-4565-adf6-99ef9a90aee7',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.providerDisplayRoles',NULL,'A comma-separated list of encounter roles (by name or id). Providers with these roles in an encounter will be displayed on the encounter tab of the patient dashboard.','bae250ec-54f8-4733-a381-51d3a5428678',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.showEditLink','true','true/false whether or not to show the \'Edit Encounter\' link on the patient dashboard','eca227fc-44c0-438a-8c34-cccac2f0e336','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.showEmptyFields','true','true/false whether or not to show empty fields on the \'View Encounter\' window','cda1b34b-dd04-4c8b-84bf-da09c9631eed','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.showViewLink','true','true/false whether or not to show the \'View Encounter\' link on the patient dashboard','018a4f20-9b14-4d90-9ecb-23a87a1b4c30','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('dashboard.encounters.usePages','smart','true/false/smart on how to show the pages on the \'View Encounter\' window.  \'smart\' means that if > 50% of the fields have page numbers defined, show data in pages','256cf60a-3d55-4233-856d-baa6f9610269',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.formEntry.maximumNumberEncountersToShow',NULL,'Allows one to limit the number of encounters shown on the form entry tab of the patient dashboard specifically','69407e26-38fd-4640-88b3-026c22829e85',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.header.programs_to_show',NULL,'List of programs to show Enrollment details of in the patient header. (Should be an ordered comma-separated list of program_ids or names.)','00292469-a526-45fd-9917-bc505c985cc6',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.header.showConcept','5497','Comma delimited list of concepts ids to show on the patient header overview','5a39a74c-fadf-4d1b-81b7-70b9ec22209b',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.header.workflows_to_show',NULL,'List of programs to show Enrollment details of in the patient header. List of workflows to show current status of in the patient header. These will only be displayed if they belong to a program listed above. (Should be a comma-separated list of program_workflow_ids.)','01ab64ea-d931-4c4d-9e1f-df37577bece7',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.metadata.caseConversion',NULL,'Indicates which type automatic case conversion is applied to program/workflow/state in the patient dashboard. Valid values: lowercase, uppercase, capitalize. If empty no conversion is applied.','b3741ab6-1ead-4d1a-8736-b082c7da348f',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.overview.showConcepts',NULL,'Comma delimited list of concepts ids to show on the patient dashboard overview tab','c327013f-1fc7-422c-a9cf-15ffeb5f60ca',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.regimen.displayDrugSetIds','ANTIRETROVIRAL DRUGS,TUBERCULOSIS TREATMENT DRUGS','Drug sets that appear on the Patient Dashboard Regimen tab. Comma separated list of name of concepts that are defined as drug sets.','d9f957ed-fc19-497a-acb6-73f4326c141e',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.regimen.displayFrequencies','7 days/week,6 days/week,5 days/week,4 days/week,3 days/week,2 days/week,1 days/week','Frequency of a drug order that appear on the Patient Dashboard. Comma separated list of name of concepts that are defined as drug frequencies.','da0ee700-e81d-49e1-b4c3-677b7ad9b414',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.relationships.show_types',NULL,'Types of relationships separated by commas.  Doctor/Patient,Parent/Child','e985abd8-79b6-4f69-b96c-c9a13d3ef14a',NULL,NULL,NULL,NULL,NULL,NULL),('dashboard.showPatientName','false','Whether or not to display the patient name in the patient dashboard title. Note that enabling this could be security risk if multiple users operate on the same computer.','83aafe2e-526e-4447-bed8-043edb069a37','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('dataexchange.mandatory','false','true/false whether or not the dataexchange module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','beb65622-2a38-4491-ae67-0f492e553caf',NULL,NULL,NULL,NULL,NULL,NULL),('dataexchange.started','true','DO NOT MODIFY. true/false whether or not the dataexchange module has been started.  This is used to make sure modules that were running  prior to a restart are started again','67d20ce6-2a40-4451-9191-3253bbcc4381',NULL,NULL,NULL,NULL,NULL,NULL),('datePicker.weekStart','0','First day of the week in the date picker. Domingo/Dimanche/Sunday:0  Lunes/Lundi/Monday:1','3d244dfc-d9e4-425e-bb81-0b31ac7cc47b',NULL,NULL,NULL,NULL,NULL,NULL),('default_locale','en_GB','Specifies the default locale. You can specify both the language code(ISO-639) and the country code(ISO-3166), e.g. \'en_GB\' or just country: e.g. \'en\'','71870828-e88b-4d0b-9c41-47ec2586d064',NULL,NULL,NULL,NULL,NULL,NULL),('default_location','Unknown Location','The name of the location to use as a system default','ff16a585-5ea7-4272-838c-ef9241359592',NULL,NULL,NULL,NULL,NULL,NULL),('default_theme',NULL,'Default theme for users.  OpenMRS ships with themes of \'green\', \'orange\', \'purple\', and \'legacy\'','98a545dc-2879-445b-ac98-e7dc0b7d19a1',NULL,NULL,NULL,NULL,NULL,NULL),('drugOrder.drugOther',NULL,'Specifies the uuid of the concept which represents drug other non coded','b944e2f6-e0d5-41e0-bf12-150860939be9',NULL,NULL,NULL,NULL,NULL,NULL),('drugOrder.requireDrug','false','Set to value true if you need to specify a formulation(Drug) when creating a drug order.','5f79c0d9-c3c5-42ec-8d03-305793faf903',NULL,NULL,NULL,NULL,NULL,NULL),('drugOrder.requireOutpatientQuantity','true','true/false whether to require quantity, quantityUnits, and numRefills for outpatient drug orders','6d04f8d5-6ba7-4575-848b-1fb47106c884',NULL,NULL,NULL,NULL,NULL,NULL),('emr.encounterMatcher',NULL,'Class name of a custom encounter matcher (e.g. org.openmrs.module.example.customEncounterMatcher)','830ad68d-8fa5-491f-bfab-49100e111e08',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.conceptSourcesForDiagnosisSearch','ICD-10-WHO','Specifies comma separated list of reference term source names to be used for diagnosis and condition search','546c9bf2-b703-4241-9b45-316e14118e4a',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.EmrApiVisitAssignmentHandler.adjustEncounterTimeOfDayIfNecessary','false','If true, and a visit is found on the same day but the encounter is not within that timeframe will adjust the encounter time as needed','3271934a-493b-4311-8479-1db2dcb0eccc',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.EmrApiVisitAssignmentHandler.encounterTypeToNewVisitTypeMap',NULL,'Specifies the mapping of encounter types to new visit types for more see https://wiki.openmrs.org/x/vgF4Aw','54a806c1-ffe9-4474-aa2f-73c1c6f61eb5',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.lastViewedPatientSizeLimit','50','Specifies the system wide number of patients to store as last viewed for a single user,\n            defaults to 50 if not specified','1445104c-5226-45c1-ba22-17bae25c692c',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.mandatory','false','true/false whether or not the emrapi module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','54669b6e-8745-4e8c-bc6b-3e294d358598',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.nonDiagnosisConceptSets',NULL,'UUIDs or mapping of non diagnosis concept sets','71b1e71d-b330-4003-9a2a-13c8e1fd7da6',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.started','true','DO NOT MODIFY. true/false whether or not the emrapi module has been started.  This is used to make sure modules that were running  prior to a restart are started again','62762c66-df40-4f03-b7cd-6684ebc21e9b',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.suppressedDiagnosisConcepts',NULL,'UUIDs or mappings of suppressed diagnosis concepts','ecb18170-2e3b-46ce-99ac-26e4e5487128',NULL,NULL,NULL,NULL,NULL,NULL),('emrapi.useLegacyDiagnosisService','false','When running Core 2.2+, use the legacy diagnosis service instead of the new one provided to work with the new diagnosis model','08e66337-d47b-419b-b759-a391074a5956',NULL,NULL,NULL,NULL,NULL,NULL),('encounterForm.obsSortOrder','number','The sort order for the obs listed on the encounter edit form.  \'number\' sorts on the associated numbering from the form schema.  \'weight\' sorts on the order displayed in the form schema.','090c82b2-6226-4cde-be50-17b67e097467',NULL,NULL,NULL,NULL,NULL,NULL),('EncounterType.encounterTypes.locked','false','saving, retiring or deleting an Encounter Type is not permitted, if true','7435645c-694b-4620-84b6-58d9307ac2e2','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('event.mandatory','false','true/false whether or not the event module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','29b72adb-ca8a-45ef-a309-534a9826de17',NULL,NULL,NULL,NULL,NULL,NULL),('event.started','true','DO NOT MODIFY. true/false whether or not the event module has been started.  This is used to make sure modules that were running  prior to a restart are started again','d2f9afda-d073-4459-a8db-550292dd0fe3',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.administeringEncounterRoleUuid','546cce2d-6d58-4097-ba92-206c1a2a0462','Set administering encounter role uuid','5fdd2abb-d8b3-472c-a151-f66305e8c9d0',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.immunizationsEncounterTypeUuid','29c02aff-9a93-46c9-bf6f-48b552fcb1fa','Set immunizations encounter type uuid','8df128ca-537d-46d4-bd1e-022e6862694b',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.locationContactPointAttributeTypeUuid','abcde432-1691-11df-97a5-7038c432abcd','Set location attribute type uuid','edca293a-79f7-4dfc-a6ab-093dd3d384ac',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.locationTypeAttributeTypeUuid',NULL,'The UUID for the Location Attribute Type representing the Location Type','b5369c92-5cea-41d7-b216-9e80f9aeee04',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.mandatory','false','true/false whether or not the fhir2 module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','109d6af3-fa93-4a8a-9e5a-1e8817f70427',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.narrativesOverridePropertyFile',NULL,'Path of narrative override properties file','e1c72a7e-e27e-42b4-95d7-b2ceff516436',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.paging.default','10','Set default page size','4c95cc16-c30d-4b4d-8383-97f53dbad64c',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.paging.maximum','100','Set maximum page size','6e932e50-9f45-4195-a5fb-0d99670c6a14',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.personAttributeTypeUuid','14d4f066-15f5-102d-96e4-000c29c2a5d7','Set person attribute type uuid','c2e3649e-981a-4b92-819b-8d70c539b017',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.personContactPointAttributeTypeUuid','14d4f066-15f5-102d-96e4-000c29c2a5d7','Set person attribute type uuid','0fb861c8-a373-4d4c-8a3e-f9412a95e178',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.providerContactPointAttributeTypeUuid','5021b1a1-e7f6-44b4-ba02-da2f2bcf8718','Set provider attribute type uuid','afac09ae-34c6-4ddb-9c83-c49153742784',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.started','true','DO NOT MODIFY. true/false whether or not the fhir2 module has been started.  This is used to make sure modules that were running  prior to a restart are started again','87a0c614-f4d4-4669-b8dc-9da30d6b0a10',NULL,NULL,NULL,NULL,NULL,NULL),('fhir2.uriPrefix',NULL,'Prefix for the FHIR server in case this cannot be automatically detected','22e890dd-b512-4f6f-a630-acdd8367d8b4',NULL,NULL,NULL,NULL,NULL,NULL),('FormEntry.enableDashboardTab','true','true/false whether or not to show a Form Entry tab on the patient dashboard','e4039d7a-87c1-4a76-9422-721c4c6de656','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('FormEntry.enableOnEncounterTab','false','true/false whether or not to show a Enter Form button on the encounters tab of the patient dashboard','6579a662-7b46-4d29-8c03-d520d03d3ef2','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('formentryapp.mandatory','false','true/false whether or not the formentryapp module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','f77c82e8-c357-45f2-90f5-d76c519e375c',NULL,NULL,NULL,NULL,NULL,NULL),('formentryapp.started','true','DO NOT MODIFY. true/false whether or not the formentryapp module has been started.  This is used to make sure modules that were running  prior to a restart are started again','9ed38868-c20a-432c-8537-6d035444c7fa',NULL,NULL,NULL,NULL,NULL,NULL),('forms.locked','false','Set to a value of true if you do not want any changes to be made on forms, else set to false.','3bb08a38-2e75-405d-848a-fb501f114b3f',NULL,NULL,NULL,NULL,NULL,NULL),('graph.color.absolute','rgb(20,20,20)','Color of the \'invalid\' section of numeric graphs on the patient dashboard.','8bed2d3f-aaf4-4423-ac25-4d22277b323e',NULL,NULL,NULL,NULL,NULL,NULL),('graph.color.critical','rgb(200,0,0)','Color of the \'critical\' section of numeric graphs on the patient dashboard.','ee9d5142-b689-47b6-85ff-2b23d1b9428c',NULL,NULL,NULL,NULL,NULL,NULL),('graph.color.normal','rgb(255,126,0)','Color of the \'normal\' section of numeric graphs on the patient dashboard.','0ff2bc6b-8822-473c-a123-2d530df78f77',NULL,NULL,NULL,NULL,NULL,NULL),('gzip.enabled','false','Set to \'true\' to turn on OpenMRS\'s gzip filter, and have the webapp compress data before sending it to any client that supports it. Generally use this if you are running Tomcat standalone. If you are running Tomcat behind Apache, then you\'d want to use Apache to do gzip compression.','a7608c0b-d774-4844-aa9c-ca9fe44747dc','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('hl7_archive.dir','hl7_archives','The default name or absolute path for the folder where to write the hl7_in_archives.','8098ed61-38cd-4b6f-8509-a55af165f52d',NULL,NULL,NULL,NULL,NULL,NULL),('hl7_processor.ignore_missing_patient_non_local','false','If true, hl7 messages for patients that are not found and are non-local will silently be dropped/ignored','c44f6633-e89f-4593-8c50-0a0a0058087c','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('host.url',NULL,'The URL to redirect to after requesting for a password reset. Always provide a place holder in this url with name {activationKey}, it will get substituted by the actual activation key.','0810b563-b4d6-4c43-bf66-ad0013dd4ea7',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.archiveDir','htmlformentry/archive/%Y/%m','Used to specify the directory used to serialize data as a blob submitted via html forms before propagation to the database.\nIf a relative is specified then the directory is created in the default application data directory otherwise the absolute\npath is used.The %Y and %M are replaced with 4 digit year and 2 digit month respectively. If this property is empty nothing then nothing is saved.','4974c447-ffe0-45b9-8e9f-fb25dd68ccec',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.archiveHtmlForms','False','Set to True if you want to archive the submitted html forms and False otherwise','6693a401-cd51-43df-a115-d69cce88d794',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.dateFormat',NULL,'Always display dates in HTML Forms in this (Java) date format. E.g. \"dd/MMM/yyyy\" for 31/Jan/2012.','0a2dd7d5-4fa1-4d14-ac21-66380eb76004',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.datePickerYearsRange','110,20','datePickerYearsRange parameter can be  set here Eg:\'110,20\' meaning that the possible years that appear in the datepicker dropdown range from  20 years past the current year, and 110 years prior to the current year.','cb4d68ec-ab26-4d72-a9fc-9047067985d1',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.mandatory','false','true/false whether or not the htmlformentry module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','2b0236e3-5a54-4e9b-a194-164da25f4436',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.restrictEncounterLocationToCurrentVisitLocation','false','When set to true and an encounter is being entered in the context of a visit, the encounter location will be restricted to the current visit location (and it\'s descendents)','8a6abee1-e0c5-48e6-9fc4-2d83b3c83dac',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.showDateFormat','true','Set to true if you want static text for the date format to be displayed next to date widgets, else set to false.','1df3cdf7-db1a-4459-ac1a-9636822f61bb',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.started','true','DO NOT MODIFY. true/false whether or not the htmlformentry module has been started.  This is used to make sure modules that were running  prior to a restart are started again','f655d24c-9366-470b-aacc-76c9f6c071e7',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentry.timeFormat','HH:mm','Always display times in HTML Forms in this (Java) date format. E.g. \"HH:mm\" for 14:45.','0e0e67db-4eea-4dd4-8771-e4eb9463e179',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentryui.customPrintPageName',NULL,'If overriding htmlformentryui print button behavior, PageName to use in ui.pageLink() built href value','f8c63d70-67f5-4b98-8668-569a7696e8bf',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentryui.customPrintProvider',NULL,'If overriding htmlformentryui print button behavior, artifactId or base route of provider overriding functionality','ff74301b-ecc7-426c-866f-d00f3f1cf8ea',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentryui.customPrintTarget','_self','If overriding htmlformentryui print button behavior, URL target value (e.g. _self, _blank)','d2db7b22-075e-4991-8148-70b021796440',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentryui.mandatory','false','true/false whether or not the htmlformentryui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','5c47f604-6017-4e2c-95b5-1550906380b2',NULL,NULL,NULL,NULL,NULL,NULL),('htmlformentryui.started','true','DO NOT MODIFY. true/false whether or not the htmlformentryui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','bca1504f-2e74-4152-843b-88709e4c4f7a',NULL,NULL,NULL,NULL,NULL,NULL),('htmlwidgets.mandatory','false','true/false whether or not the htmlwidgets module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7308d4a7-32e2-4986-a909-79b6133089b0',NULL,NULL,NULL,NULL,NULL,NULL),('htmlwidgets.started','true','DO NOT MODIFY. true/false whether or not the htmlwidgets module has been started.  This is used to make sure modules that were running  prior to a restart are started again','bb923bf4-0a04-4e88-a771-08d9a243324a',NULL,NULL,NULL,NULL,NULL,NULL),('idgen.mandatory','false','true/false whether or not the idgen module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','5758412a-4b18-4b3f-85b3-24bda50bd731',NULL,NULL,NULL,NULL,NULL,NULL),('idgen.prefixLocationAttributeType',NULL,'Name of LocationAttribute type for PatientIdentifier Prefixes.','95755ff7-b8fc-45a2-a0d2-592b523f5899',NULL,NULL,NULL,NULL,NULL,NULL),('idgen.started','true','DO NOT MODIFY. true/false whether or not the idgen module has been started.  This is used to make sure modules that were running  prior to a restart are started again','ffb9d5b7-0c57-4ee5-95e4-35af5fbbfaba',NULL,NULL,NULL,NULL,NULL,NULL),('layout.address.format','<org.openmrs.layout.address.AddressTemplate>\n    <nameMappings class=\"properties\">\n      <property name=\"postalCode\" value=\"Location.postalCode\"/>\n      <property name=\"longitude\" value=\"Location.longitude\"/>\n      <property name=\"address2\" value=\"Location.address2\"/>\n      <property name=\"address1\" value=\"Location.address1\"/>\n      <property name=\"startDate\" value=\"PersonAddress.startDate\"/>\n      <property name=\"country\" value=\"Location.country\"/>\n      <property name=\"endDate\" value=\"personAddress.endDate\"/>\n      <property name=\"stateProvince\" value=\"Location.stateProvince\"/>\n      <property name=\"latitude\" value=\"Location.latitude\"/>\n      <property name=\"cityVillage\" value=\"Location.cityVillage\"/>\n    </nameMappings>\n    <sizeMappings class=\"properties\">\n      <property name=\"postalCode\" value=\"10\"/>\n      <property name=\"longitude\" value=\"10\"/>\n      <property name=\"address2\" value=\"40\"/>\n      <property name=\"address1\" value=\"40\"/>\n      <property name=\"startDate\" value=\"10\"/>\n      <property name=\"country\" value=\"10\"/>\n      <property name=\"endDate\" value=\"10\"/>\n      <property name=\"stateProvince\" value=\"10\"/>\n      <property name=\"latitude\" value=\"10\"/>\n      <property name=\"cityVillage\" value=\"10\"/>\n    </sizeMappings>\n    <lineByLineFormat>\n      <string>address1</string>\n      <string>address2</string>\n      <string>cityVillage stateProvince country postalCode</string>\n      <string>latitude longitude</string>\n      <string>startDate endDate</string>\n    </lineByLineFormat>\n  </org.openmrs.layout.address.AddressTemplate>','XML description of address formats','98fa7af1-d183-4f70-93fb-2f488000ce4c',NULL,NULL,NULL,NULL,NULL,NULL),('layout.name.format','short','Format in which to display the person names.  Valid values are short, long','8ece8adf-4d79-4b52-a233-66187cb72f3a',NULL,NULL,NULL,NULL,NULL,NULL),('legacyui.enableExitFromCare','false','true/false whether or not to show the Exit / Resume Care button on the patient dashboard','2ee66602-c81c-48a5-b82b-e5dc4ee1ff64',NULL,NULL,NULL,NULL,NULL,NULL),('legacyui.mandatory','false','true/false whether or not the legacyui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','85513675-f007-4ecd-a5f4-b242daf9f4f5',NULL,NULL,NULL,NULL,NULL,NULL),('legacyui.started','true','DO NOT MODIFY. true/false whether or not the legacyui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','ccab16ac-8e77-4c36-906f-adf718e07d68',NULL,NULL,NULL,NULL,NULL,NULL),('locale.allowed.list','en, es, fr, it, pt','Comma delimited list of locales allowed for use on system','2b4d2797-e8d1-4483-a863-02cfb4299212',NULL,NULL,NULL,NULL,NULL,NULL),('location.field.style','default','Type of widget to use for location fields','e77923c2-d262-4f8c-b8fe-40773827ea4d',NULL,NULL,NULL,NULL,NULL,NULL),('log.layout','%p - %C{1}.%M(%L) |%d{ISO8601}| %m%n','A log layout pattern which is used by the OpenMRS file appender.','44dd2b3e-af42-4abf-ad6e-eadb48a89d41',NULL,NULL,NULL,NULL,NULL,NULL),('log.level','org.openmrs.api:info','Logging levels for log4j.xml. Valid format is class:level,class:level. If class not specified, \'org.openmrs.api\' presumed. Valid levels are trace, debug, info, warn, error or fatal','cf66565e-d00b-4127-a774-07bad9e486fc',NULL,NULL,NULL,NULL,NULL,NULL),('log.location',NULL,'A directory where the OpenMRS log file appender is stored. The log file name is \'openmrs.log\'.','4683b0d6-45aa-4fab-a257-ae754ef1e855',NULL,NULL,NULL,NULL,NULL,NULL),('logic.default.ruleClassDirectory','logic/class','Default folder where compiled rule will be stored','e3231a20-9b7c-4101-8bbb-bfad2faa6fb5',NULL,NULL,NULL,NULL,NULL,NULL),('logic.default.ruleJavaDirectory','logic/sources','Default folder where rule\'s java file will be stored','6cca96f1-7139-44dc-a7d5-891530a26987',NULL,NULL,NULL,NULL,NULL,NULL),('logic.defaultTokens.conceptClasses',NULL,'When registering default tokens for logic, if you specify a comma-separated list of concept class names here, only concepts of those classes will have tokens registered. If you leave this blank, all classes will have tokens registered for their concepts.','13ac9af0-1f9b-405a-9f0f-5e3f00a37ce5',NULL,NULL,NULL,NULL,NULL,NULL),('logic.mandatory','false','true/false whether or not the logic module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','b3d2befc-61c7-4d39-b8ee-436ccb05fc16',NULL,NULL,NULL,NULL,NULL,NULL),('logic.started','true','DO NOT MODIFY. true/false whether or not the logic module has been started.  This is used to make sure modules that were running  prior to a restart are started again','21a52a97-c08d-4ea0-9404-efec9b204bbc',NULL,NULL,NULL,NULL,NULL,NULL),('login.url','login.htm','Responsible for defining the Authentication URL','c67ec8ae-5e4e-4f15-b625-d67ac45f4265',NULL,NULL,NULL,NULL,NULL,NULL),('mail.debug','false','true/false whether to print debugging information during mailing','76c4f916-9fe1-45b5-9773-224e4f4ee484',NULL,NULL,NULL,NULL,NULL,NULL),('mail.default_content_type','text/plain','Content type to append to the mail messages','f5830019-a60a-47fe-865f-78fb98b3f5f1',NULL,NULL,NULL,NULL,NULL,NULL),('mail.from','info@openmrs.org','Email address to use as the default from address','a8303d1e-de7b-45b8-bc04-2874ae7da635',NULL,NULL,NULL,NULL,NULL,NULL),('mail.password','test','Password for the SMTP user (if smtp_auth is enabled)','858118bf-794b-42c4-8266-dcf850963b34',NULL,NULL,NULL,NULL,NULL,NULL),('mail.smtp.starttls.enable','false','Set to true to enable TLS encryption, else set to false','e8ff4c62-8c15-46a3-8a3b-27890efcf57e',NULL,NULL,NULL,NULL,NULL,NULL),('mail.smtp_auth','false','true/false whether the smtp host requires authentication','ebe1af62-5e72-4c44-a044-955a9a8b29b4',NULL,NULL,NULL,NULL,NULL,NULL),('mail.smtp_host','localhost','SMTP host name','ea0625e2-9f64-40a6-9c32-6720772fd3d4',NULL,NULL,NULL,NULL,NULL,NULL),('mail.smtp_port','25','SMTP port','e77ee4de-13f1-4a7f-b41e-eb2f720cd49d',NULL,NULL,NULL,NULL,NULL,NULL),('mail.transport_protocol','smtp','Transport protocol for the messaging engine. Valid values: smtp','9fa39a09-2b7a-415c-877c-2308cb3caa12',NULL,NULL,NULL,NULL,NULL,NULL),('mail.user','test','Username of the SMTP user (if smtp_auth is enabled)','e0f2afbe-eff3-4787-960c-e61b56c0b00d',NULL,NULL,NULL,NULL,NULL,NULL),('metadatadeploy.mandatory','false','true/false whether or not the metadatadeploy module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','6b996f07-1020-406e-8a49-65e1cb4c27ae',NULL,NULL,NULL,NULL,NULL,NULL),('metadatadeploy.started','true','DO NOT MODIFY. true/false whether or not the metadatadeploy module has been started.  This is used to make sure modules that were running  prior to a restart are started again','139c3bee-a90c-4f94-a3aa-b4e2e1a3e135',NULL,NULL,NULL,NULL,NULL,NULL),('metadatamapping.addLocalMappings',NULL,'Specifies whether the concept mappings to the local dictionary should be created when exporting concepts','799f92cc-988f-4e5b-a957-6597bea16335',NULL,NULL,NULL,NULL,NULL,NULL),('metadatamapping.mandatory','false','true/false whether or not the metadatamapping module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','504d25d0-e4cd-485b-a197-79e3d04b7eac',NULL,NULL,NULL,NULL,NULL,NULL),('metadatamapping.started','true','DO NOT MODIFY. true/false whether or not the metadatamapping module has been started.  This is used to make sure modules that were running  prior to a restart are started again','53a2e3fa-f7a9-4df8-86ce-d3edcefda61f',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.enableOnTheFlyPackages','false','Specifies whether metadata packages can be exported on the fly','a5538690-ae44-46a5-a78e-e6fe0f14fa08',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.mandatory','false','true/false whether or not the metadatasharing module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','c52eb8ea-7603-4e90-b0fb-f490ea743f8a',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.persistIdsForClasses',NULL,'A comma separated list of class package/names that denotes classes to try and persist ids for. Common options: org.openmrs.Concept,org.openmrs.Form,org.openmrs.ConceptDatatype,org.openmrs.ConceptClass,org.openmrs.EncounterType,org.openmrs.IdentifierType,org.openmrs.RelationshipType,org.openmrs.Location','f0c8f12e-f54c-473d-8fa4-98e8ee071de7',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.preferredConceptSourceIds',NULL,'Comma-separated list of concept source Ids for preferred sources, in case an incoming concept \nhas duplicate mappings to any of these sources, no confirmation will be required unless its \ndatatype or concept class differs from that of the existing concept','e03bbfa4-1303-44fb-9f5e-1b0769ce5eea',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.started','true','DO NOT MODIFY. true/false whether or not the metadatasharing module has been started.  This is used to make sure modules that were running  prior to a restart are started again','f8b20351-5d77-45e0-9a3b-3197847a7f82',NULL,NULL,NULL,NULL,NULL,NULL),('metadatasharing.webservicesKey',NULL,'Key to grant access to remote systems to consume module webservices RESTfully','4607eb08-63bb-4805-ad30-82b70ab36d59',NULL,NULL,NULL,NULL,NULL,NULL),('minSearchCharacters','3','Number of characters user must input before searching is started.','3cf7f948-6543-446f-bf62-ed72789bef00',NULL,NULL,NULL,NULL,NULL,NULL),('module_repository_folder','modules','Name of the folder in which to store the modules','b2d12eb8-a129-43b3-9dd9-dc5460fee0bf',NULL,NULL,NULL,NULL,NULL,NULL),('newPatientForm.relationships',NULL,'Comma separated list of the RelationshipTypes to show on the new/short patient form.  The list is defined like \'3a, 4b, 7a\'.  The number is the RelationshipTypeId and the \'a\' vs \'b\' part is which side of the relationship is filled in by the user.','08136389-c093-49da-8e9a-c08121e07696',NULL,NULL,NULL,NULL,NULL,NULL),('new_patient_form.showRelationships','false','true/false whether or not to show the relationship editor on the addPatient.htm screen','63af8912-caaa-4500-b212-8c7c0cb70e6a','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('obs.complex_obs_dir','complex_obs','Default directory for storing complex obs.','4928b05f-2b64-4ea1-9947-245ff4825ca2',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.mandatory','false','true/false whether or not the openconceptlab module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','886d865f-6deb-4830-9c9c-d78d3e4a4d59',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.oclLoadAtStartupPath','/home/brian/openmrs/1/ocl/configuration/loadAtStartup',NULL,'18e2d598-b38f-4d43-bb15-36c896ce577e',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.scheduledDays',NULL,'Interval in days when the process is repeated','d4eaed3a-ae5a-4983-8d97-d121b8a9b1e1',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.scheduledTime',NULL,'The the time when the process should be carried on','3b8df95e-61f1-4ae4-9168-422ad4ef1741',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.started','true','DO NOT MODIFY. true/false whether or not the openconceptlab module has been started.  This is used to make sure modules that were running  prior to a restart are started again','d90b9f5a-9168-47c4-a84a-e48927d91790',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.subscriptionUrl',NULL,'The OCL subscription URL','6de329cc-e78c-45b6-848c-f58897bafbad',NULL,NULL,NULL,NULL,NULL,NULL),('openconceptlab.token',NULL,'The OCL API Token','22a1e54e-5409-44b8-9990-03cbb6ffa086',NULL,NULL,NULL,NULL,NULL,NULL),('order.drugDispensingUnitsConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible drug dispensing units','dc5e7f1a-d027-4585-a651-bdff5725e702',NULL,NULL,NULL,NULL,NULL,NULL),('order.drugDosingUnitsConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible drug dosing units','c82c080b-ea28-4dd1-9b0f-14f952029290',NULL,NULL,NULL,NULL,NULL,NULL),('order.drugRoutesConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible drug routes','8ebca23a-f0ce-4319-974c-96e4b0310d0f',NULL,NULL,NULL,NULL,NULL,NULL),('order.durationUnitsConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible duration units','2a30b7c4-4838-4967-b4aa-ee9f06a13517',NULL,NULL,NULL,NULL,NULL,NULL),('order.nextOrderNumberSeed','1','The next order number available for assignment','c0f7f659-928d-43a8-8ffc-4d8d816558c5',NULL,NULL,NULL,NULL,NULL,NULL),('order.orderNumberGeneratorBeanId',NULL,'Specifies spring bean id of the order generator to use when assigning order numbers','5ed5b381-a8e6-4451-a3b5-c5f3df561c92',NULL,NULL,NULL,NULL,NULL,NULL),('order.testSpecimenSourcesConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible test specimen sources','dc5ab54f-6b1d-4248-b66d-7251f0587867',NULL,NULL,NULL,NULL,NULL,NULL),('owa.appBaseUrl',NULL,'The base URL from where the Open Web Apps are hosted','8dbde1e1-02cf-4a36-8e4a-940a8da6b030',NULL,NULL,NULL,NULL,NULL,NULL),('owa.appFolderPath','/home/brian/openmrs/1/owa','The default location where the apps are stored on disk','84aebf72-47a1-4d7c-a0ab-d8425c51b030',NULL,NULL,NULL,NULL,NULL,NULL),('owa.appStoreUrl','http://modules.openmrs.org','The default URL for the OpenMRS appstore','1ee3a61a-8d1f-43ee-a5bc-6fae9f39e976',NULL,NULL,NULL,NULL,NULL,NULL),('owa.mandatory','false','true/false whether or not the owa module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','3c44c7ae-6bd6-4841-aa45-379ad8aab126',NULL,NULL,NULL,NULL,NULL,NULL),('owa.started','true','DO NOT MODIFY. true/false whether or not the owa module has been started.  This is used to make sure modules that were running  prior to a restart are started again','c9533539-de71-4cd9-9f23-ef1b2b187bdf',NULL,NULL,NULL,NULL,NULL,NULL),('patient.defaultPatientIdentifierValidator','org.openmrs.patient.impl.LuhnIdentifierValidator','This property sets the default patient identifier validator.  The default validator is only used in a handful of (mostly legacy) instances.  For example, it\'s used to generate the isValidCheckDigit calculated column and to append the string \"(default)\" to the name of the default validator on the editPatientIdentifierType form.','2fd23ac4-60f6-4ae3-9508-9c3f15d77e09',NULL,NULL,NULL,NULL,NULL,NULL),('patient.headerAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that will be shown on the patient dashboard','6c1c3e59-8576-43f2-9799-ed92752d8555',NULL,NULL,NULL,NULL,NULL,NULL),('patient.identifierPrefix',NULL,'This property is only used if patient.identifierRegex is empty.  The string here is prepended to the sql indentifier search string.  The sql becomes \"... where identifier like \'<PREFIX><QUERY STRING><SUFFIX>\';\".  Typically this value is either a percent sign (%) or empty.','6b578bf3-507c-43ed-b0aa-9ccd47a261b4',NULL,NULL,NULL,NULL,NULL,NULL),('patient.identifierRegex',NULL,'WARNING: Using this search property can cause a drop in mysql performance with large patient sets.  A MySQL regular expression for the patient identifier search strings.  The @SEARCH@ string is replaced at runtime with the user\'s search string.  An empty regex will cause a simply \'like\' sql search to be used. Example: ^0*@SEARCH@([A-Z]+-[0-9])?$','3b223d05-8864-4ef6-9ca9-212483a9645d',NULL,NULL,NULL,NULL,NULL,NULL),('patient.identifierSearchPattern',NULL,'If this is empty, the regex or suffix/prefix search is used.  Comma separated list of identifiers to check.  Allows for faster searching of multiple options rather than the slow regex. e.g. @SEARCH@,0@SEARCH@,@SEARCH-1@-@CHECKDIGIT@,0@SEARCH-1@-@CHECKDIGIT@ would turn a request for \"4127\" into a search for \"in (\'4127\',\'04127\',\'412-7\',\'0412-7\')\"','98307f49-4ff2-4380-8e5e-d92794bdf4cd',NULL,NULL,NULL,NULL,NULL,NULL),('patient.identifierSuffix',NULL,'This property is only used if patient.identifierRegex is empty.  The string here is prepended to the sql indentifier search string.  The sql becomes \"... where identifier like \'<PREFIX><QUERY STRING><SUFFIX>\';\".  Typically this value is either a percent sign (%) or empty.','1ff0ff33-44c3-41b2-9111-6b7d336b1581',NULL,NULL,NULL,NULL,NULL,NULL),('patient.listingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for patients in _lists_','b6603753-e0cd-45c8-9d78-e61b49a7efdd',NULL,NULL,NULL,NULL,NULL,NULL),('patient.nameValidationRegex','^[a-zA-Z \\-]+$','Names of the patients must pass this regex. Eg : ^[a-zA-Z \\-]+$ contains only english alphabet letters, spaces, and hyphens. A value of .* or the empty string means no validation is done.','17584323-1830-4059-a6ae-7aa8a34d9e50',NULL,NULL,NULL,NULL,NULL,NULL),('patient.viewingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for patients when _viewing individually_','1fad0bd5-8990-45a0-b1ea-b473672c4142',NULL,NULL,NULL,NULL,NULL,NULL),('patientIdentifierSearch.matchMode','EXACT','Specifies how patient identifiers are matched while searching for a patient. Valid values are \'EXACT, \'ANYWHERE\' or \'START\'. Defaults to \'EXACT\' if missing or invalid value is present.','642216d9-75b2-4fa4-9c98-f4936b318a53',NULL,NULL,NULL,NULL,NULL,NULL),('patientIdentifierTypes.locked','false','Set to a value of true if you do not want allow editing patient identifier types, else set to false.','231d1754-273b-4d59-be09-746f49dd2dc0',NULL,NULL,NULL,NULL,NULL,NULL),('patientSearch.matchMode','START','Specifies how patient names are matched while searching patient. Valid values are \'ANYWHERE\' or \'START\'. Defaults to start if missing or invalid value is present.','1d59658c-6421-4e40-aba8-246e843a78fd',NULL,NULL,NULL,NULL,NULL,NULL),('patient_identifier.importantTypes',NULL,'A comma delimited list of PatientIdentifier names : PatientIdentifier locations that will be displayed on the patient dashboard.  E.g.: TRACnet ID:Rwanda,ELDID:Kenya','f7169262-2dee-4e33-b344-8ce24e9e57c9',NULL,NULL,NULL,NULL,NULL,NULL),('person.attributeSearchMatchMode','EXACT','Specifies how person attributes are matched while searching person. Valid values are \'ANYWHERE\' or \'EXACT\'. Defaults to exact if missing or invalid value is present.','d358e642-a6d2-40f4-a45d-ea0daab0972a',NULL,NULL,NULL,NULL,NULL,NULL),('person.searchMaxResults','1000','The maximum number of results returned by patient searches','be882758-29f6-40ae-8755-45312ec9a976',NULL,NULL,NULL,NULL,NULL,NULL),('personAttributeTypes.locked','false','Set to a value of true if you do not want allow editing person attribute types, else set to false.','4181d251-8169-467d-9fcc-04133cb17a8c',NULL,NULL,NULL,NULL,NULL,NULL),('provider.unknownProviderUuid',NULL,'Specifies the uuid of the Unknown Provider account','7ec3e81e-310d-478a-b5a0-8a2a5de30dad',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.addressWidget','personAddress','Address widget to use throughout the module','23422b62-4118-4189-a5c9-4f80a3f02167',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.advancedSearchPersonAttributeType',NULL,'Person attribute type, specified by uuid, to use as a search field on the advanced search page','3115795b-ce2c-4dae-b807-15b80e3a1418',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.historicalPatientListDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender|Start Date:relationship.startDate|End Date:relationship.endDate','Fields to display in the historical patient lists; specified as a pipe-delimited list of label/field pairs','02bbdfee-0208-45b3-a03e-8ea89d9f6f60',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.historicalProviderListDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender|Start Date:relationship.startDate|End Date:relationship.endDate','Fields to display in the historical provider lists; specified as a pipe-delimited list of label/field pairs','e35ffdad-4cb4-465c-810d-8480ca835fcb',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.locationTag',NULL,'Indicates the Health Facility location to which a provider could be assigned to.','a461aaa7-fe0f-4d3d-bb0f-c27439c7b385',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.mandatory','false','true/false whether or not the providermanagement module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','723c2716-eaeb-442f-8761-7775cb755da3',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.patientListDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender|Start Date:relationship.startDate','Fields to display in the patient lists; specified as a pipe-delimited list of label/field pairs','b980992b-ee4b-4556-b953-97ef175b0521',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.patientSearchDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender','Fields to display in the patient search results; specified as a pipe-delimited list of label/field pairs','054ec52f-1159-48d3-87b0-3f522eb12852',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.personAttributeTypes',NULL,'Person attributes to display on the provider dashboard; specified as a pipe-delimited list of person attribute type uuids','eb12f21e-8b86-4f03-954d-0395f56e638d',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.personSearchDisplayFields','Given Name:person.personName.givenName|Family Name:person.personName.familyName|Age:person.age|Gender:person.gender','Fields to display in the person search results; specified as a pipe-delimited list of label/field pairs','c04fc4c4-e2d7-4b7d-8cf7-4f037b99fa39',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.providerListDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender|Start Date:relationship.startDate','Fields to display in the provider lists; specified as a pipe-delimited list of label/field pairs','49f00269-c987-43da-8b11-ba6454973ce7',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.providerSearchDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender','Fields to display in the provider search results; specified as a pipe-delimited list of label/field pairs','d36f41fd-b86c-496b-ae8c-f86ebad955ec',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.restrictedRoles',NULL,'Comma delimited list of UUIDs indicating the only Provider Roles to be available via the UI.','5523d95c-97cb-4253-9a03-b003c8637e95',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.restrictSearchToProvidersWithProviderRoles','false','True/false whether to restrict providers to those with roles','5fdb08a2-a644-4a9a-ae16-ee92802f5b7b',NULL,NULL,NULL,NULL,NULL,NULL),('providermanagement.started','true','DO NOT MODIFY. true/false whether or not the providermanagement module has been started.  This is used to make sure modules that were running  prior to a restart are started again','aab37ea2-e059-4f0d-8f65-d5b5b58cbb5f',NULL,NULL,NULL,NULL,NULL,NULL),('providerSearch.matchMode','EXACT','Specifies how provider identifiers are matched while searching for providers. Valid values are START,EXACT, END or ANYWHERE','133da7b6-316c-4f01-bb8a-8983f4f73b2a',NULL,NULL,NULL,NULL,NULL,NULL),('referenceapplication.mandatory','false','true/false whether or not the referenceapplication module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','58a0401c-5cc1-49b2-9c4c-d4c049808658',NULL,NULL,NULL,NULL,NULL,NULL),('referenceapplication.started','false','DO NOT MODIFY. true/false whether or not the referenceapplication module has been started.  This is used to make sure modules that were running  prior to a restart are started again','997d87f1-b419-46cf-9e3c-82eb8c935ed2',NULL,NULL,NULL,NULL,NULL,NULL),('referencedemodata.mandatory','false','true/false whether or not the referencedemodata module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','9f7b5fc9-0f1a-458e-a1fb-657d1e42feb5',NULL,NULL,NULL,NULL,NULL,NULL),('referencedemodata.started','true','DO NOT MODIFY. true/false whether or not the referencedemodata module has been started.  This is used to make sure modules that were running  prior to a restart are started again','1735720a-cb86-4245-87e8-1f85225d9564',NULL,NULL,NULL,NULL,NULL,NULL),('referencemetadata.mandatory','false','true/false whether or not the referencemetadata module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','dd42d9ed-21b8-427c-b488-f35c4c43d7dd',NULL,NULL,NULL,NULL,NULL,NULL),('referencemetadata.started','true','DO NOT MODIFY. true/false whether or not the referencemetadata module has been started.  This is used to make sure modules that were running  prior to a restart are started again','2b68579e-981a-46fd-8566-cd14a774f557',NULL,NULL,NULL,NULL,NULL,NULL),('registrationapp.mandatory','false','true/false whether or not the registrationapp module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7dd7e308-dab5-4f4d-a0d0-d42769afc68f',NULL,NULL,NULL,NULL,NULL,NULL),('registrationapp.paperRecordIdentifierDefinition','paperrecord.patientDataDefinition.paperRecordIdentifier','Report Definition to retrieve the paper record identifier for a patient; default comes from paper record module','8b0c90e5-360f-4b29-9e8a-179cfaaa5e61',NULL,NULL,NULL,NULL,NULL,NULL),('registrationapp.started','true','DO NOT MODIFY. true/false whether or not the registrationapp module has been started.  This is used to make sure modules that were running  prior to a restart are started again','681a47d4-1cfd-47bc-aebf-23d9424a8bb1',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.application.name','openmrs','Specify the application name e.g openmrs, amrs','2867ba6d-dea5-4954-a012-ceb64d4bcde5',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.biometrics.implementation',NULL,'Which Biometrics engine implementation to should we connect to?\nSpecify a Spring bean name, or leave blank to disable','a27fa253-34c8-4e22-9fc6-6df9ddb2f338',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.birthdateEstimationStartMonth','0','The month from which the birth date is estimated, with January having a value of 0','e121f535-994b-4f1b-bf00-182630151328',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.familyNameAutoSuggestList',NULL,'A comma separated list of common names to auto suggest for the family name field, when registering patients.','df8edcdc-c0e9-45fa-81af-1440f98ad54a',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.fastSimilarPatientSearchAlgorithm','registrationcore.BasicSimilarPatientSearchAlgorithm','Specifies a bean used for the fast similar patient search algorithm.','eb588d70-6782-47dd-a7f9-7521af57d71f',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.givenNameAutoSuggestList',NULL,'A comma separated list of common names to auto suggest for the given name field, when registering patients.','2f3e1d5a-ef50-478e-9f69-1bfc922348b5',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.identifierSourceId','1','Specifies the identifier source to use when generating patient identifiers','349787f8-6235-45fa-bc7d-8771f795ad64',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.local_mpi_identifierTypeMap.OpenEMPI ID','a5d38e09-efcb-4d91-a526-50ce1ba5011a:2.16.840.1.113883.4.357:hl7','Specifies the mapping from OpenEMPI Object ID (OID) to the local OpenMRS Application\'s identifier for OpenEMPI ID UUID.\nOpenEMPI ID is the default Global Identifier Domain (GID) for OpenEMPI but this can be changed.','48303a25-7ce8-4769-bac0-266f04a1e084',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.local_mpi_identifierTypeMap.OpenMRS ID','05a29f94-c0ed-11e2-94be-8c13b969e334:2.25.71280592878078638113873461180761116318:PI','Specifies the mapping from OpenEMPI Object ID (OID) to the local OpenMRS Application\'s identifier for OpenMRS ID UUID.\nOpenMRS ID is the default generated identifier for OpenMRS but this can be changed.','c1428a7a-f6b5-4d9a-89d8-f5f5c21b9851',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mandatory','false','true/false whether or not the registrationcore module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7a19bb5f-7eb9-4070-b305-828e1b9ab4c5',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.Hl7implementation','registrationcore.mpiHl7v2HttpSender','Specifies which bean should be used to send the Hl7 Message. Current options are:\n\"registrationcore.mpiHl7v2HttpSender\", \"registrationcore.mpiHl7v2MllpSender\".','a9cde9b6-e9d4-46ab-a2be-acfe3bd825bf',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.implementation',NULL,'Which MPI to should we connect to? Specify a Spring bean name, or leave blank to disable MPI integration. Options include:\n\"registrationcore.mpi.implementation.PixPdq\", \"registrationcore.mpi.implementation.OpenEMPI\".','b44192b3-0b0f-46cd-b8bf-e84bdf451600',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pdq.errorHandler.implementation',NULL,'Specify a Spring bean name of PDQ error handler service. It requires the xds-sender module and outgoing message\nexception module developed by SolDevelo. Set value to \"outgoingmessageexceptions.PdqErrorHandlingService\" and\ninstall those two modules to enable pix error handling functionality.','0a46181f-5240-4aef-a7f7-5e17a209abc4',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pdqEndpoint','http://localhost:5001/pdq','Specifies endpoint for Hl7 PDQ Message','6dd1857b-ddea-4196-8b19-f8cc2474ba5b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pdqIdentifierTypeUuidList','05a29f94-c0ed-11e2-94be-8c13b969e334,a5d38e09-efcb-4d91-a526-50ce1ba5011a','Specifies the list of identifiers to send in a PDQ query to get patient data from the MPI. Takes a list of UUID of patient identifier types - separate them with commas.\nUUIDs can be found in the patient_identifier_type database table.','688544d0-776e-4649-a1cf-56948a2abda3',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pdqPort','3600','Specifies port for Hl7 PDQ Message','1e7700aa-fd45-46c2-bc82-897b0dc1c188',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.personIdentifierTypeUuid','a5d38e09-efcb-4d91-a526-50ce1ba5011a','Specifies UUID of the identifier type that is used as the Global Identifier Domain (GID) in the MPI.\nIt is generated by the MPI and is persisted in OpenMRS.','dd5762e9-0d71-4d02-9f8e-4e7ff3526c0b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pix.errorHandler.implementation',NULL,'Specify a Spring bean name of PIX error handler service. It requires the xds-sender module and outgoing message\nexception module developed by SolDevelo. Set value to \"outgoingmessageexceptions.PixErrorHandlingService\" and\ninstall those two modules to enable pix error handling functionality.','70975d8b-dce6-408b-9153-2a334caffb0b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pixEndpoint','http://localhost:5001/pix','Specifies the endpoint for the Hl7 PIX Message','1cba4f87-d992-4a91-8cc2-3a5720f54acf',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pixIdentifierTypeUuidList','05a29f94-c0ed-11e2-94be-8c13b969e334,a5d38e09-efcb-4d91-a526-50ce1ba5011a','Specifies the list of identifiers to send in a PIX query to save the patient in the MPI. Takes a list of UUID of patient identifier types - separate them with commas.\nUUIDs can be found in the patient_identifier_type database table.','ae907026-e6fa-4dda-8158-e7fee2f587e5',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.pixPort','3700','Specifies port for Hl7 PIX Message','32a17c97-2593-41ae-86e2-eb951f51c251',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.receivingApplication',NULL,'Specifies the receiving application in the MSH header section of the HL7 message','138d2904-81c2-464f-b440-97300e45fe7b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.receivingFacility',NULL,'Specifies sending Facility in the MSH header section of the HL7 message','1ffcea97-bb9e-4978-b7d1-f6ad830ea03d',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.sendingApplication','OpenMRS','Specifies the sending application in the MSH header section of the HL7 message','74d89c15-96f1-4700-ab97-3ea7489a4571',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.sendingFacility',NULL,'Specifies sending Facility in the MSH header section of the HL7 message','0be5e2b3-3864-4edc-abfc-c8d7ec5e343b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.mpi.url',NULL,'Specifies url to MPI server. (GSOC OpenEMPI Specific Implementation)','6bf68150-c0bb-4171-9152-2311c5895b21',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.openempi.enableProbabilisticMatching','false','Specifies if probability matching should be used (GSOC OpenEMPI Specific Implementation)','f1ac8700-f813-4eab-a967-6419189b6f8b',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.openempi.globalIdentifierDomainId',NULL,'Specifies main identifier on MPI server (e.g. \"xyz\" for OpenEMPI) (GSOC OpenEMPI Specific Implementation)','f9b021bf-5417-4d58-9a9f-4105f1518657',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.openmrsIdentifier.uuid','05a29f94-c0ed-11e2-94be-8c13b969e334','UUID of the OpenMRS identifier that will be generated during MPI import unless it is present. By default set to the UUID of OpenMRS ID.\nNote: You have to have a Patient Identifier Source correctly configured and stored in the global property identifierSourceId','e0956a1a-5c4d-4306-bd1b-565ad2aa15ce',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.patientNameSearch','registrationcore.ExistingPatientNameSearch','Specifies a bean used for the auto suggest name feature.','9e84cb38-5b0b-4829-a276-6e4347e74b2a',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.preciseSimilarPatientSearchAlgorithm','registrationcore.BasicExactPatientSearchAlgorithm','Specifies a bean used for the precise similar patient search algorithm.','8dac47f4-a914-44b4-aec9-052080ed1a12',NULL,NULL,NULL,NULL,NULL,NULL),('registrationcore.started','true','DO NOT MODIFY. true/false whether or not the registrationcore module has been started.  This is used to make sure modules that were running  prior to a restart are started again','314769d1-2b13-447c-b56e-402b169c0b18',NULL,NULL,NULL,NULL,NULL,NULL),('report.deleteReportsAgeInHours','72','Reports that are not explicitly saved are deleted automatically when they are this many hours old. (Values less than or equal to zero means do not delete automatically)','6cd18eb4-fda0-4d05-bc98-496c7bf05b04',NULL,NULL,NULL,NULL,NULL,NULL),('report.xmlMacros',NULL,'Macros that will be applied to Report Schema XMLs when they are interpreted. This should be java.util.properties format.','dc59defa-9dd1-4232-90ae-0e577f1fd61f',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.dataEvaluationBatchSize','-1','This determines whether to run evaluators for Data in batches and what the size of those batches should be.\nA value of less than or equal to 0 indicates that no batching is desired.','b360580e-ef7c-4b47-87a5-6a8b8103b0e3',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.defaultDateFormat','dd/MMM/yyyy','Default date format to use when formatting report data','c6bd13a5-e1e5-4d01-abfe-d77889dcec37',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.defaultLocale','en','Default locale to use when formatting report data','6ffeb855-4d08-4f6d-9f9b-062519d66ed0',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.evaluationLoggerEnabled','false','If false, will disable the built in use of the evaluation logger to log evaluation information for performance diagnostics','355f0143-cf05-409d-99a4-fd40db3971f6',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.includeDataExportsAsDataSetDefinitions','false','If reportingcompatibility is installed, this indicates whether data exports should be exposed as Dataset Definitions','b12ad57b-5fd9-4c3b-ae78-ff6ab7817d66',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.loadReportsFromConfigurationAtStartup','false','If true, this will automatically load reports defined by report descriptors in .OpenMRS/configuration/reports/reportdescriptors at startup','54ff0f40-d2e6-4175-97cb-ffebccc069f9',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.mandatory','false','true/false whether or not the reporting module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','07871652-02f1-4bed-873a-91d9609aad68',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.maxCachedReports','10','The maximum number of reports whose underlying data and output should be kept in the cache at any one time','53f4e4c2-3b17-4beb-9c6a-439004f0f687',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.maxReportsToRun','1','The maximum number of reports that should be processed at any one time','cb534edd-dd69-49a2-bfa3-d4966921cdd5',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.preferredIdentifierTypes',NULL,'Pipe-separated list of patient identifier type names, which should be displayed on default patient datasets','bf2aa50b-e5c3-4255-9a46-fb5d8aa68b4d',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.runReportCohortFilterMode','showIfNull','Supports the values hide,showIfNull,show which determine whether the cohort selector should be available in the run report page','7ed2e648-cfd8-47db-8bc7-26418caef6f5',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.started','true','DO NOT MODIFY. true/false whether or not the reporting module has been started.  This is used to make sure modules that were running  prior to a restart are started again','1d8b0bcb-640c-4116-b9ee-600055d1f413',NULL,NULL,NULL,NULL,NULL,NULL),('reporting.testPatientsCohortDefinition',NULL,'Points to a cohort definition representing all test/fake patients that you want to exclude from all queries and reports. You may set this to the UUID of a saved cohort definition, or to \"library:keyInADefinitionLibrary\"','ae16cdff-6f6b-4084-a0ce-b75292edcd0c',NULL,NULL,NULL,NULL,NULL,NULL),('reportingcompatibility.data_export_batch_size','7500','The number of patients to export at a time in a data export.  The larger this number the faster and more memory that is used.  The smaller this number the slower and less memory is used.','850cc75b-c1dd-49ee-8096-553caedcec92',NULL,NULL,NULL,NULL,NULL,NULL),('reportingcompatibility.mandatory','false','true/false whether or not the reportingcompatibility module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','5cc01a0b-51dc-4c9d-a7a7-cfaf0e9e55eb',NULL,NULL,NULL,NULL,NULL,NULL),('reportingcompatibility.patientLinkUrl','patientDashboard.form','The link url for a particular patient to view from the cohort builder','93bc2269-0fcd-4155-990c-3595bff4fc68',NULL,NULL,NULL,NULL,NULL,NULL),('reportingcompatibility.started','true','DO NOT MODIFY. true/false whether or not the reportingcompatibility module has been started.  This is used to make sure modules that were running  prior to a restart are started again','3718c93b-2051-4672-87cc-8d586ef4dfcb',NULL,NULL,NULL,NULL,NULL,NULL),('reportingrest.mandatory','false','true/false whether or not the reportingrest module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','edf9f4ae-4146-45b7-937f-89a8c7f93e65',NULL,NULL,NULL,NULL,NULL,NULL),('reportingrest.started','true','DO NOT MODIFY. true/false whether or not the reportingrest module has been started.  This is used to make sure modules that were running  prior to a restart are started again','9c7413b0-8f70-4958-898e-d61dd13f23e9',NULL,NULL,NULL,NULL,NULL,NULL),('reportingui.mandatory','false','true/false whether or not the reportingui module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','af76ede4-8a37-4730-bffa-86f9e6b00952',NULL,NULL,NULL,NULL,NULL,NULL),('reportingui.started','true','DO NOT MODIFY. true/false whether or not the reportingui module has been started.  This is used to make sure modules that were running  prior to a restart are started again','0710915a-738d-41ad-8046-41b07ede3e30',NULL,NULL,NULL,NULL,NULL,NULL),('reportProblem.url','http://errors.openmrs.org/scrap','The openmrs url where to submit bug reports','9d004ee7-31dc-4a39-a32e-9ce497f53f01',NULL,NULL,NULL,NULL,NULL,NULL),('scheduler.password','test','Password for the OpenMRS user that will perform the scheduler activities','05c6367e-64cb-47e9-82d3-f9209bb18ede',NULL,NULL,NULL,NULL,NULL,NULL),('scheduler.username','admin','Username for the OpenMRS user that will perform the scheduler activities','3cd95dc8-7d76-4267-a8be-6e14387461d3',NULL,NULL,NULL,NULL,NULL,NULL),('search.caseSensitiveDatabaseStringComparison','true','Indicates whether database string comparison is case sensitive or not. Setting this to false for MySQL with a case insensitive collation improves search performance.','63d90362-4500-4380-9507-fbb878014656',NULL,NULL,NULL,NULL,NULL,NULL),('search.indexVersion','7','Indicates the index version. If it is blank, the index needs to be rebuilt.','98c528a3-83e2-453e-bb11-524a1ed40080',NULL,NULL,NULL,NULL,NULL,NULL),('searchWidget.batchSize','200','The maximum number of search results that are returned by an ajax call','d5ae5616-4e21-4bc9-8722-d531da74a1b4',NULL,NULL,NULL,NULL,NULL,NULL),('searchWidget.dateDisplayFormat',NULL,'Date display format to be used to display the date somewhere in the UI i.e the search widgets and autocompletes','5ca6cf2e-d27e-45bf-ad2b-649c74f39861',NULL,NULL,NULL,NULL,NULL,NULL),('searchWidget.maximumResults','2000','Specifies the maximum number of results to return from a single search in the search widgets','26c56604-cf39-42b2-8be3-269ced77b8a8',NULL,NULL,NULL,NULL,NULL,NULL),('searchWidget.runInSerialMode','false','Specifies whether the search widgets should make ajax requests in serial or parallel order, a value of true is appropriate for implementations running on a slow network connection and vice versa','1938204f-b352-4b63-b398-b0d3afb69035','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('searchWidget.searchDelayInterval','400','Specifies time interval in milliseconds when searching, between keyboard keyup event and triggering the search off, should be higher if most users are slow when typing so as to minimise the load on the server','91ac48d0-37e4-4749-bcfc-e824e56a623c',NULL,NULL,NULL,NULL,NULL,NULL),('security.allowedFailedLoginsBeforeLockout','7','Maximum number of failed logins allowed after which username is locked out','b6d1b75a-ef70-4e93-b603-c7966357629d',NULL,NULL,NULL,NULL,NULL,NULL),('security.passwordCannotMatchUsername','true','Configure whether passwords must not match user\'s username or system id','76cfa33c-7dc7-47b3-a94a-81fc48f4e381','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('security.passwordCustomRegex',NULL,'Configure a custom regular expression that a password must match','82813b08-93f5-47fd-b692-ed13bd14649a',NULL,NULL,NULL,NULL,NULL,NULL),('security.passwordMinimumLength','8','Configure the minimum length required of all passwords','881dabb8-7771-42d9-811e-8522bace053c',NULL,NULL,NULL,NULL,NULL,NULL),('security.passwordRequiresDigit','true','Configure whether passwords must contain at least one digit','7c8d4bed-ce26-4d94-9a92-057421faa075','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('security.passwordRequiresNonDigit','true','Configure whether passwords must contain at least one non-digit','3159818d-bbaa-44d7-8d0d-2ab0dc4d096c','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('security.passwordRequiresUpperAndLowerCase','true','Configure whether passwords must contain both upper and lower case characters','21b14091-c640-41d4-8a6f-a8517884c0cc','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('security.validTime','600000','Specifies the duration of time in seconds for which a password reset token is valid, the default value is 10 minutes and the allowed values range from 1 minute to 12hrs','f0c87755-fecb-4eed-ad39-291464635f27',NULL,NULL,NULL,NULL,NULL,NULL),('serialization.xstream.mandatory','false','true/false whether or not the serialization.xstream module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','0cba6496-0544-4f9d-98bd-007cbf83f883',NULL,NULL,NULL,NULL,NULL,NULL),('serialization.xstream.started','true','DO NOT MODIFY. true/false whether or not the serialization.xstream module has been started.  This is used to make sure modules that were running  prior to a restart are started again','47d44ff8-2212-48e5-a48f-6c7bafeb24d9',NULL,NULL,NULL,NULL,NULL,NULL),('spa.baseUrl','/spa','The base URL or path at which to serve the Frontend 3.0 application','a18d6165-2bcb-4950-84a4-d643f564f686',NULL,NULL,NULL,NULL,NULL,NULL),('spa.local.directory','frontend','The directory containing the Frontend 3.0 application\'s `index.html`. Can be an absolute path, or relative to the application data directory. Only used if `spa.remote.enabled` is false.','8447a29d-cd6d-496b-abd5-a3b42933fbf8',NULL,NULL,NULL,NULL,NULL,NULL),('spa.mandatory','false','true/false whether or not the spa module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','162a06a7-ce64-49e9-bd68-ac034fa03cf3',NULL,NULL,NULL,NULL,NULL,NULL),('spa.remote.enabled','false','If enabled, serves from `spa.remote.url` instead of `spa.local.directory`','100839d0-5435-409e-969e-95fa44986c33',NULL,NULL,NULL,NULL,NULL,NULL),('spa.remote.url','https://spa-modules.nyc3.digitaloceanspaces.com/@openmrs/esm-app-shell/latest/','The URL of the Frontend 3.0 application files. Only used if `spa.remote.enabled` is true.','ca7d9432-db37-4626-b130-3b458aefd542',NULL,NULL,NULL,NULL,NULL,NULL),('spa.started','true','DO NOT MODIFY. true/false whether or not the spa module has been started.  This is used to make sure modules that were running  prior to a restart are started again','84c419a4-afe7-4560-958a-8c583942c3ce',NULL,NULL,NULL,NULL,NULL,NULL),('timezone.conversions','false','When set to true dates are sent from the server to the client as UTC dates and parsed from the client to the server as holding the client timezone information.','3970c32e-4043-40a5-8484-b83ac6f2e89d',NULL,NULL,NULL,NULL,NULL,NULL),('uicommons.mandatory','false','true/false whether or not the uicommons module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','31235e2d-7670-43f4-b902-22731106f7f1',NULL,NULL,NULL,NULL,NULL,NULL),('uicommons.started','true','DO NOT MODIFY. true/false whether or not the uicommons module has been started.  This is used to make sure modules that were running  prior to a restart are started again','1131c930-bf72-4800-8821-e5412a65cad0',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.client.timezone','clientTimezone','The name of the user property that save the client timezone.','bfdfbd68-788c-4216-bcc1-2c81f8a3d5e7',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.formatter.dateAndTimeFormat','dd.MMM.yyyy, HH:mm:ss','Format used by UiUtils.format for dates that have a time component','2f6c5b14-142b-47d7-a2b3-3d606a416f3c',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.formatter.dateFormat','dd.MMM.yyyy','Format used by UiUtils.format for dates that do not have a time component','6320db89-b088-4ecc-9a62-279daab821dc',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.formatter.JSdateAndTimeFormat','DD.MMM.YYYY, HH:mm:ss','Format used by Javascript functions for dates that have a time component','0e53614a-d6b3-4be0-a2a7-258df6d6722d',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.formatter.JSdateFormat','DD.MMM.YYYY','Format used by Javascript for dates that do not have a time component','3cb7cdc9-0f08-4eb0-9609-509aedbbf261',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.formatter.timeFormat','HH:mm:ss','Format used by UiUtils.format for time only.','e11835c1-dbb4-4067-902c-9df602c8907d',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.mandatory','false','true/false whether or not the uiframework module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7db23b82-8c3f-4ce9-99cf-2cc193b9cc4c',NULL,NULL,NULL,NULL,NULL,NULL),('uiframework.started','true','DO NOT MODIFY. true/false whether or not the uiframework module has been started.  This is used to make sure modules that were running  prior to a restart are started again','c975b7a3-d3eb-463e-bea4-a60c7528b0cd',NULL,NULL,NULL,NULL,NULL,NULL),('uilibrary.mandatory','false','true/false whether or not the uilibrary module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','6f81fbdf-dc58-4161-a139-c2b84168c87f',NULL,NULL,NULL,NULL,NULL,NULL),('uilibrary.started','true','DO NOT MODIFY. true/false whether or not the uilibrary module has been started.  This is used to make sure modules that were running  prior to a restart are started again','e4766d9e-0a90-4a29-baec-5ab7c5127441',NULL,NULL,NULL,NULL,NULL,NULL),('user.headerAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that will be shown on the user dashboard. (not used in v1.5)','d0fecc90-8778-49db-9b4e-91904de31d23',NULL,NULL,NULL,NULL,NULL,NULL),('user.listingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for users in _lists_','63245d29-3cef-479d-9d73-f05b3da47a2f',NULL,NULL,NULL,NULL,NULL,NULL),('user.requireEmailAsUsername','false','Indicates whether a username must be a valid e-mail or not.','540381e5-3afa-45ad-8c2a-0ff633144bcb','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('user.viewingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for users when _viewing individually_','227c8088-9abb-4733-b7ad-3c22aead471c',NULL,NULL,NULL,NULL,NULL,NULL),('use_patient_attribute.healthCenter','false','Indicates whether or not the \'health center\' attribute is shown when viewing/searching for patients','9927c961-e6b9-40d9-9336-6fcfa0c6c86a','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('use_patient_attribute.mothersName','false','Indicates whether or not mother\'s name is able to be added/viewed for a patient','c45dcb53-fc73-4cbf-9ec7-08d74f86d539','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('validation.disable','false','Disables validation of OpenMRS Objects. Only takes affect on next restart. Warning: only do this is you know what you are doing!','77dd550a-cc64-42f4-b383-8bf118510db7',NULL,NULL,NULL,NULL,NULL,NULL),('visits.allowOverlappingVisits','true','true/false whether or not to allow visits of a given patient to overlap','36e81cc3-fa37-4d77-a428-8d5835ae9a72','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('visits.assignmentHandler','org.openmrs.module.emrapi.adt.EmrApiVisitAssignmentHandler','Set to the name of the class responsible for assigning encounters to visits.','2c62d60f-81cf-4f60-85b4-0b424c241b31',NULL,NULL,NULL,NULL,NULL,NULL),('visits.autoCloseVisitType',NULL,'comma-separated list of the visit type(s) to automatically close','58736730-6f18-4c6f-8d0e-9baf5a102f39',NULL,NULL,NULL,NULL,NULL,NULL),('visits.enabled','true','Set to true to enable the Visits feature. This will replace the \'Encounters\' tab with a \'Visits\' tab on the dashboard.','e7259c7d-94a1-4b38-a6a4-4f59e1f7e9e1','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),('visits.encounterTypeToVisitTypeMapping',NULL,'Specifies how encounter types are mapped to visit types when automatically assigning encounters to visits. e.g 1:1, 2:1, 3:2 in the format encounterTypeId:visitTypeId or encounterTypeUuid:visitTypeUuid or a combination of encounter/visit type uuids and ids e.g 1:759799ab-c9a5-435e-b671-77773ada74e4','76333113-1e10-410e-9537-595110c6ce2f',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.allowedips',NULL,'A comma-separate list of IP addresses that are allowed to access the web services. An empty string allows everyone to access all ws. \n        IPs can be declared with bit masks e.g. 10.0.0.0/30 matches 10.0.0.0 - 10.0.0.3 and 10.0.0.0/24 matches 10.0.0.0 - 10.0.0.255.','df36a6d3-4c16-47bd-bb75-d41041664b22',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.mandatory','false','true/false whether or not the webservices.rest module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','f54925b9-daf6-4f01-bd0d-3acfe1f00a25',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.maxResultsAbsolute','100','The absolute max results limit. If the client requests a larger number of results, then will get an error','22d08397-041a-4e10-ad4f-78b96cf6b83f',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.maxResultsDefault','50','The default max results limit if the user does not provide a maximum when making the web service call.','b9cb54a1-4386-4d18-9e45-5bd1859c28e2',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.quietDocs','true','If the value of this setting is \"true\", then nothing is logged while the Swagger specification is being generated.','b43a66ed-01ff-4a52-8105-fa6316a5a82d',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.started','true','DO NOT MODIFY. true/false whether or not the webservices.rest module has been started.  This is used to make sure modules that were running  prior to a restart are started again','cf819720-10ee-4d9e-b21c-a1188182e3fc',NULL,NULL,NULL,NULL,NULL,NULL),('webservices.rest.uriPrefix',NULL,'The URI prefix through which clients consuming web services will connect to the web application, should be of the form http://{ipAddress}:{port}/{contextPath}','9bedbdc6-5a3a-41c5-9432-6059f3f2aabc',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `global_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_archive`
--

DROP TABLE IF EXISTS `hl7_in_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_archive` (
  `hl7_in_archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` varchar(255) DEFAULT NULL,
  `hl7_data` text NOT NULL,
  `date_created` datetime NOT NULL,
  `message_state` int(11) DEFAULT '2',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_archive_id`),
  UNIQUE KEY `hl7_in_archive_uuid_index` (`uuid`),
  KEY `hl7_in_archive_message_state_idx` (`message_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_archive`
--

LOCK TABLES `hl7_in_archive` WRITE;
/*!40000 ALTER TABLE `hl7_in_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_error`
--

DROP TABLE IF EXISTS `hl7_in_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_error` (
  `hl7_in_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `error` varchar(255) NOT NULL DEFAULT '',
  `error_details` mediumtext,
  `date_created` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_error_id`),
  UNIQUE KEY `hl7_in_error_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_error`
--

LOCK TABLES `hl7_in_error` WRITE;
/*!40000 ALTER TABLE `hl7_in_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_queue`
--

DROP TABLE IF EXISTS `hl7_in_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_queue` (
  `hl7_in_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `message_state` int(11) NOT NULL DEFAULT '0',
  `date_processed` datetime DEFAULT NULL,
  `error_msg` text,
  `date_created` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_queue_id`),
  UNIQUE KEY `hl7_in_queue_uuid_index` (`uuid`),
  KEY `hl7_source_with_queue` (`hl7_source`),
  CONSTRAINT `hl7_source_with_queue` FOREIGN KEY (`hl7_source`) REFERENCES `hl7_source` (`hl7_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_queue`
--

LOCK TABLES `hl7_in_queue` WRITE;
/*!40000 ALTER TABLE `hl7_in_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_source`
--

DROP TABLE IF EXISTS `hl7_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_source` (
  `hl7_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_source_id`),
  UNIQUE KEY `hl7_source_uuid_index` (`uuid`),
  KEY `user_who_created_hl7_source` (`creator`),
  CONSTRAINT `user_who_created_hl7_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_source`
--

LOCK TABLES `hl7_source` WRITE;
/*!40000 ALTER TABLE `hl7_source` DISABLE KEYS */;
INSERT INTO `hl7_source` VALUES (1,'LOCAL','',1,'2006-09-01 00:00:00','8d6b8bb6-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `hl7_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlformentry_html_form`
--

DROP TABLE IF EXISTS `htmlformentry_html_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlformentry_html_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `xml_data` mediumtext NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlformentry_html_form_uuid_index` (`uuid`),
  KEY `User who created htmlformentry_htmlform` (`creator`),
  KEY `Form with which this htmlform is related` (`form_id`),
  KEY `User who changed htmlformentry_htmlform` (`changed_by`),
  KEY `user_who_retired_html_form` (`retired_by`),
  CONSTRAINT `Form with which this htmlform is related` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `User who changed htmlformentry_htmlform` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `User who created htmlformentry_htmlform` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_html_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlformentry_html_form`
--

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlformentry_html_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_auto_generation_option`
--

DROP TABLE IF EXISTS `idgen_auto_generation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_auto_generation_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier_type` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `manual_entry_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `automatic_generation_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `location` int(11) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idgen_auto_generation_option_uuid_index` (`uuid`),
  KEY `source for idgen_auto_generation_option` (`source`),
  KEY `location_for_auto_generation_option` (`location`),
  KEY `identifier_type for idgen_auto_generation_option` (`identifier_type`),
  CONSTRAINT `identifier_type for idgen_auto_generation_option` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `location_for_auto_generation_option` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `source for idgen_auto_generation_option` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_auto_generation_option`
--

LOCK TABLES `idgen_auto_generation_option` WRITE;
/*!40000 ALTER TABLE `idgen_auto_generation_option` DISABLE KEYS */;
INSERT INTO `idgen_auto_generation_option` VALUES (1,4,1,0,1,NULL,'7225bb42-acef-45a3-b618-1ce20418194a');
/*!40000 ALTER TABLE `idgen_auto_generation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_id_pool`
--

DROP TABLE IF EXISTS `idgen_id_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_id_pool` (
  `id` int(11) NOT NULL,
  `source` int(11) DEFAULT NULL,
  `batch_size` int(11) DEFAULT NULL,
  `min_pool_size` int(11) DEFAULT NULL,
  `sequential` tinyint(1) NOT NULL DEFAULT '0',
  `refill_with_scheduled_task` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `source for idgen_id_pool` (`source`),
  CONSTRAINT `id for idgen_id_pool` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`),
  CONSTRAINT `source for idgen_id_pool` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_id_pool`
--

LOCK TABLES `idgen_id_pool` WRITE;
/*!40000 ALTER TABLE `idgen_id_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_id_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_identifier_source`
--

DROP TABLE IF EXISTS `idgen_identifier_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_identifier_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `identifier_type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator for idgen_identifier_source` (`creator`),
  KEY `retired_by for idgen_identifier_source` (`retired_by`),
  KEY `changed_by for idgen_identifier_source` (`changed_by`),
  KEY `identifier_type for idgen_identifier_source` (`identifier_type`),
  CONSTRAINT `creator for idgen_identifier_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by for idgen_identifier_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `changed_by for idgen_identifier_source` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_type for idgen_identifier_source` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_identifier_source`
--

LOCK TABLES `idgen_identifier_source` WRITE;
/*!40000 ALTER TABLE `idgen_identifier_source` DISABLE KEYS */;
INSERT INTO `idgen_identifier_source` VALUES (1,'691eed12-c0f1-11e2-94be-8c13b969e334','Generator for OpenMRS ID',NULL,4,2,'2023-10-25 10:23:28',NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `idgen_identifier_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_log_entry`
--

DROP TABLE IF EXISTS `idgen_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_generated` datetime NOT NULL,
  `generated_by` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `generated_by for idgen_log` (`generated_by`),
  KEY `source for idgen_log` (`source`),
  CONSTRAINT `generated_by for idgen_log` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `source for idgen_log` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_log_entry`
--

LOCK TABLES `idgen_log_entry` WRITE;
/*!40000 ALTER TABLE `idgen_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_pooled_identifier`
--

DROP TABLE IF EXISTS `idgen_pooled_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_pooled_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_used` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `pool_id for idgen_pooled_identifier` (`pool_id`),
  CONSTRAINT `pool_id for idgen_pooled_identifier` FOREIGN KEY (`pool_id`) REFERENCES `idgen_id_pool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_pooled_identifier`
--

LOCK TABLES `idgen_pooled_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_pooled_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_pooled_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_remote_source`
--

DROP TABLE IF EXISTS `idgen_remote_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_remote_source` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_remote_source` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_remote_source`
--

LOCK TABLES `idgen_remote_source` WRITE;
/*!40000 ALTER TABLE `idgen_remote_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_remote_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_reserved_identifier`
--

DROP TABLE IF EXISTS `idgen_reserved_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_reserved_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `source for idgen_reserved_identifier` (`source`),
  CONSTRAINT `source for idgen_reserved_identifier` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_reserved_identifier`
--

LOCK TABLES `idgen_reserved_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_reserved_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_reserved_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_seq_id_gen`
--

DROP TABLE IF EXISTS `idgen_seq_id_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_seq_id_gen` (
  `id` int(11) NOT NULL,
  `next_sequence_value` int(11) NOT NULL DEFAULT '-1',
  `base_character_set` varchar(255) NOT NULL,
  `first_identifier_base` varchar(50) NOT NULL,
  `prefix` varchar(100) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_seq_id_gen` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_seq_id_gen`
--

LOCK TABLES `idgen_seq_id_gen` WRITE;
/*!40000 ALTER TABLE `idgen_seq_id_gen` DISABLE KEYS */;
INSERT INTO `idgen_seq_id_gen` VALUES (1,-1,'0123456789ACDEFGHJKLMNPRTUVWXY','10000',NULL,NULL,6,NULL);
/*!40000 ALTER TABLE `idgen_seq_id_gen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangelog`
--

DROP TABLE IF EXISTS `liquibasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangelog` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangelog`
--

LOCK TABLES `liquibasechangelog` WRITE;
/*!40000 ALTER TABLE `liquibasechangelog` DISABLE KEYS */;
INSERT INTO `liquibasechangelog` VALUES ('0','bwolfe','liquibase-update-to-latest.xml','2011-09-20 00:00:00',10016,'MARK_RAN','8:12a6014284bbf4978e29e2f37d967125',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('02232009-1141','nribeka','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10061,'EXECUTED','8:f8a821a8e041ad4f07406e8a7c1a3968','Modify Column','Modify the password column to fit the output of SHA-512 function',NULL,'2.0.5',NULL,NULL,NULL),('02fb6cc1-d45c-4985-8117-0d313975fd81','Partners In Health','liquibase.xml','2023-10-25 10:22:16',10937,'EXECUTED','8:b004e44dc7e62fe98f8478c095b9d99b','addForeignKeyConstraint baseTableName=idgen_auto_generation_option, constraintName=location_for_auto_generation_option, referencedTableName=location','',NULL,'4.4.3',NULL,NULL,NULL),('0f79a646-4f62-4fef-b035-421ad8f73ba2','Partners In Health','liquibase.xml','2023-10-25 10:22:16',10940,'EXECUTED','8:fb715c445d9d2e57c09b974a24759598','addForeignKeyConstraint baseTableName=idgen_auto_generation_option, constraintName=identifier_type for idgen_auto_generation_option, referencedTableName=patient_identifier_type','',NULL,'4.4.3',NULL,NULL,NULL),('0h78646-4fef-b035-kj9gh8a2','Mekom Solutions','liquibase.xml','2023-10-25 10:22:16',10941,'EXECUTED','8:ff5bc5f41d89650ef86eb08ceb14bbcd','modifyDataType columnName=prefix, tableName=idgen_seq_id_gen','',NULL,'4.4.3',NULL,NULL,NULL),('1','upul','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10042,'MARK_RAN','8:991e6075bd349bc17d8762417c4f270d','Add Column','Add the column to person_attribute type to connect each type to a privilege',NULL,'2.0.5',NULL,NULL,NULL),('1-grant-new-dashboard-overview-tab-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10503,'EXECUTED','8:5f69fffb89d102e1eb536301e57e29f8','sql','Granting the new patient overview tab application privileges',NULL,'4.4.3',NULL,NULL,NULL),('1-increase-privilege-col-size-privilege','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10505,'EXECUTED','8:41f2d0fb85aba597736481b9c965fd67','dropForeignKeyConstraint baseTableName=person_attribute_type, constraintName=privilege_which_can_edit; dropForeignKeyConstraint baseTableName=role_privilege, constraintName=privilege_definitons; modifyColumn tableName=privilege; addForeignKeyConst...','Increasing the size of the privilege column in the privilege table',NULL,'4.4.3',NULL,NULL,NULL),('10-insert-new-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10501,'EXECUTED','8:0ef73a3413ede0e2a7481292685fb711','sql','Inserting the new application privileges',NULL,'4.4.3',NULL,NULL,NULL),('10000000-1000-appointment-appointment','yony258','liquibase.xml','2023-10-25 10:22:13',10912,'EXECUTED','8:c1fd43823f87bc5c62b42c3ef8a14654','createTable tableName=appointmentscheduling_appointment; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment, constraintName=appointment_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=appointmentsched...','Create the appointment table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-1000-appointment-block','yony258','liquibase.xml','2023-10-25 10:22:13',10909,'EXECUTED','8:220f1813d447e451696a6de9907fb834','createTable tableName=appointmentscheduling_appointment_block; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment_block, constraintName=appointment_block_creator, referencedTableName=users; addForeignKeyConstraint baseTableNam...','Create the appointment block table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-1000-appointment-block-type-map','dkayiwa','liquibase.xml','2023-10-25 10:22:13',10911,'EXECUTED','8:82fbaa7c080b0d506323a49612f0ad27','createTable tableName=appointmentscheduling_block_type_map; addForeignKeyConstraint baseTableName=appointmentscheduling_block_type_map, constraintName=appointment_block_type_map_appointment_type_id, referencedTableName=appointmentscheduling_appoin...','Create the link table \"appointmentscheduling_block_type_map\" that links appointmentscheduling_appointment_block table and appointmentscheduling_appointment_type table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-1000-appointment-time-slot','yony258','liquibase.xml','2023-10-25 10:22:13',10910,'EXECUTED','8:3dea113adbd888a44f0201ea2e730d7b','createTable tableName=appointmentscheduling_time_slot; addForeignKeyConstraint baseTableName=appointmentscheduling_time_slot, constraintName=appointment_slot_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=appointmentsche...','Create the time slot table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-1000-appointment-type','dkayiwa','liquibase.xml','2023-10-25 10:22:12',10908,'EXECUTED','8:8865b7c9d6ee02bbdfd15eb336100443','createTable tableName=appointmentscheduling_appointment_type; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment_type, constraintName=appointment_type_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=a...','Create appointment type table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-2019-appointment-status','yony258','liquibase.xml','2023-10-25 10:22:13',10913,'EXECUTED','8:734d3b758eae630e2214585383fccd07','createTable tableName=appointmentscheduling_appointment_status_history; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment_status_history, constraintName=appointment_status_history_appointment, referencedTableName=appointments...','Create appointment status history table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-TRUNK-6015','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:28',10756,'EXECUTED','8:10276a470199bd3ce0addf3f49f68f17','addColumn tableName=encounter_diagnosis','Adding \"form_namespace_and_path\" column to encounter_diagnosis table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-TRUNK-6016','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:28',10757,'EXECUTED','8:f0ce0a60bdab2256858d966eabb0bc5e','addColumn tableName=allergy','Adding \"form_namespace_and_path\" column to the allergy table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-TRUNK-6017','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10759,'EXECUTED','8:ec16bf7b6f70059ad300110b68192dc0','addColumn tableName=orders','Adding \"form_namespace_and_path\" column to the orders table',NULL,'4.4.3',NULL,NULL,NULL),('10000000-TRUNK-6018','aojwang','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10760,'EXECUTED','8:ebf094385dad9b9cf36fbe62aa22b4b7','addColumn tableName=patient_state','Adding \"form_namespace_and_path\" column to the patient_state table',NULL,'4.4.3',NULL,NULL,NULL),('10000001-TRUNK-6016','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10758,'EXECUTED','8:76d5f880ebc99cb1739172b4a52d013f','addColumn tableName=allergy; addForeignKeyConstraint baseTableName=allergy, constraintName=allergy_encounter_id_fk, referencedTableName=encounter','Adding \'encounter_id\' column to the allergy table',NULL,'4.4.3',NULL,NULL,NULL),('10000001-TRUNK-6018','aojwang','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10761,'EXECUTED','8:b4a0ccd8c23e64e4f3fd702fe943456e','addColumn tableName=patient_state; addForeignKeyConstraint baseTableName=patient_state, constraintName=patient_state_encounter_id_fk, referencedTableName=encounter','Adding \'encounter_id\' column to the patient_state table',NULL,'4.4.3',NULL,NULL,NULL),('11-insert-new-api-privileges','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10502,'EXECUTED','8:8d108267a32a8414e6a7820628de2854','sql','Inserting the new API privileges',NULL,'4.4.3',NULL,NULL,NULL),('1226348923233-12','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10022,'EXECUTED','8:bb24363bbbc4fced0df16bb7f8f16f14','Insert Row (x12)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-13','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10023,'EXECUTED','8:31983765854eb7c5b5a17e4719e33a36','Insert Row (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-14','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10027,'EXECUTED','8:1dd132e55df2925c4279946e865480d7','Insert Row (x4)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-15','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10028,'EXECUTED','8:d1033daf42ce797eec3172fb416970ac','Insert Row (x15)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-16','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10019,'EXECUTED','8:602bd18cfd62b1620c9409215ea87301','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-17','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10030,'EXECUTED','8:1e4df341bb32471b7979789a85321705','Insert Row (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-18','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10031,'EXECUTED','8:c34ac1c3709196543dc191ce2f0b93f2','Insert Row (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-2','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10020,'EXECUTED','8:5cbb44a28b0ef311d891fd24efa57943','Insert Row (x5)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-20','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10032,'EXECUTED','8:33e813ecb9ecc9779b454b8e23169029','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-21','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10033,'EXECUTED','8:d0a7367e2fa776a490a8803b845db9ec','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-22','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10018,'EXECUTED','8:6f142e9cb7f38398d1cb23e72b852545','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-23','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10034,'EXECUTED','8:b1f30cc0f5470c7c83572d41f5d1250a','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-6','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10026,'EXECUTED','8:d4f3f0ae5bff1c976c6d6ac30e77c9d7','Insert Row (x13)','',NULL,'2.0.5',NULL,NULL,NULL),('1226348923233-8','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10021,'EXECUTED','8:efb51ea5811efd6ead825f1d72a1063b','Insert Row (x7)','',NULL,'2.0.5',NULL,NULL,NULL),('1226412230538-24','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:28',10024,'EXECUTED','8:d8e61a7fd06bb9fe652c25af8769a23b','Insert Row (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('1226412230538-7','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10025,'EXECUTED','8:85ea71083e5c1a7c2f851212278aadee','Insert Row (x106)','',NULL,'2.0.5',NULL,NULL,NULL),('1226412230538-9a','ben (generated)','liquibase-core-data.xml','2016-07-07 08:14:29',10035,'EXECUTED','8:8384d4acc1f80f90eca0f2daf46d3aa2','Insert Row (x4)','',NULL,'2.0.5',NULL,NULL,NULL),('1227123456789-100','dkayiwa','liquibase-schema-only.xml','2016-07-07 08:14:24',178,'EXECUTED','8:94df37ec6e1d989969b931fe8c1b4a10','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-1','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',1,'EXECUTED','8:b9ee4c0e8008ec77d884bc1b20d3e4af','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-10','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',8,'EXECUTED','8:5e473876e7fe6743de5d12b73a92ce67','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-100','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',114,'EXECUTED','8:b82fee3c37b72cc3cbe07eb7f884f392','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-101','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',115,'EXECUTED','8:312a5a8c66b7882abc7a29a6ea0bd7c3','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-102','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',116,'EXECUTED','8:5136a87232a949301939f363154f9d13','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-103','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',117,'EXECUTED','8:a4e06c893bc3abbba045c45ab85853a8','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-104','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',118,'EXECUTED','8:8b0af28d7870f07c6d747ea1f4f84427','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-105','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',119,'EXECUTED','8:b2a50e78f1c72368f0fe189966e0e4a4','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-106','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',120,'EXECUTED','8:9a11d3faff3bc49fd5f178c62ff6f1e8','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-107','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',121,'EXECUTED','8:5bb2d869cd940420add9767f582d3340','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-108','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',135,'EXECUTED','8:4d0fd8dfa3132aeda7fd95fce186feca','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-109','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',136,'EXECUTED','8:898a7623617966cd510cee8696044919','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-11','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',9,'EXECUTED','8:246eecf888b6e516f7c5111ca182a300','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-110','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',137,'EXECUTED','8:d9477a162e1fbc21a0d3c1b7eacfd1e1','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-111','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',138,'EXECUTED','8:0bcc6c622cb1340d70bf01da7461aef9','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-112','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',139,'EXECUTED','8:ff5d37e7cb4d30650d7e13056dc33dc5','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-115','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',140,'EXECUTED','8:8fe43a46974794123e7befe6a8b9ed28','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-116','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',141,'EXECUTED','8:907bb8476d14d066857bb9b66dd0524f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-117','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',142,'EXECUTED','8:8711faa15c279d4c7c4b6a560e07eaa2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-118','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',143,'EXECUTED','8:bfb62d5788118190ee02400aa6aefbba','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-119','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',144,'EXECUTED','8:7e8377c775d527df2615e4cb50df702d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-12','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',10,'EXECUTED','8:ba84f58e4897d27213c7d149dd403d7b','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-120','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',145,'EXECUTED','8:f7413bef07383112602b74b12b825e61','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-121','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',146,'EXECUTED','8:a17fdca397bd485507fc28b78ddf0939','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-122','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',147,'EXECUTED','8:8f0d4dad5f4097fe33370512cfef177e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-123','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',148,'EXECUTED','8:33220c0b589a0b3d5e98997606293ade','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-124','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',149,'EXECUTED','8:a47bda8885b98a1354d9d5b35492665d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-125','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',150,'EXECUTED','8:08eb1f8ee0e4ea531ccfda38a33c412a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-126','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',151,'EXECUTED','8:6acecf1ef9667b482fec5b6f5daafa20','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-128','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',152,'EXECUTED','8:9529c1e321fe781628ed212a926502d9','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-129','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',153,'EXECUTED','8:cc50810c3979bb56f574cbf6b9aa35ca','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-13','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',11,'EXECUTED','8:6471aa402a63c659dfe087491712a159','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-130','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',154,'EXECUTED','8:b9e6fd520b69b2e0cf8378a599f5af96','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-131','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',155,'EXECUTED','8:a3590505dd4113518513b471228fd9ce','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-132','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',156,'EXECUTED','8:c1f3769598fea95a686f33ea1e81450d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-134','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',157,'EXECUTED','8:2d2cf512d0f3a8ac703922f4eaa134f8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-135','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',158,'EXECUTED','8:538229aca1977a64b71417de6f9b2203','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-136','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',159,'EXECUTED','8:42264fcc9ed9e7f0b79b3c4286883e42','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-137','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',160,'EXECUTED','8:afb2d71f356b81b14ddba3354cb16d3e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-139','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',161,'EXECUTED','8:e522bfbd461773a55bd5cd2e302ddfa9','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-14','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',12,'EXECUTED','8:47c333878a63bb0829dbd70be5d6fbde','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-140','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',162,'EXECUTED','8:0a92c6aa00468c1138659c133b47f689','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-141','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',163,'EXECUTED','8:e7006b0ba18224ba3e65034727d920e6','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-142','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',164,'EXECUTED','8:dbe91f626277b7755414156f8e822ddf','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-143','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',165,'EXECUTED','8:0fbb640bf726e1725e1e16a9e7d9d660','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-144','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',166,'EXECUTED','8:af117aa9c1fc98e5647e06188e67897d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-145','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',167,'EXECUTED','8:a3ea4580bec548e44c13a5e4ba48291f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-146','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',168,'EXECUTED','8:624a7378df141559081274e3b9490409','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-147','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',169,'EXECUTED','8:7fc4fc3cb040fabc59a3d896fc6db14d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-149','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',170,'EXECUTED','8:dc4fc39a9b92d489247c3ae7c39502c0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-15','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',13,'EXECUTED','8:cf72b976506c68977da03bf631e4976a','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-150','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',171,'EXECUTED','8:82673a3ca4ce3dc22d91f7fb943238b4','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-151','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',172,'EXECUTED','8:ca8e406ac7c35a8bed355a297b9b727d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-153','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',173,'EXECUTED','8:b6aa43fc174a02cbdf41d9345ecafeef','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-154','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',174,'EXECUTED','8:fe5fcb763d71ae04ea1236c18112fb78','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-155','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',175,'EXECUTED','8:c939abf513c92137e189b9b3f0696346','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-158','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',176,'EXECUTED','8:a041ccd99fd8e3372f3a7e939e5cfa8f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-159','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',177,'EXECUTED','8:f4a15d22f90d940a6ebb98282b104a50','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-16','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',14,'EXECUTED','8:d6e4e68dcaf2230046cdf81040580be0','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-160','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',179,'EXECUTED','8:87a27fdfa8a122a26521476f95e5b9cc','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-161','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',180,'EXECUTED','8:f442267aa1c5ceeff29e7e067dc23a39','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-162','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',181,'EXECUTED','8:a922ecb26bcd3dce8f958e0a698f7a8f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-163','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',182,'EXECUTED','8:8c1b126ec623a54fc58e7117b2c69442','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-164','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',183,'EXECUTED','8:e036a8611996a334d4b7c1a64d373967','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-165','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',184,'EXECUTED','8:97e31f702f3477b2e6c4adf7ff6ce788','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-166','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',185,'EXECUTED','8:616a9bba053513635fd9cb319b9d2148','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-167','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',186,'EXECUTED','8:adc24af188e55646d2de3f132186b110','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-168','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',187,'EXECUTED','8:a926a454309c7f1dfb6dd9cdc3d78f56','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-169','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',188,'EXECUTED','8:3219fbfc0e1e9e2bb9647d04661a5e95','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-17','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',15,'EXECUTED','8:11e45d5067a89a3d021b79ce4ea72c98','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-170','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',189,'EXECUTED','8:d55b0889f9237b6f48c07be443185b50','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-171','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',190,'EXECUTED','8:8129c4e809429228a78a121492cf75ae','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-173','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',191,'EXECUTED','8:0d0490bb229e0c93937b97bd1a1da3da','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-174','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',192,'EXECUTED','8:288d97e78fe4711e2c824add03593934','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-175','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',193,'EXECUTED','8:5c81b788b71d72347efc04e2ea14e86e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-176','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',194,'EXECUTED','8:2d2cc0fff3d1b1b87c2b8408ab9dcec8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-177','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',195,'EXECUTED','8:fb5444c537926cc5ddb7a4d7685572c0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-178','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',196,'EXECUTED','8:080331e4e521909eeff49029db253ac7','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-179','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',197,'EXECUTED','8:13eaab806af2e6ef373269df3a75f50c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-18','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',16,'EXECUTED','8:0985338631bc69e03ad28cec443b4ef9','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-180','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',198,'EXECUTED','8:6f02254260667a609aa7b7bed418a054','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-181','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',199,'EXECUTED','8:f831b9d0614a2f1288cf590d4f42ff5e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-182','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',200,'EXECUTED','8:69cf5f8af39868715a7212e3982bd6c3','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-183','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',201,'EXECUTED','8:dac4b647aac57b2521193b9d51c36875','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-184','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',202,'EXECUTED','8:3a05d0f8472d2f9616f282208ccbfb24','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-185','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',203,'EXECUTED','8:e4d0dcac58c6a439b1fd3bb29bd250bb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-186','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',204,'EXECUTED','8:bc40972a9ca894ca341596a0e238cb20','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-187','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',205,'EXECUTED','8:fef3ce1af33eafc48c01c6a641cdc6aa','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-188','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',206,'EXECUTED','8:7bfd83a0c064489b3be2f3d3d724329a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-189','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',207,'EXECUTED','8:d03299e4b005c3f57e21adffe84fe9e9','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-19','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',17,'EXECUTED','8:e23e36321c19a2a2d0c6de601b7399f5','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-190','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',208,'EXECUTED','8:3451a0cef626a0ea0e6880caaa07710b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-191','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',209,'EXECUTED','8:b407ad923b164d71e62c1a54cba7f8e6','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-192','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',210,'EXECUTED','8:17f0abb8aeaea10ebaa261c07fe89819','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-193','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',211,'EXECUTED','8:1af26804285d3781e8f20f64fca2b801','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-194','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',212,'EXECUTED','8:2b2723d27a393d2a08355f2c0d690969','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-195','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',213,'EXECUTED','8:d20285f254bae676e4cf34dedb8ad204','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-196','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',214,'EXECUTED','8:df2cb7ab8e7bf606efaac0b60b09828d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-197','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',215,'EXECUTED','8:7c8f7cbb185d4b569744060f1d959dfe','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-198','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',216,'EXECUTED','8:c8a1b99634259d0853a28308b25376f0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-199','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:24',217,'EXECUTED','8:122b1b781b9647cef5c75188856b2fb1','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-2','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',2,'EXECUTED','8:9fabbaa2a7e0fe524eee1752b89f46e6','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-20','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',18,'EXECUTED','8:824f4a936297d786e76ef2599a331b07','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-200','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',218,'EXECUTED','8:fac409fa9dc54f7da65eb2a91a909662','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-201','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',219,'EXECUTED','8:d88d1c8dbf1716b5594de5d966bd4c7a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-202','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',220,'EXECUTED','8:931354889d25441e582e4a6906a8cf39','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-203','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',221,'EXECUTED','8:6b88af8eeada64d06620e37c9160eed8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-204','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',222,'EXECUTED','8:5ea0a5d44207cd1136e379c85c1f4ede','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-205','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',223,'EXECUTED','8:816a75aad04786a9ff5c6b1654754834','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-207','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',224,'EXECUTED','8:04c787d381d35902a52e5fc1ab835e62','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-208','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',225,'EXECUTED','8:ee57b25859180f18b59202de8eaf1a50','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-209','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',226,'EXECUTED','8:a45ba0b58b30b0d9a8039c325ff0ec86','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-21','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',19,'EXECUTED','8:967d30ff8a8c9090fce2394beb060346','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-210','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',227,'EXECUTED','8:57fc8b055c19714b325d4acc72ee8cb2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-211','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',228,'EXECUTED','8:79b38fb2671d546d8b3aff323b5f5db7','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-212','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',229,'EXECUTED','8:1264f1181b621ea81a5fbfa4a3a1ba10','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-213','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',230,'EXECUTED','8:eae032da1de620c893e5f4097ab21ea4','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-214','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',231,'EXECUTED','8:df8e5ca1f2dfe75caea42ee631b8d945','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-215','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',232,'EXECUTED','8:52b0b69fa958558fbc793b0bb8c48c0b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-216','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',233,'EXECUTED','8:a84ca3ad5332805b9ac730db2ecd7751','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-217','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',234,'EXECUTED','8:df378a8c646bfe7120206639191e4379','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-218','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',235,'EXECUTED','8:443c8c622ed11c4ed8ea591ed2f46a57','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-219','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',236,'EXECUTED','8:bfa49ce65ce129e897b193915ae9254d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-22','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',20,'EXECUTED','8:b82f19178202b32c24c35113b96f6f48','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-220','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',237,'EXECUTED','8:294cab06123ffaa612d862bb1770f507','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-221','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',238,'EXECUTED','8:b97adb659df32747d9d11f1f27861cc0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-222','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',239,'EXECUTED','8:01a41e1499eccbceb2ee1e85f885fc6b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-223','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',240,'EXECUTED','8:784f11544fa4fb78337d0d4726001a20','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-224','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',241,'EXECUTED','8:d708bfc19b3f72dd244e92af44a48a6f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-225','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',242,'EXECUTED','8:b562f4552de1ee1d313ba400ad0abdcf','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-226','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',243,'EXECUTED','8:bd137d46a4117614f13149d9921a6a0c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-227','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',244,'EXECUTED','8:ae5f09dfc18ed781f6a40eabf99b2080','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-228','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',245,'EXECUTED','8:e13f40ea2b81bd3c8f88114afea8b98b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-229','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',246,'EXECUTED','8:a8cd37a93164fff7878cf490079e4f52','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-23','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',21,'EXECUTED','8:243fb268f2145683b0f144d818159951','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-230','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',247,'EXECUTED','8:406498a13805528d6fddc0e6c7341cf5','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-231','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',248,'EXECUTED','8:54b7296fa90a459d7c973b0dad40d4eb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-232','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',249,'EXECUTED','8:02752f99428dde99a49b18fd526a1ff2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-234','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',250,'EXECUTED','8:09761974f703e0f0873a2ee5fbd6010b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-235','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',251,'EXECUTED','8:7325424371f3459d9d5e8671c6ce352d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-236','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',252,'EXECUTED','8:ddec2c62eb77d94538330c3fd4b2f74e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-237','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',253,'EXECUTED','8:325fb31ac58f83967d393c93bc0a1caa','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-239','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',254,'EXECUTED','8:8e489eac5e3fda67030eaf19ba4fb336','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-24','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',22,'EXECUTED','8:93a08be66270fc86033d43a29d5d0fb0','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-240','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',255,'EXECUTED','8:4852e6011efe34354313a6dee16245ec','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-241','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',256,'EXECUTED','8:870085d83f6db3788fda9bbb0a5eced5','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-242','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',257,'EXECUTED','8:32c6d7fe9dd7edf50913872f5f580d36','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-243','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',258,'EXECUTED','8:234a3f86d408a26037246e51d157e978','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-244','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',259,'EXECUTED','8:877e65e37a23488650cf8da0924e397a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-245','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',260,'EXECUTED','8:34292be5f3d5f642a205e090f42ec1d0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-246','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',261,'EXECUTED','8:7e8a2f630b93499da5bfa14be0272128','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-247','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',262,'EXECUTED','8:512574bd869f69658c919d03dd82efaf','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-248','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',263,'EXECUTED','8:819dd227d3fa0a87c4caa787d63b5f9a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-249','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',264,'EXECUTED','8:d139c4ee68c48efe2f15c650485c2128','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-25','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',23,'EXECUTED','8:1eefe029f3db6b92c0e8635907050b03','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-250','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',265,'EXECUTED','8:8ac3a86eebf76fe9707ac804781caf25','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-251','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',266,'EXECUTED','8:b93837b949b74ee2615d75b02466780e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-252','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',267,'EXECUTED','8:428ddd5a90b6a2b2c64f1bc330ea1dd1','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-253','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',268,'EXECUTED','8:93d8209c11d0889d9f08da91f6f55d00','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-254','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',269,'EXECUTED','8:49980361202a7431a9eebe87fdbb163a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-255','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',270,'EXECUTED','8:21b93409799d20c5ffe9e4b7ae772b56','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-256','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',271,'EXECUTED','8:a95ff360f7b50aaec60fd15a2177a3bc','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-257','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',272,'EXECUTED','8:177befaf326dbda388563a43bbceaf3c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-258','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',273,'EXECUTED','8:2fc819a4127debbc5c0e3677ac3a84c2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-259','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',274,'EXECUTED','8:8a68843cbb9ee511c31c7ade79f91f90','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-26','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',24,'EXECUTED','8:b53c6fee26203bc468bc6c8ed3c26b82','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-260','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',275,'EXECUTED','8:7a051e2c6ed52bf7095ba7a7010321a8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-261','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:25',276,'EXECUTED','8:ec1887f2092d0488a2817d4c081e67b7','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-262','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',277,'EXECUTED','8:47af392b01fc954bba483d9ce08e3796','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-263','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',278,'EXECUTED','8:4de5603f0df218cdd681b0f61d8b1f49','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-264','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',279,'EXECUTED','8:2f8b67450bbe1a9855a70f119df13161','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-265','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',280,'EXECUTED','8:ce6a2b55ad00d751500690708db7b2c0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-266','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',281,'EXECUTED','8:405d8706e1b750c15eef45a95a576a1d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-267','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',282,'EXECUTED','8:580d0e47dc42a73fa97dfd47ba35d082','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-268','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',283,'EXECUTED','8:69d65b39a0eed70cea696899be4dc274','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-269','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',284,'EXECUTED','8:862dbda4b3adda29d7bbd252b6a870f6','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-27','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',25,'EXECUTED','8:34d1368d781c4c2c09cd34f44d66f87d','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-270','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',285,'EXECUTED','8:d4dc63350a170a64eb9660d7946b257b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-271','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',286,'EXECUTED','8:f10ff78209c3e95a93d2bf546e1c7be2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-272','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',287,'EXECUTED','8:68e403d624f8c440f04eba12e5e4ca40','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-273','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',288,'EXECUTED','8:8731eef11c093e33844595b6248a8430','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-274','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',289,'EXECUTED','8:342d5a86c1f4448e5acf445db148a914','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-275','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',290,'EXECUTED','8:ec8da449622fb757d68944b3911f7686','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-276','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',291,'EXECUTED','8:cd33bac67f462bae9f7d861662d9ca55','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-277','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',292,'EXECUTED','8:f577fc315cfd4a65ac6efbda2788e190','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-278','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',293,'EXECUTED','8:a69193512a21ced5e137287a1f2e4b22','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-279','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',294,'EXECUTED','8:474f284368f5574fdf4a6787d848aa8b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-28','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',26,'EXECUTED','8:3674baa9b7bef0377b86f968d4005c15','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-280','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',295,'EXECUTED','8:6fddf45f8f23d6b526a0c6380fdf8e75','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-281','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',296,'EXECUTED','8:2f42ecf0e297deff9ecf9fa036d1f7eb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-282','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',297,'EXECUTED','8:8afe37c7611647b84db798745124c71a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-283','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',298,'EXECUTED','8:1ebff8cb70f8a959fa679d866c2e4d0d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-284','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',299,'EXECUTED','8:3118ece63b5e3f681eb8ceb916b9f4c3','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-285','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',300,'EXECUTED','8:59046a70052c608b9da12ce385700208','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-286','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',301,'EXECUTED','8:9601ccbb14fdd0886df63abc9602c09f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-287','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',302,'EXECUTED','8:ea6f5d796fc93953678e921b5c461556','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-288','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',303,'EXECUTED','8:7756dad654857babe7d182dc9e732273','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-289','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',304,'EXECUTED','8:9bdac9cd60d44aae3ecba3ca94470cd6','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-29','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',27,'EXECUTED','8:796cc934f4657168e452ddd4b446b669','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-290','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',305,'EXECUTED','8:0f723ef290712e01df3e2dc5529b83bb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-291','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',306,'EXECUTED','8:91c3fd2eb43b91b68d18984692f6e2ae','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-292','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',307,'EXECUTED','8:9abfbd0a3bfa317acb6d2010d8b59a1d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-293','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',308,'EXECUTED','8:02b0c86ca6937b19028b3d65f2428e5f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-294','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',309,'EXECUTED','8:d304d70729a9c588fbe374302dcbe5b0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-295','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',310,'EXECUTED','8:7e3a3bfd45501ae6376fb0a7994ead05','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-296','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',311,'EXECUTED','8:754851b11bb6bcbd75ba8a0ca5b44cfc','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-297','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',312,'EXECUTED','8:7c42397818d1b5204b86553de075c03b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-298','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',313,'EXECUTED','8:b0bf22ea31dc4681ea18e7160b78447e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-299','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',314,'EXECUTED','8:486a85a30bb34f06bb8494eb66c3946f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-30','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',28,'EXECUTED','8:5dc1d10d359dfafcd8165c2fdcdcf4f6','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-300','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',315,'EXECUTED','8:8d25ef0f1b1e47704bb555a0b9b8a0fa','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-301','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:26',316,'EXECUTED','8:db4d8e41589809f08836eb9c51c7f1f2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-31','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',29,'EXECUTED','8:a47f9ea643e9137c2661b7cc1c739d3b','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-32','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',30,'EXECUTED','8:1ce8870ad88a2afa289c943262a799d3','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-33','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',31,'EXECUTED','8:382517f2c1d0ef153ea7a4c955bb2c98','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-34','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',32,'EXECUTED','8:b70d719a673788f00b25e6be9470fd68','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-35','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',33,'EXECUTED','8:f4812355bb8df61c9b4804edc3506a28','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-36','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',34,'EXECUTED','8:69ee3da4e5afaa90ec1bf4524b4933d4','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-37','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',35,'EXECUTED','8:93adb423282bcb7a6abc9a3461de848e','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-39','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',36,'EXECUTED','8:87eacef2b6f347c8dfb473fec966bd7d','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-4','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',3,'EXECUTED','8:f132cf2bc2b4de846dfebdcb71b880bc','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-40','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',37,'EXECUTED','8:a7619ad8304326287c2d3224c730130c','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-41','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',38,'EXECUTED','8:d08dbffd822602fdd51c912cf5139edd','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-42','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',39,'EXECUTED','8:81e833b1773e3061e1d8a99d8b509883','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-43','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',40,'EXECUTED','8:8e277b197cc5aa4adff2e12c9e8ce9b4','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-44','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',41,'EXECUTED','8:42e54dd8810de987d52880b8ca0331ee','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-45','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',42,'EXECUTED','8:c48976cd5b95055c8cee5ba93dcf706d','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-46','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',43,'EXECUTED','8:5acacd7d7891e4a59c921213408bf78a','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-47','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',44,'EXECUTED','8:91bd9e03fafe0c54c70af94cd09a397a','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-48','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',45,'EXECUTED','8:89045b42da7bd45a2b7d9f64511e60c8','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-49','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',46,'EXECUTED','8:da5a1c063e17a2170d2507d734027cf2','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-5','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',4,'EXECUTED','8:4f815b5ade565c4181842a06a914b33e','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-50','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',47,'EXECUTED','8:7d8d52ca80f9251977b942a41a01684f','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-51','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',48,'EXECUTED','8:c0e340f833fc8b0a897f766f8d28559e','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-52','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',49,'EXECUTED','8:c78aef8f5bed877f209e2929d5601632','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-53','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',50,'EXECUTED','8:21a81e0aabb467978dba93aa6ff49e56','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-54','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',51,'EXECUTED','8:ab6e0235fb941f142e9f77ab3818cecf','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-55','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',52,'EXECUTED','8:d2c349708efd64bff948c9f3628f69c7','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-56','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',53,'EXECUTED','8:055daf3aebd4c75a5222bdb5753bab1f','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-57','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',54,'EXECUTED','8:15c666579adca65ac59e50b4363f1d67','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-58','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',55,'EXECUTED','8:3c8fa58916d0f07aa5945477991420c0','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-59','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',56,'EXECUTED','8:be6bb86fa85ae84ef0eb4c1442935f7c','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-6','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',5,'EXECUTED','8:6d194162ae41c1eb56bcceb5b98fb2dd','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-60','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',57,'EXECUTED','8:7aef9bd685e05e00fd3dba5b707e6dfc','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-61','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',58,'EXECUTED','8:c97901d3ccd8a3370af9a3615d29aed7','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-62','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',59,'EXECUTED','8:31b1443b16aa921032024a6fbaa682ef','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-63','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',60,'EXECUTED','8:60f184e73c38311cfc21e3d56cb21a58','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-64','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',61,'EXECUTED','8:a730a0cf22f6948f9b236a2623ce361a','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-65','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',62,'EXECUTED','8:ea6b9e7bcd2f4a293226d2e85b0869d8','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-66','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',63,'EXECUTED','8:c135beb12cbc32b9bba0f4c46b9984a1','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-67','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',64,'EXECUTED','8:9565c50e09deaee956108205f7f0692c','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-68','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',65,'EXECUTED','8:db3c9804aec65a634360b9dae1c438ac','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-7','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',6,'EXECUTED','8:c3a514e9b9955e251475b494d9c0f37c','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-70','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',66,'EXECUTED','8:e08024edda0d46e9f3791350c20870c1','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-71','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',67,'EXECUTED','8:eb4242ca3f767f4f38d06424226b786a','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-72','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:22',68,'EXECUTED','8:cbf073110abbb6705f74f1edac6d0d1f','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-73','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',89,'EXECUTED','8:93bc8e07ef54744c6936f86e9bc0bce0','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-75','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',90,'EXECUTED','8:1a3ef38f92cb196a32c5bb853f0bf01a','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-77','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',91,'EXECUTED','8:220af5ccd81c66e73b1681055c6dd081','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-78','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',92,'EXECUTED','8:7cc81659ee8d69d510500dca90ccbc18','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-79','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',93,'EXECUTED','8:fc879e209ad095057724d196e38d8d0f','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-81','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',94,'EXECUTED','8:57db34a9aad33e9c3926881608d96673','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-82','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',95,'EXECUTED','8:f3a497e17b6748747270b5cffa52ad89','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-83','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',96,'EXECUTED','8:83041d405e6a4607d17e4c3bdb470f89','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-84','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',97,'EXECUTED','8:ce76d2b396e4862b93b268e0d2b38102','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-85','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',99,'EXECUTED','8:10dd421af13171c93b9a4b0c9493d2d2','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-86','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',100,'EXECUTED','8:3a1855a57c069c0e95b1c5a670b41cd1','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-87','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',101,'EXECUTED','8:fc75042ff21053a52c51cd24ccd728cb','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-88','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',102,'EXECUTED','8:4fa55c37743c667db20646e00c983055','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-89','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',103,'EXECUTED','8:6d73a8d8fb8ca5a16cb0dcff557f1529','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-9','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:21',7,'EXECUTED','8:6e038709bc309eef7574cf8f35496720','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-90','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',104,'EXECUTED','8:17ffcb676dfe120cf24afacc3c0b3a65','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-91','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',105,'EXECUTED','8:bfca481d55ccff730dd230ae65d087a9','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-92','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',106,'EXECUTED','8:03be1266ccc05cfad7efa40747d4d2cc','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-93','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',107,'EXECUTED','8:10b2cacd0dd97eae418593a4e5f5de22','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-94','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',108,'EXECUTED','8:d45b0842a9a1434cf5e06cee5d8e9ea0','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-95','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',109,'EXECUTED','8:9399e3fbfb0b7d9c67ded1c0bfd7e784','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-96','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',110,'EXECUTED','8:88961931654d72cab82a81cfaee1cde9','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-97','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',111,'EXECUTED','8:a09ae7a5d3935120e4598069c0f6a2c0','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-98','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',112,'EXECUTED','8:a89855d60cf822ff4f93457a5d9ec428','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('1227303685425-99','ben (generated)','liquibase-schema-only.xml','2016-07-07 08:14:23',113,'EXECUTED','8:69190b5ab06806605078796b6ee32294','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('17a1d838-bf40-45d0-9e2b-6d177ff7ad62','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10929,'EXECUTED','8:767f6fb50abd678d14d20cfe95dae163','createTable tableName=idgen_reserved_identifier','',NULL,'4.4.3',NULL,NULL,NULL),('1df31052-65ce-4b81-8a9c-86c58c87c042','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10932,'EXECUTED','8:9df0c24077567cb40ba47ddc3c2ed971','addColumn tableName=idgen_remote_source','',NULL,'4.4.3',NULL,NULL,NULL),('2','upul','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10043,'MARK_RAN','8:994eef110601ec00914894c4b6e94651','Add Foreign Key Constraint','Create the foreign key from the privilege required for to edit\n			a person attribute type and the privilege.privilege column',NULL,'2.0.5',NULL,NULL,NULL),('2-increase-privilege-col-size-rol-privilege','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10506,'EXECUTED','8:e8b24e34e6c6dc2c8170a9e30bcebc47','dropForeignKeyConstraint baseTableName=role_privilege, constraintName=privilege_definitions; modifyColumn tableName=role_privilege; addForeignKeyConstraint baseTableName=role_privilege, constraintName=privilege_definitions, referencedTableName=pri...','Increasing the size of the privilege column in the role_privilege table',NULL,'4.4.3',NULL,NULL,NULL),('2-role-assign-new-api-privileges-to-renamed-ones','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10504,'EXECUTED','8:a9864f3710971db50826543ab2e79224','sql','Assigning the new API-level privileges to roles that used to have the renamed privileges',NULL,'4.4.3',NULL,NULL,NULL),('200805281223','bmckown','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10045,'MARK_RAN','8:074b13df89bf0362fb9785ae893ba013','Create Table, Add Foreign Key Constraint','Create the concept_complex table',NULL,'2.0.5',NULL,NULL,NULL),('200805281224','bmckown','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10046,'MARK_RAN','8:6986fd4e1043cedec48390ee3f6306af','Add Column','Adding the value_complex column to obs.  This may take a long time if you have a large number of observations.',NULL,'2.0.5',NULL,NULL,NULL),('200805281225','bmckown','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10047,'MARK_RAN','8:c031e591b89ee9e0545337e3e35db77c','Insert Row','Adding a \'complex\' Concept Datatype',NULL,'2.0.5',NULL,NULL,NULL),('200805281226','bmckown','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10048,'MARK_RAN','8:684bdc9c06dbb995cb7cd1dc25f36da3','Drop Table (x2)','Dropping the mimetype and complex_obs tables as they aren\'t needed in the new complex obs setup',NULL,'2.0.5',NULL,NULL,NULL),('200809191226','smbugua','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10049,'MARK_RAN','8:05957b3b575084e61560b0f982ac49b4','Add Column','Adding the hl7 archive message_state column so that archives can be tracked\n			(preCondition database_version check in place because this change was in the old format in trunk for a while)',NULL,'2.0.5',NULL,NULL,NULL),('200809191927','smbugua','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10050,'MARK_RAN','8:2ae91750b725ef3a76c0a67082e948e5','Rename Column, Modify Column','Adding the hl7 archive message_state column so that archives can be tracked',NULL,'2.0.5',NULL,NULL,NULL),('200811261102','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10044,'EXECUTED','8:702d63c1f4df83c47e1db3cbe5cab2b1','Update Data','Fix field property for new Tribe person attribute',NULL,'2.0.5',NULL,NULL,NULL),('200901101524','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10051,'EXECUTED','8:a9443329a76435cfd0826394e4c95c32','Modify Column','Changing datatype of drug.retire_reason from DATETIME to varchar(255)',NULL,'2.0.5',NULL,NULL,NULL),('200901130950','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10052,'EXECUTED','8:4f76ab65377acf1eddfed038749ded86','Delete Data (x2)','Remove Manage Tribes and View Tribes privileges from all roles',NULL,'2.0.5',NULL,NULL,NULL),('200901130951','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10053,'EXECUTED','8:bafff0cb91a4f0d3c294e783fe2888d4','Delete Data (x2)','Remove Manage Mime Types, View Mime Types, and Purge Mime Types privilege',NULL,'2.0.5',NULL,NULL,NULL),('200901161126','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10054,'EXECUTED','8:3f0f5495529bf79177080416637013f5','Delete Data','Removed the database_version global property',NULL,'2.0.5',NULL,NULL,NULL),('20090121-0949','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10055,'EXECUTED','8:7753c9deef5448a2dc7e583f4b5ac747','Custom SQL','Switched the default xslt to use PV1-19 instead of PV1-1',NULL,'2.0.5',NULL,NULL,NULL),('20090122-0853','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:31',10056,'EXECUTED','8:d287ee58845e22aba7f671f7c2450bae','Custom SQL, Add Lookup Table, Drop Foreign Key Constraint, Delete Data (x2), Drop Table','Remove duplicate concept name tags',NULL,'2.0.5',NULL,NULL,NULL),('20090123-0305','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10057,'MARK_RAN','8:733624adb629b21a72d150f5400acbf2','Add Unique Constraint','Add unique constraint to the tags table',NULL,'2.0.5',NULL,NULL,NULL),('20090214-2246','isherman','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10063,'EXECUTED','8:690b856ba1a294eea0ffa33129cb716a','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (mysql specific)',NULL,'2.0.5',NULL,NULL,NULL),('20090214-2247','isherman','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10064,'MARK_RAN','8:210e9534dd7f6f5c1439050673176abb','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (using standard sql)',NULL,'2.0.5',NULL,NULL,NULL),('200902142212','ewolodzko','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10242,'MARK_RAN','8:f44564fc206096a026c494f2b67c39a1','Add Column','Add a sortWeight field to PersonAttributeType',NULL,'2.0.5',NULL,NULL,NULL),('200902142213','ewolodzko','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10243,'EXECUTED','8:88a5dbdc582edb314cc5e9f037faf867','Custom SQL','Add default sortWeights to all current PersonAttributeTypes',NULL,'2.0.5',NULL,NULL,NULL),('20090224-1002-create-visit_type','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10384,'MARK_RAN','8:a43352c3e672ede733bee8451b5a3752','Create Table, Add Foreign Key Constraint (x3)','Create visit type table',NULL,'2.0.5',NULL,NULL,NULL),('20090224-1229','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10058,'MARK_RAN','8:6f100ecab372c2e84bd8005542fc473f','Create Table, Add Foreign Key Constraint (x2)','Add location tags table',NULL,'2.0.5',NULL,NULL,NULL),('20090224-1250','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10059,'MARK_RAN','8:61bd0a6375d678a2a488e09fffc7f5f8','Create Table, Add Foreign Key Constraint (x2), Add Primary Key','Add location tag map table',NULL,'2.0.5',NULL,NULL,NULL),('20090224-1256','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10060,'MARK_RAN','8:bace0255bf77eec2f4d6a9093b3e4f54','Add Column, Add Foreign Key Constraint','Add parent_location column to location table',NULL,'2.0.5',NULL,NULL,NULL),('20090225-1551','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10001,'MARK_RAN','8:22e7c547946a33f8fd2a5d45b13c0f13',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090301-1259','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10062,'EXECUTED','8:0c675d0ef999f9ae994db9b12a5c3bbb','Update Data (x2)','Fixes the description for name layout global property',NULL,'2.0.5',NULL,NULL,NULL),('20090316-1008','vanand','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10000,'MARK_RAN','8:3ed8c39a3e9a9dcec6d90d853fa25d70',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090316-1008-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10432,'EXECUTED','8:7ab0cc9af397882d5c3c8440af60763d','Modify Column (x36)','(Fixed)Changing from smallint to BOOLEAN type on BOOLEAN properties',NULL,'2.0.5',NULL,NULL,NULL),('200903210905','mseaton','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10065,'MARK_RAN','8:3253e07995aa73558d050cd9ab3871b2','Create Table, Add Foreign Key Constraint (x3)','Add a table to enable generic storage of serialized objects',NULL,'2.0.5',NULL,NULL,NULL),('200903210905-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10066,'EXECUTED','8:c98c63dc236a0d05589fec21ad4f75b5','Modify Column','(Fixed)Add a table to enable generic storage of serialized objects',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-cohort','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10071,'MARK_RAN','8:dfd349213f4e4420b7434be443f177a7','Add Column','Adding \"uuid\" column to cohort table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10072,'MARK_RAN','8:49b29ff9e018411ef0a8bb9e6d1e6e63','Add Column','Adding \"uuid\" column to concept table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10073,'MARK_RAN','8:116ffcd364fe305a9c4b45076087f2eb','Add Column','Adding \"uuid\" column to concept_answer table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_class','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10074,'MARK_RAN','8:eb32830247a967891fa82b60549a4733','Add Column','Adding \"uuid\" column to concept_class table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10075,'MARK_RAN','8:bda3bbd0db73de9a70e398f3c2c26894','Add Column','Adding \"uuid\" column to concept_datatype table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_description','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10076,'MARK_RAN','8:a0c894858dc298285e114f6408914ce9','Add Column','Adding \"uuid\" column to concept_description table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10002,'MARK_RAN','8:41f48f7496d0018bd569d4619a72ccab',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1515-38-concept_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10077,'MARK_RAN','8:df3db343dd510d0d857a72fafb1ba30c','Add Column','Adding \"uuid\" column to concept_name table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10078,'MARK_RAN','8:07c52ba900d6f818338d1b0589dd2a8a','Add Column','Adding \"uuid\" column to concept_name_tag table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10079,'MARK_RAN','8:e0de2b5735e30548ecbc9fab2f1c2211','Add Column','Adding \"uuid\" column to concept_proposal table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_set','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10080,'MARK_RAN','8:7e8b8983a8ee1596310fa7058251e1fc','Add Column','Adding \"uuid\" column to concept_set table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10003,'MARK_RAN','8:1a338a4f1677a54a286d436e7fc7b4f5',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1515-38-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10081,'MARK_RAN','8:21bec53f218e6bd24cccae667e5dc85a','Add Column','Adding \"uuid\" column to concept_state_conversion table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-drug','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10082,'MARK_RAN','8:1decd3f89ba2aca40e061ea160a1b9ef','Add Column','Adding \"uuid\" column to drug table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-encounter','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10083,'MARK_RAN','8:a741c222423621abdf68535359f32898','Add Column','Adding \"uuid\" column to encounter table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-encounter_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10084,'MARK_RAN','8:139c94b0944467f861b94743fedb83a1','Add Column','Adding \"uuid\" column to encounter_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10085,'MARK_RAN','8:cea6c5bceb8a63aeb705aeabc9eda074','Add Column','Adding \"uuid\" column to field table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-field_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10086,'MARK_RAN','8:257a42ef6e65628b2328cceddb9d79af','Add Column','Adding \"uuid\" column to field_answer table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-field_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10087,'MARK_RAN','8:3fc87b41cb19a1a936a0843b588406b8','Add Column','Adding \"uuid\" column to field_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-form','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10088,'MARK_RAN','8:9df9e8b138a66ee813ba3e6563dbcd28','Add Column','Adding \"uuid\" column to form table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-form_field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10089,'MARK_RAN','8:f3fa05a70b238ad39fdc4b5f5775a170','Add Column','Adding \"uuid\" column to form_field table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-global_property','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10090,'MARK_RAN','8:3191a35266bb80aacd7dbfbcab62c881','Add Column','Adding \"uuid\" column to global_property table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10091,'MARK_RAN','8:299ee90d4b77c2f8644295016756f26d','Add Column','Adding \"uuid\" column to hl7_in_archive table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10092,'MARK_RAN','8:c2d494cf4849455cf98b28d5787bcff8','Add Column','Adding \"uuid\" column to hl7_in_error table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10093,'MARK_RAN','8:761e2adde052d212fae3ddf795305726','Add Column','Adding \"uuid\" column to hl7_in_queue table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-hl7_source','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10094,'MARK_RAN','8:03f5882475857194746c9cae19fb033d','Add Column','Adding \"uuid\" column to hl7_source table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-location','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10095,'MARK_RAN','8:fb5852c147c6552683742bb36cab712a','Add Column','Adding \"uuid\" column to location table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-location_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10096,'MARK_RAN','8:9d2d045aa80786a9a3258df6332d5683','Add Column','Adding \"uuid\" column to location_tag table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-note','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10097,'MARK_RAN','8:6cddec65df48e21d60213067fa3b17b1','Add Column','Adding \"uuid\" column to note table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-notification_alert','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10098,'MARK_RAN','8:dc0b48ef8527b4051b21f288853edcd1','Add Column','Adding \"uuid\" column to notification_alert table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-notification_template','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10099,'MARK_RAN','8:282775b441053b08fe0c52a264d4129a','Add Column','Adding \"uuid\" column to notification_template table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-obs','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10100,'MARK_RAN','8:53c3e6402015533b339c62e16719b405','Add Column','Adding \"uuid\" column to obs table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-orders','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10102,'MARK_RAN','8:63d4fa7c72867778d83f761f62d1d8f0','Add Column','Adding \"uuid\" column to orders table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-order_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10101,'MARK_RAN','8:7a330740dbef60e686d1ea8b288e2c25','Add Column','Adding \"uuid\" column to order_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10103,'MARK_RAN','8:9146eb4b70d16a42a4f22ec512b1ebb3','Add Column','Adding \"uuid\" column to patient_identifier table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10104,'MARK_RAN','8:ad452810a6368848d35038295d34adf8','Add Column','Adding \"uuid\" column to patient_identifier_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-patient_program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10105,'MARK_RAN','8:3b3828a5869d8534b3e9005e76864760','Add Column','Adding \"uuid\" column to patient_program table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-patient_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10106,'MARK_RAN','8:8adb1f93dd431670c14974af4eb9a136','Add Column','Adding \"uuid\" column to patient_state table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-person','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10107,'MARK_RAN','8:fc958fe4b7b798e07fb298193dac004a','Add Column','Adding \"uuid\" column to person table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-person_address','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10108,'MARK_RAN','8:1c4706c30f63e4ac562dda6064c3320d','Add Column','Adding \"uuid\" column to person_address table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-person_attribute','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10109,'MARK_RAN','8:8df07962118ce4256c3663a2cac5fa6d','Add Column','Adding \"uuid\" column to person_attribute table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10110,'MARK_RAN','8:eb63583f3dc09efe8110de22caa78152','Add Column','Adding \"uuid\" column to person_attribute_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-person_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10111,'MARK_RAN','8:2dac685163826c58b24bb5651634062e','Add Column','Adding \"uuid\" column to person_name table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-privilege','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10112,'MARK_RAN','8:c268f25e6813449d2eadf0d68396b2cc','Add Column','Adding \"uuid\" column to privilege table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10113,'MARK_RAN','8:8e8f9accf78030c69ee3215ca9fba00d','Add Column','Adding \"uuid\" column to program table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-program_workflow','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10114,'MARK_RAN','8:5d32167cb42d7cbdd125d72fd61ccf62','Add Column','Adding \"uuid\" column to program_workflow table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10115,'MARK_RAN','8:d3db0773befa2bb3f5067273b3651e08','Add Column','Adding \"uuid\" column to program_workflow_state table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-relationship','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10116,'MARK_RAN','8:fbc333ba5255a1a2ae18c161415e165e','Add Column','Adding \"uuid\" column to relationship table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-relationship_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10117,'MARK_RAN','8:00e478ff9774218dbcae69353e39d36e','Add Column','Adding \"uuid\" column to relationship_type table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-report_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10118,'MARK_RAN','8:e813e7bbf9200ba577a6b7de2c9f2d3e','Add Column','Adding \"uuid\" column to report_object table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10119,'MARK_RAN','8:9e001c357521a148a920c2c18de2c92d','Add Column','Adding \"uuid\" column to report_schema_xml table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-role','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10120,'MARK_RAN','8:7af04cddec8d25686faea5823b062300','Add Column','Adding \"uuid\" column to role table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1515-38-serialized_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10121,'MARK_RAN','8:7f544fd844f6fad7ba68767d01a47c21','Add Column','Adding \"uuid\" column to serialized_object table',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-cohort','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10122,'EXECUTED','8:2aec641cb1c4a52c7a3e3a9aec8ecde2','Update Data','Generating UUIDs for all rows in cohort table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10123,'EXECUTED','8:95207da0528a9be3b9bd25ba74412b5e','Update Data','Generating UUIDs for all rows in concept table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10124,'EXECUTED','8:d93c561107bbfdaf221b962a8faadef2','Update Data','Generating UUIDs for all rows in concept_answer table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_class','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10125,'EXECUTED','8:3c669720a030112860368418505f7ff6','Update Data','Generating UUIDs for all rows in concept_class table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10126,'EXECUTED','8:416d783ab7a7afcaae7de90804bfef76','Update Data','Generating UUIDs for all rows in concept_datatype table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_description','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10127,'EXECUTED','8:c5e949674cfc1ab44c3b14f2a2243eb0','Update Data','Generating UUIDs for all rows in concept_description table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10004,'MARK_RAN','8:473811d69495503c4779f69e1e39cc96',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1516-concept_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10128,'EXECUTED','8:cbb0c68546f2f3cf6c054e2bfb5d35ed','Update Data','Generating UUIDs for all rows in concept_name table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10129,'EXECUTED','8:bdf262d25be8a474ecd082cf912c7a46','Update Data','Generating UUIDs for all rows in concept_name_tag table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10130,'EXECUTED','8:c35661adc7de633f5a09341aa66e4464','Update Data','Generating UUIDs for all rows in concept_proposal table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_set','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10131,'EXECUTED','8:c1ae0a21355b727580ce5fd27f038f9a','Update Data','Generating UUIDs for all rows in concept_set table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10005,'MARK_RAN','8:8b55f0633e4cfac3b4cafa1457414587',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1516-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10132,'EXECUTED','8:9e6d6c9c6aae84fe66b62bfd2f7449f4','Update Data','Generating UUIDs for all rows in concept_state_conversion table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-drug','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10133,'EXECUTED','8:ca660f1210e771cd5fe9adf129fa4fe7','Update Data','Generating UUIDs for all rows in drug table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-encounter','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10134,'EXECUTED','8:fcad09479545ddbd610c1fbe80a99a98','Update Data','Generating UUIDs for all rows in encounter table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-encounter_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10135,'EXECUTED','8:28cf79decfb6733b9fded57570ae70aa','Update Data','Generating UUIDs for all rows in encounter_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10136,'EXECUTED','8:4fff4e8fa2e3baa014447181e93a2179','Update Data','Generating UUIDs for all rows in field table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-field_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10137,'EXECUTED','8:bdf11bfe68d3cd5e72cb9bde6f9db72a','Update Data','Generating UUIDs for all rows in field_answer table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-field_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10138,'EXECUTED','8:9c0ae756b4216bfe210ee3bc0010ca59','Update Data','Generating UUIDs for all rows in field_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-form','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10139,'EXECUTED','8:378d9ed17da79cce5c21f6c6bf5b8d7a','Update Data','Generating UUIDs for all rows in form table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-form_field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10140,'EXECUTED','8:859f8df70d99983b7f5be179ee2c0156','Update Data','Generating UUIDs for all rows in form_field table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-global_property','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10141,'EXECUTED','8:0a772a7a774bae5725bd6759eaf2cb23','Update Data','Generating UUIDs for all rows in global_property table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10142,'EXECUTED','8:54a322e0f3b5cf7ed897e2249ca17d76','Update Data','Generating UUIDs for all rows in hl7_in_archive table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10143,'EXECUTED','8:4bbb1e57dca851e4110d41d4dc0ec463','Update Data','Generating UUIDs for all rows in hl7_in_error table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10144,'EXECUTED','8:01b916c4d68fd62fd0ab23531d9860f0','Update Data','Generating UUIDs for all rows in hl7_in_queue table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-hl7_source','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10145,'EXECUTED','8:13e38d86ad39fca09b4e9e82a63705c7','Update Data','Generating UUIDs for all rows in hl7_source table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-location','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10146,'EXECUTED','8:32f5adaaf261baad31e70e79643c2c2b','Update Data','Generating UUIDs for all rows in location table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-location_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10147,'EXECUTED','8:3042d164255542158295b00512ed45f2','Update Data','Generating UUIDs for all rows in location_tag table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-note','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10148,'EXECUTED','8:670ed9708c27860f462b54c068196a69','Update Data','Generating UUIDs for all rows in note table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-notification_alert','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10149,'EXECUTED','8:383fec14d77658f1211f1165c240d255','Update Data','Generating UUIDs for all rows in notification_alert table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-notification_template','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10150,'EXECUTED','8:f1c0ccfe7a0aaf2d233d0822d3c213b0','Update Data','Generating UUIDs for all rows in notification_template table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-obs','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10151,'EXECUTED','8:1d9b0b160fefef7205f4a424d03cdaf3','Update Data','Generating UUIDs for all rows in obs table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-orders','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10153,'EXECUTED','8:38902fa2f185db604bf719baf5fedd0f','Update Data','Generating UUIDs for all rows in orders table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-order_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10152,'EXECUTED','8:9ec2968e7184834a13f32af289826480','Update Data','Generating UUIDs for all rows in order_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10154,'EXECUTED','8:8f868c560c9b44b629e6a1d0eff550dd','Update Data','Generating UUIDs for all rows in patient_identifier table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10155,'EXECUTED','8:5d1400c2dc3c6d6c5ffeb02b72942fa5','Update Data','Generating UUIDs for all rows in patient_identifier_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-patient_program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10156,'EXECUTED','8:12451028127f6d7536989af69ec8bdc9','Update Data','Generating UUIDs for all rows in patient_program table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-patient_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10157,'EXECUTED','8:0b81277a703b38d0ebe5cf65e7ecc313','Update Data','Generating UUIDs for all rows in patient_state table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-person','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10158,'EXECUTED','8:357977a0ad46e8e166a51fd516820898','Update Data','Generating UUIDs for all rows in person table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-person_address','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10159,'EXECUTED','8:5f4b16332d1645b1a3a2c3671e680cc9','Update Data','Generating UUIDs for all rows in person_address table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-person_attribute','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10160,'EXECUTED','8:51c79b0cdd021644e011b4fb57376436','Update Data','Generating UUIDs for all rows in person_attribute table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10161,'EXECUTED','8:2a7050fcd87693ae2f8cb7d6d3f6ed23','Update Data','Generating UUIDs for all rows in person_attribute_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-person_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10162,'EXECUTED','8:d04cb9640a4462cc376b7497d045fb2b','Update Data','Generating UUIDs for all rows in person_name table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-privilege','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10163,'EXECUTED','8:8661fe630022fa2f248a313f578dd30b','Update Data','Generating UUIDs for all rows in privilege table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10164,'EXECUTED','8:048acecb6308a96c34b3fc6db419d25f','Update Data','Generating UUIDs for all rows in program table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-program_workflow','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10165,'EXECUTED','8:27bb44cb60d3e895512cb9022aa586b0','Update Data','Generating UUIDs for all rows in program_workflow table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10166,'EXECUTED','8:ffd6c9969bbf9ea41aef80d5c0d493a6','Update Data','Generating UUIDs for all rows in program_workflow_state table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-relationship','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10167,'EXECUTED','8:3439981909918c7932414c77c17072cc','Update Data','Generating UUIDs for all rows in relationship table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-relationship_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10168,'EXECUTED','8:0cca043249122b9f4f639e56f272491c','Update Data','Generating UUIDs for all rows in relationship_type table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-report_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10169,'EXECUTED','8:9c954f74614ab79ae4f0fed58f8a6f88','Update Data','Generating UUIDs for all rows in report_object table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10170,'EXECUTED','8:3440f488fa2cab5432b80a40c883f580','Update Data','Generating UUIDs for all rows in report_schema_xml table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-role','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10171,'EXECUTED','8:b9cca9504ef0caaebb12f4208a7dc428','Update Data','Generating UUIDs for all rows in role table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1516-serialized_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10172,'EXECUTED','8:2607cf633f0300f09c6a339bdde6529b','Update Data','Generating UUIDs for all rows in serialized_object table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1517','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10181,'MARK_RAN','8:c21f941e118c0d47576e1641d185ccd5','Custom Change','Adding UUIDs to all rows in all columns via a java class. (This will take a long time on large databases)',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1518','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10182,'MARK_RAN','8:76910e4c3815ec85281ce213f54d987f','Add Not-Null Constraint (x52)','Now that UUID generation is done, set the uuid columns to not \"NOT NULL\"',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-cohort','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10183,'EXECUTED','8:77b494d38aabc6081271790f1564dab1','Create Index','Creating unique index on cohort.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10184,'EXECUTED','8:500f06c0ccd14c3ad38ad346625bce42','Create Index','Creating unique index on concept.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10185,'EXECUTED','8:c69cbfc6d2a895f923c44cef77c58c57','Create Index','Creating unique index on concept_answer.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_class','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:36',10186,'EXECUTED','8:777953414468627a2f501bd7e125db49','Create Index','Creating unique index on concept_class.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:36',10187,'EXECUTED','8:6c8e4a3a894750ce9bc678e9d807518a','Create Index','Creating unique index on concept_datatype.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_description','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:36',10188,'EXECUTED','8:317a7702fa74a21e03cfb9e3a52de422','Create Index','Creating unique index on concept_description.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10006,'MARK_RAN','8:bb2d240e64ac0fe71b690d29198df955',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1519-concept_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:36',10189,'EXECUTED','8:8bbbbd22558e249981bf4d3f6c7371a0','Create Index','Creating unique index on concept_name.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:37',10190,'EXECUTED','8:3bd2e9880786acbece7c5e6a32df1a6e','Create Index','Creating unique index on concept_name_tag.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:37',10191,'EXECUTED','8:5c89b47e4723db1092ff4cd1edf9789d','Create Index','Creating unique index on concept_proposal.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_set','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:37',10192,'EXECUTED','8:726cacc6a41d6085f83ebd2ded0b0508','Create Index','Creating unique index on concept_set.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10007,'MARK_RAN','8:326340af265daddbe08cfa9318455f75',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090402-1519-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:37',10193,'EXECUTED','8:34f2585ef6ec5a1406ba4cb500d797f2','Create Index','Creating unique index on concept_state_conversion.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-drug','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:38',10194,'EXECUTED','8:90a5c1c07fc60cf606f2e5287420eb8a','Create Index','Creating unique index on drug.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-encounter','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:38',10195,'EXECUTED','8:e1469cea326c33a9a7b2037e0f3fd950','Create Index','Creating unique index on encounter.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-encounter_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:38',10196,'EXECUTED','8:6b6184d6dfa1cb5244846f86905834c2','Create Index','Creating unique index on encounter_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:38',10197,'EXECUTED','8:9c28f982a3f44a0ff474bcf2e5c3fbe0','Create Index','Creating unique index on field.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-field_answer','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:39',10198,'EXECUTED','8:4e30b5bd7fb49b67689d8e9d7ce098cb','Create Index','Creating unique index on field_answer.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-field_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:39',10199,'EXECUTED','8:76fba4dbde21b10af578e7a234f36e79','Create Index','Creating unique index on field_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-form','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:39',10200,'EXECUTED','8:6bd03d28591c39c417bebedb4d07a2d9','Create Index','Creating unique index on form.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-form_field','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:39',10201,'EXECUTED','8:9f5f7a115a63a18bff06a79ab57e3b79','Create Index','Creating unique index on form_field.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-global_property','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:40',10202,'EXECUTED','8:6b83da608638370c70772fbda4306f80','Create Index','Creating unique index on global_property.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:40',10203,'EXECUTED','8:8bf1e300e8d59d339d074ee1d9c06a3e','Create Index','Creating unique index on hl7_in_archive.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:40',10204,'EXECUTED','8:96007e74c2ab4db39707f441a0e405c5','Create Index','Creating unique index on hl7_in_error.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:40',10205,'EXECUTED','8:7026ded64129d5ee13983e0139863cef','Create Index','Creating unique index on hl7_in_queue.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-hl7_source','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:41',10206,'EXECUTED','8:9aefe928785ebc93038120d8f1198b09','Create Index','Creating unique index on hl7_source.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-location','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:41',10207,'EXECUTED','8:a8bd3a1fe414a06a075c50bb23bf7e96','Create Index','Creating unique index on location.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-location_tag','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:41',10208,'EXECUTED','8:25dbec36375b2d464c85efa5d7d45ece','Create Index','Creating unique index on location_tag.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-note','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:41',10209,'EXECUTED','8:78990bcbb4708019e152c1cff21b94b7','Create Index','Creating unique index on note.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-notification_alert','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:42',10210,'EXECUTED','8:fe7cb1bda832204e534c4b3af6a39605','Create Index','Creating unique index on notification_alert.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-notification_template','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:42',10211,'EXECUTED','8:b209aecc9baa12965e731bb464fd3f5c','Create Index','Creating unique index on notification_template.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-obs','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:42',10212,'EXECUTED','8:4395352eee53db567d0d66e3e8bf7d2d','Create Index','Creating unique index on obs.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-orders','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:42',10214,'EXECUTED','8:8e03d3bdee85f503eaf3a836f7e80b43','Create Index','Creating unique index on orders.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-order_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:42',10213,'EXECUTED','8:a4c3cb136a54680371d860c89d13c90f','Create Index','Creating unique index on order_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:43',10215,'EXECUTED','8:102efeb63bce03581ef711e92fbf4269','Create Index','Creating unique index on patient_identifier.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:43',10216,'EXECUTED','8:09db86cc2664cd4e1fdf6b4c7b7c83f0','Create Index','Creating unique index on patient_identifier_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-patient_program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:43',10217,'EXECUTED','8:9701be1bbedaacd361eda124e80cc0fd','Create Index','Creating unique index on patient_program.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-patient_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:43',10218,'EXECUTED','8:53318c39e879f77a7b6d8ed569969258','Create Index','Creating unique index on patient_state.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-person','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:44',10219,'EXECUTED','8:767cf71beed653993ad3f2c80d01f839','Create Index','Creating unique index on person.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-person_address','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:44',10220,'EXECUTED','8:a2e00f3d9e790b0645fc59d3c5867f90','Create Index','Creating unique index on person_address.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-person_attribute','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:44',10221,'EXECUTED','8:0526457c6e72d5d0fc510a8df3c5ed82','Create Index','Creating unique index on person_attribute.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:44',10222,'EXECUTED','8:c61cabd046206a46a734a908e4a69636','Create Index','Creating unique index on person_attribute_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-person_name','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:45',10223,'EXECUTED','8:5369e0fa305852af136d2db5656d65f3','Create Index','Creating unique index on person_name.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-privilege','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:45',10224,'EXECUTED','8:06caf65888135bb5004b72befdabb9e3','Create Index','Creating unique index on privilege.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-program','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:45',10225,'EXECUTED','8:9b6166282bfd83be4c7d17503ec8c77e','Create Index','Creating unique index on program.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-program_workflow','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:45',10226,'EXECUTED','8:e2a4933e4b5a58e7c9b0db0fe8a3a080','Create Index','Creating unique index on program_workflow.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:46',10227,'EXECUTED','8:855a4d592fda084790c160bda14e60fd','Create Index','Creating unique index on program_workflow_state.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-relationship','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:46',10228,'EXECUTED','8:353b87e4d3d7cf8941a59ec946e1deb6','Create Index','Creating unique index on relationship.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-relationship_type','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:46',10229,'EXECUTED','8:894a9d4a6491ab41ce500852f4ba9f06','Create Index','Creating unique index on relationship_type.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-report_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:46',10230,'EXECUTED','8:d270ccf458d341419b7ffd672f381602','Create Index','Creating unique index on report_object.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10231,'EXECUTED','8:85fde849e083b6d73d9f77bfe8b348da','Create Index','Creating unique index on report_schema_xml.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-role','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10232,'EXECUTED','8:6e59e26f177e1690d53eaee678369e91','Create Index','Creating unique index on role.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090402-1519-serialized_object','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10233,'EXECUTED','8:56201769190e59008c7e5cfb1d1cf2c9','Create Index','Creating unique index on serialized_object.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090408-1298','Cory McCarthy','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10068,'EXECUTED','8:c461291f0024f205ab1a0d8085500649','Modify Column','Changed the datatype for encounter_type to \'text\' instead of just 50 chars',NULL,'2.0.5',NULL,NULL,NULL),('200904091023','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10067,'EXECUTED','8:edd3c2248371a8f0f2b66efd137d672c','Delete Data (x4)','Remove Manage Tribes and View Tribes privileges from the privilege table and role_privilege table.\n			The privileges will be recreated by the Tribe module if it is installed.',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0804','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10173,'EXECUTED','8:c7ae9cc69665a7cac874796a15ac75f9','Drop Foreign Key Constraint','Dropping foreign key on concept_set.concept_id table',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0805','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10174,'MARK_RAN','8:31195ba116232c3c239eb99a74f3be9a','Drop Primary Key','Dropping primary key on concept set table',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0806','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:33',10175,'MARK_RAN','8:2fec2a5cbe145044e4ddda6e528b95e8','Add Column','Adding new integer primary key to concept set table',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0807','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:34',10176,'MARK_RAN','8:ebc6c156c3492c8c2d16f12297ae3e43','Create Index, Add Foreign Key Constraint','Adding index and foreign key to concept_set.concept_id column',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0808a','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:34',10177,'EXECUTED','8:b26ae51a72c53522c54fc2e1d9f83ebc','Drop Foreign Key Constraint','Dropping foreign key on patient_identifier.patient_id column',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0808b','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:34',10178,'MARK_RAN','8:5ef5bcb5f83f538fe32a3e1b0ac0d014','Drop Primary Key','Dropping non-integer primary key on patient identifier table before adding a new integer primary key',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0809','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:34',10179,'MARK_RAN','8:d830ba80f78504482eaa8dfe4d93be3d','Add Column','Adding new integer primary key to patient identifier table',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0810','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:35',10180,'MARK_RAN','8:31c7d78247503004563dcec3b22c97fe','Create Index, Add Foreign Key Constraint','Adding index and foreign key on patient_identifier.patient_id column',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0811a','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10234,'EXECUTED','8:a996aae13913281567000b04221e17b4','Drop Foreign Key Constraint','Dropping foreign key on concept_word.concept_id column',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0811b','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10236,'MARK_RAN','8:68201f30b43cec5ad62a2c0ad1ef8cf3','Drop Primary Key','Dropping non-integer primary key on concept word table before adding new integer one',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0812','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10237,'MARK_RAN','8:be261ff12facaf51c32cbd2c442149ce','Add Column','Adding integer primary key to concept word table',NULL,'2.0.5',NULL,NULL,NULL),('20090414-0812b','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10238,'MARK_RAN','8:6a9f6449f288592ea5e47bae65986340','Add Foreign Key Constraint','Re-adding foreign key for concept_word.concept_name_id',NULL,'2.0.5',NULL,NULL,NULL),('200904271042','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10241,'MARK_RAN','8:63e5f7ca7868c45cda0fcb1250323e00','Drop Column','Remove the now unused synonym column',NULL,'2.0.5',NULL,NULL,NULL),('20090428-0811aa','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:47',10235,'MARK_RAN','8:210185827394b8982208a79333b4c33f','Drop Foreign Key Constraint','Removing concept_word.concept_name_id foreign key so that primary key can be changed to concept_word_id',NULL,'2.0.5',NULL,NULL,NULL),('20090428-0854','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10239,'EXECUTED','8:1ad9516c3ccff7c5d0f2c4d0ccb4d820','Add Foreign Key Constraint','Adding foreign key for concept_word.concept_id column',NULL,'2.0.5',NULL,NULL,NULL),('200905071626','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10070,'MARK_RAN','8:56e2d2bb15a004bd5ac5bf362e7e3f82','Create Index','Add an index to the concept_word.concept_id column (This update may fail if it already exists)',NULL,'2.0.5',NULL,NULL,NULL),('200905150814','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:32',10069,'EXECUTED','8:d4325318f852b3ede2798d3a08f42088','Delete Data','Deleting invalid concept words',NULL,'2.0.5',NULL,NULL,NULL),('200905150821','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10240,'EXECUTED','8:096845d15f847ebefb86fec52322ee8f','Custom SQL','Deleting duplicate concept word keys',NULL,'2.0.5',NULL,NULL,NULL),('200906301606','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10244,'EXECUTED','8:044fc2a5c368ef46ca54e94f5283ba23','Modify Column','Change person_attribute_type.sort_weight from an integer to a float',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-1','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10245,'EXECUTED','8:3a4f40729f5f01ef36ee1c178a987138','Modify Column','Change obs.value_numeric from a double(22,0) to a double',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-2','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10246,'EXECUTED','8:450c05cda87828eb6f47ffe0cdf401ce','Modify Column','Change concept_numeric columns from a double(22,0) type to a double',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-3','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10247,'EXECUTED','8:3ec90a07b19979d3f1a2832381ef162d','Modify Column','Change concept_set.sort_weight from a double(22,0) to a double',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-4','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10248,'EXECUTED','8:e9cf31e6d6c61bd1fe037f91a615a8bc','Modify Column','Change concept_set_derived.sort_weight from a double(22,0) to a double',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-5','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10249,'EXECUTED','8:60ce0bb585b5279a887cb56a7e26e945','Modify Column','Change drug table columns from a double(22,0) to a double',NULL,'2.0.5',NULL,NULL,NULL),('200907161638-6','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10250,'EXECUTED','8:4e57bc42bd5470361e6cda531795c115','Modify Column','Change drug_order.dose from a double(22,0) to a double',NULL,'2.0.5',NULL,NULL,NULL),('200908291938-1','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10008,'MARK_RAN','8:e5090f4822b86509bb56596dceab99a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('200908291938-2a','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10009,'MARK_RAN','8:d634a0e082718f7366d632aa5ed24593',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20090831-1039-38-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10254,'MARK_RAN','8:d946e9fef0aca80b94cb3d4409289d38','Add Column','Adding \"uuid\" column to scheduler_task_config table',NULL,'2.0.5',NULL,NULL,NULL),('20090831-1040-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10255,'EXECUTED','8:0ff0cf59b9ea0198eb9aa57efdc52202','Update Data','Generating UUIDs for all rows in scheduler_task_config table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20090831-1041-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10256,'MARK_RAN','8:a738d122f05898d4f7817e280e5d7dd1','Custom Change','Adding UUIDs to all rows in scheduler_task_config table via a java class for non mysql/oracle/mssql databases.',NULL,'2.0.5',NULL,NULL,NULL),('20090831-1042-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10257,'EXECUTED','8:980b925052886c640c72550654dec469','Add Not-Null Constraint','Now that UUID generation is done for scheduler_task_config, set the uuid column to not \"NOT NULL\"',NULL,'2.0.5',NULL,NULL,NULL),('20090831-1043-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10258,'EXECUTED','8:e65d51a694f6ab7dc4507b049f2ea611','Create Index','Creating unique index on scheduler_task_config.uuid column',NULL,'2.0.5',NULL,NULL,NULL),('20090907-1','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10259,'MARK_RAN','8:d62c4cf899e32b8abfb9a48ac4e02b88','Rename Column','Rename the concept_source.date_voided column to date_retired',NULL,'2.0.5',NULL,NULL,NULL),('20090907-2a','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10260,'MARK_RAN','8:4cbe5f1c7fcb781e1c286f7b52b05123','Drop Foreign Key Constraint','Remove the concept_source.voided_by foreign key constraint',NULL,'2.0.5',NULL,NULL,NULL),('20090907-2b','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10261,'MARK_RAN','8:c539308417bd8549b90356addfbc9b85','Rename Column, Add Foreign Key Constraint','Rename the concept_source.voided_by column to retired_by',NULL,'2.0.5',NULL,NULL,NULL),('20090907-3','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10262,'MARK_RAN','8:23b6001e89959129ba05e21077cbc427','Rename Column','Rename the concept_source.voided column to retired',NULL,'2.0.5',NULL,NULL,NULL),('20090907-4','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10263,'MARK_RAN','8:80eb04b2bb5c0e714b29dba6ebdfd502','Rename Column','Rename the concept_source.void_reason column to retire_reason',NULL,'2.0.5',NULL,NULL,NULL),('20091001-1023','rcrichton','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10291,'MARK_RAN','8:1e7ac300f296e9eadf8bc121ddd053da','Add Column','add retired column to relationship_type table',NULL,'2.0.5',NULL,NULL,NULL),('20091001-1024','rcrichton','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10292,'MARK_RAN','8:4d7a047e2438ab41b60e3cbb81405863','Add Column','add retired_by column to relationship_type table',NULL,'2.0.5',NULL,NULL,NULL),('20091001-1025','rcrichton','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10293,'MARK_RAN','8:67813c79367264837a9aedbc8cda45dc','Add Foreign Key Constraint','Create the foreign key from the relationship.retired_by to users.user_id.',NULL,'2.0.5',NULL,NULL,NULL),('20091001-1026','rcrichton','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10294,'MARK_RAN','8:ee3a0de9371dad837a6c57cb5488378d','Add Column','add date_retired column to relationship_type table',NULL,'2.0.5',NULL,NULL,NULL),('20091001-1027','rcrichton','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10295,'MARK_RAN','8:5d943e10f541dae0d795443c3986948f','Add Column','add retire_reason column to relationship_type table',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-1','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10264,'EXECUTED','8:23d6932d2fbff1776cb07c241fb96520','Update Data (x5)','Setting core field types to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-10','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10273,'EXECUTED','8:21cdf21fa5da029385241ae0dd09ac97','Update Data (x4)','Setting core roles to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-2','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10265,'EXECUTED','8:f446e8df5eaf852168c54402101ca1a3','Update Data (x7)','Setting core person attribute types to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-3','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10266,'EXECUTED','8:9430aaffa164ed6be0e42efd1aba2112','Update Data (x4)','Setting core encounter types to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-4','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10267,'EXECUTED','8:c8fbf8c706341ec7404fdf974d2577c2','Update Data (x12)','Setting core concept datatypes to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-5','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10268,'EXECUTED','8:98daa6de2bd8ba45273bd4b69715ea5e','Update Data (x4)','Setting core relationship types to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-6','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10269,'EXECUTED','8:a080a9b0abaf6a4c71e1836d1db9e70e','Update Data (x15)','Setting core concept classes to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-7','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10270,'EXECUTED','8:a595ef7a02fcb5da4072a0a7bab0ff10','Update Data (x2)','Setting core patient identifier types to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-8','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10271,'EXECUTED','8:243233f07faeed0ac0df5cee4e5b9bbc','Update Data','Setting core location to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200910271049-9','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10272,'EXECUTED','8:89a5030d339ad14f4d9f43b9ccd31e8a','Update Data','Setting core hl7 source to have standard UUIDs',NULL,'2.0.5',NULL,NULL,NULL),('200912031842','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10277,'EXECUTED','8:82ac70cd14fed7009266943f155ffee7','Drop Foreign Key Constraint, Add Foreign Key Constraint','Changing encounter.provider_id to reference person instead of users',NULL,'2.0.5',NULL,NULL,NULL),('200912031846-1','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10279,'MARK_RAN','8:77ff621f2e656826b8608f19478aaddf','Add Column, Update Data','Adding person_id column to users table (if needed)',NULL,'2.0.5',NULL,NULL,NULL),('200912031846-2','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10280,'MARK_RAN','8:b0748b0c468f23f2fa58c8ed1d081839','Update Data, Add Not-Null Constraint','Populating users.person_id',NULL,'2.0.5',NULL,NULL,NULL),('200912031846-3','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10281,'EXECUTED','8:6b05d0fd1d75a6095123ea18f108b56a','Add Foreign Key Constraint, Set Column as Auto-Increment','Restoring foreign key constraint on users.person_id',NULL,'2.0.5',NULL,NULL,NULL),('200912071501-1','arthurs','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10274,'EXECUTED','8:8764502f80067d318dfd2faf3731bbed','Update Data','Change name for patient.searchMaxResults global property to person.searchMaxResults',NULL,'2.0.5',NULL,NULL,NULL),('200912091819','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10282,'MARK_RAN','8:226f16d4a250f1ccf1af5fdaa7d48761','Add Column, Add Foreign Key Constraint','Adding retired metadata columns to users table',NULL,'2.0.5',NULL,NULL,NULL),('200912091819-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10283,'EXECUTED','8:2764ddfca1b043b732dad9881e3d49f7','Modify Column','(Fixed)users.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('200912091820','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10284,'MARK_RAN','8:80d1f6e3d1adedd6ef1b6247e058af21','Update Data','Migrating voided metadata to retired metadata for users table',NULL,'2.0.5',NULL,NULL,NULL),('200912091821','djazayeri','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10012,'MARK_RAN','8:71e37f0c4349070be32aac4af3374fa0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('200912140038','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10285,'MARK_RAN','8:e2240aba6ac7f26f9802be8411084fd8','Add Column','Adding \"uuid\" column to users table',NULL,'2.0.5',NULL,NULL,NULL),('200912140039','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10286,'EXECUTED','8:8027b71175d4202a72bda26f7e107cdf','Update Data','Generating UUIDs for all rows in users table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('200912140040','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10287,'MARK_RAN','8:c5bd581226dfb2f5c7762b205513bcb9','Custom Change','Adding UUIDs to users table via a java class. (This will take a long time on large databases)',NULL,'2.0.5',NULL,NULL,NULL),('200912141000-drug-add-date-changed','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10469,'MARK_RAN','8:a11b32c878736f7e6cc5fbb3626f2434','Add Column','Add date_changed column to drug table',NULL,'2.0.5',NULL,NULL,NULL),('200912141001-drug-add-changed-by','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10470,'MARK_RAN','8:a267bc3e9979e861b15ceea91818cdd1','Add Column, Add Foreign Key Constraint','Add changed_by column to drug table',NULL,'2.0.5',NULL,NULL,NULL),('200912141552','madanmohan','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10275,'MARK_RAN','8:55ee44a866dff1e5dcb69fc194290632','Add Column, Add Foreign Key Constraint','Add changed_by column to encounter table',NULL,'2.0.5',NULL,NULL,NULL),('200912141553','madanmohan','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10276,'MARK_RAN','8:f74808b8d0e70703c836cade7f4977a2','Add Column','Add date_changed column to encounter table',NULL,'2.0.5',NULL,NULL,NULL),('20091215-0208','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10296,'EXECUTED','8:19e9a8690cdb14b0a786d1601e91b1de','Custom SQL','Prune concepts rows orphaned in concept_numeric tables',NULL,'2.0.5',NULL,NULL,NULL),('20091215-0209','jmiranda','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10297,'EXECUTED','8:e5265abc655a7ec6195a36faf971ebc2','Custom SQL','Prune concepts rows orphaned in concept_complex tables',NULL,'2.0.5',NULL,NULL,NULL),('20091215-0210','jmiranda','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10011,'MARK_RAN','8:187f8a0f34e454b5adddfcded840f610',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('200912151032','n.nehete','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10289,'EXECUTED','8:5587ff3f964f6c0ef863fd2679a7af1b','Add Not-Null Constraint','Encounter Type should not be null when saving an Encounter',NULL,'2.0.5',NULL,NULL,NULL),('200912211118','nribeka','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10010,'MARK_RAN','8:a0be212b17f9a3be33b6e6d0f97d1a5c',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('201001072007','upul','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10290,'MARK_RAN','8:a8d4f3d196b4585531d89adc4d9bfaa3','Add Column','Add last execution time column to scheduler_task_config table',NULL,'2.0.5',NULL,NULL,NULL),('20100111-0111-associating-daemon-user-with-person','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10462,'MARK_RAN','8:c72be5ab36e9c2c7a36528e8c1c66478','Custom SQL','Associating daemon user with a person',NULL,'2.0.5',NULL,NULL,NULL),('20100128-1','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10251,'MARK_RAN','8:9a5dbd5c16787ee4670a889c0b3563a0','Insert Row','Adding \'System Developer\' role again (see ticket #1499)',NULL,'2.0.5',NULL,NULL,NULL),('20100128-2','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10252,'MARK_RAN','8:146b8eb501aae3a9d23f62a8fc89a53a','Update Data','Switching users back from \'Administrator\' to \'System Developer\' (see ticket #1499)',NULL,'2.0.5',NULL,NULL,NULL),('20100128-3','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:48',10253,'MARK_RAN','8:33e7b5581d96e6ef6c1d2c585eeef324','Delete Data','Deleting \'Administrator\' role (see ticket #1499)',NULL,'2.0.5',NULL,NULL,NULL),('20100306-095513a','thilini.hg','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10298,'MARK_RAN','8:cc3b542d171452e4684a4f15742bc592','Drop Foreign Key Constraint','Dropping unused foreign key from notification alert table',NULL,'2.0.5',NULL,NULL,NULL),('20100306-095513b','thilini.hg','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10299,'MARK_RAN','8:277cc468e6aa9258fbac3ce37c88b6e6','Drop Column','Dropping unused user_id column from notification alert table',NULL,'2.0.5',NULL,NULL,NULL),('20100322-0908','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10300,'MARK_RAN','8:fae60ed0a1fd3f64484e1ab3dff39c7f','Add Column, Update Data','Adding sort_weight column to concept_answers table and initially sets the sort_weight to the concept_answer_id',NULL,'2.0.5',NULL,NULL,NULL),('20100323-192043','ricardosbarbosa','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10317,'EXECUTED','8:22fc806be045ee61b18dc2c15c9e454d','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Add Concept Proposal\' in favor of \'Add Concept Proposals\'',NULL,'2.0.5',NULL,NULL,NULL),('20100330-190413','ricardosbarbosa','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10318,'EXECUTED','8:fd57944f31d29f10fd984a364556e6ef','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Edit Concept Proposal\' in favor of \'Edit Concept Proposals\'',NULL,'2.0.5',NULL,NULL,NULL),('20100412-2217','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10301,'MARK_RAN','8:2a2eccd27a0ccfa3640864fdab32edb0','Add Column','Adding \"uuid\" column to notification_alert_recipient table',NULL,'2.0.5',NULL,NULL,NULL),('20100412-2218','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10302,'EXECUTED','8:b81d6cac8db510e4ca1449202e41fd45','Update Data','Generating UUIDs for all rows in notification_alert_recipient table via built in uuid function.',NULL,'2.0.5',NULL,NULL,NULL),('20100412-2219','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10303,'MARK_RAN','8:9d7e78fcb1a5ebe7e34f05fc94a1116f','Custom Change','Adding UUIDs to notification_alert_recipient table via a java class (if needed).',NULL,'2.0.5',NULL,NULL,NULL),('20100412-2220','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10304,'EXECUTED','8:c208411e9c01b29b520b2d15bcf9f55f','Add Not-Null Constraint','Now that UUID generation is done, set the notification_alert_recipient.uuid column to not \"NOT NULL\"',NULL,'2.0.5',NULL,NULL,NULL),('20100413-1509','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10305,'MARK_RAN','8:7e44eccfd68046f392168bce56a35163','Rename Column','Change location_tag.tag to location_tag.name',NULL,'2.0.5',NULL,NULL,NULL),('20100415-forgotten-from-before','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10288,'EXECUTED','8:6574c7948db9e686d5010bc833a0579c','Add Not-Null Constraint','Adding not null constraint to users.uuid',NULL,'2.0.5',NULL,NULL,NULL),('20100419-1209','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10385,'MARK_RAN','8:597a1c408d8ddbd964370a1de61814a5','Create Table, Add Foreign Key Constraint (x7), Create Index','Create the visit table and add the foreign key for visit_type',NULL,'2.0.5',NULL,NULL,NULL),('20100419-1209-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10386,'EXECUTED','8:81fcc92ec6a41bf454f8d0832d1dc1a1','Modify Column','(Fixed)Changed visit.voided to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20100423-1402','slorenz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10307,'MARK_RAN','8:4afd4079efd3ff663172a71a656cb0af','Create Index','Add an index to the encounter.encounter_datetime column to speed up statistical\n			analysis.',NULL,'2.0.5',NULL,NULL,NULL),('20100423-1406','slorenz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10308,'MARK_RAN','8:722b0dba4b61dcab30b52c887cf9e0b8','Create Index','Add an index to the obs.obs_datetime column to speed up statistical analysis.',NULL,'2.0.5',NULL,NULL,NULL),('20100426-1111-add-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10463,'EXECUTED','8:8e301734688653a461f8f70769939106','Add Not-Null Constraint','Add the not null person id contraint',NULL,'2.0.5',NULL,NULL,NULL),('20100426-1111-remove-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10309,'EXECUTED','8:949a17577887a067e61a70e2a07776bc','Drop Not-Null Constraint','Drop the not null person id contraint',NULL,'2.0.5',NULL,NULL,NULL),('20100426-1947','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10310,'MARK_RAN','8:6a5d4dffc66d17649534cf5bab3711c5','Insert Row','Adding daemon user to users table',NULL,'2.0.5',NULL,NULL,NULL),('20100512-1400','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10312,'MARK_RAN','8:ebc342e31168b104b1a855d17eb1a145','Insert Row','Create core order_type for drug orders',NULL,'2.0.5',NULL,NULL,NULL),('20100513-1947','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10311,'EXECUTED','8:f1e35335210be5047614b7f7a4b4e182','Delete Data (x2)','Removing scheduler.username and scheduler.password global properties',NULL,'2.0.5',NULL,NULL,NULL),('20100517-1545','wyclif and djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10313,'EXECUTED','8:ae87f981f04fae8f03c3859ef84ce632','Custom Change','Switch boolean concepts/observations to be stored as coded',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-1','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10319,'MARK_RAN','8:3d48d9996ee36dcbb39edfc649d499de','Create Table, Add Foreign Key Constraint (x2)','Create active list type table.',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-1-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10320,'EXECUTED','8:bdee9ea46cd4ae75e1fbfc2257d8c7fa','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-2','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10321,'MARK_RAN','8:0e4feb9bc6ebf0989f3d52f653987dc8','Create Table, Add Foreign Key Constraint (x7)','Create active list table',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-2-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10322,'EXECUTED','8:0681e8628edfbf79903f4a282e964517','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-3','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10323,'MARK_RAN','8:6a70737e46b4c9da140e334889543639','Create Table, Add Foreign Key Constraint','Create allergen table',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-4','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10324,'MARK_RAN','8:9412cbd4f4330ea59c04cd314caf6e6e','Create Table','Create problem table',NULL,'2.0.5',NULL,NULL,NULL),('20100525-818-5','syhaas','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10325,'MARK_RAN','8:b44486b46d789020feece4100f07226a','Insert Row (x2)','Inserting default active list types',NULL,'2.0.5',NULL,NULL,NULL),('20100526-1025','Harsha.cse','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10314,'EXECUTED','8:e81895e7335e642b219d9520e5d051c0','Drop Not-Null Constraint (x2)','Drop Not-Null constraint from location column in Encounter and Obs table',NULL,'2.0.5',NULL,NULL,NULL),('20100603-1625-1-person_address','sapna','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10366,'MARK_RAN','8:afcf5d54e869e06ddee319fb5b8e2ea5','Add Column','Adding \"date_changed\" column to person_address table',NULL,'2.0.5',NULL,NULL,NULL),('20100603-1625-2-person_address','sapna','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10367,'MARK_RAN','8:f185ffac5a215382b7de2018aad8cf9b','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to person_address table',NULL,'2.0.5',NULL,NULL,NULL),('20100604-0933a','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10315,'EXECUTED','8:5c31dfc2bf4cf407431c2f74c8619b1c','Add Default Value','Changing the default value to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'2.0.5',NULL,NULL,NULL),('20100604-0933b','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10316,'EXECUTED','8:7f6ffd19b615403d5b61c53ca8f099b5','Update Data','Converting 0 and 1 to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550a','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10326,'MARK_RAN','8:49317fce52bc13b927643a5061818733','Add Column','Adding \'concept_name_type\' column to concept_name table',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550b','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10327,'MARK_RAN','8:231fd1d938aa540dc20a66a40b2c65b7','Add Column','Adding \'locale_preferred\' column to concept_name table',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550b-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10328,'EXECUTED','8:23279fd3d8ec462f445ad6ea2c5a25bd','Modify Column','(Fixed)Change concept_name.locale_preferred to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550c','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10329,'EXECUTED','8:a85db3130823a0fa3303be1c3f20ca40','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550d','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10330,'EXECUTED','8:4482ac0fbdef7ca9dd3dbe4dd5950ac7','Update Data, Delete Data (x2)','Setting the concept name type for short names',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550f','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10331,'EXECUTED','8:852131421995919f7635e39a5938aa74','Update Data, Delete Data (x2)','Converting concept names with \'preferred\' and \'preferred_XX\' concept name tags to preferred names',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550g','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10334,'EXECUTED','8:ebd05571a805ac48c744d51797a73926','Delete Data (x2)','Deleting \'default\' and \'synonym\' concept name tags',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550h','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10335,'EXECUTED','8:49690601b77333c239a98a0dd87b48ea','Custom Change','Validating and attempting to fix invalid concepts and ConceptNames',NULL,'2.0.5',NULL,NULL,NULL),('20100607-1550i','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10336,'EXECUTED','8:c5f743c8e5d86321e9faad7714a034f0','Add Foreign Key Constraint','Restoring foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'2.0.5',NULL,NULL,NULL),('20100621-1443','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10337,'EXECUTED','8:3efe573dc4aeb0f4602f4858f48031f7','Modify Column','Modify the error_details column of hl7_in_error to hold\n			stacktraces',NULL,'2.0.5',NULL,NULL,NULL),('201008021047','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10338,'MARK_RAN','8:d37207a166aaca60d194ee966bc7e120','Create Index','Add an index to the person_name.family_name2 to speed up patient and person searches',NULL,'2.0.5',NULL,NULL,NULL),('201008201345','mseaton','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10339,'EXECUTED','8:8773db0676f99091aa4c93783e84c973','Custom Change','Validates Program Workflow States for possible configuration problems and reports warnings',NULL,'2.0.5',NULL,NULL,NULL),('201008242121','misha680','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10340,'EXECUTED','8:5f75b90f75b1e3b9563197e0c478e2cd','Modify Column','Make person_name.person_id not NULLable',NULL,'2.0.5',NULL,NULL,NULL),('20100924-1110','mseaton','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10341,'MARK_RAN','8:ce0f46a7551b0141913d8d0879184c70','Add Column, Add Foreign Key Constraint','Add location_id column to patient_program table',NULL,'2.0.5',NULL,NULL,NULL),('201009281047','misha680','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10342,'MARK_RAN','8:ff2e6e0cfaf8ec11aa9abe24486ab1be','Drop Column','Remove the now unused default_charge column',NULL,'2.0.5',NULL,NULL,NULL),('201010051745','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10343,'EXECUTED','8:beb060b6240890967b8ce28b9bf42fb4','Update Data','Setting the global property \'patient.identifierRegex\' to an empty string',NULL,'2.0.5',NULL,NULL,NULL),('201010051746','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10344,'EXECUTED','8:40f4b376001d7e8275f3ec38c4b2673f','Update Data','Setting the global property \'patient.identifierSuffix\' to an empty string',NULL,'2.0.5',NULL,NULL,NULL),('201010151054','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10345,'MARK_RAN','8:abe3a64258b8fa35d18382132e201e4f','Create Index','Adding index to form.published column',NULL,'2.0.5',NULL,NULL,NULL),('201010151055','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10346,'MARK_RAN','8:ede27f7bbe00e7d92488436c40e95cb6','Create Index','Adding index to form.retired column',NULL,'2.0.5',NULL,NULL,NULL),('201010151056','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10347,'MARK_RAN','8:95a17d8e94c1c037f484ce2778456583','Create Index','Adding multi column index on form.published and form.retired columns',NULL,'2.0.5',NULL,NULL,NULL),('201010261143','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10348,'MARK_RAN','8:db57d4a9ffbef9fa7bd6fd11f13e4862','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261145','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10349,'MARK_RAN','8:861c1dddc95f793a90d8882346962b6f','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261147','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10350,'MARK_RAN','8:e0da5f97d74ee12b59f083cd525e3a89','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261149','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10351,'MARK_RAN','8:4ff46473e5a408f908c24f546ade64da','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261151','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10352,'MARK_RAN','8:27d4a904b2ff1d2dc5a95f89953dda7e','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261153','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10353,'MARK_RAN','8:4384f3a168c246179310ddb83ea84cdb','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261156','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10354,'MARK_RAN','8:f468002c0f4230aaf64643caff634b5e','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('201010261159','crecabarren','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10355,'MARK_RAN','8:dacb6a5db8698edfc5a185a20d213186','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('20101029-1016','gobi/prasann','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10368,'MARK_RAN','8:6104cefe5f6860cbd88263d0f174d7e5','Create Table, Add Unique Constraint','Create table to store concept stop words to avoid in search key indexing',NULL,'2.0.5',NULL,NULL,NULL),('20101029-1026','gobi/prasann','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10369,'MARK_RAN','8:53e135b8d5a4764106323cbb8af6c096','Insert Row (x10)','Inserting the initial concept stop words',NULL,'2.0.5',NULL,NULL,NULL),('201011011600','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10357,'MARK_RAN','8:c33417b0d7b79c1047e80a570938e7de','Create Index','Adding index to message_state column in HL7 archive table',NULL,'2.0.5',NULL,NULL,NULL),('201011011605','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10358,'EXECUTED','8:d99d2c232a3c1e4621a8d138893b459a','Custom Change','Moving \"deleted\" HL7s from HL7 archive table to queue table',NULL,'2.0.5',NULL,NULL,NULL),('201011051300','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10365,'MARK_RAN','8:8147fa6e97c11507e1f592303259720e','Create Index','Adding index on notification_alert.date_to_expire column',NULL,'2.0.5',NULL,NULL,NULL),('201012081716','nribeka','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10363,'MARK_RAN','8:383dd3fb35a2368b1fbc27bf59118f15','Delete Data','Removing concept that are concept derived and the datatype',NULL,'2.0.5',NULL,NULL,NULL),('201012081717','nribeka','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10364,'MARK_RAN','8:3f230e64be983208e486949e2489377d','Drop Table','Removing concept derived tables',NULL,'2.0.5',NULL,NULL,NULL),('20101209-10000-encounter-add-visit-id-column','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10387,'MARK_RAN','8:2df1b03acdf5a6b0d54b4a25077891df','Add Column, Add Foreign Key Constraint','Adding visit_id column to encounter table',NULL,'2.0.5',NULL,NULL,NULL),('20101209-1353','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10509,'MARK_RAN','8:a2f1f517eb417f7efde2eed25cd78b2c','addNotNullConstraint columnName=as_needed, tableName=drug_order','Adding not-null constraint to orders.as_needed',NULL,'4.4.3',NULL,NULL,NULL),('20101209-1721','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10359,'MARK_RAN','8:9e9d018e3f308f58fa80bc8068d3795e','Add Column','Add \'weight\' column to concept_word table',NULL,'2.0.5',NULL,NULL,NULL),('20101209-1722','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10360,'MARK_RAN','8:0be623f667ba4826338d27cd0aa96b9a','Create Index','Adding index to concept_word.weight column',NULL,'2.0.5',NULL,NULL,NULL),('20101209-1723','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10361,'MARK_RAN','8:e6eefd14cf271f73906b95631d1a6890','Insert Row','Insert a row into the schedule_task_config table for the ConceptIndexUpdateTask',NULL,'2.0.5',NULL,NULL,NULL),('20101209-1731','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10362,'MARK_RAN','8:6b7cd4a7763b5cd3eef94bf9c86a8a1e','Update Data','Setting the value of \'start_on_startup\' to trigger off conceptIndexUpdateTask on startup',NULL,'2.0.5',NULL,NULL,NULL),('201012092009','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:52',10356,'EXECUTED','8:5a6ee12caac3b6ab0999a6bba72bcaf7','Modify Column (x10)','Increasing length of address fields in person_address and location to 255',NULL,'2.0.5',NULL,NULL,NULL),('2011-07-12-1947-add-outcomesConcept-to-program','grwarren','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10398,'MARK_RAN','8:4ab8c5595a1b1f1ce1e31a7e2db04a29','Add Column, Add Foreign Key Constraint','Adding the outcomesConcept property to Program',NULL,'2.0.5',NULL,NULL,NULL),('2011-07-12-2005-add-outcome-to-patientprogram','grwarren','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10399,'MARK_RAN','8:92988d39364b8fabd34281f906e7f510','Add Column, Add Foreign Key Constraint','Adding the outcome property to PatientProgram',NULL,'2.0.5',NULL,NULL,NULL),('201101121434','gbalaji,gobi','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10378,'MARK_RAN','8:54c5f947d09d807f9a6a40e0bc44bdd7','Drop Column','Dropping unused date_started column from obs table',NULL,'2.0.5',NULL,NULL,NULL),('201101221453','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10377,'EXECUTED','8:539410b84b415f17d3108ac726bf5ae8','Modify Column','Increasing the serialized_data column of serialized_object to hold mediumtext',NULL,'2.0.5',NULL,NULL,NULL),('20110124-1030','surangak','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10380,'MARK_RAN','8:41690fc231a4f9057758a2fb39134251','Add Foreign Key Constraint','Adding correct foreign key for concept_answer.answer_drug',NULL,'2.0.5',NULL,NULL,NULL),('20110125-1435','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10371,'MARK_RAN','8:373cbc561e5c827cfa62f38d0e74de98','Add Column','Adding \'start_date\' column to person_address table',NULL,'2.0.5',NULL,NULL,NULL),('20110125-1436','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10372,'MARK_RAN','8:92b60f0b0d6b32865634e8ea0ae014a5','Add Column','Adding \'end_date\' column to person_address table',NULL,'2.0.5',NULL,NULL,NULL),('201101271456-add-enddate-to-relationship','misha680','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10389,'MARK_RAN','8:90dbc7c097acfc01a98815b526cda2a9','Add Column','Adding the end_date column to relationship.',NULL,'2.0.5',NULL,NULL,NULL),('201101271456-add-startdate-to-relationship','misha680','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10388,'MARK_RAN','8:5b24ed14dd68a5736074bae7b5e2121a','Add Column','Adding the start_date column to relationship.',NULL,'2.0.5',NULL,NULL,NULL),('20110201-1625-1','arahulkmit','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10373,'MARK_RAN','8:2e6d682c843b4b5de444fd932b5c63a6','Add Column','Adding \"date_changed\" column to patient_identifier table',NULL,'2.0.5',NULL,NULL,NULL),('20110201-1625-2','arahulkmit','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10374,'MARK_RAN','8:6e112a8f10060fafcde892317204b236','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to patient_identifier table',NULL,'2.0.5',NULL,NULL,NULL),('20110201-1626-1','arahulkmit','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10375,'MARK_RAN','8:ce68acff64cd26068b239e698fbcd630','Add Column','Adding \"date_changed\" column to relationship table',NULL,'2.0.5',NULL,NULL,NULL),('20110201-1626-2','arahulkmit','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10376,'MARK_RAN','8:70a24f63744571b1ccbe4fbce1bf47ea','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to relationship table',NULL,'2.0.5',NULL,NULL,NULL),('201102081800','gbalaji,gobi','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10379,'MARK_RAN','8:ae7478c0a07c75a3b1bf7c6db2b019e8','Drop Column','Dropping unused date_stopped column from obs table',NULL,'2.0.5',NULL,NULL,NULL),('20110218-1206','rubailly','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10013,'MARK_RAN','8:52f364b1a36198c2024048401494f5a3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20110218-1210','rubailly','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10013,'MARK_RAN','8:14d6f807ae4d2f334aa9b8d93845e0bd',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('201102280948','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:49',10278,'EXECUTED','8:ba3abc4baa4d798f52d09937afe469bb','Drop Foreign Key Constraint','Removing the foreign key from users.user_id to person.person_id if it still exists',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030a','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10413,'MARK_RAN','8:cbf1fb1dea4114240ba27eb3903b380f','Rename Table','Renaming the concept_source table to concept_reference_source',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030b','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10414,'MARK_RAN','8:7f53907bf6494ed14dfd7e4bba32a399','Create Table, Add Foreign Key Constraint (x4)','Adding concept_reference_term table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030b-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10415,'EXECUTED','8:a9335dc5ca9f2ea27acf67021788d3a1','Modify Column','(Fixed)Change concept_reference_term.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030c','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10416,'MARK_RAN','8:7885f4a3923325ebbf9b20c2d76e710e','Create Table, Add Foreign Key Constraint (x3)','Adding concept_map_type table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030c-fix','sunbiz','liquibase-update-to-latest.xml','2011-09-19 00:00:00',10014,'MARK_RAN','8:7548e6ce94df3068683687e7a7f99337',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20110301-1030d','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10417,'MARK_RAN','8:0802aea258b9f9655ac9e21095f1008c','Rename Table','Renaming the concept_map table to concept_reference_map',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030e','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10418,'MARK_RAN','8:ca8f281b5735e257a0b912184a5c9063','Add Column','Adding concept_reference_term_id column to concept_reference_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030f','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10419,'MARK_RAN','8:4c4c13f192b0cd7da7d7de1227497aae','Custom Change','Inserting core concept map types',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030g','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10420,'MARK_RAN','8:d6365858db30a5d92ddc31dba97f2311','Add Column, Add Foreign Key Constraint','Adding concept_map_type_id column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030h','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10421,'MARK_RAN','8:b439329c677473ade4a6eadf707784b9','Add Column, Add Foreign Key Constraint','Adding changed_by column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030i','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10422,'MARK_RAN','8:7f51b6bec534a039b83b24ab9881efba','Add Column','Adding date_changed column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030j','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10423,'MARK_RAN','8:2c564409b4763443025e5dfd61daa67e','Create Table, Add Foreign Key Constraint (x5)','Adding concept_reference_term_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030m','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10424,'MARK_RAN','8:f15295af2ea3c533fa8626e9f113474c','Custom Change','Creating concept reference terms from existing rows in the concept_reference_map table',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030n','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10425,'MARK_RAN','8:17a88a578acd46c70251707660ca065c','Add Foreign Key Constraint','Adding foreign key constraint to concept_reference_map.concept_reference_term_id column',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030o','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10426,'MARK_RAN','8:0d25bb6c779222fa15dd5a4d55b05e57','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_reference_map.source column',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030p','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10427,'MARK_RAN','8:9b6815bb916832686f48897cad437505','Drop Column','Dropping concept_reference_map.source column',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030q','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10428,'MARK_RAN','8:bc25b8f0965a382c1038d496779e24d3','Drop Column','Dropping concept_reference_map.source_code column',NULL,'2.0.5',NULL,NULL,NULL),('20110301-1030r','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10429,'MARK_RAN','8:fa861adc577c7fd6b4d8a95b3df82133','Drop Column','Dropping concept_reference_map.comment column',NULL,'2.0.5',NULL,NULL,NULL),('201103011751','abbas','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10381,'EXECUTED','8:ab3253aaf0761754c23390525905b01b','Create Table, Add Foreign Key Constraint (x3)','Create the person_merge_log table',NULL,'2.0.5',NULL,NULL,NULL),('20110326-1','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10456,'EXECUTED','8:bb69a04248c7d2129a5da8ebf4c2d0bc','Add Column, Add Foreign Key Constraint','Add obs.previous_version column (TRUNK-420)',NULL,'2.0.5',NULL,NULL,NULL),('20110326-2','Knoll_Frank','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10459,'EXECUTED','8:d6d191acfac83ee1ecbc831088011217','Custom SQL','Fix all the old void_reason content and add in the new previous_version to the matching obs row (POTENTIALLY VERY SLOW FOR LARGE OBS TABLES)',NULL,'2.0.5',NULL,NULL,NULL),('20110329-2317','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10382,'EXECUTED','8:85017b1c7309955389a91e900ddbbfa4','Delete Data','Removing \'View Encounters\' privilege from Anonymous user',NULL,'2.0.5',NULL,NULL,NULL),('20110329-2318','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10383,'EXECUTED','8:811fb7534042dac50b03315d19f72af6','Delete Data','Removing \'View Observations\' privilege from Anonymous user',NULL,'2.0.5',NULL,NULL,NULL),('20110425-1600-create-visit-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10390,'MARK_RAN','8:8b80760cc4cd291ec4245823458241f5','Create Table, Add Foreign Key Constraint (x3)','Creating visit_attribute_type table',NULL,'2.0.5',NULL,NULL,NULL),('20110425-1600-create-visit-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10391,'EXECUTED','8:b543b2800a3f431a2058295a2276df75','Modify Column','(Fixed)Change visit_attribute_type.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110425-1700-create-visit-attribute-table','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10393,'MARK_RAN','8:73a51fd457452975f971319b52e07e92','Create Table, Add Foreign Key Constraint (x5)','Creating visit_attribute table',NULL,'2.0.5',NULL,NULL,NULL),('20110425-1700-create-visit-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10394,'EXECUTED','8:6423f08e572239efc6791424b9d6ace9','Modify Column','(Fixed)Change visit_attribute.voided to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110426-11701','zabil','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10435,'MARK_RAN','8:6e02976998c4465924a64766b04557f2','Create Table, Add Foreign Key Constraint (x4)','Create provider table',NULL,'2.0.5',NULL,NULL,NULL),('20110426-11701-create-provider-table','dkayiwa','liquibase-schema-only.xml','2016-07-07 08:14:22',87,'EXECUTED','8:6e02976998c4465924a64766b04557f2','Create Table, Add Foreign Key Constraint (x4)','Create provider table',NULL,'2.0.5',NULL,NULL,NULL),('20110426-11701-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10436,'EXECUTED','8:21f99433a430ef61cae45aaa8697d9a1','Modify Column','(Fixed)Change provider.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110510-11702-create-provider-attribute-type-table','zabil','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10437,'EXECUTED','8:4c4b1eef4d1daf3ca04e8d2bda0ba03f','Create Table, Add Foreign Key Constraint (x3)','Creating provider_attribute_type table',NULL,'2.0.5',NULL,NULL,NULL),('20110510-11702-create-provider-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10438,'EXECUTED','8:98a5e5f4fd9945dbebbc71476f06f4f6','Modify Column','(Fixed)Change provider_attribute_type.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110628-1400-create-provider-attribute-table','kishoreyekkanti','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10440,'EXECUTED','8:30487ce7bf6e01e597d5bdcd2c37651f','Create Table, Add Foreign Key Constraint (x5)','Creating provider_attribute table',NULL,'2.0.5',NULL,NULL,NULL),('20110628-1400-create-provider-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10441,'EXECUTED','8:2d3c0e46fb801f22ace3289190fcb94d','Modify Column','(Fixed)Change provider_attribute.voided to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110705-2300-create-encounter-role-table','kishoreyekkanti','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10442,'MARK_RAN','8:a781c79a82d42eb0c640f7a1634bfe12','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_role table',NULL,'2.0.5',NULL,NULL,NULL),('20110705-2300-create-encounter-role-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10443,'EXECUTED','8:537f4b2d1e10580fc498a3ccf3c93434','Modify Column','(Fixed)Change encounter_role.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110705-2311-create-encounter-role-table','dkayiwa','liquibase-schema-only.xml','2016-07-07 08:14:23',88,'EXECUTED','8:a781c79a82d42eb0c640f7a1634bfe12','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_role table',NULL,'2.0.5',NULL,NULL,NULL),('20110708-2105','cta','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10397,'MARK_RAN','8:499ad47fee416ccf8275d3ec4a615ede','Add Unique Constraint','Add unique constraint to the concept_source table',NULL,'2.0.5',NULL,NULL,NULL),('201107192313-change-length-of-regex-column','jtellez','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10395,'EXECUTED','8:e2acac9088095b0d6686001470124f73','Modify Column','Increasing maximum length of patient identifier type regex format',NULL,'2.0.5',NULL,NULL,NULL),('20110811-1205-create-encounter-provider-table','sree/vishnu','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10444,'EXECUTED','8:42bd6a51dd55ecda516d60ec0f3695a6','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_provider table',NULL,'2.0.5',NULL,NULL,NULL),('20110811-1205-create-encounter-provider-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10445,'EXECUTED','8:0c8f4336d4c1a2c21ee0533187e405df','Modify Column','(Fixed)Change encounter_provider.voided to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110817-1544-create-location-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10400,'MARK_RAN','8:b67d6fbe077d5709320fa3dc6ec6e0ba','Create Table, Add Foreign Key Constraint (x3)','Creating location_attribute_type table',NULL,'2.0.5',NULL,NULL,NULL),('20110817-1544-create-location-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10401,'EXECUTED','8:54f69c863e384b40aca4d55a0f1008be','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110817-1601-create-location-attribute-table','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10403,'MARK_RAN','8:c43c78ded673255ae489de00afb98efa','Create Table, Add Foreign Key Constraint (x5)','Creating location_attribute table',NULL,'2.0.5',NULL,NULL,NULL),('20110817-1601-create-location-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10404,'EXECUTED','8:1e33b44a92ddb0ab701fdee6a79c144c','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5',NULL,NULL,NULL),('20110819-1455-insert-unknown-encounter-role','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10446,'EXECUTED','8:8debfac6b7fa992660ff624c2477d58d','Insert Row','Inserting the unknown encounter role into the encounter_role table',NULL,'2.0.5',NULL,NULL,NULL),('20110825-1000-creating-providers-for-persons-from-encounter','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10447,'EXECUTED','8:d09eb76f79ceb485389b4e868101075d','Custom SQL','Creating providers for persons from the encounter table',NULL,'2.0.5',NULL,NULL,NULL),('20110825-1000-drop-provider-id-column-from-encounter-table','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10449,'EXECUTED','8:7dcdc5b75b8b7c0bca5051be6cf3675c','Drop Foreign Key Constraint, Drop Column','Dropping the provider_id column from the encounter table',NULL,'2.0.5',NULL,NULL,NULL),('20110825-1000-migrating-providers-to-encounter-provider','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10448,'EXECUTED','8:71426149e5750b40093427adff0eca07','Custom SQL','Migrating providers from the encounter table to the encounter_provider table',NULL,'2.0.5',NULL,NULL,NULL),('2011091-0749','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',125,'EXECUTED','8:4afd4079efd3ff663172a71a656cb0af','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('2011091-0750','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',126,'EXECUTED','8:722b0dba4b61dcab30b52c887cf9e0b8','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110913-0300','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10430,'MARK_RAN','8:cc8823c1d921823036ac3ed9f2bb5505','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_a',NULL,'2.0.5',NULL,NULL,NULL),('20110913-0300b','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10431,'MARK_RAN','8:21d8366ed023110a7ce75934e6ec5106','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_b',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0104','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',317,'EXECUTED','8:994eef110601ec00914894c4b6e94651','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0114','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',69,'EXECUTED','8:3d4ecc1aca24cfccba63760fff22b965','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0117','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',318,'EXECUTED','8:102ab5b11c58ef42f225a6d7e0166dc9','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0245','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',319,'EXECUTED','8:733624adb629b21a72d150f5400acbf2','Add Unique Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0306','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',70,'EXECUTED','8:d1577a646538485feb8450fedeff773b','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0308','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',320,'EXECUTED','8:85942a6e70ed22d099815b6e72f396a8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0310','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',321,'EXECUTED','8:8eb1140d1d7d244f103d73ddfeb66a83','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0312','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',71,'EXECUTED','8:3342f138915efd12b9eef259b790f806','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0314','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',322,'EXECUTED','8:388b084e9b2e9db99a6e6e50acac1d54','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0315','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',323,'EXECUTED','8:3409c75179bc800b59bc7b00eb031376','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0317','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',98,'EXECUTED','8:40a24cc34eb0e336d3e9547d0112065f','Add Primary Key','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0321','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',324,'EXECUTED','8:566cede85bd9be926a0bb71a0d79277c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0434','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',326,'EXECUTED','8:dd23007aa851d93be1865482135927b4','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0435','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',327,'EXECUTED','8:2cb7f73620a4888bfa9cd900a8933855','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0448','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',72,'EXECUTED','8:af1c6d38c0a1512361ea93fdb6b6edbd','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0453','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',325,'EXECUTED','8:cf7ca65534550a56abe71344b886a6ab','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0509','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',122,'EXECUTED','8:56e2d2bb15a004bd5ac5bf362e7e3f82','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0943','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',123,'EXECUTED','8:e2599444ff422fb5697c582cfa7a78e9','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0945','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',328,'EXECUTED','8:dc59ece89c55d66d0906899b6d2f4e7a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0956','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',124,'EXECUTED','8:25e26185db2276fdaa06fb8e7003dc72','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110914-0958','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',329,'EXECUTED','8:a7a644bd479b8815bba03ab3b5fd792d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0258','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',330,'EXECUTED','8:6a9f6449f288592ea5e47bae65986340','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0259','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',331,'EXECUTED','8:1ad9516c3ccff7c5d0f2c4d0ccb4d820','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0357','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',332,'EXECUTED','8:9857d30e4da66f8ec3def347bd917bef','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0547','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',333,'EXECUTED','8:40387996134eb4915291bf634e37aa2a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0552','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',334,'EXECUTED','8:78a3e8e747854495f3afc6131ae38ea4','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0603','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',335,'EXECUTED','8:879ec37f7216d61d3d7dd43c0ffc2e37','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0610','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',336,'EXECUTED','8:71b1c44a62d9c2fa3ac4a99ae12970bf','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0634','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',337,'EXECUTED','8:67813c79367264837a9aedbc8cda45dc','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0751','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10029,'EXECUTED','8:c20bfa3cacd99a49bf2e4394a3924a5c','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0803','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10036,'EXECUTED','8:1cb881162fff62bdff9cd8de70216838','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0823','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:26',338,'EXECUTED','8:5c7873a4c9e718facc72ff713b187821','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0824','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',339,'EXECUTED','8:3b16e2439602fd5d0d7a471e1d31418c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0825','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',74,'EXECUTED','8:2b7f97660cbf73b850bb567f82a965fa','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0836','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',340,'EXECUTED','8:c25a8391f65339803f7de1c189a6622c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0837','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',341,'EXECUTED','8:e5ae5343711b1667a433e85d67e4a7c2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0838','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',342,'EXECUTED','8:579f7479fca5058f113ece4f5940eba8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0839','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',343,'EXECUTED','8:a40880a17eac8d7c2befe4269796c712','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0840','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',344,'EXECUTED','8:0ff0418c876585fbb78b9d8033b38154','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0841','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',345,'EXECUTED','8:44887a73d028466598f12c11d425584b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0842','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',346,'EXECUTED','8:a61c3fa2ca3199228f0c97b57f5f0c6e','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0845','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',75,'EXECUTED','8:614827d67d9b8f4f940a3b718c9a868f','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0846','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',347,'EXECUTED','8:459986f989751047b879f2ab5484b555','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0847','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',76,'EXECUTED','8:624de527b9b6a618c6bd31f65089866d','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0848','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10037,'EXECUTED','8:de76d856ac158405e8a828b4d5473c51','Insert Row (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0848','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',77,'EXECUTED','8:811391518f0aaf7387666454816bb7e7','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-0903','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',348,'EXECUTED','8:c5f743c8e5d86321e9faad7714a034f0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1045','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',127,'EXECUTED','8:d37207a166aaca60d194ee966bc7e120','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1049','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',349,'EXECUTED','8:67dca3df78ad8f45f5345da7cac35f38','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1051','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',128,'EXECUTED','8:abe3a64258b8fa35d18382132e201e4f','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1052','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',129,'EXECUTED','8:ede27f7bbe00e7d92488436c40e95cb6','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1053','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',130,'EXECUTED','8:95a17d8e94c1c037f484ce2778456583','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1103','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',131,'EXECUTED','8:c33417b0d7b79c1047e80a570938e7de','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1104','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',132,'EXECUTED','8:0be623f667ba4826338d27cd0aa96b9a','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1107','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10038,'EXECUTED','8:3fbd85d611e663f73689e46b1022a6e2','Insert Row','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1133','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',133,'EXECUTED','8:8147fa6e97c11507e1f592303259720e','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1135','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',350,'EXECUTED','8:b307c0f5349edbd181e3cfb64ddb003d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1148','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',351,'EXECUTED','8:c3c65251490400697cc18e3891b9dca1','Add Unique Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1149','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10039,'EXECUTED','8:53e135b8d5a4764106323cbb8af6c096','Insert Row (x10)','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1202','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',352,'EXECUTED','8:0e0a981ccbcce3a4a4dfaa7262670332','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1203','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',353,'EXECUTED','8:25cfe24f72d094570dba3cd507f4ac8a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1210','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',354,'EXECUTED','8:41690fc231a4f9057758a2fb39134251','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1215','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',73,'EXECUTED','8:4269116d244bf6d2a3c13205f56426ca','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1222','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',78,'EXECUTED','8:a73115d32f5484096004d72dc0b57a76','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1225','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',355,'EXECUTED','8:40d0d2fc674d312a29162f0da9a14b46','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1226','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',356,'EXECUTED','8:d50d8a771c5a981799c16bda2a382529','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1227','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',357,'EXECUTED','8:8da6c886b62b32eac3f5b7a3d67e10c8','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1231','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',79,'EXECUTED','8:c48324984a84aa2ac8ae9862a9424e2b','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1240','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',358,'EXECUTED','8:1fec4b72b749d0d81755f930bacb47c1','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1241','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',359,'EXECUTED','8:1db06dd675d9a7d321aa5d5c710d2e31','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1242','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',360,'EXECUTED','8:a032157868f4714b709ca145ff3695e5','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1243','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',361,'EXECUTED','8:387e39d049631288ee2cf8133ab343ee','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1244','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',362,'EXECUTED','8:e24fea75579c2e94b2cda9ba126a590a','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1245','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',363,'EXECUTED','8:1072d841664d4d1bc7bcea3adaea5b16','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1246','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',364,'EXECUTED','8:9556c1cfa8795950a3b3d454f73cab1b','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1247','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:23',134,'EXECUTED','8:fe8454bcd5df128318c029e22ad9e9ea','Create Index','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1248','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',365,'EXECUTED','8:a7717355d58a5aa09c9b63d9c379b76f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1258','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',80,'EXECUTED','8:8a94dc5f641f6fc222d15008da5a12a2','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1301','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',366,'EXECUTED','8:c9105c36d10d4b7910df721357dee582','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1302','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',367,'EXECUTED','8:d1e2064772cf01d87303c1e72296fade','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1303','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',368,'EXECUTED','8:24d89b37a504b649ab28f328a1f5c597','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1307','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',81,'EXECUTED','8:f2cf6b336a586b20420582bd982fbc6c','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1311','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',392,'EXECUTED','8:ead67eaad39389c77abe64eb15bf10ca','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1312','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',369,'EXECUTED','8:bda9eb22045c9d58fc263810cfed7bd5','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1313','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',370,'EXECUTED','8:c3c71ec2ca69aaed775247e914bfa733','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1314','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',371,'EXECUTED','8:27bfbfc163bc36ff7a9ea59fd84578d0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1315','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',372,'EXECUTED','8:20bddf00dab5e9ad44b8b48e9e799b7c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1316','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',373,'EXECUTED','8:24baa4b064618a638e619677b06ced54','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1317','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',374,'EXECUTED','8:593dacdc206815bb33788bc9e26b9170','Add Unique Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1320','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',375,'EXECUTED','8:2deb6e9613d4166064f769af173919ff','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1323','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',376,'EXECUTED','8:780ff19cd2bb02f1ff17c2e849d5ac74','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1325','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',82,'EXECUTED','8:269eb6c8a2b5708da7896ec4932728f0','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1327','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',377,'EXECUTED','8:b6ed1c67d900499bad7b2e8915684400','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1328','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',378,'EXECUTED','8:a742b4cd576b24716d211b570e1397bd','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1329','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',379,'EXECUTED','8:1d2d42a3e8298efb36d82dcdb7706bbd','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1337','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',83,'EXECUTED','8:0f670f4d0e094548f7ba5c31e3ba2b97','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1342','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',380,'EXECUTED','8:119692e9cb663b78878edbf24ab91bd3','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1343','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',381,'EXECUTED','8:46ac285c7f3e4b567bdd84f39c30dc73','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1344','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',382,'EXECUTED','8:3dab20a653fb83532e2ccf2dba0524d0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1345','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',383,'EXECUTED','8:6613eaaa4a89a59e09c3920999e73e48','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1346','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',384,'EXECUTED','8:1847ad162d3f62091f97e52f0dd8c1dd','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1435','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',84,'EXECUTED','8:c0f7820a36a74f0a5820501050ec9185','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1440','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',385,'EXECUTED','8:d1f6227c33788dc5bed023dc637e4cd2','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1441','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',386,'EXECUTED','8:be081836e24d509f3a387071a6bc5c22','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1442','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',387,'EXECUTED','8:704c167289fdb193640d5b07a2e417df','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1443','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',388,'EXECUTED','8:df91c3b6faca6f3406b29a8cab00c63d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1450','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',85,'EXECUTED','8:dd9120d3823c30cdfac401df92bca5eb','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1451','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',389,'EXECUTED','8:d3b488259594544b59347e376b27673f','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1452','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',390,'EXECUTED','8:5e0881515fd493523bafdbe301e0b358','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1453','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:27',391,'EXECUTED','8:76bc43ace6336c00c20eec560827f418','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1459','sunbiz','liquibase-core-data.xml','2016-07-07 08:14:29',10040,'EXECUTED','8:4c4c13f192b0cd7da7d7de1227497aae','Custom Change','Inserting core concept map types',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1524','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',393,'EXECUTED','8:c558a844985e8c07a8daafa8940321eb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1528','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:22',86,'EXECUTED','8:9c429ec0e80e5bd159c92a3d6208058b','Create Table','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1530','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',394,'EXECUTED','8:274bece0d1bffce6525b8dd9b2c81692','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1531','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',395,'EXECUTED','8:ce869ae90333b8196248dd09233dbccb','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1532','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',396,'EXECUTED','8:b8ed3edfff7329c42196616310aa025d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1533','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',397,'EXECUTED','8:485c2fa3a8444ac0fad21c573c6da07d','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1534','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',398,'EXECUTED','8:a376e8581e22f17b014dc63b435d9a37','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1536','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',399,'EXECUTED','8:17a88a578acd46c70251707660ca065c','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20110915-1700','sunbiz','liquibase-schema-only.xml','2016-07-07 08:14:28',400,'EXECUTED','8:fe6398f690dcce73e63f2358a35bec9c','Insert Row (x18)','',NULL,'2.0.5',NULL,NULL,NULL),('201109152336','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10433,'MARK_RAN','8:c451aced1df1dc71785fa829c18c37df','Update Data','Updating logging level global property',NULL,'2.0.5',NULL,NULL,NULL),('20110919-0638','sunbiz','liquibase-update-to-latest.xml','2011-09-19 00:00:00',10015,'MARK_RAN','8:c2e715a956abd582cdfc0d2a3687ca6c',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20110919-0639-void_empty_attributes','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10434,'EXECUTED','8:fcec772d0288922a7b5b47a607afa56f','Custom SQL','Void all attributes that have empty string values.',NULL,'2.0.5',NULL,NULL,NULL),('20110922-0551','sunbiz','liquibase-update-to-latest.xml','2016-07-07 08:14:50',10306,'MARK_RAN','8:39508d681f7516cf9b5a26327be4ecff','Modify Column','Changing global_property.property from varbinary to varchar',NULL,'2.0.5',NULL,NULL,NULL),('20110926-1200','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10396,'MARK_RAN','8:3ef8d1055940a0771db494f7af553ae6','Custom SQL','Change all empty concept_source.hl7_code to NULL',NULL,'2.0.5',NULL,NULL,NULL),('201109301703','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10405,'MARK_RAN','8:9757fada669433daa071408fdaf195f3','Update Data','Converting general address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301704','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10406,'MARK_RAN','8:aca928b9b33626159f2f3286e89db814','Update Data','Converting Spain address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301705','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10407,'MARK_RAN','8:91e51392803ac675854e0b6d8a00036c','Update Data','Converting Rwanda address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301706','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10408,'MARK_RAN','8:dc90d947a50a2a7181c9f6a781f67484','Update Data','Converting USA address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301707','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10409,'MARK_RAN','8:29c983a2ad6a23fb97b3022d3d26e004','Update Data','Converting Kenya address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301708','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10410,'MARK_RAN','8:71493b9ab4fa4e7dbb52a373eebf4fb5','Update Data','Converting Lesotho address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301709','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10411,'MARK_RAN','8:e9fead577033768e28cf27f88ac1b601','Update Data','Converting Malawi address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201109301710','suho','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10412,'MARK_RAN','8:fcdd0dc9413b3ba8779c057e0381b4f3','Update Data','Converting Tanzania address format (if applicable)',NULL,'2.0.5',NULL,NULL,NULL),('201110051353-fix-visit-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10392,'MARK_RAN','8:0c4e69ce9f53ced8b3e3499a1d13ea7b','Add Column (x2)','Refactoring visit_attribute_type table (devs only)',NULL,'2.0.5',NULL,NULL,NULL),('201110072042-fix-location-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:54',10402,'MARK_RAN','8:a989035dca24723de87a0e320fa874b4','Add Column (x2)','Refactoring location_attribute_type table (devs only)',NULL,'2.0.5',NULL,NULL,NULL),('201110072043-fix-provider-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10439,'MARK_RAN','8:6ca4d48a0730805c14401d369b7c9a1c','Add Column (x2)','Refactoring provider_attribute_type table (devs only)',NULL,'2.0.5',NULL,NULL,NULL),('20111008-0938-1','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10450,'EXECUTED','8:41703ff87604623af1acde531f8a847f','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',NULL,NULL,NULL),('20111008-0938-2','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10451,'EXECUTED','8:da67fa2b6f1df1ae3d3101996e095fae','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',NULL,NULL,NULL),('20111008-0938-3','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10452,'EXECUTED','8:e08d2fce7a991f8ad8b572a29edfe8c0','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',NULL,NULL,NULL),('20111008-0938-4','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10453,'EXECUTED','8:b40ce1995b3973edb44159fde30cf10c','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',NULL,NULL,NULL),('201110091820-a','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10454,'MARK_RAN','8:f91a6a26fa2bbe2f2aa773adc00b2e43','Add Column','Add xslt column back to the form table',NULL,'2.0.5',NULL,NULL,NULL),('201110091820-b','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10455,'MARK_RAN','8:8b1655d1fa210ceab38f715c58085791','Add Column','Add template column back to the form table',NULL,'2.0.5',NULL,NULL,NULL),('201110091820-c','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10457,'MARK_RAN','8:c24f73198c50e3ea4d15d7dd9077995f','Rename Table','Rename form_resource table to preserve data; 20111010-1515 reference is for bleeding-edge developers and can be generally ignored',NULL,'2.0.5',NULL,NULL,NULL),('20111010-1515','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10458,'EXECUTED','8:d1af328501320d2630042d9ff59f7bbc','Create Table, Add Foreign Key Constraint, Add Unique Constraint','Creating form_resource table',NULL,'2.0.5',NULL,NULL,NULL),('20111128-1601','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10460,'EXECUTED','8:aa22584cc3e9f06299826c53da91c5c7','Insert Row','Inserting Auto Close Visits Task into \'schedule_task_config\' table',NULL,'2.0.5',NULL,NULL,NULL),('20111209-1400-deleting-non-existing-roles-from-role-role-table','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10461,'EXECUTED','8:5487278421f32da2d31b46327187223d','Custom SQL','Deleting non-existing roles from the role_role table',NULL,'2.0.5',NULL,NULL,NULL),('20111214-1500-setting-super-user-gender','raff','liquibase-update-to-latest.xml','2016-07-07 08:14:55',10464,'EXECUTED','8:fc183f43699ef3c7f980fd439f1367d9','Custom SQL','Setting super user gender',NULL,'2.0.5',NULL,NULL,NULL),('20111218-1830','abbas','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10465,'EXECUTED','8:5990d972bed8ac44270d934de5699349','Add Unique Constraint, Add Column (x6), Add Foreign Key Constraint (x2)','Add unique uuid constraint and attributes inherited from BaseOpenmrsData to the person_merge_log table',NULL,'2.0.5',NULL,NULL,NULL),('20111218-1830-fix','sunbiz','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10493,'EXECUTED','8:3cb13fd64b7b3d1b9c1e685d2eef422b','modifyColumn tableName=person_merge_log','(Fixed)Change person_merge_log.voided to BOOLEAN',NULL,'4.4.3',NULL,NULL,NULL),('20111219-1404','bwolfe','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10466,'EXECUTED','8:7fadabff0a1e627ad8f39835c8e09996','Update Data','Fix empty descriptions on relationship types',NULL,'2.0.5',NULL,NULL,NULL),('20111222-1659','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10468,'EXECUTED','8:c567cc29efdfa8755e68371df80c0608','Create Table, Create Index','Create clob_datatype_storage table',NULL,'2.0.5',NULL,NULL,NULL),('201118012301','lkellett','liquibase-update-to-latest.xml','2016-07-07 08:14:53',10370,'MARK_RAN','8:56d2e999aa23ae8a6fb10f1e1d6e9b47','Add Column','Adding the discontinued_reason_non_coded column to orders.',NULL,'2.0.5',NULL,NULL,NULL),('201202020847','abbas','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10467,'EXECUTED','8:d8991008694bd642a82d66e0eab76495','Modify data type, Add Not-Null Constraint','Change merged_data column type to CLOB in person_merge_log table',NULL,'2.0.5',NULL,NULL,NULL),('20120316-1300','mseaton','liquibase.xml','2023-10-25 10:22:09',10863,'EXECUTED','8:99fd34e500fcd59c5517f7da01db5087','createTable tableName=calculation_registration','Adding calculation_registration table',NULL,'4.4.3',NULL,NULL,NULL),('20120322-1510','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10494,'EXECUTED','8:830dbe85a0fd56b5c5ece5b7225f2e09','addColumn tableName=patient_identifier_type','Adding uniqueness_behavior column to patient_identifier_type table',NULL,'4.4.3',NULL,NULL,NULL),('20120330-0954','jkeiper','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10472,'EXECUTED','8:fc35b420fb6f4f4846f5e017a68a3ea5','Modify data type','Increase size of drug name column to 255 characters',NULL,'2.0.5',NULL,NULL,NULL),('20120503-djmod','dkayiwa and djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10475,'EXECUTED','8:b6dba7388bcd4d41dd7a5c4259baff40','Create Table, Add Foreign Key Constraint (x2)','Create test_order table',NULL,'2.0.5',NULL,NULL,NULL),('20120504-1000','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10495,'EXECUTED','8:cc6cc689db5924e3cfacc0ff8768e25f','dropTable tableName=drug_ingredient','Dropping the drug_ingredient table',NULL,'4.4.3',NULL,NULL,NULL),('20120504-1010','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10496,'EXECUTED','8:03c6138ff06bcdf1e6d14fc7bd8f004a','createTable tableName=drug_ingredient','Creating the drug_ingredient table',NULL,'4.4.3',NULL,NULL,NULL),('20120504-1020','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10497,'EXECUTED','8:0ab99e16e664357c4b075e45900f4407','addPrimaryKey constraintName=drug_ingredient_pk, tableName=drug_ingredient','Adding a primary key to the drug_ingredient table',NULL,'4.4.3',NULL,NULL,NULL),('20120504-1030','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10498,'EXECUTED','8:2bf0fad4eaa11d1bc644a07b147f2514','addForeignKeyConstraint baseTableName=drug_ingredient, constraintName=drug_ingredient_units_fk, referencedTableName=concept','Adding a new foreign key from drug_ingredient.units to concept.concept_id',NULL,'4.4.3',NULL,NULL,NULL),('20120504-1040','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10499,'EXECUTED','8:51a1211a4eb0bf76018851fbe6a8ad48','addForeignKeyConstraint baseTableName=drug_ingredient, constraintName=drug_ingredient_drug_id_fk, referencedTableName=drug','Adding a new foreign key from drug_ingredient.drug_id to drug.drug_id',NULL,'4.4.3',NULL,NULL,NULL),('20120504-1050','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:08',10500,'EXECUTED','8:42f5ddc295fca4e609698624e9122bb8','addForeignKeyConstraint baseTableName=drug_ingredient, constraintName=drug_ingredient_ingredient_id_fk, referencedTableName=concept','Adding a new foreign key from drug_ingredient.ingredient_id to concept.concept_id',NULL,'4.4.3',NULL,NULL,NULL),('201205241728-1','mvorobey','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10507,'EXECUTED','8:8e5564b918f5ed37a5e4e9f591e5b27b','addColumn tableName=encounter_type; addForeignKeyConstraint baseTableName=encounter_type, constraintName=privilege_which_can_view_encounter_type, referencedTableName=privilege','Add optional property view_privilege to encounter_type table',NULL,'4.4.3',NULL,NULL,NULL),('201205241728-2','mvorobey','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10508,'EXECUTED','8:a1fb897c3a8cae31813ac90302a817c1','addColumn tableName=encounter_type; addForeignKeyConstraint baseTableName=encounter_type, constraintName=privilege_which_can_edit_encounter_type, referencedTableName=privilege','Add optional property edit_privilege to encounter_type table',NULL,'4.4.3',NULL,NULL,NULL),('20120529-2230','mvorobey','liquibase-schema-only.xml','2016-07-07 08:14:28',401,'EXECUTED','8:83886060f9bcb3f8c743b39b7bde4aa0','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20120529-2231','mvorobey','liquibase-schema-only.xml','2016-07-07 08:14:28',402,'EXECUTED','8:b28ab1097a92cdea10ef1b6f2456cc97','Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('20120613-0930','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10473,'EXECUTED','8:1176a3533ab6e628829e1ca068aaadb1','Drop Not-Null Constraint','Dropping not null constraint from provider.identifier column',NULL,'2.0.5',NULL,NULL,NULL),('20121007-orders_urgency','djazayeri','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10474,'EXECUTED','8:315a2373649cb932bb2a96bcef36ed43','Add Column','Adding urgency column to orders table',NULL,'2.0.5',NULL,NULL,NULL),('20121007-test_order_laterality','djazayeri','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10510,'EXECUTED','8:791574955077ba15a21655c3cd971b95','modifyDataType columnName=laterality, tableName=test_order','Changing test_order.laterality to be a varchar',NULL,'4.4.3',NULL,NULL,NULL),('20121008-order_specimen_source_fk','djazayeri','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10511,'MARK_RAN','8:52b643b1891c542f45df4a6d362f13f9','addForeignKeyConstraint baseTableName=test_order, constraintName=test_order_specimen_source_fk, referencedTableName=concept','Adding FK constraint for test_order.specimen_source if necessary',NULL,'4.4.3',NULL,NULL,NULL),('20121016-1504','wyclif','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10476,'EXECUTED','8:780a14eb75c1692c4989a8169ab2f708','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Removing auto increment from test_order.order_id column',NULL,'2.0.5',NULL,NULL,NULL),('20121020-TRUNK-3610','lluismf','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10477,'EXECUTED','8:602805280d880932a94fcfd534d5a107','Update Data (x2)','Rename global property autoCloseVisits.visitType to visits.autoCloseVisitType',NULL,'2.0.5',NULL,NULL,NULL),('20121021-TRUNK-333','lluismf','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10513,'EXECUTED','8:0d5e1d8fc96ed73b9a76b333c1c4010d','dropTable tableName=concept_set_derived','Removing concept set derived table',NULL,'4.4.3',NULL,NULL,NULL),('20121025-TRUNK-213','lluismf','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10512,'EXECUTED','8:6f303bd1747a6924d29c43ee3b593817','modifyColumn tableName=concept_stop_word; modifyColumn tableName=concept_word','Normalize varchar length of locale columns',NULL,'4.4.3',NULL,NULL,NULL),('20121109-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10514,'EXECUTED','8:92f9c5a99209f5f71ccb4cb4fc392ff3','dropNotNullConstraint columnName=description, tableName=concept_class','Dropping not null constraint from concept_class.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121112-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10515,'EXECUTED','8:7df1af16bab05233408b4461fdf14471','dropNotNullConstraint columnName=description, tableName=concept_datatype','Dropping not null constraint from concept_datatype.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121113-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10516,'EXECUTED','8:ae49ac026a5e0dc548a6f468039af43c','dropNotNullConstraint columnName=description, tableName=patient_identifier_type','Dropping not null constraint from patient_identifier_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121113-TRUNK-3474-person-attribute-type','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10517,'EXECUTED','8:badc91a102c3e59ad3272fb24366a58f','dropNotNullConstraint columnName=description, tableName=person_attribute_type','Dropping not null constraint from person_attribute_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121113-TRUNK-3474-privilege','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10518,'EXECUTED','8:498a6bb6292a64e260820c75ac6c6622','dropNotNullConstraint columnName=description, tableName=privilege','Dropping not null constraint from privilege.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121114-TRUNK-3474-encounter_type','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10521,'EXECUTED','8:9c0e7e651d3c7c910aa56658c3129be4','dropNotNullConstraint columnName=description, tableName=encounter_type','Dropping not null constraint from encounter_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121114-TRUNK-3474-relationship_type','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10520,'EXECUTED','8:26d74cb76761bac56d6746a9b06a27a5','dropNotNullConstraint columnName=description, tableName=relationship_type','Dropping not null constraint from relationship_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121114-TRUNK-3474-role','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:09',10519,'EXECUTED','8:7127e753b29990afafb6587d0bbbd25f','dropNotNullConstraint columnName=description, tableName=role','Dropping not null constraint from role.description column',NULL,'4.4.3',NULL,NULL,NULL),('20121212-TRUNK-2768','patandre','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10522,'EXECUTED','8:9187db1be97c4d91d35a1cc35f4ab748','addColumn tableName=person','Adding deathdate_estimated column to person.',NULL,'4.4.3',NULL,NULL,NULL),('201301031440-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10581,'EXECUTED','8:feadce20f10427194d62fdddec7a5bab','customChange','Creating coded order frequencies for drug order frequencies',NULL,'4.4.3',NULL,NULL,NULL),('201301031448-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10582,'EXECUTED','8:65ba189466c8817db26bf9da7292e90a','customChange','Migrating drug order frequencies to coded order frequencies',NULL,'4.4.3',NULL,NULL,NULL),('201301031455-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10583,'EXECUTED','8:0b00899fe3d6b9f81f9811deefd49046','dropColumn columnName=frequency_text, tableName=drug_order','Dropping temporary column drug_order.frequency_text',NULL,'4.4.3',NULL,NULL,NULL),('201306141103-TRUNK-3884','susantan','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10478,'EXECUTED','8:75076e2450e410fc30b8d9198b01d512','Add Foreign Key Constraint (x3)','Adding 3 foreign key relationships (creator,created_by,voided_by) to encounter_provider table',NULL,'2.0.5',NULL,NULL,NULL),('20130626-TRUNK-439','jthoenes','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10523,'EXECUTED','8:57cf0e3f590b2e8a954f87c4d6464510','update tableName=global_property','Adding configurability to Patient Header on Dashboard. Therefore the cd4_count property is dropped and\n            replaced with a header.showConcept property.',NULL,'4.4.3',NULL,NULL,NULL),('20130809-TRUNK-4044-duplicateEncounterRoleChangeSet','surangak','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10525,'EXECUTED','8:854400531f71e88e351bb748f9724ed6','customChange','Custom changesets to identify and resolve duplicate EncounterRole names',NULL,'4.4.3',NULL,NULL,NULL),('20130809-TRUNK-4044-duplicateEncounterTypeChangeSet','surangak','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10526,'MARK_RAN','8:730273b18b7a29d8aa6ef77bf69e2693','customChange','Custom changesets to identify and resolve duplicate EncounterType names',NULL,'4.4.3',NULL,NULL,NULL),('20130809-TRUNK-4044-encounter_role_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10528,'EXECUTED','8:2549dbe31c7d2ef5c74105fb8b907d5f','addUniqueConstraint constraintName=encounter_role_unique_name, tableName=encounter_role','Adding the unique constraint to the encounter_role.name column',NULL,'4.4.3',NULL,NULL,NULL),('20130809-TRUNK-4044-encounter_type_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10527,'EXECUTED','8:d33c85414c1f1592aeaacfe5568783c4','addUniqueConstraint constraintName=encounter_type_unique_name, tableName=encounter_type','Adding the unique constraint to the encounter_type.name column',NULL,'4.4.3',NULL,NULL,NULL),('20130925-TRUNK-4105','hannes','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10479,'EXECUTED','8:d2ad7f39efadf4ae6e8cc21e028d3ae2','Create Index','Adding index on concept_reference_term.code column',NULL,'2.0.5',NULL,NULL,NULL),('20131023-TRUNK-3903','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10524,'EXECUTED','8:cf91ab0553cbb9ec7cac072849cd326f','addColumn tableName=concept_numeric','Adding \"display_precision\" column to concept_numeric table',NULL,'4.4.3',NULL,NULL,NULL),('201310281153-TRUNK-4123','mujir,sushmitharaos','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10551,'EXECUTED','8:be70be300b910a582310a204e754a7fa','addColumn tableName=orders; addForeignKeyConstraint baseTableName=orders, constraintName=previous_order_id_order_id, referencedTableName=orders','Adding previous_order_id to orders',NULL,'4.4.3',NULL,NULL,NULL),('201310281153-TRUNK-4124','mujir,sushmitharaos','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10552,'EXECUTED','8:a493352b87f8552e7595dcd80120969e','addColumn tableName=orders; update tableName=orders; addNotNullConstraint columnName=order_action, tableName=orders','Adding order_action to orders and setting order_actions as NEW for existing orders',NULL,'4.4.3',NULL,NULL,NULL),('201311041510','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10546,'EXECUTED','8:26be1a4e020906ea74e1cde7e44e4ef0','renameColumn newColumnName=as_needed, oldColumnName=prn, tableName=drug_order','Renaming drug_order.prn column to drug_order.as_needed',NULL,'4.4.3',NULL,NULL,NULL),('201311041511','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10547,'EXECUTED','8:6e51cb7454670c8dac8e059756b3bab5','addColumn tableName=drug_order','Adding as_needed_condition column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201311041512','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10548,'EXECUTED','8:bfb1543529f3e5559b7ab7a60cc81ee5','addColumn tableName=orders','Adding order_number column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('201311041513','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10549,'MARK_RAN','8:38715220feef4c61b1cd9dcb477f1161','update tableName=orders','Setting order numbers for existing orders',NULL,'4.4.3',NULL,NULL,NULL),('201311041515-TRUNK-4122','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10550,'EXECUTED','8:5f36fc8fa2eaaf81683dae32d11734ee','addNotNullConstraint columnName=order_number, tableName=orders','Making orders.order_number not nullable',NULL,'4.4.3',NULL,NULL,NULL),('20131210-TRUNK-4130','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10556,'EXECUTED','8:01f153d08375fe18d7eaecfb60247b64','addColumn tableName=drug_order','Adding num_refills column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312141400-TRUNK-4126','arathy','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10553,'EXECUTED','8:55586a39affe5750b8cfcf783f35ce8d','modifyDataType columnName=complex, tableName=drug_order; renameColumn newColumnName=dosing_type, oldColumnName=complex, tableName=drug_order','Renaming drug_order.complex to dosing_type',NULL,'4.4.3',NULL,NULL,NULL),('201312141400-TRUNK-4127','arathy','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10555,'MARK_RAN','8:7c437a28fe021d08c0db024a79f6d9ef','update tableName=drug_order; update tableName=drug_order','Converting values in drug_order.dosing_type column',NULL,'4.4.3',NULL,NULL,NULL),('201312141401-TRUNK-4126','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10554,'EXECUTED','8:9b14ba27d4610cc3652270925b8ee305','dropNotNullConstraint columnName=dosing_type, tableName=drug_order','Making drug_order.dosing_type nullable',NULL,'4.4.3',NULL,NULL,NULL),('20131216-1637','gitahi','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10591,'EXECUTED','8:93db608425b739536413a9643f34e791','createTable tableName=drug_reference_map; addForeignKeyConstraint baseTableName=drug_reference_map, constraintName=drug_for_drug_reference_map, referencedTableName=drug; addForeignKeyConstraint baseTableName=drug_reference_map, constraintName=conc...','Add drug_reference_map table',NULL,'4.4.3',NULL,NULL,NULL),('201312161618-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10562,'EXECUTED','8:8f39307fb685d25a5fcb31a619037d87','addColumn tableName=drug_order; addForeignKeyConstraint baseTableName=drug_order, constraintName=drug_order_quantity_units, referencedTableName=concept','Adding quantity_units column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312161713-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10563,'EXECUTED','8:3375513e4491388717db57d88191ab7c','modifyDataType columnName=quantity, tableName=drug_order','Changing quantity column of drug_order to double',NULL,'4.4.3',NULL,NULL,NULL),('201312162044-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10560,'EXECUTED','8:d3e848a205a746bf4e9740f40c5a7282','addColumn tableName=drug_order','Adding duration column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312162059-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10561,'EXECUTED','8:d1005650e5202567e6204bf6b6574689','addColumn tableName=drug_order; addForeignKeyConstraint baseTableName=drug_order, constraintName=drug_order_duration_units_fk, referencedTableName=concept','Adding duration_units column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('20131217-TRUNK-4142','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10559,'EXECUTED','8:6c30e47f0cf1ebbefaab6dcc16770e50','addColumn tableName=orders','Adding comment_to_fulfiller column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('20131217-TRUNK-4157','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10558,'EXECUTED','8:3201330e5aa8f7a5e2dc75bd4e95a6fe','addColumn tableName=drug_order','Adding dosing_instructions column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312171559-TRUNK-4159','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:11',10557,'EXECUTED','8:a1356a33a2f1f3ee34126bbf3a8e4d94','createTable tableName=order_frequency; addForeignKeyConstraint baseTableName=order_frequency, constraintName=order_frequency_concept_id_fk, referencedTableName=concept; addForeignKeyConstraint baseTableName=order_frequency, constraintName=order_fr...','Create the order_frequency table',NULL,'4.4.3',NULL,NULL,NULL),('201312181649-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10570,'EXECUTED','8:3bfcd0b9f492c8b516c0800e1452b937','addColumn tableName=test_order; addForeignKeyConstraint baseTableName=test_order, constraintName=test_order_frequency_fk, referencedTableName=order_frequency','Adding frequency column to test_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312181650-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10571,'EXECUTED','8:0ba86fc85458a0e4df7b8d4742136cd9','addColumn tableName=test_order','Adding number_of_repeats column to test_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312182214-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10564,'EXECUTED','8:acb3dcb3c474c68ba94802c675021723','addColumn tableName=drug_order; addForeignKeyConstraint baseTableName=drug_order, constraintName=drug_order_route_fk, referencedTableName=concept','Adding route column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312182223-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10565,'EXECUTED','8:cb3c2c150182d226e9bd3c435c036d67','dropColumn columnName=equivalent_daily_dose, tableName=drug_order','Dropping equivalent_daily_dose column from drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312191200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10566,'EXECUTED','8:eec66ebb21605b80079a99a7bf437aa0','addColumn tableName=drug_order','Adding dose_units column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201312191300-TRUNK-4167','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10567,'EXECUTED','8:324df324d6431af1946d01624b1c64fa','addForeignKeyConstraint baseTableName=drug_order, constraintName=drug_order_dose_units, referencedTableName=concept','Adding foreignKey constraint on dose_units',NULL,'4.4.3',NULL,NULL,NULL),('201312201200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10568,'MARK_RAN','8:ae0a91ef02548a3580eb168c9f3f7317','customChange','Migrating old text units to coded dose_units in drug_order',NULL,'4.4.3',NULL,NULL,NULL),('201312201425-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10574,'MARK_RAN','8:7ae5071d34fa145acac884a61df18179','update tableName=orders','Setting order.discontinued_reason to null for stopped orders',NULL,'4.4.3',NULL,NULL,NULL),('201312201523-TRUNK-4138','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10573,'EXECUTED','8:9ca149b68f2df37166fde53eea920fe1','customChange','Creating Discontinue Order for discontinued orders',NULL,'4.4.3',NULL,NULL,NULL),('201312201525-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10575,'MARK_RAN','8:f338be595f4d1b489c5a0d7cabfef17c','update tableName=orders','Setting orders.discontinued_reason_non_coded to null for stopped orders',NULL,'4.4.3',NULL,NULL,NULL),('201312201601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10577,'EXECUTED','8:5ccea84adf3b7dfeabc7b0a3a6c5a6b4','dropForeignKeyConstraint baseTableName=orders, constraintName=user_who_discontinued_order','Dropping fk constraint on orders.discontinued_by column to users.user_id column',NULL,'4.4.3',NULL,NULL,NULL),('201312201640-TRUNK-4138','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10572,'EXECUTED','8:12ba0eeb2ddebe7c77996b0651669b94','renameColumn newColumnName=date_stopped, oldColumnName=discontinued_date, tableName=orders','Rename orders.discontinued_date to date_stopped',NULL,'4.4.3',NULL,NULL,NULL),('201312201651-TRUNK-4138','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10576,'EXECUTED','8:900c1a849be3ca5104c1addbf8c90971','dropColumn columnName=discontinued, tableName=orders','Removing discontinued from orders',NULL,'4.4.3',NULL,NULL,NULL),('201312201700-TRUNK-4138','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10578,'EXECUTED','8:9d8f08ab296afa73d3dcaaaa6199d9bf','dropColumn columnName=discontinued_by, tableName=orders','Removing discontinued_by from orders',NULL,'4.4.3',NULL,NULL,NULL),('201312201800-TRUNK-4167','banka','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10569,'EXECUTED','8:f1e3dd59ccfe7395af57333fe7a0be77','dropColumn columnName=units, tableName=drug_order','Deleting units column',NULL,'4.4.3',NULL,NULL,NULL),('201312271822-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10584,'EXECUTED','8:4e4555c7ef47460b32994178eecafa5f','createTable tableName=care_setting; addForeignKeyConstraint baseTableName=care_setting, constraintName=care_setting_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=care_setting, constraintName=care_setting_retired_by, ref...','Adding care_setting table',NULL,'4.4.3',NULL,NULL,NULL),('201312271823-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10585,'EXECUTED','8:2c0254863d118f52cb87047ddfb9c11c','insert tableName=care_setting','Adding OUTPATIENT care setting',NULL,'4.4.3',NULL,NULL,NULL),('201312271824-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10586,'EXECUTED','8:34935ebf282def5963db2270ecc61c74','insert tableName=care_setting','Adding INPATIENT care setting',NULL,'4.4.3',NULL,NULL,NULL),('201312271826-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10587,'EXECUTED','8:0c789d70e7602127ae8e5d88fb58df4e','addColumn tableName=orders','Add care_setting column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('201312271827-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10588,'MARK_RAN','8:254146872f9e6ac0429e414c01a4369d','sql','Set default value for orders.care_setting column for existing rows',NULL,'4.4.3',NULL,NULL,NULL),('201312271828-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10589,'EXECUTED','8:658c1a309a30a8880ec77cf3954ca8ea','addNotNullConstraint columnName=care_setting, tableName=orders','Make care_setting column non-nullable',NULL,'4.4.3',NULL,NULL,NULL),('201312271829-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10590,'EXECUTED','8:797ed8855071aa2e47f920e31ff33e54','addForeignKeyConstraint baseTableName=orders, constraintName=orders_care_setting, referencedTableName=care_setting','Add foreign key constraint',NULL,'4.4.3',NULL,NULL,NULL),('201401031433-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10579,'EXECUTED','8:b8892aab8ea4fde9acf3204eac4e20dd','renameColumn newColumnName=frequency_text, oldColumnName=frequency, tableName=drug_order','Temporarily renaming drug_order.frequency column to frequency_text',NULL,'4.4.3',NULL,NULL,NULL),('201401031434-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:12',10580,'EXECUTED','8:b8a47a7ea5ef704760bc0cd4c167e181','addColumn tableName=drug_order; addForeignKeyConstraint baseTableName=drug_order, constraintName=drug_order_frequency_fk, referencedTableName=order_frequency','Adding the frequency column to the drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201401040436-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10482,'EXECUTED','8:64885a85f461f51fdc86f199982e6845','Add Column, Add Foreign Key Constraint','Add changed_by column to location_tag table',NULL,'2.0.5',NULL,NULL,NULL),('201401040438-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10483,'EXECUTED','8:7ae930c289721170583ffc6ca1be8c2c','Add Column','Add date_changed column to location_tag table',NULL,'2.0.5',NULL,NULL,NULL),('201401040440-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10484,'EXECUTED','8:3fd1822464548afa4134b32a042e709d','Add Column, Add Foreign Key Constraint','Add changed_by column to location table',NULL,'2.0.5',NULL,NULL,NULL),('201401040442-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10485,'EXECUTED','8:0d59525585bdbc1c2145fc9c917a6272','Add Column','Add date_changed column to location table',NULL,'2.0.5',NULL,NULL,NULL),('201401101647-TRUNK-4187','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10529,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checks that all existing free text drug order dose units and frequencies have been mapped to\n            concepts, this will fail the upgrade process if any unmapped text is found',NULL,'4.4.3',NULL,NULL,NULL),('201402041600-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10592,'EXECUTED','8:10ddf0c27a96e7fda9d6c4b0e0963653','dropForeignKeyConstraint baseTableName=orders, constraintName=discontinued_because','Temporary dropping foreign key on orders.discontinued_reason column',NULL,'4.4.3',NULL,NULL,NULL),('201402041601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10593,'EXECUTED','8:d4be61b39216cd34a90a8aded6f49b04','renameColumn newColumnName=order_reason, oldColumnName=discontinued_reason, tableName=orders','Renaming orders.discontinued_reason column to order_reason',NULL,'4.4.3',NULL,NULL,NULL),('201402041602-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10594,'EXECUTED','8:e223c0933b53a0c7e4b4353211d96b2d','addForeignKeyConstraint baseTableName=orders, constraintName=discontinued_because, referencedTableName=concept','Adding back foreign key on orders.discontinued_reason column',NULL,'4.4.3',NULL,NULL,NULL),('201402041604-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10595,'EXECUTED','8:2c3af06ae1e1e5c7a22007747fc7efba','renameColumn newColumnName=order_reason_non_coded, oldColumnName=discontinued_reason_non_coded, tableName=orders','Renaming orders.discontinued_reason_non_coded column to order_reason_non_coded',NULL,'4.4.3',NULL,NULL,NULL),('201402042238-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10597,'MARK_RAN','8:7929683b57dbbd7be48a2e698c868f55','customChange','Converting orders.orderer to reference provider.provider_id',NULL,'4.4.3',NULL,NULL,NULL),('201402051638-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10596,'EXECUTED','8:4c73656c9bcb89e03487349ce1be62b3','dropForeignKeyConstraint baseTableName=orders, constraintName=orderer_not_drug','Temporarily removing foreign key constraint from orders.orderer column',NULL,'4.4.3',NULL,NULL,NULL),('201402051639-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:13',10598,'EXECUTED','8:3b2feb440d7b27d40befa121b23657d4','addForeignKeyConstraint baseTableName=orders, constraintName=fk_orderer_provider, referencedTableName=provider','Adding foreign key constraint to orders.orderer column',NULL,'4.4.3',NULL,NULL,NULL),('201402120720-TRUNK-3902','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10608,'EXECUTED','8:4ca5cb3aa17f56718f3c56ecaaf7b128','renameColumn newColumnName=allow_decimal, oldColumnName=precise, tableName=concept_numeric','Rename concept_numeric.precise to concept_numeric.allow_decimal',NULL,'4.4.3',NULL,NULL,NULL),('201402141515','djazayeri','liquibase.xml','2023-10-25 10:22:13',10914,'EXECUTED','8:8e9506a28e33db58c2905300a7f7a464','dropNotNullConstraint columnName=provider_id, tableName=appointmentscheduling_appointment_block','Allow appointment blocks with no provider specified',NULL,'4.4.3',NULL,NULL,NULL),('201402241055','Akshika','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10544,'EXECUTED','8:613168bf075ac75360d11f573feefabf','modifyColumn tableName=orders','Making orders.start_date not nullable',NULL,'4.4.3',NULL,NULL,NULL),('201402281648-TRUNK-4274','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10545,'EXECUTED','8:fb1c0544bf2516c18a9f90f686d27db6','modifyColumn tableName=orders','Making order.encounter required',NULL,'4.4.3',NULL,NULL,NULL),('201403011348','alexisduque','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10599,'EXECUTED','8:fe0c10d32f9b817a295bec10ed17a97e','modifyColumn tableName=orders','Make orders.orderer not NULLable',NULL,'4.4.3',NULL,NULL,NULL),('20140304-TRUNK-4170-duplicateLocationAttributeTypeNameChangeSet','harsz89','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10609,'MARK_RAN','8:bcc61948650059bb491e961971af50b5','customChange','Custom changeset to identify and resolve duplicate Location Attribute Type names',NULL,'4.4.3',NULL,NULL,NULL),('20140304-TRUNK-4170-location_attribute_type_unique_name','harsz89','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10610,'EXECUTED','8:8840ef4f61f4f2c05e3d41e322de7fa5','addUniqueConstraint constraintName=location_attribute_type_unique_name, tableName=location_attribute_type','Adding the unique constraint to the location_attribute_type.name column',NULL,'4.4.3',NULL,NULL,NULL),('20140304816-TRUNK-4139','Akshika','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10601,'EXECUTED','8:2e1712a31d04490070783fc9db61c52d','addColumn tableName=orders','Adding scheduled_date column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('201403061758-TRUNK-4284','Banka, Vinay','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10600,'EXECUTED','8:4bf8b412e24209f462942bfc981af0e9','insert tableName=concept_class','Inserting Frequency concept class',NULL,'4.4.3',NULL,NULL,NULL),('201403070132-TRUNK-4286','andras-szell','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10543,'EXECUTED','8:6dd03bbcf2de9d2645b2cfff5fb0a2aa','insert tableName=order_type','Insert order type for test orders',NULL,'4.4.3',NULL,NULL,NULL),('20140313-TRUNK-4288','dszafranek','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10602,'EXECUTED','8:308822b1f80ada31873aa1729c151d5b','createTable tableName=order_type_class_map; addForeignKeyConstraint baseTableName=order_type_class_map, constraintName=fk_order_type_order_type_id, referencedTableName=order_type; addForeignKeyConstraint baseTableName=order_type_class_map, constra...','Add order_type_class_map table',NULL,'4.4.3',NULL,NULL,NULL),('20140314-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10530,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all orders have start_date column set',NULL,'4.4.3',NULL,NULL,NULL),('20140316-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10532,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all orders have encounter_id column set',NULL,'4.4.3',NULL,NULL,NULL),('201403171701-appointmentscheduling_appointment_cancel_reason','cioan','liquibase.xml','2023-10-25 10:22:13',10915,'EXECUTED','8:1563fa1625f91a118e787ae22278f503','addColumn tableName=appointmentscheduling_appointment','Adding cancel_reason column to appointmentscheduling_appointment table',NULL,'4.4.3',NULL,NULL,NULL),('20140318-TRUNK-4265','jkondrat','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10603,'EXECUTED','8:4f65d700426c7aa94fe7838ce8b1dc62','mergeColumns column1Name=dose_strength, column2Name=units, finalColumnName=strength, tableName=drug; update tableName=drug','Concatenate dose_strength and units to form the value for the new strength field',NULL,'4.4.3',NULL,NULL,NULL),('201403262140-TRUNK-4265','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10533,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking if there are any drugs with the dose_strength specified but no units',NULL,'4.4.3',NULL,NULL,NULL),('20140331-1-TRUNK-4335','rkorytkowski','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10480,'EXECUTED',NULL,'Add Column','Adding uuid to concept_set_derived',NULL,'2.0.5',NULL,NULL,NULL),('20140331-2-TRUNK-4335','rkorytkowski','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10481,'EXECUTED',NULL,'Add Column','Adding uuid to drug_ingredient',NULL,'2.0.5',NULL,NULL,NULL),('201404091110','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10534,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking if order_type table is already up to date or can be updated automatically',NULL,'4.4.3',NULL,NULL,NULL),('201404091112','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10538,'EXECUTED','8:853f2329810a15bf5ef36f3130e70eb5','addUniqueConstraint tableName=order_type','Adding unique key constraint to order_type.name column',NULL,'4.4.3',NULL,NULL,NULL),('201404091128','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10539,'EXECUTED','8:39511fb040092c43e8f5f3ec58118cdb','addColumn tableName=order_type','Adding java_class_name column to order_type table',NULL,'4.4.3',NULL,NULL,NULL),('201404091129','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10540,'EXECUTED','8:f07c00661d9c0245a17d4e32eef42220','addColumn tableName=order_type','Adding parent column to order_type table',NULL,'4.4.3',NULL,NULL,NULL),('201404091131','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10542,'EXECUTED','8:b7f8f3c60aebc38f27ea8a81568a9adc','addNotNullConstraint columnName=java_class_name, tableName=order_type','Add not-null constraint on order_type.java_class_name column',NULL,'4.4.3',NULL,NULL,NULL),('201404091516','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10604,'EXECUTED','8:678a7d1063d398f828d0efeff02dc2ec','addColumn tableName=order_type; addForeignKeyConstraint baseTableName=order_type, constraintName=order_type_changed_by, referencedTableName=users','Add changed_by column to order_type table',NULL,'4.4.3',NULL,NULL,NULL),('201404091517','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10605,'EXECUTED','8:2e448249bde370177f9904a22609c8a7','addColumn tableName=order_type','Add date_changed column to order_type table',NULL,'4.4.3',NULL,NULL,NULL),('201404101130','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10541,'EXECUTED','8:acc2139dbc25f461a6f65f371f01c805','update tableName=order_type','Setting java_class_name column for drug order type row',NULL,'4.4.3',NULL,NULL,NULL),('201406201443','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10606,'EXECUTED','8:40e2b8be45cba42d7b37e41f1e10e634','addColumn tableName=drug_order','Add brand_name column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201406201444','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10607,'EXECUTED','8:85dfe5492c7b3a49f07bc90086842844','addColumn tableName=drug_order','Add dispense_as_written column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('201406211643-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10536,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all discontinued orders have the discontinued_date column set',NULL,'4.4.3',NULL,NULL,NULL),('201406211703-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10537,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all discontinued orders have the discontinued_by column set',NULL,'4.4.3',NULL,NULL,NULL),('201406262016','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10535,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all users that created orders have provider accounts',NULL,'4.4.3',NULL,NULL,NULL),('20140635-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:10',10531,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','Checking that all orders have orderer column set',NULL,'4.4.3',NULL,NULL,NULL),('20140715-TRUNK-2999-remove_concept_word','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10611,'EXECUTED','8:823f79c3bd5624f810ed81cb2f8b01ad','dropTable tableName=concept_word','Removing the concept_word table (replaced by Lucene)',NULL,'4.4.3',NULL,NULL,NULL),('20140718-TRUNK-2999-remove_update_concept_index_task','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10612,'EXECUTED','8:d8f65c211d04d19312075861f4995a5d','delete tableName=scheduler_task_config','Deleting the update concept index task',NULL,'4.4.3',NULL,NULL,NULL),('20140719-TRUNK-4445-update_dosing_type_to_varchar_255','mihir','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10615,'EXECUTED','8:d71b286da1e68819d005c837254e84bf','modifyDataType columnName=dosing_type, tableName=drug_order','Increase size of dosing type column to 255 characters',NULL,'4.4.3',NULL,NULL,NULL),('20140724-1528','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10613,'EXECUTED','8:e67f765e838502e837d4ac0651073035','dropDefaultValue columnName=drug_inventory_id, tableName=drug_order','Dropping default value for drug_order.drug_inventory_id',NULL,'4.4.3',NULL,NULL,NULL),('20140801-TRUNK-4443-rename_order_start_date_to_date_activated','bharti','liquibase-update-to-latest.xml','2023-10-25 10:21:14',10614,'EXECUTED','8:64a97f174a667e831045af5a93bb95b1','renameColumn newColumnName=date_activated, oldColumnName=start_date, tableName=orders','Renaming the start_date in order table to date_activated',NULL,'4.4.3',NULL,NULL,NULL),('201408200733-TRUNK-4446','Deepak','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10616,'EXECUTED','8:dba80a93fd9105b84082a603882354e7','modifyDataType columnName=duration, tableName=drug_order','Changing duration column of drug_order to int',NULL,'4.4.3',NULL,NULL,NULL),('20140917-1-appointmentmentscheduling_appointment_request','mogoodrich','liquibase.xml','2023-10-25 10:22:14',10916,'EXECUTED','8:b4b37f0f8515a8f92a993e03a0cd1c71','createTable tableName=appointmentscheduling_appointment_request; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment_request, constraintName=appointment_request_creator, referencedTableName=users; addForeignKeyConstraint baseTa...','Create the appointment request table',NULL,'4.4.3',NULL,NULL,NULL),('201409230113-TRUNK-3484','k-joseph','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10619,'EXECUTED','8:58d6f207f90b799e675c7cb89fff6a56','update tableName=global_property','Updating description for visits.encounterTypeToVisitTypeMapping GP to the value set in OpenmrsContants',NULL,'4.4.3',NULL,NULL,NULL),('201409251456-appointmentscheduling-confidential','djazayeri','liquibase.xml','2023-10-25 10:22:14',10917,'EXECUTED','8:5493b010b179340482d0ead2d0da4891','addColumn tableName=appointmentscheduling_appointment_type','Adding confidential column to appointmentscheduling_appointment_type table',NULL,'4.4.3',NULL,NULL,NULL),('20141010-trunk-4492','alec','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10621,'EXECUTED','8:27fd49cfedc85505c11797f46d5c9a72','dropColumn columnName=tribe, tableName=patient','Dropping the tribe field from patient table because it has been moved to person_attribute.',NULL,'4.4.3',NULL,NULL,NULL),('201410291606-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10622,'EXECUTED','8:3dda1c6a8738461777bfdb1de7e1b66b','dropNotNullConstraint columnName=description, tableName=program','Dropping not null constraint from program.description column',NULL,'4.4.3',NULL,NULL,NULL),('201410291613-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10623,'EXECUTED','8:609dd8b60d1360b7e24dcbf12287e987','dropNotNullConstraint columnName=description, tableName=order_type','Dropping not null constraint from order_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('201410291614-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10624,'EXECUTED','8:d2f5710af3a8f8f58937508d321426ce','dropNotNullConstraint columnName=description, tableName=concept_name_tag','Dropping not null constraint from concept_name_tag.description column',NULL,'4.4.3',NULL,NULL,NULL),('201410291616-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10625,'EXECUTED','8:1074e6b56ed6777fb9269d187c26bce1','dropNotNullConstraint columnName=description, tableName=active_list_type','Dropping not null constraint from active_list_type.description column',NULL,'4.4.3',NULL,NULL,NULL),('20141103-1030','wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10626,'EXECUTED','8:98b6390ae26c56e8ec5c2c1a3a3d31bd','addColumn tableName=obs','Adding form_namespace_and_path column to obs table',NULL,'4.4.3',NULL,NULL,NULL),('201411101055-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10631,'EXECUTED','8:2de993e213dfec1e8b358a4164c8af03','dropForeignKeyConstraint baseTableName=person_attribute_type, constraintName=privilege_which_can_edit','Temporarily removing foreign key constraint from person_attribute_type.edit_privilege column',NULL,'4.4.3',NULL,NULL,NULL),('201411101056-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10632,'EXECUTED','8:4443516e0b36928b1a58f040b8791d68','dropForeignKeyConstraint baseTableName=role_privilege, constraintName=privilege_definitions','Temporarily removing foreign key constraint from role_privilege.privilege column',NULL,'4.4.3',NULL,NULL,NULL),('201411101057-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10633,'EXECUTED','8:3f49e3dc4aa458623dfe11c10d6e6c1b','modifyColumn tableName=privilege','Increasing the size of the privilege column in the privilege table',NULL,'4.4.3',NULL,NULL,NULL),('201411101058-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10634,'EXECUTED','8:994eef110601ec00914894c4b6e94651','addForeignKeyConstraint baseTableName=person_attribute_type, constraintName=privilege_which_can_edit, referencedTableName=privilege','Adding foreign key constraint to person_attribute_type.edit_privilege column',NULL,'4.4.3',NULL,NULL,NULL),('201411101106-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10635,'EXECUTED','8:cfc610064cf20217eb1f853fadd52b92','modifyColumn tableName=role_privilege','Increasing the size of the privilege column in the role_privilege table',NULL,'4.4.3',NULL,NULL,NULL),('201411101107-TRUNK-3386','pmuchowski','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10636,'EXECUTED','8:1f30c7e5e81967c3e1a1196ccf2f2710','addForeignKeyConstraint baseTableName=role_privilege, constraintName=privilege_definitions, referencedTableName=privilege','Adding foreign key constraint to role_privilege.privilege column',NULL,'4.4.3',NULL,NULL,NULL),('20141121-TRUNK-2193','raff','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10627,'EXECUTED','8:90856496e5c98091c58930f9eb5e19ef','renameColumn newColumnName=strength, oldColumnName=quantity, tableName=drug_ingredient','Renaming drug_ingredient.quantity to strength',NULL,'4.4.3',NULL,NULL,NULL),('20150108-TRUNK-14','rpuzdrowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10629,'EXECUTED','8:1dfd11ff1e6b71c1a7327a0c59d5f931','delete tableName=global_property','Removing dashboard.regimen.standardRegimens global property',NULL,'4.4.3',NULL,NULL,NULL),('20150108-TRUNK-3849','rpuzdrowski','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10628,'EXECUTED','8:1d204100dff76eaa6977d108540e800f','customChange','Updating layout.address.format global property',NULL,'4.4.3',NULL,NULL,NULL),('20150122-1414','rkorytkowski','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10332,'EXECUTED','8:616062e6acd8d1dac50b8353ca1d459f','Update Data','Reverting concept name type to NULL for concepts having names tagged as default',NULL,'2.0.5',NULL,NULL,NULL),('20150122-1420','rkorytkowski','liquibase-update-to-latest.xml','2016-07-07 08:14:51',10333,'EXECUTED','8:a1a2b59662d50c016bc8968b794d968d','Update Data, Delete Data (x2)','Setting concept name type to fully specified for names tagged as default',NULL,'2.0.5',NULL,NULL,NULL),('20150211-TRUNK-3709','jkondrat','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10630,'EXECUTED','8:7247188ac237d4d2adfe1029c92bf5c2','customChange','Encrypting the users.secret_answer column',NULL,'4.4.3',NULL,NULL,NULL),('20150221-1644','sandeepraparthi','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10637,'EXECUTED','8:45e485ce6f9b8785b930c0374a8d891f','addForeignKeyConstraint baseTableName=patient_identifier, constraintName=fk_patient_id_patient_identifier, referencedTableName=patient','Adding foreign key on patient_identifier.patient_id column',NULL,'4.4.3',NULL,NULL,NULL),('20150428-TRUNK-4693-1','mseaton','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10617,'MARK_RAN','8:010954269c2f406ff0e1d9085ee07381','dropForeignKeyConstraint baseTableName=order_type, constraintName=order_type_parent','Removing invalid foreign key constraint from order_type.parent column to order.order_id column',NULL,'4.4.3',NULL,NULL,NULL),('20150428-TRUNK-4693-2','mseaton','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10618,'EXECUTED','8:75e6d21123e6c08353cad016c466452a','addForeignKeyConstraint baseTableName=order_type, constraintName=order_type_parent_order_type, referencedTableName=order_type','Adding foreign key constraint from order_type.parent column to order_type.order_type_id column',NULL,'4.4.3',NULL,NULL,NULL),('201506051103-TRUNK-4727','Chethan, Preethi','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10638,'EXECUTED','8:124825ed3eb7b8d328f206a02738981d','addColumn tableName=person','Adding birthtime column to person',NULL,'4.4.3',NULL,NULL,NULL),('201506192000-TRUNK-4729','thomasvandoren','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10639,'EXECUTED','8:1d4b84f18070d55cebd66c603675ef58','addColumn tableName=encounter_type; addForeignKeyConstraint baseTableName=encounter_type, constraintName=encounter_type_changed_by, referencedTableName=users','Add changed_by column to encounter_type table',NULL,'4.4.3',NULL,NULL,NULL),('201506192001-TRUNK-4729','thomasvandoren','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10640,'EXECUTED','8:134c1bbb31b0bc1be1d05cb004278105','addColumn tableName=encounter_type','Add date_changed column to encounter_type table',NULL,'4.4.3',NULL,NULL,NULL),('201508111304','sns.recommind','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10641,'EXECUTED','8:9672f72dfc57e0a6bb5bd0df42e90040','createIndex indexName=global_property_property_index, tableName=global_property','Add an index to the global_property.property column',NULL,'4.4.3',NULL,NULL,NULL),('201508111412','sns.recommind','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10642,'EXECUTED','8:6e676415380fef7f1ac0d9f9033aca69','createIndex indexName=concept_class_name_index, tableName=concept_class','Add an index to the concept_class.name column',NULL,'4.4.3',NULL,NULL,NULL),('201508111415','sns.recommind','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10643,'EXECUTED','8:0eb97161e6a7cea441a2ed63e804feaa','createIndex indexName=concept_datatype_name_index, tableName=concept_datatype','Add an index to the concept_datatype.name column',NULL,'4.4.3',NULL,NULL,NULL),('201509281653','Sravanthi','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10652,'EXECUTED','8:6b0b62e1eb0e2be03a7efb772cdc3d77','addColumn tableName=drug_order','Add drug_non_coded column to drug_order table',NULL,'4.4.3',NULL,NULL,NULL),('20151006-1530','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:19',10657,'EXECUTED','8:53759a5bad5df99a0cdae9f89ecd1f52','createTable tableName=order_set; addForeignKeyConstraint baseTableName=order_set, constraintName=order_set_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=order_set, constraintName=order_set_retired_by_fk, referencedTa...','Create order_set table',NULL,'4.4.3',NULL,NULL,NULL),('20151006-1537','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10658,'EXECUTED','8:021e1756be58ad3d219d72a1253d3918','createTable tableName=order_set_member; addForeignKeyConstraint baseTableName=order_set_member, constraintName=order_set_member_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=order_set_member, constraintName=order_set...','Create order_set_member table',NULL,'4.4.3',NULL,NULL,NULL),('20151007-TRUNK-4747-remove_active_list','jdegraft','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10650,'EXECUTED','8:805d64f01b1308d9a8bf77fc7e589690','dropTable tableName=active_list','Removing the active_list table (active_list feature removed)',NULL,'4.4.3',NULL,NULL,NULL),('20151007-TRUNK-4747-remove_active_list_allergy','jdegraft','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10649,'EXECUTED','8:d065b749b4efbd4f1fe5ebb652002c06','dropTable tableName=active_list_allergy','Removing the active_list_allergy table (active_list feature removed)',NULL,'4.4.3',NULL,NULL,NULL),('20151007-TRUNK-4747-remove_active_list_problem','jdegraft','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10648,'EXECUTED','8:47a86f44747e4df00fe9f45adbc0f487','dropTable tableName=active_list_problem','Removing the active_list_problem table (active_list feature removed)',NULL,'4.4.3',NULL,NULL,NULL),('20151007-TRUNK-4747-remove_active_list_type','jdegraft','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10651,'EXECUTED','8:693196ad558eda718e394a7c914971d1','dropTable tableName=active_list_type','Removing the active_list_type table (active_list feature removed)',NULL,'4.4.3',NULL,NULL,NULL),('20151022-TRUNK-4750','gwasilwa','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10653,'EXECUTED','8:036050f0ba60f45596591e876d558ffd','addColumn tableName=person_address; addColumn tableName=location','Adding address columns (7-15) to person_address and location',NULL,'4.4.3',NULL,NULL,NULL),('20151118-1630','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10659,'EXECUTED','8:d7449cf960dbec1d5b9765c2fe4f0ac5','createTable tableName=order_group; addForeignKeyConstraint baseTableName=order_group, constraintName=order_group_patient_id_fk, referencedTableName=patient; addForeignKeyConstraint baseTableName=order_group, constraintName=order_group_encounter_id...','Create order_group table',NULL,'4.4.3',NULL,NULL,NULL),('20151118-1640','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10660,'EXECUTED','8:a120b265a54af40422854ac577880d6e','addColumn tableName=orders; addForeignKeyConstraint baseTableName=orders, constraintName=orders_order_group_id_fk, referencedTableName=order_group','Adding \'order_group_id\' column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('20151218-1729','Rahul,Swathi','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10723,'EXECUTED','8:663120bc2e414e0ef0dc8c53ebcb3136','createTable tableName=patient_program_attribute; addForeignKeyConstraint baseTableName=patient_program_attribute, constraintName=patient_program_attribute_programid_fk, referencedTableName=patient_program; addForeignKeyConstraint baseTableName=pat...','Creating patient_program_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('20160201-TRUNK-1505','mnagasowmya','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10654,'EXECUTED','8:7825e4e23a06261e731818c1060c7d51','dropColumn columnName=value_boolean, tableName=obs','Removing a column value_boolean from obs table',NULL,'4.4.3',NULL,NULL,NULL),('20160202-1743','rkorytkowski','liquibase-update-to-latest.xml','2023-10-25 10:21:19',10656,'EXECUTED','8:484954fb75c20307a88b0ae4171dda02','addNotNullConstraint columnName=uuid, tableName=cohort; addNotNullConstraint columnName=uuid, tableName=concept; addNotNullConstraint columnName=uuid, tableName=concept_answer; addNotNullConstraint columnName=uuid, tableName=concept_class; addNotN...','Set uuid columns to \"NOT NULL\", if not set already for 1.9.x tables',NULL,'4.4.3',NULL,NULL,NULL),('20160212-1020','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10661,'EXECUTED','8:088bfc1ebb05ceafd3237b844541f0aa','addColumn tableName=orders','Adding \'sort_weight\' column to orders table',NULL,'4.4.3',NULL,NULL,NULL),('20160216-1700','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10655,'EXECUTED','8:83647104df9b6914cb009179f10e9dc9','customChange','Set uuid for columns in all tables which has uuid as null. This is required for successful run of next changeSet.',NULL,'4.4.3',NULL,NULL,NULL),('20160427-0950-create-concept-attribute-type-table','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10664,'EXECUTED','8:0e3bb5143dc3562a4106f5f010c950e8','createTable tableName=concept_attribute_type; addForeignKeyConstraint baseTableName=concept_attribute_type, constraintName=concept_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=concept_attribute_type, ...','Creating concept_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('20160427-0954-create-concept-attribute-table','bahmni','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10665,'EXECUTED','8:f1aff3972d637493a6adc91be193348c','createTable tableName=concept_attribute; addForeignKeyConstraint baseTableName=concept_attribute, constraintName=concept_attribute_concept_fk, referencedTableName=concept; addForeignKeyConstraint baseTableName=concept_attribute, constraintName=con...','Creating concept_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('201604281645','vishnuraom','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10662,'MARK_RAN','8:41c185d784b1e6f5a717f94ed4c444dd','update tableName=drug_order','Converting values in drug_order.dosing_type column from SIMPLE to org.openmrs.SimpleDosingInstructions (TRUNK-4845)',NULL,'4.4.3',NULL,NULL,NULL),('201604281646','vishnuraom','liquibase-update-to-latest.xml','2023-10-25 10:21:20',10663,'MARK_RAN','8:7dd6cc5720b5bcb82c811bac7c2baf57','update tableName=drug_order','Converting values in drug_order.dosing_type column from FREE_TEXT to org.openmrs.FreeTextDosingInstructions(TRUNK-4845)',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10676,'EXECUTED','8:a1ffc1cc8db22ad700b3d5789b4ca80e','dropForeignKeyConstraint baseTableName=cohort_member, constraintName=member_patient','Dropping foreign key constraint member_patient',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-1.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10677,'EXECUTED','8:c1e8d888a52cd6830f1c7245534c931e','dropForeignKeyConstraint baseTableName=cohort_member, constraintName=parent_cohort','Dropping foreign key constraint parent_cohort',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-1.2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10678,'EXECUTED','8:1eb5a9ee7233979adbee989a91140325','dropPrimaryKey tableName=cohort_member','Dropping primary key for cohort_member',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10679,'EXECUTED','8:2b6770c6367227bccaec91119037bb92','addColumn tableName=cohort_member','Adding column cohort_member.cohort_member_id',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-2.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10680,'MARK_RAN','8:0958768d360dcd6a6f07dec01138c55d','customChange','Updating cohort member ids',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-2.2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10681,'EXECUTED','8:efac82e8f62fe999ae8cdd851256a571','addPrimaryKey tableName=cohort_member','Adding primary key to cohort_member.cohort_member_id',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-2.3','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10682,'EXECUTED','8:7c93380a4682620b5c0881d6b02bfbdf','addAutoIncrement columnName=cohort_member_id, tableName=cohort_member','Adding auto increment property to cohort_member.cohort_member_id',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-3','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10683,'EXECUTED','8:abfcac2b2f7c09993a274548c146fa04','addColumn tableName=cohort_member','Adding column cohort_member.start_date',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-4','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10685,'EXECUTED','8:04b0ef23418e3ea2a00eacbbcfbc00cc','addColumn tableName=cohort_member','Adding column cohort_member.end_date',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-5','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10686,'EXECUTED','8:4ea126f0da0ddd2e03644de5cc91edb0','addColumn tableName=cohort_member','Adding column cohort_member.creator',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-5.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10687,'MARK_RAN','8:f23677031ae31460d2748c50b71d5eb4','update tableName=cohort_member','Updating cohort_member.creator value',NULL,'4.4.3',NULL,NULL,NULL),('201609171146-5.2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10688,'EXECUTED','8:4612418089a691bf2a01b68dd9423390','addForeignKeyConstraint baseTableName=cohort_member, constraintName=cohort_member_creator, referencedTableName=users','Adding foreign key constraint to cohort_member.creator',NULL,'4.4.3',NULL,NULL,NULL),('201610042145-1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10689,'EXECUTED','8:433d5a023c2a97ae8e1447eb83163d30','addColumn tableName=cohort_member','Adding column cohort_member.date_created',NULL,'4.4.3',NULL,NULL,NULL),('201610042145-1.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10690,'MARK_RAN','8:ec3182a6d6c5353fa647098aabb665b3','update tableName=cohort_member','Updating cohort_member.date_created with value cohort.date_created',NULL,'4.4.3',NULL,NULL,NULL),('201610042145-2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10696,'EXECUTED','8:6158704b588ee00c5e328b2bab9d171e','addColumn tableName=cohort_member','Adding column cohort_member.uuid',NULL,'4.4.3',NULL,NULL,NULL),('201610042145-2.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10697,'EXECUTED','8:a80e35af13b110ae2544b75cf3d07243','update tableName=cohort_member','Generating UUIDs for all rows in cohort_member table via built in uuid function.',NULL,'4.4.3',NULL,NULL,NULL),('201610042145-2.2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10698,'EXECUTED','8:e21714083cfc6eaca753218bdbaebff4','addUniqueConstraint tableName=cohort_member','Adding unique constraint to cohort_member.uuid',NULL,'4.4.3',NULL,NULL,NULL),('20161011-001','themoonraker13','liquibase.xml','2023-10-25 10:22:18',10950,'EXECUTED','8:1b9b88740d78bdbf2ef8d1760f11b070','update tableName=global_property','Updated the value of patient dashboard URL global property',NULL,'4.4.3',NULL,NULL,NULL),('201610131530-1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10691,'EXECUTED','8:2c34109121c89941136d4d148f52d0a4','addColumn tableName=cohort_member','Adding column cohort_member.voided',NULL,'4.4.3',NULL,NULL,NULL),('201610131530-1.1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10692,'EXECUTED','8:7771c874bb3fe2a9102c8ddf8b2b137d','addDefaultValue columnName=voided, tableName=cohort_member','Adding defaultValue for cohort_member.voided',NULL,'4.4.3',NULL,NULL,NULL),('201610131530-2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10693,'EXECUTED','8:c89d07098df9f58356d3284d53b30ee5','addColumn tableName=cohort_member','Adding column cohort_member.voided_by',NULL,'4.4.3',NULL,NULL,NULL),('201610131530-3','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10694,'EXECUTED','8:b33935a613e8e7308ee15b300bc94270','addColumn tableName=cohort_member','Adding column cohort_member.date_voided',NULL,'4.4.3',NULL,NULL,NULL),('201610131530-4','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10695,'EXECUTED','8:3a18b5e8d5f23f27051b0d8dd144a0cc','addColumn tableName=cohort_member','Adding column cohort_member.void_reason',NULL,'4.4.3',NULL,NULL,NULL),('201610242135-1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10699,'EXECUTED','8:fa5a33f95d868d1052807395813e37d1','addForeignKeyConstraint baseTableName=cohort_member, constraintName=parent_cohort, referencedTableName=cohort','Adding foreign key constraint to cohort_member.cohort_id',NULL,'4.4.3',NULL,NULL,NULL),('201610242135-2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10700,'EXECUTED','8:2cae31214498cbfd57211a94afbeaa7e','addForeignKeyConstraint baseTableName=cohort_member, constraintName=member_patient, referencedTableName=patient','Adding foreign key constraint to cohort_member.patient_id',NULL,'4.4.3',NULL,NULL,NULL),('201610242135-3','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10684,'MARK_RAN','8:65e8273dbaf897b4e34769d92363e9f5','update tableName=cohort_member','Updating cohort_start_date with value cohort.date_created',NULL,'4.4.3',NULL,NULL,NULL),('201611121945-1','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10701,'EXECUTED','8:00f89c8fc8d81fd3f662b33b10b22415','dropDefaultValue columnName=cohort_id, tableName=cohort_member','Dropping defaultValue for cohort_member.cohort_id',NULL,'4.4.3',NULL,NULL,NULL),('201611121945-2','vshankar','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10702,'EXECUTED','8:c8cc20aa06d6626210c3db2053a81b3e','dropDefaultValue columnName=patient_id, tableName=cohort_member','Dropping defaultValue for cohort_member.patient_id',NULL,'4.4.3',NULL,NULL,NULL),('20170707-TRUNK-5185-1','mogoodrich','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10673,'EXECUTED','8:735b6bfe17b5c70118e1bef0ec2e3b9b','createIndex indexName=concept_reference_source_uuid_id, tableName=concept_reference_source','Adding unique index on concept_reference_source uuid column',NULL,'4.4.3',NULL,NULL,NULL),('20170707-TRUNK-5185-2','mogoodrich','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10674,'EXECUTED','8:f8b2a9472948917c4824525c825f13a9','createIndex indexName=concept_reference_map_uuid_id, tableName=concept_reference_map','Adding unique index on concept_reference_map uuid column',NULL,'4.4.3',NULL,NULL,NULL),('20180405131015-TRUNK-5333','alicerowan','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10728,'MARK_RAN','8:4ca5cb3aa17f56718f3c56ecaaf7b128','renameColumn newColumnName=allow_decimal, oldColumnName=precise, tableName=concept_numeric','Rename concept_numeric.precise to concept_numeric.allow_decimal',NULL,'4.4.3',NULL,NULL,NULL),('20180508-1000','Kelechi+iheanyi','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10724,'MARK_RAN','8:845dfe877a088206a28fcbd0c04dd2fd','renameTable newTableName=emrapi_conditions, oldTableName=conditions','Rename conditions table to emrapi_conditions',NULL,'4.4.3',NULL,NULL,NULL),('20180508-1001','Kelechi+iheanyi','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10725,'EXECUTED','8:88d01340cbf5c037e124d0599522bb13','createTable tableName=conditions; addForeignKeyConstraint baseTableName=conditions, constraintName=condition_previous_version_fk, referencedTableName=conditions; addForeignKeyConstraint baseTableName=conditions, constraintName=condition_condition_...','Add conditions table',NULL,'4.4.3',NULL,NULL,NULL),('20180508-1002','Kelechi+iheanyi','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10726,'MARK_RAN','8:69842fc8b8dda5fbaa7b4755d2c58f02','sql','Migrate data from the emrapi_conditions table to the new conditions table',NULL,'4.4.3',NULL,NULL,NULL),('20180706-passwordreset','harisu+fanyui','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10734,'EXECUTED','8:441a4efcc2181b70efd7cb0384ec5563','addColumn tableName=users','Adding column users.activation_key',NULL,'4.4.3',NULL,NULL,NULL),('20180808-passwordreset','harisu+fanyui','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10735,'EXECUTED','8:52aab8137a1343c58822432e90d8e530','addColumn tableName=users','Adding column users.email',NULL,'4.4.3',NULL,NULL,NULL),('20181402-TRUNK-5339','esirkings','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10727,'EXECUTED','8:daa25283474716219ec1e857668a3ff8','createTable tableName=encounter_diagnosis; addForeignKeyConstraint baseTableName=encounter_diagnosis, constraintName=encounter_diagnosis_encounter_id_fk, referencedTableName=encounter; addForeignKeyConstraint baseTableName=encounter_diagnosis, con...','Creating encounter_diagnosis table',NULL,'4.4.3',NULL,NULL,NULL),('2018Jun28-1','Chew Chia Shao Yuan','liquibase.xml','2023-10-25 10:22:17',10945,'EXECUTED','8:6fc8758401ae8acdb1689cae1976aa32','insert tableName=patient_identifier_type','Creates a Patient Identifier Type which acts as the MPI Global Identifier for the Demo of the MPI Functionality with OpenEMPI',NULL,'4.4.3',NULL,NULL,NULL),('20190625-Trunk-5411','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10738,'EXECUTED','8:54df679826e34a04b8b80942e94a7b7a','addColumn tableName=drug; addForeignKeyConstraint baseTableName=drug, constraintName=drug_dose_limit_units_fk, referencedTableName=concept','Adding \"dose_limit_units\" column to drug table',NULL,'4.4.3',NULL,NULL,NULL),('20190815-Trunk-5412','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10744,'EXECUTED','8:097971ad4b683c624ef7b5d9afb8faea','addColumn tableName=order_group; addForeignKeyConstraint baseTableName=order_group, constraintName=order_group_order_group_reason_fk, referencedTableName=concept','Adding \"order_group_reason\" column to order_group table',NULL,'4.4.3',NULL,NULL,NULL),('20190815-Trunk-5650','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10745,'EXECUTED','8:683558c2e7716af357494252a94aee20','addColumn tableName=order_group; addForeignKeyConstraint baseTableName=order_group, constraintName=order_group_parent_order_group_fk, referencedTableName=order_group','Adding \"parent_order_group\" column to order_group table',NULL,'4.4.3',NULL,NULL,NULL),('20190815-Trunk-5651','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10747,'EXECUTED','8:f57b630542abaf86eb5f11cb4c3e9ad5','addColumn tableName=order_group; addForeignKeyConstraint baseTableName=order_group, constraintName=order_group_previous_order_group_fk, referencedTableName=order_group','Adding \"previous_order_group\" column to order_group table',NULL,'4.4.3',NULL,NULL,NULL),('201909','jecihjoy','liquibase.xml','2023-10-25 10:22:14',10918,'EXECUTED','8:a6d0319d61e4348fc52d20003b453e31','addColumn tableName=appointmentscheduling_appointment_type; addForeignKeyConstraint baseTableName=appointmentscheduling_appointment_type, constraintName=appointment_type_visit_type_id, referencedTableName=visit_type','Adding visitType column to appointmentscheduling_appointment_type table',NULL,'4.4.3',NULL,NULL,NULL),('20191126-make-appointment-status-history-end-date-nullable','jecihjoy','liquibase.xml','2023-10-25 10:22:14',10921,'EXECUTED','8:57ca8eb85de433dd1239f308c4d79921','modifyColumn tableName=appointmentscheduling_appointment_status_history','After AM-196, we need to make sure that for existing implementations the end date of appointment_status_history is nullable',NULL,'4.4.3',NULL,NULL,NULL),('2019_appointmentscheduling_provider_schedule','jecihjoy','liquibase.xml','2023-10-25 10:22:14',10919,'EXECUTED','8:dada90ccf2cff61f0ba91f14e8b96e2f','createTable tableName=appointmentscheduling_provider_schedule; addForeignKeyConstraint baseTableName=appointmentscheduling_provider_schedule, constraintName=provider_schedule_creator, referencedTableName=users; addForeignKeyConstraint baseTableNam...','Create the provider_schedule table',NULL,'4.4.3',NULL,NULL,NULL),('2019_appointmentscheduling_provider_type_map','jecihjoy','liquibase.xml','2023-10-25 10:22:14',10920,'EXECUTED','8:f64640920afb3923246e316487b7aae7','createTable tableName=appointmentscheduling_provider_type_map; addForeignKeyConstraint baseTableName=appointmentscheduling_provider_type_map, constraintName=appointmentscheduling_provider_type_map_appointment_type_id, referencedTableName=appointme...','Create the link table \"appointmentscheduling_provider_type_map\" that links\n			appointmentscheduling_provider_schedule table and appointmentscheduling_appointment_type table',NULL,'4.4.3',NULL,NULL,NULL),('2020-08-29-2200-TRUNK-5821','miirochristopher','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10742,'EXECUTED','8:b19d78a89af7cbbc1146acfdc3bc9ee5','createIndex indexName=orders_order_number, tableName=orders','Adding index to order_number column in Orders table',NULL,'4.4.3',NULL,NULL,NULL),('2020-08-30-100-TRUNK-5821','miirochristopher','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10743,'EXECUTED','8:ebab8d61ca65d04b73dbed42acebbe6e','createIndex indexName=orders_accession_number, tableName=orders','Adding index to accession_number column in Orders table',NULL,'4.4.3',NULL,NULL,NULL),('2020-08-31-2200-TRUNK-5821','miirochristopher','liquibase-update-to-latest.xml','2023-10-25 10:21:28',10753,'MARK_RAN','8:b19d78a89af7cbbc1146acfdc3bc9ee5','createIndex indexName=orders_order_number, tableName=orders','Adding index to order_number column in Orders table',NULL,'4.4.3',NULL,NULL,NULL),('2020-08-32-100-TRUNK-5821','miirochristopher','liquibase-update-to-latest.xml','2023-10-25 10:21:28',10754,'MARK_RAN','8:ebab8d61ca65d04b73dbed42acebbe6e','createIndex indexName=orders_accession_number, tableName=orders','Adding index to accession_number column in Orders table',NULL,'4.4.3',NULL,NULL,NULL),('2020-09-16-1700-TRUNK-5736','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10771,'EXECUTED','8:40649e743e95f164311fbe7a4d9db53c','dropForeignKeyConstraint baseTableName=users, constraintName=user_who_changed_user; addForeignKeyConstraint baseTableName=users, constraintName=user_who_changed_user, referencedTableName=users','Updating foreign key user_who_changed_user to add delete CASCADE',NULL,'4.4.3',NULL,NULL,NULL),('20200714-Trunk-5862','loliveira','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10748,'EXECUTED','8:c2d4c311dcab0c2c9507b75bfdd78a3c','addColumn tableName=conditions','Adding \"form_namespace_and_path\" column to conditions table',NULL,'4.4.3',NULL,NULL,NULL),('20200723-TRUNK-5410','tendomart','liquibase-update-to-latest.xml','2023-10-25 10:21:28',10752,'EXECUTED','8:47b18620e5dd10a8c0f7a13281af80ce','createTable tableName=order_group_attribute; addForeignKeyConstraint baseTableName=order_group_attribute, constraintName=order_group_attribute_order_group_fk, referencedTableName=order_group; addForeignKeyConstraint baseTableName=order_group_attri...','Creating order_group_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('2021-09-02-TRUNK-6020-a','tendomart','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10762,'EXECUTED','8:aadbb027ec7a7517476c91d72adfeb81','modifyDataType columnName=property, tableName=user_property','Increasing user_property.property from VARCHAR(100) to VARCHAR(255)',NULL,'4.4.3',NULL,NULL,NULL),('2021-09-02-TRUNK-6020-b','tendomart','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10763,'EXECUTED','8:85b6045f5edd6bb0e8196d34ce45af93','modifyDataType columnName=property_value, tableName=user_property','Changing user_property.property_value from VARCHAR(255) to LONGTEXT',NULL,'4.4.3',NULL,NULL,NULL),('2021-17-11-0222-TRUNK-6044','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10772,'EXECUTED','8:891345f735354d676708be6a6901e6d6','renameColumn newColumnName=dx_rank, oldColumnName=rank, tableName=encounter_diagnosis','Renaming column rank to dx_rank because rank is a reserved word in MySQL 8.0.2 and later',NULL,'4.4.3',NULL,NULL,NULL),('2021-24-10-1000-TRUNK-6038','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10769,'EXECUTED','8:64667c33ce83ef617adcec76bb0d8d07','createTable tableName=diagnosis_attribute_type; addForeignKeyConstraint baseTableName=diagnosis_attribute_type, constraintName=diagnosis_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=diagnosis_attribut...','Creating diagnosis_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('2021-24-10-1145-TRUNK-6038','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10770,'EXECUTED','8:f8ab3e462613d00033a3c048dd1dfd20','createTable tableName=diagnosis_attribute; addForeignKeyConstraint baseTableName=diagnosis_attribute, constraintName=diagnosis_attribute_diagnosis_fk, referencedTableName=encounter_diagnosis; addForeignKeyConstraint baseTableName=diagnosis_attribu...','Creating diagnosis_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('2021-27-09-0200-TRUNK-6027','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10764,'EXECUTED','8:06f763bdcac48ebd7f3a3c27b1659968','createTable tableName=order_attribute_type; addForeignKeyConstraint baseTableName=order_attribute_type, constraintName=order_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=order_attribute_type, constrai...','Creating order_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('2021-27-09-0300-TRUNK-6027','miirochristopher','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10765,'EXECUTED','8:61f02d74b284d8b7ce979fa00a81a4a7','createTable tableName=order_attribute; addForeignKeyConstraint baseTableName=order_attribute, constraintName=order_attribute_order_fk, referencedTableName=orders; addForeignKeyConstraint baseTableName=order_attribute, constraintName=order_attribut...','Creating order_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('3-increase-privilege-col-size-person_attribute_type','dkayiwa','liquibase-update-to-latest.xml','2016-07-07 08:14:56',10471,'EXECUTED','8:8c799f623a82031f88eede87cc3f37e9','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Increasing the size of the edit_privilege column in the person_attribute_type table',NULL,'2.0.5',NULL,NULL,NULL),('3e32c214-9f9a-4424-8590-43ca68396aa6','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10931,'EXECUTED','8:c210f6a3c522b49852cc7f7ce011faf8','addColumn tableName=idgen_remote_source','',NULL,'4.4.3',NULL,NULL,NULL),('43889130-55c2-49e9-b72b-a9eae9a31da7','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10922,'EXECUTED','8:373516eb011f344c988f9f5c8c121ec9','createTable tableName=idgen_identifier_source','',NULL,'4.4.3',NULL,NULL,NULL),('4b4ee08c-262f-48f0-a37e-2372614e1a58','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10928,'EXECUTED','8:e049bd1485f41729157717defbe8e7ab','createTable tableName=idgen_log_entry','',NULL,'4.4.3',NULL,NULL,NULL),('4dce863f-bb66-4aa3-9663-22a23be24689','Partners In Health','liquibase.xml','2023-10-25 10:22:16',10938,'EXECUTED','8:ca901c85ff134c614a44996f7b8445c6','dropForeignKeyConstraint baseTableName=idgen_auto_generation_option, constraintName=identifier_type for idgen_auto_generation_option','',NULL,'4.4.3',NULL,NULL,NULL),('6b164990-ccd3-4508-9c08-11d27786da17','Samuel Male','liquibase.xml','2023-10-25 10:22:16',10944,'EXECUTED','8:f64aa54c07012b957b35718200001b31','addNotNullConstraint columnName=uuid, tableName=idgen_auto_generation_option; createIndex indexName=idgen_auto_generation_option_uuid_index, tableName=idgen_auto_generation_option','Now that UUID generation is done, set the uuid columns to \"NOT NULL\" and create a unique index for the column',NULL,'4.4.3',NULL,NULL,NULL),('82b51fe1-e6ad-423c-80a0-d2a48a3efe6c','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10927,'EXECUTED','8:8180e375c265c002562bd651f27fde0e','createTable tableName=idgen_auto_generation_option','',NULL,'4.4.3',NULL,NULL,NULL),('9b1eb03d-bd27-428b-8359-5877797b0fb8','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10926,'EXECUTED','8:5a04d8559c47487fd8984975778f55a6','createTable tableName=idgen_pooled_identifier','',NULL,'4.4.3',NULL,NULL,NULL),('a5b34ba3-2cb0-46b5-bb47-4e07da4a7acd','Jeremy Keiper','liquibase.xml','2023-10-25 10:22:16',10935,'EXECUTED','8:bf30ad2e0f1f88d6f04731aa96ae0367','sql','',NULL,'4.4.3',NULL,NULL,NULL),('a7a39c84-cb48-427e-9141-ee851c283132','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10923,'EXECUTED','8:b9d71be011a11b3bf513053fb0eae327','createTable tableName=idgen_seq_id_gen','',NULL,'4.4.3',NULL,NULL,NULL),('a92f91c0-162b-42d9-a33b-c1412dc2948d','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10924,'EXECUTED','8:8509f2488dabeecafee4dc9626d9b031','createTable tableName=idgen_remote_source','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-1','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10806,'EXECUTED','8:7af68c228c63ee24ac3e2c9b91e8bf22','createTable tableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-2','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10807,'EXECUTED','8:d2ed5a23e363ed1bc853b0dd81aeffeb','createTable tableName=address_hierarchy_level','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-3','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10809,'EXECUTED','8:212ff915d280852a7155f39826b27d3f','createIndex indexName=address_field_unique, tableName=address_hierarchy_level','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-4','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10810,'EXECUTED','8:6a51c7db6a958ef729963187f36b57dc','createIndex indexName=address_hierarchy_entry_name_idx, tableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-5','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10811,'EXECUTED','8:6854e0527dec4660bf44fcfef4db05cd','createIndex indexName=level_name, tableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-6','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10812,'EXECUTED','8:b966d8fe42054bbc575db80e38374650','createIndex indexName=parent_name, tableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-7','aman (generated)','liquibase.xml','2023-10-25 10:22:05',10815,'EXECUTED','8:9cda37caf56963005b8cf80b29e33bbb','addForeignKeyConstraint baseTableName=address_hierarchy_entry, constraintName=level_to_level, referencedTableName=address_hierarchy_level','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-8','aman (generated)','liquibase.xml','2023-10-25 10:22:05',10816,'EXECUTED','8:0829ef612906edde3ee09ed23cdf045d','addForeignKeyConstraint baseTableName=address_hierarchy_entry, constraintName=parent-to-parent, referencedTableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595797202649-9','aman (generated)','liquibase.xml','2023-10-25 10:22:05',10817,'EXECUTED','8:23718917acff5432859dfbf2f408435d','addForeignKeyConstraint baseTableName=address_hierarchy_level, constraintName=parent_level, referencedTableName=address_hierarchy_level','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595832956041-1','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10808,'EXECUTED','8:a43e3e0ab172198952209eaba316c225','createTable tableName=address_hierarchy_address_to_entry_map','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595832956041-116','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10813,'EXECUTED','8:643a6de0b36c21e7649c72f7f5a13399','createIndex indexName=address_id_to_person_address_table, tableName=address_hierarchy_address_to_entry_map','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595832956041-229','aman (generated)','liquibase.xml','2023-10-25 10:22:04',10814,'EXECUTED','8:2ce0874029567b6d0f1063047c54a820','createIndex indexName=entry_id_to_address_hierarchy_table, tableName=address_hierarchy_address_to_entry_map','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595832956041-516','aman (generated)','liquibase.xml','2023-10-25 10:22:05',10818,'EXECUTED','8:d0b31e94e752d75c753a7618211053cc','addForeignKeyConstraint baseTableName=address_hierarchy_address_to_entry_map, constraintName=address_id_to_person_address_table, referencedTableName=person_address','',NULL,'4.4.3',NULL,NULL,NULL),('address_hierarchy-1595832956041-625','aman (generated)','liquibase.xml','2023-10-25 10:22:05',10819,'EXECUTED','8:6fc70b53ff0bb150a12b9685fcc47363','addForeignKeyConstraint baseTableName=address_hierarchy_address_to_entry_map, constraintName=entry_id_to_address_hierarchy_table, referencedTableName=address_hierarchy_entry','',NULL,'4.4.3',NULL,NULL,NULL),('add_based_on_reference_join_table_20200311','pmanko','liquibase.xml','2023-10-25 10:21:59',10779,'EXECUTED','8:9fed57d573d504ea890f9f13132f55fe','createTable tableName=fhir_task_based_on_reference; addForeignKeyConstraint baseTableName=fhir_task_based_on_reference, constraintName=task_based_on_fk, referencedTableName=fhir_task; addForeignKeyConstraint baseTableName=fhir_task_based_on_refere...','',NULL,'4.4.3',NULL,NULL,NULL),('add_changed_by_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10897,'MARK_RAN','8:353391974542b0ad63799033da0bda97','addForeignKeyConstraint baseTableName=reporting_report_design, constraintName=changed_by_for_reporting_report_design, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_changed_by_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10901,'MARK_RAN','8:63f051932a28de92212e3ed097943151','addForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=changed_by_for_reporting_report_design_resource, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_changed_by_for_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10905,'MARK_RAN','8:90f2f4adb189e8b75b025d1c4aa74624','addForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=changed_by_for_reporting_report_processor, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_ciel_fhir_concept_source_20200221','ibacher','liquibase.xml','2023-10-25 10:21:59',10775,'EXECUTED','8:f2e2cb0a28fe3b6a94a95e49661a5bb7','sql','',NULL,'4.4.3',NULL,NULL,NULL),('add_creator_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10896,'MARK_RAN','8:841a6303048177eb5ff545cf7ce7f955','addForeignKeyConstraint baseTableName=reporting_report_design, constraintName=creator_for_reporting_report_design, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_creator_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10900,'MARK_RAN','8:ed1aea146bbcd225a348a93a3d2e8c36','addForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=creator_for_reporting_report_design_resource, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_creator_for_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10904,'MARK_RAN','8:62011059da39c1e548e3b468164ba76a','addForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=creator_for_reporting_report_processor, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_default_duration_unit_20200930','ibacher','liquibase.xml','2023-10-25 10:22:01',10790,'EXECUTED','8:1f653cca60adfae5c8c91994cb23beea','sql; sql; sql; sql; sql; sql; sql','',NULL,'4.4.3',NULL,NULL,NULL),('add_default_observation_categories_20200930','ibacher','liquibase.xml','2023-10-25 10:22:01',10788,'EXECUTED','8:73affe6c6768796f73b415e5ce59f160','sql; sql; sql','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_concept_source_20200105','ibacher','liquibase.xml','2023-10-25 10:21:58',10773,'EXECUTED','8:32021b3c1947c434aa9b2c00d550a0d4','createTable tableName=fhir_concept_source; addForeignKeyConstraint baseTableName=fhir_concept_source, constraintName=fhir_concept_source_concept_reference_source_fk, referencedTableName=concept_reference_source; addForeignKeyConstraint baseTableNa...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_diagnostic_report_20200917','ibacher','liquibase.xml','2023-10-25 10:22:00',10783,'EXECUTED','8:8e027c92045d9cdc7817bcdcf72079ac','createTable tableName=fhir_diagnostic_report; addForeignKeyConstraint baseTableName=fhir_diagnostic_report, constraintName=fhir_diagnostic_report_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_diagnostic_report, con...','Create the table for storing Diagnostic Reports',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_diagnostic_report_performers_20200917','ibacher','liquibase.xml','2023-10-25 10:22:00',10784,'EXECUTED','8:82f5bbdcf8b2bd705a2c20c61a27d977','createTable tableName=fhir_diagnostic_report_performers; addForeignKeyConstraint baseTableName=fhir_diagnostic_report_performers, constraintName=fhir_diagnostic_report_performers_diagnostic_report, referencedTableName=fhir_diagnostic_report; addFo...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_diagnostic_report_results_20201020','ibacher','liquibase.xml','2023-10-25 10:22:01',10785,'EXECUTED','8:0e92072a259d4762a0f1b3bb2749f444','createTable tableName=fhir_diagnostic_report_results; addForeignKeyConstraint baseTableName=fhir_diagnostic_report_results, constraintName=fhir_diagnostic_report_results_diagnostic_report, referencedTableName=fhir_diagnostic_report; addForeignKeyC...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_duration_unit_map_20200930','ibacher','liquibase.xml','2023-10-25 10:22:01',10789,'EXECUTED','8:837653ceb2c37b0f16dd861364ed03c0','createTable tableName=fhir_duration_unit_map; addForeignKeyConstraint baseTableName=fhir_duration_unit_map, constraintName=fhir_duration_unit_map_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_duration_unit_map, con...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_encounter_class_map_20200930','ibacher','liquibase.xml','2023-10-25 10:22:01',10786,'EXECUTED','8:c07b71cc89518e9c89054145d3d3851c','createTable tableName=fhir_encounter_class_map; addForeignKeyConstraint baseTableName=fhir_encounter_class_map, constraintName=fhir_encounter_class_map_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_encounter_class_...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_observation_category_map_20200930','ibacher','liquibase.xml','2023-10-25 10:22:01',10787,'EXECUTED','8:8406cad7f81cab2dfa52a98702256f17','createTable tableName=fhir_observation_category_map; addForeignKeyConstraint baseTableName=fhir_observation_category_map, constraintName=fhir_observation_category_map_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_o...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_patient_identifier_system_20210507','Medhavi','liquibase.xml','2023-10-25 10:22:01',10791,'EXECUTED','8:3e54e358f177bc7d2b968ce42cc55739','createTable tableName=fhir_patient_identifier_system; addForeignKeyConstraint baseTableName=fhir_patient_identifier_system, constraintName=fhir_patient_identifier_system_patient_identifier_type_fk, referencedTableName=patient_identifier_type; addF...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_reference_20200311','pmanko','liquibase.xml','2023-10-25 10:21:59',10778,'EXECUTED','8:4af2620a8401719ce59a4b4ba75b7eb4','createTable tableName=fhir_reference; addForeignKeyConstraint baseTableName=fhir_reference, constraintName=fhir_reference_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_reference, constraintName=fhir_reference_ch...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_task_20200311','pmanko','liquibase.xml','2023-10-25 10:21:59',10777,'EXECUTED','8:e1ec059d84b15074664e277fe1d2d2dd','createTable tableName=fhir_task; addForeignKeyConstraint baseTableName=fhir_task, constraintName=task_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_task, constraintName=task_changed_by, referencedTableName=users; a...','Create Task table for the Task FHIR resource',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_task_input_20200308','pmanko','liquibase.xml','2023-10-25 10:22:00',10781,'EXECUTED','8:347812d29adfbbaf3b757f8e9832738e','createTable tableName=fhir_task_input; addForeignKeyConstraint baseTableName=fhir_task_input, constraintName=fhir_task_input_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_task_input, constraintName=fhir_task_inp...','',NULL,'4.4.3',NULL,NULL,NULL),('add_fhir_task_output_20200311','pmanko','liquibase.xml','2023-10-25 10:22:00',10780,'EXECUTED','8:591e2822f354ee07598a8f13a8de6307','createTable tableName=fhir_task_output; addForeignKeyConstraint baseTableName=fhir_task_output, constraintName=fhir_task_output_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=fhir_task_output, constraintName=fhir_task...','',NULL,'4.4.3',NULL,NULL,NULL),('add_loinc_fhir_concept_source_20200221','ibacher','liquibase.xml','2023-10-25 10:21:59',10774,'EXECUTED','8:a338427d100eb59b39015c6773b85dba','sql','',NULL,'4.4.3',NULL,NULL,NULL),('add_report_definition_uuid_index','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10895,'MARK_RAN','8:124a0287bbfff94cf290ad5307eebbe9','createIndex indexName=report_definition_uuid_for_reporting_report_design, tableName=reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('add_report_design_id_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10899,'MARK_RAN','8:761d950f1a95ba64008e5c8981c57c25','addForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=report_design_id_for_reporting_report_design_resource, referencedTableName=reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('add_requested_by_for_reporting_report_request','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10903,'MARK_RAN','8:6fb0147388c094ce3f8ba1172e1d7971','addForeignKeyConstraint baseTableName=reporting_report_request, constraintName=requested_by_for_reporting_report_request, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_retired_by_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10898,'MARK_RAN','8:e3b44f7de3ef9402bd053403748557be','addForeignKeyConstraint baseTableName=reporting_report_design, constraintName=retired_by_for_reporting_report_design, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_retired_by_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10902,'MARK_RAN','8:43f821e5d783c35b7d505735a1506fab','addForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=retired_by_for_reporting_report_design_resource, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_retired_by_for_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:12',10906,'MARK_RAN','8:ca424a6f32b474c7ee86863005478d5d','addForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=retired_by_for_reporting_report_processor, referencedTableName=users','',NULL,'4.4.3',NULL,NULL,NULL),('add_target_uuid_to_fhir_reference_202020917','ibacher','liquibase.xml','2023-10-25 10:22:00',10782,'EXECUTED','8:34e6228e38f3e8434003dd0e71cbf682','addColumn tableName=fhir_reference; sql','',NULL,'4.4.3',NULL,NULL,NULL),('add_task_location_reference_20221121','moses_mutesa','liquibase.xml','2023-10-25 10:22:02',10795,'EXECUTED','8:0bdb5fd62f9d6bd943f8a4cfa33d9b7f','addColumn tableName=fhir_task; addForeignKeyConstraint baseTableName=fhir_task, constraintName=task_location_reference_fk, referencedTableName=fhir_reference','',NULL,'4.4.3',NULL,NULL,NULL),('aea80abc-8e1b-44f2-9574-c64741750cec','Jeremy Keiper','liquibase.xml','2023-10-25 10:22:15',10933,'EXECUTED','8:5824bddc9a62e841b62c1369a33e30f7','renameColumn newColumnName=min_length, oldColumnName=length, tableName=idgen_seq_id_gen','',NULL,'4.4.3',NULL,NULL,NULL),('appframework-1','djazayeri','liquibase.xml','2023-10-25 10:22:17',10946,'EXECUTED','8:df72d4474c873750fb4a2a19d098d0d1','createTable tableName=appframework_app_enabled; addForeignKeyConstraint baseTableName=appframework_app_enabled, constraintName=app_enabled_for_user, referencedTableName=users; addForeignKeyConstraint baseTableName=appframework_app_enabled, constra...','Create table for AppEnabled',NULL,'4.4.3',NULL,NULL,NULL),('appframework-2','djazayeri','liquibase.xml','2023-10-25 10:22:17',10947,'EXECUTED','8:2cac456963a99394c141e79ab76ce797','dropTable tableName=appframework_app_enabled','Drop table for AppEnabled, since we\'ll be using privileges instead',NULL,'4.4.3',NULL,NULL,NULL),('appframework-3','nutsiepully','liquibase.xml','2023-10-25 10:22:17',10948,'EXECUTED','8:a75b0eea217a4c1996ff9f222b079add','createTable tableName=appframework_component_state','Create table to track which AppFramework components are enabled',NULL,'4.4.3',NULL,NULL,NULL),('appframework-4','Wyclif','liquibase.xml','2023-10-25 10:22:17',10949,'EXECUTED','8:7767361264b00ee01f59b6cad7dfc244','createTable tableName=appframework_user_app','Create table to store user defined apps',NULL,'4.4.3',NULL,NULL,NULL),('b50c8351-3c6c-40eb-be40-bbdaed78c5a0','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10925,'EXECUTED','8:7c76bea8629e9376f87f717d2db9f837','createTable tableName=idgen_id_pool','',NULL,'4.4.3',NULL,NULL,NULL),('c7084acb-9cc5-4643-ad6d-6302acc76d69','Samuel Male','liquibase.xml','2023-10-25 10:22:16',10942,'EXECUTED','8:35b24b07f328933802389d347109f2ea','addColumn tableName=idgen_auto_generation_option','Adding \"uuid\" column to the idgen_auto_generation_option table',NULL,'4.4.3',NULL,NULL,NULL),('change_ciel_url_fhir_concept_source_20200820','ibacher','liquibase.xml','2023-10-25 10:21:59',10776,'EXECUTED','8:e21abac1fac251c4d8dfd0f8f732c765','sql','',NULL,'4.4.3',NULL,NULL,NULL),('create-logic-rule-definition','mseaton','liquibase.xml','2016-07-07 08:15:05',10490,'EXECUTED',NULL,'Create Table, Create Index (x3), Add Foreign Key Constraint (x3)','',NULL,'2.0.5',NULL,NULL,NULL),('create-logic-rule-token-tag','nribeka','liquibase.xml','2016-07-07 08:15:05',10489,'EXECUTED',NULL,'Create Table, Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('create-logic_token_registration','djazayeri','liquibase.xml','2016-07-07 08:15:05',10491,'EXECUTED',NULL,'Create Table, Add Foreign Key Constraint (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('create-logic_token_registration_tag','djazayeri','liquibase.xml','2016-07-07 08:15:05',10492,'EXECUTED',NULL,'Create Table, Add Foreign Key Constraint','',NULL,'2.0.5',NULL,NULL,NULL),('create_logic_rule_token','nribeka','liquibase.xml','2016-07-07 08:15:05',10488,'EXECUTED',NULL,'Create Table, Add Foreign Key Constraint (x2)','',NULL,'2.0.5',NULL,NULL,NULL),('d5bc38a3-35e3-4a16-b1b2-df6f4c32ec7a','Partners In Health','liquibase.xml','2023-10-25 10:22:16',10936,'EXECUTED','8:fde1e37cfb9f1b55418131fd140b6a28','addColumn tableName=idgen_auto_generation_option','',NULL,'4.4.3',NULL,NULL,NULL),('daa579e7-b8de-4858-bfe5-c9ef2606db5e','Samuel Male','liquibase.xml','2023-10-25 10:22:16',10943,'EXECUTED','8:8c0e70ceade1a06bd939857cc4d82841','update tableName=idgen_auto_generation_option','Generating UUIDs for all rows in the idgen_auto_generation_option table',NULL,'4.4.3',NULL,NULL,NULL),('disable-foreign-key-checks','ben','liquibase-core-data.xml','2016-07-07 08:14:28',10017,'EXECUTED','8:fa07746edc31d6235f8a7c1e63dc7c95','Custom SQL','',NULL,'2.0.5',NULL,NULL,NULL),('drop-tribe-foreign-key-TRUNK-4492','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:15',10620,'MARK_RAN','8:c4e617969fb8916681fd50b86a153ec9','dropForeignKeyConstraint baseTableName=patient, constraintName=belongs_to_tribe','Dropping foreign key on patient.tribe',NULL,'4.4.3',NULL,NULL,NULL),('drop_changed_by_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10885,'MARK_RAN','8:74652ad4d2efb434505e19367a420b0f','dropForeignKeyConstraint baseTableName=reporting_report_design, constraintName=changed_by for reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('drop_changed_by_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10889,'MARK_RAN','8:bca747464fdd5fc5fc46948c10f31005','dropForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=changed_by for reporting_report_design_resource','',NULL,'4.4.3',NULL,NULL,NULL),('drop_changed_by_for_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10893,'MARK_RAN','8:88f6bc9e73a06f0b8a4cdfd4c6576e06','dropForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=changed_by for reporting_report_processor','',NULL,'4.4.3',NULL,NULL,NULL),('drop_creator_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10884,'MARK_RAN','8:c314c3b42e1fc94c32705c9d046a0b21','dropForeignKeyConstraint baseTableName=reporting_report_design, constraintName=creator for reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('drop_creator_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10888,'MARK_RAN','8:8737ae3a0723ad113b7cda14c8e613d7','dropForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=creator for reporting_report_design_resource','',NULL,'4.4.3',NULL,NULL,NULL),('drop_creator_for_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10892,'MARK_RAN','8:5c5aa96380ca21b353c2b60fcfd05ab8','dropForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=creator for reporting_report_processor','',NULL,'4.4.3',NULL,NULL,NULL),('drop_fhir_duration_unit_map_20220412','mseaton','liquibase.xml','2023-10-25 10:22:02',10793,'EXECUTED','8:9b47e04cc61496d9e7496caf6fc846d4','dropTable tableName=fhir_duration_unit_map','',NULL,'4.4.3',NULL,NULL,NULL),('drop_logic_rule_token','nribeka','liquibase.xml','2016-07-07 08:15:05',10487,'MARK_RAN',NULL,'Drop Table','',NULL,'2.0.5',NULL,NULL,NULL),('drop_logic_rule_token_tag','nribeka','liquibase.xml','2016-07-07 08:15:05',10486,'MARK_RAN',NULL,'Drop Table','',NULL,'2.0.5',NULL,NULL,NULL),('drop_report_definition_uuid_constraint','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10882,'MARK_RAN','8:ca6f51c29eca7b7916f7274fd6ebac78','dropForeignKeyConstraint baseTableName=reporting_report_design, constraintName=report_definition_uuid for reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('drop_report_definition_uuid_index','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10883,'MARK_RAN','8:622e7e741defdd566dc6ead8d007cfb1','dropIndex indexName=report_definition_uuid for reporting_report_design, tableName=reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('drop_report_design_id_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10887,'MARK_RAN','8:dea79c83eeeec40b038742d122f7e5d9','dropForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=report_design_id for reporting_report_design_resource','',NULL,'4.4.3',NULL,NULL,NULL),('drop_requested_by_for_reporting_report_request','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10891,'MARK_RAN','8:3f97e4add6ed06b586c4b6b3e7254dfa','dropForeignKeyConstraint baseTableName=reporting_report_request, constraintName=requested_by for reporting_report_request','',NULL,'4.4.3',NULL,NULL,NULL),('drop_retired_by_for_reporting_report_design','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10886,'MARK_RAN','8:3f1f7122c7c090d9780e370fae6ba72b','dropForeignKeyConstraint baseTableName=reporting_report_design, constraintName=retired_by for reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('drop_retired_by_for_reporting_report_design_resource','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10890,'MARK_RAN','8:eb3a26a3b3e64e51ca4f8cbfe0672bd6','dropForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=retired_by for reporting_report_design_resource','',NULL,'4.4.3',NULL,NULL,NULL),('drop_retired_by_reporting_report_processor','mgoodrich','liquibase.xml','2023-10-25 10:22:11',10894,'MARK_RAN','8:070ad8bf7c934359ee43ccec6171f421','dropForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=retired_by for reporting_report_processor','',NULL,'4.4.3',NULL,NULL,NULL),('e8258234-2133-4270-9370-301c908f1e2b','Partners In Health','liquibase.xml','2023-10-25 10:22:16',10939,'EXECUTED','8:14d9c5911538a3394ce3ee4a4a4bbb14','dropIndex indexName=identifier_type, tableName=idgen_auto_generation_option','',NULL,'4.4.3',NULL,NULL,NULL),('e931b3c1-94b6-4169-90f4-1c6bf49d4883','Partners In Health','liquibase.xml','2023-10-25 10:22:15',10930,'EXECUTED','8:08d1354da2ac2c8c03cb8a876130fb0b','addColumn tableName=idgen_id_pool','',NULL,'4.4.3',NULL,NULL,NULL),('enable-foreign-key-checks','ben','liquibase-core-data.xml','2016-07-07 08:14:29',10041,'EXECUTED','8:82a4e40bbc30eaf5423a361c1b56ad02','Custom SQL','',NULL,'2.0.5',NULL,NULL,NULL),('f3244825-c3d1-4789-99bd-03a014ae56a4','Jeremy Keiper','liquibase.xml','2023-10-25 10:22:16',10934,'EXECUTED','8:c47df23a6e52032be1db458ed0e83455','addColumn tableName=idgen_seq_id_gen','',NULL,'4.4.3',NULL,NULL,NULL),('fix_target_uuid_column','moses_mutesa','liquibase.xml','2023-10-25 10:22:02',10792,'EXECUTED','8:1edc34b3cf99326c6c01c017349ea783','modifyDataType columnName=target_uuid, tableName=fhir_reference; dropUniqueConstraint constraintName=target_uuid, tableName=fhir_reference','',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_date_retired','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10857,'EXECUTED','8:b4c81fbe47559ba99aab98d428667df4','addColumn tableName=htmlformentry_html_form','Update htmlformentry_html_form table to contain date_retired column',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_description','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10855,'EXECUTED','8:90bbfcad6180c5a965b8993077698d14','addColumn tableName=htmlformentry_html_form','Update htmlformentry_html_form table to contain description column',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_foreign_key_to_retired_by','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10859,'EXECUTED','8:a73be88ee383b49999a50f193ebd72c8','addForeignKeyConstraint baseTableName=htmlformentry_html_form, constraintName=user_who_retired_html_form, referencedTableName=users','Add foreign key user_who_retired_html_form',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_retired_by','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10856,'EXECUTED','8:83353ad7082e7c80d970f6595b8665e5','addColumn tableName=htmlformentry_html_form','Update htmlformentry_html_form table to contain retired_by column',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_retire_reason','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10858,'EXECUTED','8:6bc7efc9d9ba806e02bb2280410d1e1d','addColumn tableName=htmlformentry_html_form','Update htmlformentry_html_form table to contain retire_reason column',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_add_uuid','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10854,'EXECUTED','8:eb86061afb2a7f61862d20527100c635','addColumn tableName=htmlformentry_html_form','Update htmlformentry_html_form table to contain uuid column',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_create_index_for_uuid','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10861,'EXECUTED','8:3bab3ea5b62f62b1d743480ab4a54913','createIndex indexName=htmlformentry_html_form_uuid_index, tableName=htmlformentry_html_form','Create index htmlformentry_html_form_uuid_index',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_create_table','Darius Jazayeri','liquibase.xml','2023-10-25 10:22:09',10853,'EXECUTED','8:caa1a9be86f69d0452900c9d8fee2013','createTable tableName=htmlformentry_html_form; addForeignKeyConstraint baseTableName=htmlformentry_html_form, constraintName=User who created htmlformentry_htmlform, referencedTableName=users; addForeignKeyConstraint baseTableName=htmlformentry_ht...','Create table htmlformentry_html_form, for storing html form templates',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_make_name_nullable','Darius Jazayeri','liquibase.xml','2023-10-25 10:22:09',10862,'EXECUTED','8:54cf2d4509397d6294e47f2fa5b6ebf5','dropNotNullConstraint columnName=name, tableName=htmlformentry_html_form','Make name column nullable (because we\'re deprecating it)',NULL,'4.4.3',NULL,NULL,NULL),('htmlformentry_html_form_update_uuid','Mark Goodrich','liquibase.xml','2023-10-25 10:22:09',10860,'EXECUTED','8:b69558e4552d66b2aeab4b759a2de314','sql; modifyColumn tableName=htmlformentry_html_form','Remove null values from uuid column',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2011-10-04-a','bwolfe','liquibase.xml','2023-10-25 10:22:06',10833,'EXECUTED','8:9e1f4ac3d34f4b355f44d31a9bd15943','update tableName=global_property','Move MDS property addLocalMappings to metadatamapping',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2011-10-04-b','bwolfe','liquibase.xml','2023-10-25 10:22:06',10834,'EXECUTED','8:d0b48291150cec09f8ec41e99777c14c','update tableName=global_property','Move MDS property localConceptSourceUuid to metadatamapping',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2015-10-11-1834','kosmik','liquibase.xml','2023-10-25 10:22:07',10835,'EXECUTED','8:5fb6e7e2e4c13af7b81aa7ef15dbcbe8','createTable tableName=metadatamapping_metadata_source; addForeignKeyConstraint baseTableName=metadatamapping_metadata_source, constraintName=metadatamapping_metadata_source_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=...','Create metadata source table',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2015-10-11-1835','kosmik','liquibase.xml','2023-10-25 10:22:07',10836,'EXECUTED','8:158f71d7f620046777fdb527ad9abc79','createTable tableName=metadatamapping_metadata_term_mapping; addForeignKeyConstraint baseTableName=metadatamapping_metadata_term_mapping, constraintName=metadatamapping_metadata_term_mapping_metadata_source_id, referencedTableName=metadatamapping_...','Create metadata term mapping table',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2015-10-25-1124','kosmik','liquibase.xml','2023-10-25 10:22:07',10837,'EXECUTED','8:05e8c41b6de8ef7ab62058e8881a5cfe','addUniqueConstraint constraintName=metadatamapping_metadata_term_code_unique_within_source, tableName=metadatamapping_metadata_term_mapping','Add unique constraint on a code withing a source',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2015-11-16-1932','kosmik','liquibase.xml','2023-10-25 10:22:07',10838,'EXECUTED','8:fffb52d06fd554d7e747e7fd0963bc21','addUniqueConstraint constraintName=metadatamapping_metadata_source_name_unique, tableName=metadatamapping_metadata_source','Add unique constraint on metadata source name',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-01-06-0800','jasonvena','liquibase.xml','2023-10-25 10:22:07',10839,'EXECUTED','8:3f55b7f5a1b57b2dd0621e45f0f004f1','dropNotNullConstraint columnName=metadata_class, tableName=metadatamapping_metadata_term_mapping','Make MetadataTermMapping.metadataClass optional. We follow the openmrs convention of checking if the column\n			exists.',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-01-06-0801','jasonvena','liquibase.xml','2023-10-25 10:22:07',10840,'EXECUTED','8:26aa09cc619f2d01fd680ce985b8ba56','dropNotNullConstraint columnName=metadata_uuid, tableName=metadatamapping_metadata_term_mapping','Make MetadataTermMapping.metadataUuid optional. We follow the openmrs convention of checking if the column\n			exists.',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-02-07-1310-a','kosmik','liquibase.xml','2023-10-25 10:22:07',10841,'EXECUTED','8:befb1a2780e568d2cc0107d5e96d4a63','createIndex indexName=metadatamapping_idx_mdtm_retired, tableName=metadatamapping_metadata_term_mapping','Add index on metadata term mapping retired',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-02-07-1310-b-mysql','kosmik','liquibase.xml','2023-10-25 10:22:07',10842,'EXECUTED','8:c20dfb62bce6b8ee4582072b1841d34e','sql','For mysql, add a prefix index on metadata term mapping metadata class, since there is a hard length limit\n			on varchar indexes starting from mysql 5.6.',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-02-07-1310-b-non-mysql','kosmik','liquibase.xml','2023-10-25 10:22:07',10843,'MARK_RAN','8:7839394721a263fd56a6ee383e13e977','createIndex indexName=metadatamapping_idx_mdtm_mdclass, tableName=metadatamapping_metadata_term_mapping','Add index on metadata term mapping metadata class for any other dbms than mysql.',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-02-07-1310-c','kosmik','liquibase.xml','2023-10-25 10:22:07',10844,'EXECUTED','8:2b8d054099da6178a6115659007babdc','createIndex indexName=metadatamapping_idx_mdtm_mdsource, tableName=metadatamapping_metadata_term_mapping','Add index on metadata term mapping source',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-02-07-1310-d','kosmik','liquibase.xml','2023-10-25 10:22:07',10845,'EXECUTED','8:cc8edbfec4da38df5e325b34594047b5','createIndex indexName=metadatamapping_idx_mdtm_code, tableName=metadatamapping_metadata_term_mapping','Add index on metadata term mapping code',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-08-03-1044','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:07',10846,'EXECUTED','8:e781c9175e278eab3cfd3ff95a2ac61e','dropNotNullConstraint columnName=date_changed, tableName=metadatamapping_metadata_term_mapping; dropNotNullConstraint columnName=date_changed, tableName=metadatamapping_metadata_source','Make date_changed optional',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-08-04-1511','pgutkowski','liquibase.xml','2023-10-25 10:22:07',10847,'EXECUTED','8:c229300c8e2b5d2da18d5e731b9aa551','createTable tableName=metadatamapping_metadata_set; addForeignKeyConstraint baseTableName=metadatamapping_metadata_set, constraintName=metadatamapping_metadata_set_creator, referencedTableName=users; addForeignKeyConstraint baseTableName=metadatam...','Create metadata set table',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-08-04-1513','pgutkowski','liquibase.xml','2023-10-25 10:22:08',10848,'EXECUTED','8:abaa1635197f59db3c990c8ef6f67a0b','createTable tableName=metadatamapping_metadata_set_member; addUniqueConstraint constraintName=metadatamapping_metadata_set_member_term_unique_within_set, tableName=metadatamapping_metadata_set_member; addForeignKeyConstraint baseTableName=metadata...','Create metadata set member table',NULL,'4.4.3',NULL,NULL,NULL),('metadatamapping-2016-08-05-8000','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:08',10849,'EXECUTED','8:ed8fe7976557830e75e7d59a42624345','dropNotNullConstraint columnName=name, tableName=metadatamapping_metadata_term_mapping','Make name optional',NULL,'4.4.3',NULL,NULL,NULL),('metadatasharing_create_table_exported_package','Dmytro Trifonov','liquibase.xml','2023-10-25 10:22:08',10850,'EXECUTED','8:20f95ea1e7ec1d6a0cbcf599994d5e2b','createTable tableName=metadatasharing_exported_package; createIndex indexName=metadatasharing_package_group_uuid, tableName=metadatasharing_exported_package','Create table metadatasharing_exported_package',NULL,'4.4.3',NULL,NULL,NULL),('metadatasharing_create_table_imported_item','Dmytro Trifonov','liquibase.xml','2023-10-25 10:22:08',10852,'EXECUTED','8:0769db0ae1028e871ba64d617b20a5df','createTable tableName=metadatasharing_imported_item; createIndex indexName=metadatasharing_item_uuid, tableName=metadatasharing_imported_item','Create table metadatasharing_imported_item',NULL,'4.4.3',NULL,NULL,NULL),('metadatasharing_create_table_imported_package','Dmytro Trifonov','liquibase.xml','2023-10-25 10:22:08',10851,'EXECUTED','8:b5c327671c64ba1c2dfc6a8c62ff4f9e','createTable tableName=metadatasharing_imported_package; createIndex indexName=metadatasharing_package_uuid, tableName=metadatasharing_imported_package','Create table metadatasharing_imported_package',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-03.11.2016-16.10','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:06',10825,'MARK_RAN','8:3031a99cd49a20dbd64f71fc14629050','dropTable tableName=openconceptlab_item','Drop item table',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-03.11.2016-16.11','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:06',10826,'MARK_RAN','8:bae8599e0e50cefdce779dc0fc67058f','dropTable tableName=openconceptlab_update','Drop update table',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-03.11.2016-16.12','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:06',10827,'EXECUTED','8:9b13090663e39e80a21683ef13dcc0ab','createTable tableName=openconceptlab_import','Create import table',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-03.11.2016-16.13','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:06',10828,'EXECUTED','8:123496906a0f3539bffbdab79e0f8daa','createTable tableName=openconceptlab_item; addForeignKeyConstraint baseTableName=openconceptlab_item, constraintName=openconceptlab_item_import, referencedTableName=openconceptlab_import','Create openconceptlab_item table',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-04.11.2016-14.27','adamgrzybkowski','liquibase.xml','2023-10-25 10:22:06',10830,'EXECUTED','8:57d6bca7d22c3f668a1da8ae7d5dfe0f','addColumn tableName=openconceptlab_item','Create openconceptlab_item_update_on',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-08.11.2016','lkukielka','liquibase.xml','2023-10-25 10:22:06',10831,'EXECUTED','8:9d0ea0113f17ab257855a7c2841c84f1','addColumn tableName=openconceptlab_import','Add subscription_url column- See OCLM-43 for details',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-12','tomaszmarzeion','liquibase.xml','2023-10-25 10:22:06',10829,'EXECUTED','8:601dca7e378cf5dfc508bfc95385d91f','addColumn tableName=openconceptlab_import','Create release_version - See OCLM-38 for details',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-14.03.2018','rkorytkowski','liquibase.xml','2023-10-25 10:22:06',10832,'EXECUTED','8:94eddb7708692b1b905d36a3f89bface','createIndex indexName=openconceptlab_item_url, tableName=openconceptlab_item','Add openconceptlab_item_url index',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-5','rkorytkowski','liquibase.xml','2023-10-25 10:22:05',10820,'MARK_RAN','8:be3ede082581230c50956f395bbeb371','createIndex indexName=concept_reference_map_uuid, tableName=concept_reference_map','Add concept_reference_map_uuid index',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-6','rkorytkowski','liquibase.xml','2023-10-25 10:22:05',10821,'EXECUTED','8:56556175d9d83a69d7d5b5b2d2e7b46d','createIndex indexName=concept_reference_source_name, tableName=concept_reference_source','Add concept_reference_source_name index',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-7','rkorytkowski','liquibase.xml','2023-10-25 10:22:05',10822,'MARK_RAN','8:f62211c5d8fbbe7d71178a92245f32a1','createIndex indexName=concept_map_type_name, tableName=concept_map_type','Add concept_map_type_name index',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-8','rkorytkowski','liquibase.xml','2023-10-25 10:22:05',10823,'EXECUTED','8:e0527a82e885f05545a83569a5ee19ab','createIndex indexName=concept_reference_term_code, tableName=concept_reference_term','Add concept_reference_term_code index',NULL,'4.4.3',NULL,NULL,NULL),('openconceptlab-v1-9','rkorytkowski','liquibase.xml','2023-10-25 10:22:06',10824,'EXECUTED','8:70609ab372409be51de6892cda5291a8','createIndex indexName=concept_name_duplicate, tableName=concept_name','Add concept_name_duplicate index',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-1','bgeVam','liquibase.xml','2023-10-25 10:22:03',10797,'EXECUTED','8:57013f94ffa566583e651f3aee1b3e21','createTable tableName=providermanagement_provider_role','create table provider role',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-2a','pgutkowski','liquibase.xml','2023-10-25 10:22:03',10798,'EXECUTED','8:57e745a9ef1160df1cb597b91f85e87a','addColumn tableName=provider','add provider role id to table provider',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-2b','pgutkowski','liquibase.xml','2023-10-25 10:22:03',10799,'EXECUTED','8:23b5e1207a74b8177a2dfd1a6c5f5c94','addForeignKeyConstraint baseTableName=provider, constraintName=provider_ibfk_1, referencedTableName=providermanagement_provider_role','use provider role id from table provider as foreign key',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-3','bgeVam','liquibase.xml','2023-10-25 10:22:03',10800,'EXECUTED','8:8a7deb8da044b7d7665b8a5a602783c3','createTable tableName=providermanagement_provider_role_relationship_type; addForeignKeyConstraint baseTableName=providermanagement_provider_role_relationship_type, constraintName=providermanagement_provider_role_relationship_type_ibfk_1, reference...','create table providermanagement_provider_role_relationship_type',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-4','bgeVam','liquibase.xml','2023-10-25 10:22:03',10801,'EXECUTED','8:27efc3e37503c4a8119186a5b15c59e7','createTable tableName=providermanagement_provider_role_supervisee_provider_role; addForeignKeyConstraint baseTableName=providermanagement_provider_role_supervisee_provider_role, constraintName=providermanagement_prspr_provider_role_fk, referencedT...','create table providermanagement_provider_role_supervisee_provider_role',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-5','bgeVam','liquibase.xml','2023-10-25 10:22:04',10802,'EXECUTED','8:161f1172a7ac0f635ab7450a5e72934c','createTable tableName=providermanagement_provider_role_provider_attribute_type; addForeignKeyConstraint baseTableName=providermanagement_provider_role_provider_attribute_type, constraintName=providermanagement_prpat_provider_role_fk, referencedTab...','create table providermanagement_provider_role_provider_attribute_type',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-6','bgeVam','liquibase.xml','2023-10-25 10:22:04',10803,'EXECUTED','8:307068dfacead5d2de71418ceb54c498','createTable tableName=providermanagement_provider_suggestion; addForeignKeyConstraint baseTableName=providermanagement_provider_suggestion, constraintName=providermanagement_provider_suggestion_ibfk_1, referencedTableName=relationship_type','create table providermanagement_provider_suggestion',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-7','bgeVam','liquibase.xml','2023-10-25 10:22:04',10804,'EXECUTED','8:db56bd1b70bfa1fd71f1b4c8dcdfe9a3','createTable tableName=providermanagement_supervision_suggestion; addForeignKeyConstraint baseTableName=providermanagement_supervision_suggestion, constraintName=providermanagement_supervision_suggestion_ibfk_1, referencedTableName=providermanageme...','create table providermanagement_supervision_suggestion',NULL,'4.4.3',NULL,NULL,NULL),('providermanagement-8','bgeVam','liquibase.xml','2023-10-25 10:22:04',10805,'EXECUTED','8:023f27b0a5c5993cca87d2bc131c0a8b','insert tableName=relationship_type','insert in relationship_type',NULL,'4.4.3',NULL,NULL,NULL),('RA-354-create-allergy-table-rev1','fbiedrzycki','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10644,'EXECUTED','8:c3bbe348bf50ae51795514ba336ae6a0','createTable tableName=allergy; addForeignKeyConstraint baseTableName=allergy, constraintName=allergy_patient_id_fk, referencedTableName=patient; addForeignKeyConstraint baseTableName=allergy, constraintName=allergy_coded_allergen_fk, referencedTab...','Create allergy table',NULL,'4.4.3',NULL,NULL,NULL),('RA-355-create-allergy-reaction-table','fbiedrzycki','liquibase-update-to-latest.xml','2023-10-25 10:21:16',10645,'EXECUTED','8:e660411099e3c253756902442c7f0589','createTable tableName=allergy_reaction; addForeignKeyConstraint baseTableName=allergy_reaction, constraintName=allergy_reaction_allergy_id_fk, referencedTableName=allergy; addForeignKeyConstraint baseTableName=allergy_reaction, constraintName=alle...','Create allergy_reaction table',NULL,'4.4.3',NULL,NULL,NULL),('RA-360-Add-allergy-status-to-patient-2','rpuzdrowski','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10646,'EXECUTED','8:24ff421cbe357d83006cdc236785deae','addColumn tableName=patient','Add allergy_status field to the patient table',NULL,'4.4.3',NULL,NULL,NULL),('reporting_id_set_cleanup','mseaton','liquibase.xml','2023-10-25 10:22:11',10881,'MARK_RAN','8:9cd97bed4783a168273e1bfeafb97b86','dropTable tableName=reporting_idset','Removing reporting_idset table that is no longer used',NULL,'4.4.3',NULL,NULL,NULL),('reporting_migration_1','mseaton','liquibase.xml','2023-10-25 10:22:11',10879,'EXECUTED','8:631a987732036d592c48c118f8de368d','sql; sql','Remove OpenMRS scheduled tasks produced by the reporting module',NULL,'4.4.3',NULL,NULL,NULL),('reporting_migration_2','mseaton','liquibase.xml','2023-10-25 10:22:11',10880,'EXECUTED','8:d48283f2baf85e8370b670e2d7307f14','sql','Rename the default web renderer',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_1','mseaton','liquibase.xml','2023-10-25 10:22:10',10864,'EXECUTED','8:fb867a325b165f44658ad2124ec0a307','createTable tableName=reporting_report_design; addForeignKeyConstraint baseTableName=reporting_report_design, constraintName=report_definition_id_for_reporting_report_design, referencedTableName=serialized_object; addForeignKeyConstraint baseTable...','Create table to persist report design specifications',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_2','mseaton','liquibase.xml','2023-10-25 10:22:10',10865,'EXECUTED','8:53ee2581fae69de6011402f9ccf56cdd','addColumn tableName=reporting_report_design; sql','',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_3','mseaton','liquibase.xml','2023-10-25 10:22:10',10866,'EXECUTED','8:376812e41a0a69544e5d3a03f3a99c7f','sql','',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_4','mseaton','liquibase.xml','2023-10-25 10:22:10',10867,'EXECUTED','8:6dcc76696a102db9641cf24cf0f27a86','dropForeignKeyConstraint baseTableName=reporting_report_design, constraintName=report_definition_id_for_reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_5','mseaton','liquibase.xml','2023-10-25 10:22:10',10868,'EXECUTED','8:124a0287bbfff94cf290ad5307eebbe9','createIndex indexName=report_definition_uuid_for_reporting_report_design, tableName=reporting_report_design','',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_6','mseaton','liquibase.xml','2023-10-25 10:22:11',10869,'EXECUTED','8:0f11f76a96b156948c5268921f2abe75','dropColumn columnName=report_definition_id, tableName=reporting_report_design','Step 4 in changing reporting_report_design to reference report definition\n			by uuid rather than id, in order to not tie it directly to the serialized object table\n			Drop report_definition_id column',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_design_resource_1','mseaton','liquibase.xml','2023-10-25 10:22:11',10870,'EXECUTED','8:0fb92315359c950677e1e82e9aa902d5','createTable tableName=reporting_report_design_resource; addForeignKeyConstraint baseTableName=reporting_report_design_resource, constraintName=report_design_id_for_reporting_report_design_resource, referencedTableName=reporting_report_design; addF...','Create table to persist report design resources',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_processor_1','mseaton','liquibase.xml','2023-10-25 10:22:11',10875,'EXECUTED','8:36be55b07480c352f37f3636861ec170','createTable tableName=reporting_report_processor; addForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=creator_for_reporting_report_processor, referencedTableName=users; addForeignKeyConstraint baseTableName=reporting_r...','Create tables to persist report processors',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_processor_2','mseaton','liquibase.xml','2023-10-25 10:22:11',10876,'MARK_RAN','8:5ed324f807d43990531686a9616987fe','dropTable tableName=reporting_report_request_processor','Drop the reporting_report_request_processor table (creation of this table was done\n			in the old sqldiff and not ported over to liquibase, as it is not needed.  this\n			changeset serves only to clean it up and delete it if is still exists',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_processor_3','mseaton','liquibase.xml','2023-10-25 10:22:11',10877,'EXECUTED','8:f0a48de833b4465de960aea9e8ce587c','addColumn tableName=reporting_report_processor; addForeignKeyConstraint baseTableName=reporting_report_processor, constraintName=reporting_report_processor_report_design, referencedTableName=reporting_report_design','Update reporting_report_processor table to have report_design_id column',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_processor_4','mseaton','liquibase.xml','2023-10-25 10:22:11',10878,'EXECUTED','8:15bca6b2063797e75ce3ce21be6e451a','addColumn tableName=reporting_report_processor; sql','Update reporting_report_processor table to have processor_mode column\n			and set the value to automatic for all processors that were previously created',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_request_1','mseaton','liquibase.xml','2023-10-25 10:22:11',10871,'EXECUTED','8:927f4423e0f7c12b361f1811b7a8f428','createTable tableName=reporting_report_request; addForeignKeyConstraint baseTableName=reporting_report_request, constraintName=requested_by_for_reporting_report_request, referencedTableName=users','Create tables to persist a report request and save reports',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_request_2','mseaton','liquibase.xml','2023-10-25 10:22:11',10872,'EXECUTED','8:60c18cb37e75f76df6cfee2920258f4c','addColumn tableName=reporting_report_request','Add a schedule property to ReportRequest',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_request_3','mseaton','liquibase.xml','2023-10-25 10:22:11',10873,'EXECUTED','8:2a1cc858e6743038cbf196312f592e59','addColumn tableName=reporting_report_request','Add processAutomatically boolean to ReportRequest',NULL,'4.4.3',NULL,NULL,NULL),('reporting_report_request_4','mseaton','liquibase.xml','2023-10-25 10:22:11',10874,'EXECUTED','8:521ded29a7578ed526976c3b1589d68b','addColumn tableName=reporting_report_request','Add minimum_days_to_preserve property to ReportRequest',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1700','Wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10666,'MARK_RAN','8:46e6a005763154c52b42815a8be21919','insert tableName=privilege','Add \"Get Visits\" privilege',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1701','Wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10667,'MARK_RAN','8:fb13a3b10d6183ecdf6a6031330e1553','insert tableName=privilege','Add \"Get Providers\" privilege',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1702','Wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10668,'MARK_RAN','8:d94bb114f6cb1a6cd93d596509e23ddf','insert tableName=privilege','Add \"Add Visits\" privilege',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1703','PralayRamteke','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10669,'MARK_RAN','8:ed13450b7bf16eb62dad1717e9226634','sql','Add \"Get Visits\" privilege to the roles having \"Get Encounter\"',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1704','PralayRamteke','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10670,'MARK_RAN','8:944a87096eeefe837d2756ca5521054a','sql','Add \"Get Providers\" privilege to the roles having \"Get Encounter\"',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1705','Wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10671,'MARK_RAN','8:1f26253e28e048edc6050ff1153c79b4','sql','Add \"Add Visits\" privilege to the roles having \"Add Encounters\"',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-3422-20160216-1706','Wyclif','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10672,'MARK_RAN','8:d0529400c5e3c985f25f404619b695bc','sql','Add \"Add Visits\" privilege to the roles having \"Edit Encounters\"',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4505-20180804','fruether','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10731,'EXECUTED','8:07c7f60638902f4d8d8c49c970512d80','addColumn tableName=person','Adding cause_of_death_non_coded to the table person',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4548-MigrateAllergiesChangeSet1','dkayiwa','liquibase-update-to-latest.xml','2023-10-25 10:21:17',10647,'MARK_RAN','8:2c8deede314598dfd0f83338b03a2102','customChange','Custom changeset to migrate allergies from old to new tables',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1000','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:22',10703,'EXECUTED','8:0dc0121eeda9c2f3f251dbceea361ffc','addColumn tableName=concept_class','Adding \"date_changed\" column to concept_class table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1001','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10704,'EXECUTED','8:eca6440f4ea914d1c31337deff78411f','addColumn tableName=concept_class; addForeignKeyConstraint baseTableName=concept_class, constraintName=concept_class_changed_by, referencedTableName=users','Adding \"changed_by\" column to concept_class table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1002','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10705,'EXECUTED','8:3a584b6fd05e960a6437771d325fe5c7','addColumn tableName=concept_reference_source','Adding \"date_changed\" column to concept_reference_source table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1003','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10706,'EXECUTED','8:96bdffec834950246574c2c97d3f2faf','addColumn tableName=concept_reference_source; addForeignKeyConstraint baseTableName=concept_reference_source, constraintName=concept_reference_source_changed_by, referencedTableName=users','Adding \"changed_by\" column to concept_reference_source table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1004','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10707,'EXECUTED','8:7024c608b8df8c3417272527a783b601','addColumn tableName=concept_name','Adding \"date_changed\" column to concept_name table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1005','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10708,'EXECUTED','8:3122f9c1679cc8a1a2948a42d88abf81','addColumn tableName=concept_name; addForeignKeyConstraint baseTableName=concept_name, constraintName=concept_name_changed_by, referencedTableName=users','Adding \"changed_by\" column to concept_name table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1006','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10709,'EXECUTED','8:f8b1698369e70c263c7d256232fa9853','addColumn tableName=concept_name_tag','Adding \"date_changed\" column to concept_name_tag table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1007','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10710,'EXECUTED','8:557c94271264ae94470f10a79887ba7a','addColumn tableName=concept_name_tag; addForeignKeyConstraint baseTableName=concept_name_tag, constraintName=concept_name_tag_changed_by, referencedTableName=users','Adding \"changed_by\" column to concept_name_tag table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1008','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10711,'EXECUTED','8:a7181bbfa73fc7837958e522fb88d913','addColumn tableName=form_resource','Adding \"date_changed\" column to form_resource table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1009','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10712,'EXECUTED','8:363a7f4db98813fd511c551d327555a4','addColumn tableName=form_resource; addForeignKeyConstraint baseTableName=form_resource, constraintName=form_resource_changed_by, referencedTableName=users','Adding \"changed_by\" column to form_resource table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1010','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10713,'EXECUTED','8:f90dd5ade7da1bf408a0d06c4129d78f','addColumn tableName=global_property','Adding \"date_changed\" column to global_property table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1011','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10714,'EXECUTED','8:7f9643696d99fe37e4155df39ef0c12d','addColumn tableName=global_property; addForeignKeyConstraint baseTableName=global_property, constraintName=global_property_changed_by, referencedTableName=users','Adding \"changed_by\" column to global_property table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1012','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10715,'EXECUTED','8:34bb5636497c57f69cf59c27912115fc','addColumn tableName=patient_identifier_type','Adding \"date_changed\" column to patient_identifier_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1013','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10716,'EXECUTED','8:d5d773f7421b9d52597fe84d872d3d90','addColumn tableName=patient_identifier_type; addForeignKeyConstraint baseTableName=patient_identifier_type, constraintName=patient_identifier_type_changed_by, referencedTableName=users','Adding \"changed_by\" column to patient_identifier_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1014','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:23',10717,'EXECUTED','8:74c92214e8d24e34eead91a6465bdece','addColumn tableName=relationship_type','Adding \"date_changed\" column to relationship_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4730-20161114-1015','manuelagrindei','liquibase-update-to-latest.xml','2023-10-25 10:21:24',10718,'EXECUTED','8:d4bb129db6652e093ce4f4f85a404926','addColumn tableName=relationship_type; addForeignKeyConstraint baseTableName=relationship_type, constraintName=relationship_type_changed_by, referencedTableName=users','Adding \"changed_by\" column to relationship_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4755','Rahul,Swathi','liquibase-update-to-latest.xml','2023-10-25 10:21:24',10722,'EXECUTED','8:7323cb6bea011952036ba65c8ee6af56','createTable tableName=program_attribute_type; addForeignKeyConstraint baseTableName=program_attribute_type, constraintName=program_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=program_attribute_type, ...','Creating program_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4791-20180215','patrick','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10729,'EXECUTED','8:c2355838b0dab9af7eba58f6777cb9a5','addColumn tableName=provider; addForeignKeyConstraint baseTableName=provider, constraintName=provider_role_id_fk, referencedTableName=concept','Adding role_id column to provider table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4791-20180216','patrick','liquibase-update-to-latest.xml','2023-10-25 10:21:25',10730,'EXECUTED','8:38f4f039ed68dca355240837cd365768','addColumn tableName=provider; addForeignKeyConstraint baseTableName=provider, constraintName=provider_speciality_id_fk, referencedTableName=concept','Adding speciality_id column to provider table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4936-20160930-1000','teleivo','liquibase-update-to-latest.xml','2023-10-25 10:21:21',10675,'EXECUTED','8:ae7e0e8e7e90d5c1bbed4bd6c8eb9504','addColumn tableName=concept_reference_source; addUniqueConstraint constraintName=concept_reference_source_unique_id_unique, tableName=concept_reference_source','Add unique_id column to concept_reference_source',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4976-20170403-1','darius','liquibase-update-to-latest.xml','2023-10-25 10:21:24',10719,'EXECUTED','8:498a038469d6fe8e15046517a5d6724d','addColumn tableName=obs','Adding \"status\" column to obs table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-4976-20170403-2','darius','liquibase-update-to-latest.xml','2023-10-25 10:21:24',10720,'EXECUTED','8:d765d031f1ddb8e475bcd1ea370823dd','addColumn tableName=obs','Adding \"interpretation\" column to obs table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5140-20170404-1000','Shruthi,Salauddin','liquibase-update-to-latest.xml','2023-10-25 10:21:24',10721,'EXECUTED','8:0e83bac43d511d8e8c1738f886c1b69d','modifyDataType columnName=value_complex, tableName=obs','Modify column length to 1000 from 255',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5334-rename-allergy-comment-to-comments','madhavkauntia','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10736,'EXECUTED','8:f50bf8c0e8303f0d084de461e464e742','renameColumn newColumnName=comments, oldColumnName=comment, tableName=allergy','Renaming allerygy.comment to allergy.comments',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5400-20180731-1','fruether','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10732,'EXECUTED','8:0cc9bac4ead83049dc518d2f1d31411c','addColumn tableName=orders','Adding fulfill_status and  fulfiller_comment column to provider table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5400-201807311-2','fruether','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10733,'EXECUTED','8:8d3de8285a02614ab2706c1ffd5f6303','addColumn tableName=orders','Adding fulfill_status and  fulfiller_comment column to provider table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5410','tendomart','liquibase-update-to-latest.xml','2023-10-25 10:21:28',10751,'EXECUTED','8:7a314d2f15c425b8fc40545505441ce3','createTable tableName=order_group_attribute_type; addForeignKeyConstraint baseTableName=order_group_attribute_type, constraintName=order_group_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=order_group_...','Creating order_group_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5413','odorajonathan','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10737,'EXECUTED','8:adfdcedd3b6451067f29f86e734076c1','addColumn tableName=order_set; addForeignKeyConstraint baseTableName=order_set, constraintName=category_order_set_fk, referencedTableName=concept','Add a category field to the order_set table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5663-20191002','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10739,'EXECUTED','8:ee20300a74e8d4c069824f7c3328a294','addColumn tableName=conditions','Adding \"date_changed\" column to conditions table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5672-201910211105','Mritunjay','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10740,'MARK_RAN','8:b1be0d7a6267503335e635e79132b5b7','update tableName=users','Populate username for admin user',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5728-2020-04-15','samuel34','liquibase-update-to-latest.xml','2023-10-25 10:21:26',10741,'EXECUTED','8:2a90bedc8b02e4c89e1a37dc1110014b','addColumn tableName=conditions; addForeignKeyConstraint baseTableName=conditions, constraintName=conditions_encounter_id_fk, referencedTableName=encounter','Adding \'encounter_id\' column to \'conditions\' table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5728-2020-05-20','samuel34','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10746,'MARK_RAN','8:2a90bedc8b02e4c89e1a37dc1110014b','addColumn tableName=conditions; addForeignKeyConstraint baseTableName=conditions, constraintName=conditions_encounter_id_fk, referencedTableName=encounter','Adding \'encounter_id\' column to \'conditions\' table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5835-2020-07-09-1600','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10749,'EXECUTED','8:b744e5bfec82a26f3ed1e8a71fc8d5e5','createTable tableName=order_set_attribute_type; addForeignKeyConstraint baseTableName=order_set_attribute_type, constraintName=order_set_attribute_type_creator_fk, referencedTableName=users; addForeignKeyConstraint baseTableName=order_set_attribut...','Creating order_set_attribute_type table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-5835-2020-07-09-1700','gitacliff','liquibase-update-to-latest.xml','2023-10-25 10:21:27',10750,'EXECUTED','8:8877d8978506c3107937fb42e6c6634b','createTable tableName=order_set_attribute; addForeignKeyConstraint baseTableName=order_set_attribute, constraintName=order_set_attribute_order_set_fk, referencedTableName=order_set; addForeignKeyConstraint baseTableName=order_set_attribute, constr...','Creating order_set_attribute table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-6001','rasztabigab','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:28',10755,'EXECUTED','8:00bd333022b8d08c676749c2e68f3190','dropNotNullConstraint columnName=start_date, tableName=cohort_member','Delete non-null constraint from column cohort_member.start_date',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-6035','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10767,'EXECUTED','8:a83b3c51647a7b4cd149c317b0305a1c','addColumn tableName=test_order; addForeignKeyConstraint baseTableName=test_order, constraintName=test_order_location_fk, referencedTableName=concept','Adding location column to the test_order table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-6036','dkayiwa','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:29',10766,'EXECUTED','8:a03e4dfd1b62637612a7de0eb6b8f16c','createTable tableName=referral_order; addForeignKeyConstraint baseTableName=referral_order, constraintName=referral_order_order_id_fk, referencedTableName=orders; addForeignKeyConstraint baseTableName=referral_order, constraintName=referral_order_...','Create referral_order table',NULL,'4.4.3',NULL,NULL,NULL),('TRUNK-6045','pmanko','org/openmrs/liquibase/updates/liquibase-update-to-latest-2.5.x.xml','2023-10-25 10:21:30',10768,'EXECUTED','8:8d3cf8206c717b64458982d991f40555','addColumn tableName=location; addForeignKeyConstraint baseTableName=location, constraintName=location_type_fk, referencedTableName=concept','Adding type field to the Location table',NULL,'4.4.3',NULL,NULL,NULL),('uiframework-20120913-2055','wyclif','liquibase.xml','2023-10-25 10:22:02',10796,'EXECUTED','8:710833828a3d1fe96cd3c56831d33921','createTable tableName=uiframework_user_defined_page_view','Adding uiframework_page_view table',NULL,'4.4.3',NULL,NULL,NULL),('update_content_type_database_type','alalo','liquibase.xml','2023-10-25 10:22:12',10907,'EXECUTED','8:f7a9104e7565bbea78e4d458c332e623','modifyDataType columnName=content_type, tableName=reporting_report_design_resource','Update data type of content_type column from reporting_report_design_resource table',NULL,'4.4.3',NULL,NULL,NULL),('update_fhir_diagnostic_report_table_20220511','moses_mutesa','liquibase.xml','2023-10-25 10:22:02',10794,'EXECUTED','8:c4b44d26e7d86e8c1fc7001273576c63','addColumn tableName=fhir_diagnostic_report; dropColumn columnName=name, tableName=fhir_diagnostic_report','',NULL,'4.4.3',NULL,NULL,NULL);
/*!40000 ALTER TABLE `liquibasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangeloglock`
--

DROP TABLE IF EXISTS `liquibasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangeloglock`
--

LOCK TABLES `liquibasechangeloglock` WRITE;
/*!40000 ALTER TABLE `liquibasechangeloglock` DISABLE KEYS */;
INSERT INTO `liquibasechangeloglock` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `liquibasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `address7` varchar(255) DEFAULT NULL,
  `address8` varchar(255) DEFAULT NULL,
  `address9` varchar(255) DEFAULT NULL,
  `address10` varchar(255) DEFAULT NULL,
  `address11` varchar(255) DEFAULT NULL,
  `address12` varchar(255) DEFAULT NULL,
  `address13` varchar(255) DEFAULT NULL,
  `address14` varchar(255) DEFAULT NULL,
  `address15` varchar(255) DEFAULT NULL,
  `location_type_concept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_uuid_index` (`uuid`),
  KEY `name_of_location` (`name`),
  KEY `location_retired_status` (`retired`),
  KEY `user_who_created_location` (`creator`),
  KEY `user_who_retired_location` (`retired_by`),
  KEY `parent_location` (`parent_location`),
  KEY `location_changed_by` (`changed_by`),
  KEY `location_type_fk` (`location_type_concept_id`),
  CONSTRAINT `location_type_fk` FOREIGN KEY (`location_type_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `location_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `parent_location` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `user_who_created_location` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_location` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Unknown Location',NULL,'','','','','','',NULL,NULL,1,'2005-09-22 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'8d6c993e-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_location_fk` (`location_id`),
  KEY `location_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `location_attribute_creator_fk` (`creator`),
  KEY `location_attribute_changed_by_fk` (`changed_by`),
  KEY `location_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`),
  CONSTRAINT `location_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute`
--

LOCK TABLES `location_attribute` WRITE;
/*!40000 ALTER TABLE `location_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `location_attribute_type_unique_name` (`name`),
  KEY `location_attribute_type_creator_fk` (`creator`),
  KEY `location_attribute_type_changed_by_fk` (`changed_by`),
  KEY `location_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `location_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute_type`
--

LOCK TABLES `location_attribute_type` WRITE;
/*!40000 ALTER TABLE `location_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag`
--

DROP TABLE IF EXISTS `location_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag` (
  `location_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE KEY `location_tag_uuid_index` (`uuid`),
  KEY `location_tag_creator` (`creator`),
  KEY `location_tag_retired_by` (`retired_by`),
  KEY `location_tag_changed_by` (`changed_by`),
  CONSTRAINT `location_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag`
--

LOCK TABLES `location_tag` WRITE;
/*!40000 ALTER TABLE `location_tag` DISABLE KEYS */;
INSERT INTO `location_tag` VALUES (1,'Login Location','When a user logs in and chooses a session location, they may only choose one with this tag',2,'2023-10-25 10:23:28',0,NULL,NULL,NULL,'b8bbf83e-645f-451f-8efe-a0db56f09676',NULL,NULL);
/*!40000 ALTER TABLE `location_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag_map`
--

DROP TABLE IF EXISTS `location_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag_map` (
  `location_id` int(11) NOT NULL,
  `location_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`location_tag_id`),
  KEY `location_tag_map_tag` (`location_tag_id`),
  CONSTRAINT `location_tag_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_tag_map_tag` FOREIGN KEY (`location_tag_id`) REFERENCES `location_tag` (`location_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag_map`
--

LOCK TABLES `location_tag_map` WRITE;
/*!40000 ALTER TABLE `location_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_definition`
--

DROP TABLE IF EXISTS `logic_rule_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `rule_content` varchar(2048) NOT NULL,
  `language` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` smallint(6) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `creator_idx` (`creator`),
  KEY `changed_by_idx` (`changed_by`),
  KEY `retired_by_idx` (`retired_by`),
  CONSTRAINT `changed_by_for_rule_definition` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_rule_definition` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by_for_rule_definition` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_definition`
--

LOCK TABLES `logic_rule_definition` WRITE;
/*!40000 ALTER TABLE `logic_rule_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_token`
--

DROP TABLE IF EXISTS `logic_rule_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_token` (
  `logic_rule_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `token` varchar(512) NOT NULL,
  `class_name` varchar(512) NOT NULL,
  `state` varchar(512) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`logic_rule_token_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `token_creator` (`creator`),
  KEY `token_changed_by` (`changed_by`),
  CONSTRAINT `token_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `person` (`person_id`),
  CONSTRAINT `token_creator` FOREIGN KEY (`creator`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_token`
--

LOCK TABLES `logic_rule_token` WRITE;
/*!40000 ALTER TABLE `logic_rule_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_token_tag`
--

DROP TABLE IF EXISTS `logic_rule_token_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_token_tag` (
  `logic_rule_token_id` int(11) NOT NULL,
  `tag` varchar(512) NOT NULL,
  KEY `token_tag` (`logic_rule_token_id`),
  CONSTRAINT `token_tag` FOREIGN KEY (`logic_rule_token_id`) REFERENCES `logic_rule_token` (`logic_rule_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_token_tag`
--

LOCK TABLES `logic_rule_token_tag` WRITE;
/*!40000 ALTER TABLE `logic_rule_token_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_token_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_token_registration`
--

DROP TABLE IF EXISTS `logic_token_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_token_registration` (
  `token_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `token` varchar(512) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `provider_token` varchar(512) NOT NULL,
  `configuration` varchar(2000) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`token_registration_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `token_registration_creator` (`creator`),
  KEY `token_registration_changed_by` (`changed_by`),
  CONSTRAINT `token_registration_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `token_registration_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_token_registration`
--

LOCK TABLES `logic_token_registration` WRITE;
/*!40000 ALTER TABLE `logic_token_registration` DISABLE KEYS */;
INSERT INTO `logic_token_registration` VALUES (1,2,'2016-07-07 08:15:10',NULL,NULL,'encounterLocation','org.openmrs.logic.datasource.EncounterDataSource','encounterLocation','encounterLocation','b06d3ddb-170e-4e17-a04a-d8d1cd349a4d'),(2,2,'2016-07-07 08:15:10',NULL,NULL,'encounterProvider','org.openmrs.logic.datasource.EncounterDataSource','encounterProvider','encounterProvider','2fff4388-7ca7-4686-ac66-f38090048ff9'),(3,2,'2016-07-07 08:15:10',NULL,NULL,'encounter','org.openmrs.logic.datasource.EncounterDataSource','encounter','encounter','efee7046-c86f-4aba-b6f6-e544f9077e02'),(4,2,'2016-07-07 08:15:10',NULL,NULL,'identifier','org.openmrs.logic.datasource.PatientDataSource','identifier','identifier','815c7955-dd76-4226-ac32-b08496b373c6'),(5,2,'2016-07-07 08:15:10',NULL,NULL,'family name','org.openmrs.logic.datasource.PersonDataSource','family name','family name','50606952-2e58-4b62-8650-9a58192fb0b8'),(6,2,'2016-07-07 08:15:10',NULL,NULL,'middle name','org.openmrs.logic.datasource.PersonDataSource','middle name','middle name','ecfe6086-d4a3-4236-bdf9-261d4ea39dab'),(7,2,'2016-07-07 08:15:10',NULL,NULL,'death date','org.openmrs.logic.datasource.PersonDataSource','death date','death date','bb3b8e24-ad31-4737-a90d-1b6e10ce0e74'),(8,2,'2016-07-07 08:15:10',NULL,NULL,'birthdate','org.openmrs.logic.datasource.PersonDataSource','birthdate','birthdate','f8b85cf7-2260-4902-a8fa-6d0c77189661'),(9,2,'2016-07-07 08:15:10',NULL,NULL,'cause of death','org.openmrs.logic.datasource.PersonDataSource','cause of death','cause of death','cc36441e-2b2f-4450-8fac-f0f85e73ef3f'),(10,2,'2016-07-07 08:15:10',NULL,NULL,'birthdate estimated','org.openmrs.logic.datasource.PersonDataSource','birthdate estimated','birthdate estimated','d0c05d58-c54d-40f7-bd0d-d21cabb81c4f'),(11,2,'2016-07-07 08:15:10',NULL,NULL,'gender','org.openmrs.logic.datasource.PersonDataSource','gender','gender','d7da980c-4f63-4ca5-b0f5-ed5e40f44ba1'),(12,2,'2016-07-07 08:15:10',NULL,NULL,'family name2','org.openmrs.logic.datasource.PersonDataSource','family name2','family name2','f1889d0e-c043-40cd-b30d-45546c9d8220'),(13,2,'2016-07-07 08:15:10',NULL,NULL,'dead','org.openmrs.logic.datasource.PersonDataSource','dead','dead','4c098e08-e1fd-417f-b3ea-e9b5e500cb95'),(14,2,'2016-07-07 08:15:10',NULL,NULL,'given name','org.openmrs.logic.datasource.PersonDataSource','given name','given name','29555b7d-c71e-4e14-8773-75b0dbbb2da0'),(15,2,'2016-07-07 08:15:10',NULL,NULL,'CURRENT STATE','org.openmrs.logic.datasource.ProgramDataSource','CURRENT STATE','CURRENT STATE','167efad0-8f0a-44f9-9f33-24663eaa22e9'),(16,2,'2016-07-07 08:15:10',NULL,NULL,'PROGRAM ENROLLMENT','org.openmrs.logic.datasource.ProgramDataSource','PROGRAM ENROLLMENT','PROGRAM ENROLLMENT','8c77f6a6-d183-47af-ab5d-b97aea4d9ca7'),(17,2,'2016-07-07 08:15:10',NULL,NULL,'PROGRAM COMPLETION','org.openmrs.logic.datasource.ProgramDataSource','PROGRAM COMPLETION','PROGRAM COMPLETION','fe9e859f-e86f-4bde-a2b1-66f2da8ec842');
/*!40000 ALTER TABLE `logic_token_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_token_registration_tag`
--

DROP TABLE IF EXISTS `logic_token_registration_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_token_registration_tag` (
  `token_registration_id` int(11) NOT NULL,
  `tag` varchar(512) NOT NULL,
  KEY `token_registration_tag` (`token_registration_id`),
  CONSTRAINT `token_registration_tag` FOREIGN KEY (`token_registration_id`) REFERENCES `logic_token_registration` (`token_registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_token_registration_tag`
--

LOCK TABLES `logic_token_registration_tag` WRITE;
/*!40000 ALTER TABLE `logic_token_registration_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_token_registration_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatamapping_metadata_set`
--

DROP TABLE IF EXISTS `metadatamapping_metadata_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatamapping_metadata_set` (
  `metadata_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`metadata_set_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `metadatamapping_metadata_set_creator` (`creator`),
  KEY `metadatamapping_metadata_set_changed_by` (`changed_by`),
  KEY `metadatamapping_metadata_set_retired_by` (`retired_by`),
  CONSTRAINT `metadatamapping_metadata_set_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_set_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_set_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatamapping_metadata_set`
--

LOCK TABLES `metadatamapping_metadata_set` WRITE;
/*!40000 ALTER TABLE `metadatamapping_metadata_set` DISABLE KEYS */;
INSERT INTO `metadatamapping_metadata_set` VALUES (1,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'e4aab2eb-5d19-496f-858b-c1269d92c549');
/*!40000 ALTER TABLE `metadatamapping_metadata_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatamapping_metadata_set_member`
--

DROP TABLE IF EXISTS `metadatamapping_metadata_set_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatamapping_metadata_set_member` (
  `metadata_set_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_set_id` int(11) NOT NULL,
  `metadata_class` varchar(1024) NOT NULL,
  `metadata_uuid` varchar(38) NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`metadata_set_member_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `metadatamapping_metadata_set_member_term_unique_within_set` (`metadata_set_id`,`metadata_uuid`),
  KEY `metadatamapping_metadata_set_member_creator` (`creator`),
  KEY `metadatamapping_metadata_set_member_changed_by` (`changed_by`),
  KEY `metadatamapping_metadata_set_member_retired_by` (`retired_by`),
  CONSTRAINT `metadatamapping_metadata_set_member_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_set_member_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_set_member_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_set_member_metadata_set_id` FOREIGN KEY (`metadata_set_id`) REFERENCES `metadatamapping_metadata_set` (`metadata_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatamapping_metadata_set_member`
--

LOCK TABLES `metadatamapping_metadata_set_member` WRITE;
/*!40000 ALTER TABLE `metadatamapping_metadata_set_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatamapping_metadata_set_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatamapping_metadata_source`
--

DROP TABLE IF EXISTS `metadatamapping_metadata_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatamapping_metadata_source` (
  `metadata_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`metadata_source_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `metadatamapping_metadata_source_name_unique` (`name`),
  KEY `metadatamapping_metadata_source_creator` (`creator`),
  KEY `metadatamapping_metadata_source_changed_by` (`changed_by`),
  KEY `metadatamapping_metadata_source_retired_by` (`retired_by`),
  CONSTRAINT `metadatamapping_metadata_source_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_source_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatamapping_metadata_source`
--

LOCK TABLES `metadatamapping_metadata_source` WRITE;
/*!40000 ALTER TABLE `metadatamapping_metadata_source` DISABLE KEYS */;
INSERT INTO `metadatamapping_metadata_source` VALUES (1,'org.openmrs.module.emrapi','Source used to tag metadata used in the EMR API module',2,NULL,'2023-10-25 10:23:27',NULL,0,NULL,NULL,NULL,'d0b3d9ec-f443-46b7-a261-9b356e1ccb40');
/*!40000 ALTER TABLE `metadatamapping_metadata_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatamapping_metadata_term_mapping`
--

DROP TABLE IF EXISTS `metadatamapping_metadata_term_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatamapping_metadata_term_mapping` (
  `metadata_term_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata_source_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `metadata_class` varchar(1024) DEFAULT NULL,
  `metadata_uuid` varchar(38) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`metadata_term_mapping_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `metadatamapping_metadata_term_code_unique_within_source` (`metadata_source_id`,`code`),
  KEY `metadatamapping_metadata_term_mapping_creator` (`creator`),
  KEY `metadatamapping_metadata_term_mapping_changed_by` (`changed_by`),
  KEY `metadatamapping_metadata_term_mapping_retired_by` (`retired_by`),
  KEY `metadatamapping_idx_mdtm_retired` (`retired`),
  KEY `metadatamapping_idx_mdtm_mdclass` (`metadata_class`(255)),
  KEY `metadatamapping_idx_mdtm_mdsource` (`metadata_source_id`),
  KEY `metadatamapping_idx_mdtm_code` (`code`),
  CONSTRAINT `metadatamapping_metadata_term_mapping_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_term_mapping_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `metadatamapping_metadata_term_mapping_metadata_source_id` FOREIGN KEY (`metadata_source_id`) REFERENCES `metadatamapping_metadata_source` (`metadata_source_id`),
  CONSTRAINT `metadatamapping_metadata_term_mapping_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatamapping_metadata_term_mapping`
--

LOCK TABLES `metadatamapping_metadata_term_mapping` WRITE;
/*!40000 ALTER TABLE `metadatamapping_metadata_term_mapping` DISABLE KEYS */;
INSERT INTO `metadatamapping_metadata_term_mapping` VALUES (1,1,'emr.extraPatientIdentifierTypes','org.openmrs.module.metadatamapping.MetadataSet','e4aab2eb-5d19-496f-858b-c1269d92c549','emr.extraPatientIdentifierTypes',NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'182d94bc-081b-4b04-a496-5976aac969b1'),(2,1,'emr.unknownLocation','org.openmrs.Location',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'849f6ce5-59e4-416e-9fff-43b17b640b43'),(3,1,'emr.primaryIdentifierType','org.openmrs.PatientIdentifierType','05a29f94-c0ed-11e2-94be-8c13b969e334',NULL,NULL,2,'2023-10-25 10:23:27',2,'2023-10-25 10:23:28',0,NULL,NULL,NULL,'b60e6776-f27b-4177-9fe3-844c41a43544'),(4,1,'emr.atFacilityVisitType','org.openmrs.VisitType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'4eb95cb6-5bb0-4654-9451-47a452badb2b'),(5,1,'emr.orderingProviderEncounterRole','org.openmrs.EncounterRole',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'366bf152-0442-4a4a-bcad-051ca2b4ce0b'),(6,1,'emr.checkInClerkEncounterRole','org.openmrs.EncounterRole',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'413c5745-63d2-453e-b5d1-1b8faad20118'),(7,1,'emr.clinicianEncounterRole','org.openmrs.EncounterRole',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'f4481602-1d5e-4e0d-bee5-e8bb1f117200'),(8,1,'emr.checkInEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'7b11e8a1-c92c-48cc-b8d4-1360f5de7104'),(9,1,'emr.consultEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'6c441b00-84c5-4470-93c9-4a4a8d170bfa'),(10,1,'emr.visitNoteEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'5cc22434-1973-4c05-ade6-9ec4982ee041'),(11,1,'emr.admissionEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'06299ddf-0ef9-4c46-9026-a001295ca233'),(12,1,'emr.exitFromInpatientEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'1131bbed-3142-4214-8ac4-0e222aecb3d6'),(13,1,'emr.transferWithinHospitalEncounterType','org.openmrs.EncounterType',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'4bf52cf8-1854-483b-9e88-e8097393af6a'),(14,1,'emr.admissionForm','org.openmrs.Form',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'b18adb4f-6fc3-4012-aaab-1f0d993155b2'),(15,1,'emr.exitFromInpatientForm','org.openmrs.Form',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'0b7bc8cb-629d-40f4-b8f0-a1bb1f63db92'),(16,1,'emr.transferWithinHospitalForm','org.openmrs.Form',NULL,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'c4257a89-e712-44cd-ad34-1190f0d07e09'),(17,1,'emr.unknownProvider','org.openmrs.Provider','f9badd80-ab76-11e2-9e96-0800200c9a66',NULL,NULL,2,'2023-10-25 10:23:28',NULL,NULL,0,NULL,NULL,NULL,'6e23614a-23e4-47dd-94a1-a0998e1a7ec8');
/*!40000 ALTER TABLE `metadatamapping_metadata_term_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_exported_package`
--

DROP TABLE IF EXISTS `metadatasharing_exported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_exported_package` (
  `exported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `version` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `content` longblob,
  PRIMARY KEY (`exported_package_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `metadatasharing_package_group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_exported_package`
--

LOCK TABLES `metadatasharing_exported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_exported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_exported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_item`
--

DROP TABLE IF EXISTS `metadatasharing_imported_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_item` (
  `imported_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `classname` varchar(256) NOT NULL,
  `existing_uuid` char(38) DEFAULT NULL,
  `date_imported` datetime DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `import_type` tinyint(4) DEFAULT '0',
  `assessed` tinyint(1) NOT NULL,
  PRIMARY KEY (`imported_item_id`),
  KEY `metadatasharing_item_uuid` (`uuid`,`existing_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_item`
--

LOCK TABLES `metadatasharing_imported_item` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_package`
--

DROP TABLE IF EXISTS `metadatasharing_imported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_package` (
  `imported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `subscription_url` varchar(512) DEFAULT NULL,
  `subscription_status` tinyint(4) DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_imported` datetime DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(256) NOT NULL,
  `import_config` varchar(1024) DEFAULT NULL,
  `remote_version` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`imported_package_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `metadatasharing_package_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_package`
--

LOCK TABLES `metadatasharing_imported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL DEFAULT '0',
  `note_type` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `note_uuid_index` (`uuid`),
  KEY `user_who_changed_note` (`changed_by`),
  KEY `user_who_created_note` (`creator`),
  KEY `encounter_note` (`encounter_id`),
  KEY `obs_note` (`obs_id`),
  KEY `note_hierarchy` (`parent`),
  KEY `patient_note` (`patient_id`),
  CONSTRAINT `encounter_note` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `note_hierarchy` FOREIGN KEY (`parent`) REFERENCES `note` (`note_id`),
  CONSTRAINT `obs_note` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `patient_note` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_note` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_note` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert`
--

DROP TABLE IF EXISTS `notification_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(512) NOT NULL,
  `satisfied_by_any` tinyint(1) NOT NULL DEFAULT '0',
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_to_expire` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `notification_alert_uuid_index` (`uuid`),
  KEY `alert_date_to_expire_idx` (`date_to_expire`),
  KEY `user_who_changed_alert` (`changed_by`),
  KEY `alert_creator` (`creator`),
  CONSTRAINT `alert_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_alert` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert`
--

LOCK TABLES `notification_alert` WRITE;
/*!40000 ALTER TABLE `notification_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert_recipient`
--

DROP TABLE IF EXISTS `notification_alert_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert_recipient` (
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`,`user_id`),
  KEY `alert_read_by_user` (`user_id`),
  CONSTRAINT `alert_read_by_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `id_of_alert` FOREIGN KEY (`alert_id`) REFERENCES `notification_alert` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert_recipient`
--

LOCK TABLES `notification_alert_recipient` WRITE;
/*!40000 ALTER TABLE `notification_alert_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `template` text,
  `subject` varchar(100) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` varchar(512) DEFAULT NULL,
  `ordinal` int(11) DEFAULT '0',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `notification_template_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template`
--

LOCK TABLES `notification_template` WRITE;
/*!40000 ALTER TABLE `notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs`
--

DROP TABLE IF EXISTS `obs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs` (
  `obs_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `obs_datetime` datetime NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `obs_group_id` int(11) DEFAULT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `value_group_id` int(11) DEFAULT NULL,
  `value_coded` int(11) DEFAULT NULL,
  `value_coded_name_id` int(11) DEFAULT NULL,
  `value_drug` int(11) DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_modifier` varchar(2) DEFAULT NULL,
  `value_text` text,
  `value_complex` varchar(1000) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `previous_version` int(11) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'FINAL',
  `interpretation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`obs_id`),
  UNIQUE KEY `obs_uuid_index` (`uuid`),
  KEY `obs_datetime_idx` (`obs_datetime`),
  KEY `obs_concept` (`concept_id`),
  KEY `obs_enterer` (`creator`),
  KEY `encounter_observations` (`encounter_id`),
  KEY `obs_location` (`location_id`),
  KEY `obs_grouping_id` (`obs_group_id`),
  KEY `obs_order` (`order_id`),
  KEY `person_obs` (`person_id`),
  KEY `answer_concept` (`value_coded`),
  KEY `obs_name_of_coded_value` (`value_coded_name_id`),
  KEY `answer_concept_drug` (`value_drug`),
  KEY `user_who_voided_obs` (`voided_by`),
  KEY `previous_version` (`previous_version`),
  CONSTRAINT `answer_concept` FOREIGN KEY (`value_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_concept_drug` FOREIGN KEY (`value_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `encounter_observations` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `obs_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `obs_enterer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_grouping_id` FOREIGN KEY (`obs_group_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value` FOREIGN KEY (`value_coded_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `person_obs` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_version` FOREIGN KEY (`previous_version`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_voided_obs` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs`
--

LOCK TABLES `obs` WRITE;
/*!40000 ALTER TABLE `obs` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openconceptlab_import`
--

DROP TABLE IF EXISTS `openconceptlab_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openconceptlab_import` (
  `import_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) DEFAULT NULL,
  `local_date_started` datetime NOT NULL,
  `local_date_stopped` datetime DEFAULT NULL,
  `ocl_date_started` datetime DEFAULT NULL,
  `error_message` varchar(1024) DEFAULT NULL,
  `release_version` varchar(512) DEFAULT NULL,
  `subscription_url` text,
  PRIMARY KEY (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openconceptlab_import`
--

LOCK TABLES `openconceptlab_import` WRITE;
/*!40000 ALTER TABLE `openconceptlab_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `openconceptlab_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openconceptlab_item`
--

DROP TABLE IF EXISTS `openconceptlab_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openconceptlab_item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) NOT NULL,
  `type` varchar(512) NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  `version_url` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `hashed_url` binary(16) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `error_message` varchar(1024) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `openconceptlab_item_import` (`import_id`),
  KEY `openconceptlab_item_url` (`hashed_url`),
  CONSTRAINT `openconceptlab_item_import` FOREIGN KEY (`import_id`) REFERENCES `openconceptlab_import` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openconceptlab_item`
--

LOCK TABLES `openconceptlab_item` WRITE;
/*!40000 ALTER TABLE `openconceptlab_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `openconceptlab_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attribute`
--

DROP TABLE IF EXISTS `order_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_attribute` (
  `order_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_attribute_order_fk` (`order_id`),
  KEY `order_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `order_attribute_creator_fk` (`creator`),
  KEY `order_attribute_changed_by_fk` (`changed_by`),
  KEY `order_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `order_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `order_attribute_type` (`order_attribute_type_id`),
  CONSTRAINT `order_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_attribute_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attribute`
--

LOCK TABLES `order_attribute` WRITE;
/*!40000 ALTER TABLE `order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attribute_type`
--

DROP TABLE IF EXISTS `order_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_attribute_type` (
  `order_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_attribute_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_attribute_type_creator_fk` (`creator`),
  KEY `order_attribute_type_changed_by_fk` (`changed_by`),
  KEY `order_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `order_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attribute_type`
--

LOCK TABLES `order_attribute_type` WRITE;
/*!40000 ALTER TABLE `order_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_frequency`
--

DROP TABLE IF EXISTS `order_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_frequency` (
  `order_frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `frequency_per_day` double DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_frequency_id`),
  UNIQUE KEY `concept_id` (`concept_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_frequency_creator_fk` (`creator`),
  KEY `order_frequency_retired_by_fk` (`retired_by`),
  KEY `order_frequency_changed_by_fk` (`changed_by`),
  CONSTRAINT `order_frequency_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_concept_id_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_frequency_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_frequency`
--

LOCK TABLES `order_frequency` WRITE;
/*!40000 ALTER TABLE `order_frequency` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_group`
--

DROP TABLE IF EXISTS `order_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_group` (
  `order_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_set_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `order_group_reason` int(11) DEFAULT NULL,
  `parent_order_group` int(11) DEFAULT NULL,
  `previous_order_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_group_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_group_patient_id_fk` (`patient_id`),
  KEY `order_group_encounter_id_fk` (`encounter_id`),
  KEY `order_group_creator_fk` (`creator`),
  KEY `order_group_set_id_fk` (`order_set_id`),
  KEY `order_group_voided_by_fk` (`voided_by`),
  KEY `order_group_changed_by_fk` (`changed_by`),
  KEY `order_group_order_group_reason_fk` (`order_group_reason`),
  KEY `order_group_parent_order_group_fk` (`parent_order_group`),
  KEY `order_group_previous_order_group_fk` (`previous_order_group`),
  CONSTRAINT `order_group_previous_order_group_fk` FOREIGN KEY (`previous_order_group`) REFERENCES `order_group` (`order_group_id`),
  CONSTRAINT `order_group_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `order_group_order_group_reason_fk` FOREIGN KEY (`order_group_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_group_parent_order_group_fk` FOREIGN KEY (`parent_order_group`) REFERENCES `order_group` (`order_group_id`),
  CONSTRAINT `order_group_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `order_group_set_id_fk` FOREIGN KEY (`order_set_id`) REFERENCES `order_set` (`order_set_id`),
  CONSTRAINT `order_group_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_group`
--

LOCK TABLES `order_group` WRITE;
/*!40000 ALTER TABLE `order_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_group_attribute`
--

DROP TABLE IF EXISTS `order_group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_group_attribute` (
  `order_group_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_group_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_group_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_group_attribute_order_group_fk` (`order_group_id`),
  KEY `order_group_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `order_group_attribute_creator_fk` (`creator`),
  KEY `order_group_attribute_changed_by_fk` (`changed_by`),
  KEY `order_group_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `order_group_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `order_group_attribute_type` (`order_group_attribute_type_id`),
  CONSTRAINT `order_group_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_attribute_order_group_fk` FOREIGN KEY (`order_group_id`) REFERENCES `order_group` (`order_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_group_attribute`
--

LOCK TABLES `order_group_attribute` WRITE;
/*!40000 ALTER TABLE `order_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_group_attribute_type`
--

DROP TABLE IF EXISTS `order_group_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_group_attribute_type` (
  `order_group_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_group_attribute_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_group_attribute_type_creator_fk` (`creator`),
  KEY `order_group_attribute_type_changed_by_fk` (`changed_by`),
  KEY `order_group_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `order_group_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_group_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_group_attribute_type`
--

LOCK TABLES `order_group_attribute_type` WRITE;
/*!40000 ALTER TABLE `order_group_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_group_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_set`
--

DROP TABLE IF EXISTS `order_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_set` (
  `order_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_set_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_set_creator_fk` (`creator`),
  KEY `order_set_retired_by_fk` (`retired_by`),
  KEY `order_set_changed_by_fk` (`changed_by`),
  KEY `category_order_set_fk` (`category`),
  CONSTRAINT `category_order_set_fk` FOREIGN KEY (`category`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_set_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_set`
--

LOCK TABLES `order_set` WRITE;
/*!40000 ALTER TABLE `order_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_set_attribute`
--

DROP TABLE IF EXISTS `order_set_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_set_attribute` (
  `order_set_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_set_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_set_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_set_attribute_order_set_fk` (`order_set_id`),
  KEY `order_set_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `order_set_attribute_creator_fk` (`creator`),
  KEY `order_set_attribute_changed_by_fk` (`changed_by`),
  KEY `order_set_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `order_set_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `order_set_attribute_type` (`order_set_attribute_type_id`),
  CONSTRAINT `order_set_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_attribute_order_set_fk` FOREIGN KEY (`order_set_id`) REFERENCES `order_set` (`order_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_set_attribute`
--

LOCK TABLES `order_set_attribute` WRITE;
/*!40000 ALTER TABLE `order_set_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_set_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_set_attribute_type`
--

DROP TABLE IF EXISTS `order_set_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_set_attribute_type` (
  `order_set_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_set_attribute_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_set_attribute_type_creator_fk` (`creator`),
  KEY `order_set_attribute_type_changed_by_fk` (`changed_by`),
  KEY `order_set_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `order_set_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_set_attribute_type`
--

LOCK TABLES `order_set_attribute_type` WRITE;
/*!40000 ALTER TABLE `order_set_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_set_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_set_member`
--

DROP TABLE IF EXISTS `order_set_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_set_member` (
  `order_set_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type` int(11) NOT NULL,
  `order_template` text,
  `order_template_type` varchar(1024) DEFAULT NULL,
  `order_set_id` int(11) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_set_member_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_set_member_creator_fk` (`creator`),
  KEY `order_set_member_order_set_id_fk` (`order_set_id`),
  KEY `order_set_member_concept_id_fk` (`concept_id`),
  KEY `order_set_member_order_type_fk` (`order_type`),
  KEY `order_set_member_retired_by_fk` (`retired_by`),
  KEY `order_set_member_changed_by_fk` (`changed_by`),
  CONSTRAINT `order_set_member_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_member_concept_id_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_set_member_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_set_member_order_set_id_fk` FOREIGN KEY (`order_set_id`) REFERENCES `order_set` (`order_set_id`),
  CONSTRAINT `order_set_member_order_type_fk` FOREIGN KEY (`order_type`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `order_set_member_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_set_member`
--

LOCK TABLES `order_set_member` WRITE;
/*!40000 ALTER TABLE `order_set_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_set_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `java_class_name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `order_type_uuid_index` (`uuid`),
  KEY `order_type_retired_status` (`retired`),
  KEY `type_created_by` (`creator`),
  KEY `user_who_retired_order_type` (`retired_by`),
  KEY `order_type_changed_by` (`changed_by`),
  KEY `order_type_parent_order_type` (`parent`),
  CONSTRAINT `order_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_type_parent_order_type` FOREIGN KEY (`parent`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `type_created_by` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_order_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (2,'Drug Order','An order for a medication to be given to the patient',1,'2010-05-12 00:00:00',0,NULL,NULL,NULL,'131168f4-15f5-102d-96e4-000c29c2a5d7','org.openmrs.DrugOrder',NULL,NULL,NULL),(3,'Test Order','Order type for test orders',1,'2014-03-09 00:00:00',0,NULL,NULL,NULL,'52a447d3-a64a-11e3-9aeb-50e549534c5e','org.openmrs.TestOrder',NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type_class_map`
--

DROP TABLE IF EXISTS `order_type_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type_class_map` (
  `order_type_id` int(11) NOT NULL,
  `concept_class_id` int(11) NOT NULL,
  PRIMARY KEY (`order_type_id`,`concept_class_id`),
  UNIQUE KEY `concept_class_id` (`concept_class_id`),
  CONSTRAINT `fk_order_type_class_map_concept_class_concept_class_id` FOREIGN KEY (`concept_class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `fk_order_type_order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type_class_map`
--

LOCK TABLES `order_type_class_map` WRITE;
/*!40000 ALTER TABLE `order_type_class_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_type_class_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `orderer` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `instructions` text,
  `date_activated` datetime DEFAULT NULL,
  `auto_expire_date` datetime DEFAULT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `order_reason` int(11) DEFAULT NULL,
  `order_reason_non_coded` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `urgency` varchar(50) NOT NULL DEFAULT 'ROUTINE',
  `order_number` varchar(50) NOT NULL,
  `previous_order_id` int(11) DEFAULT NULL,
  `order_action` varchar(50) NOT NULL,
  `comment_to_fulfiller` varchar(1024) DEFAULT NULL,
  `care_setting` int(11) NOT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `order_group_id` int(11) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `fulfiller_comment` varchar(1024) DEFAULT NULL,
  `fulfiller_status` varchar(50) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_uuid_index` (`uuid`),
  KEY `order_creator` (`creator`),
  KEY `discontinued_because` (`order_reason`),
  KEY `orders_in_encounter` (`encounter_id`),
  KEY `type_of_order` (`order_type_id`),
  KEY `orderer_not_drug` (`orderer`),
  KEY `order_for_patient` (`patient_id`),
  KEY `user_who_voided_order` (`voided_by`),
  KEY `previous_order_id_order_id` (`previous_order_id`),
  KEY `orders_care_setting` (`care_setting`),
  KEY `orders_order_group_id_fk` (`order_group_id`),
  KEY `orders_order_number` (`order_number`),
  KEY `orders_accession_number` (`accession_number`),
  CONSTRAINT `discontinued_because` FOREIGN KEY (`order_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `fk_orderer_provider` FOREIGN KEY (`orderer`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `orders_care_setting` FOREIGN KEY (`care_setting`) REFERENCES `care_setting` (`care_setting_id`),
  CONSTRAINT `orders_in_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `orders_order_group_id_fk` FOREIGN KEY (`order_group_id`) REFERENCES `order_group` (`order_group_id`),
  CONSTRAINT `order_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_order_id_order_id` FOREIGN KEY (`previous_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `type_of_order` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `user_who_voided_order` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `allergy_status` varchar(50) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`patient_id`),
  KEY `user_who_changed_pat` (`changed_by`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  CONSTRAINT `person_id_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_pat` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_patient` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier`
--

DROP TABLE IF EXISTS `patient_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier` (
  `patient_identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`patient_identifier_id`),
  UNIQUE KEY `patient_identifier_uuid_index` (`uuid`),
  KEY `identifier_name` (`identifier`),
  KEY `idx_patient_identifier_patient` (`patient_id`),
  KEY `identifier_creator` (`creator`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `patient_identifier_ibfk_2` (`location_id`),
  KEY `identifier_voider` (`voided_by`),
  KEY `patient_identifier_changed_by` (`changed_by`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `fk_patient_id_patient_identifier` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier`
--

LOCK TABLES `patient_identifier` WRITE;
/*!40000 ALTER TABLE `patient_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `patient_identifier_type_retired_status` (`retired`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  KEY `patient_identifier_type_changed_by` (`changed_by`),
  CONSTRAINT `patient_identifier_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier_type`
--

LOCK TABLES `patient_identifier_type` WRITE;
/*!40000 ALTER TABLE `patient_identifier_type` DISABLE KEYS */;
INSERT INTO `patient_identifier_type` VALUES (1,'OpenMRS Identification Number','Unique number used in OpenMRS','',1,1,'2005-09-22 00:00:00',0,NULL,'org.openmrs.patient.impl.LuhnIdentifierValidator',NULL,0,NULL,NULL,NULL,'8d793bee-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL,NULL),(2,'Old Identification Number','Number given out prior to the OpenMRS system (No check digit)','',0,1,'2005-09-22 00:00:00',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'8d79403a-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL,NULL),(3,'OpenEMPI ID','Specifies UUID of the identifier type that is used as the Global Identifier Domain (GID) in the MPI.                   It is generated by the MPI and is persisted in OpenMRS.',NULL,0,2,'2018-06-28 00:00:00',0,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'a5d38e09-efcb-4d91-a526-50ce1ba5011a',NULL,NULL,NULL),(4,'OpenMRS ID','OpenMRS patient identifier, with check-digit',NULL,0,2,'2023-10-25 10:23:28',1,NULL,'org.openmrs.module.idgen.validator.LuhnMod30IdentifierValidator',NULL,0,NULL,NULL,NULL,'05a29f94-c0ed-11e2-94be-8c13b969e334',NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient_identifier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_program`
--

DROP TABLE IF EXISTS `patient_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_program` (
  `patient_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '0',
  `date_enrolled` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `outcome_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`patient_program_id`),
  UNIQUE KEY `patient_program_uuid_index` (`uuid`),
  KEY `user_who_changed` (`changed_by`),
  KEY `patient_program_creator` (`creator`),
  KEY `patient_in_program` (`patient_id`),
  KEY `program_for_patient` (`program_id`),
  KEY `user_who_voided_patient_program` (`voided_by`),
  KEY `patient_program_location_id` (`location_id`),
  KEY `patient_program_outcome_concept_id_fk` (`outcome_concept_id`),
  CONSTRAINT `patient_in_program` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_program_outcome_concept_id_fk` FOREIGN KEY (`outcome_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_for_patient` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `user_who_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient_program` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_program`
--

LOCK TABLES `patient_program` WRITE;
/*!40000 ALTER TABLE `patient_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_program_attribute`
--

DROP TABLE IF EXISTS `patient_program_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_program_attribute` (
  `patient_program_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_program_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `patient_program_attribute_programid_fk` (`patient_program_id`),
  KEY `patient_program_attribute_attributetype_fk` (`attribute_type_id`),
  KEY `patient_program_attribute_creator_fk` (`creator`),
  KEY `patient_program_attribute_changed_by_fk` (`changed_by`),
  KEY `patient_program_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `patient_program_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_attribute_attributetype_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `program_attribute_type` (`program_attribute_type_id`),
  CONSTRAINT `patient_program_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_attribute_programid_fk` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_program_attribute`
--

LOCK TABLES `patient_program_attribute` WRITE;
/*!40000 ALTER TABLE `patient_program_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_program_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_state`
--

DROP TABLE IF EXISTS `patient_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_state` (
  `patient_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_state_id`),
  UNIQUE KEY `patient_state_uuid_index` (`uuid`),
  KEY `patient_state_changer` (`changed_by`),
  KEY `patient_state_creator` (`creator`),
  KEY `patient_program_for_state` (`patient_program_id`),
  KEY `state_for_patient` (`state`),
  KEY `patient_state_voider` (`voided_by`),
  KEY `patient_state_encounter_id_fk` (`encounter_id`),
  CONSTRAINT `patient_state_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `patient_program_for_state` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_state_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_for_patient` FOREIGN KEY (`state`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_state`
--

LOCK TABLES `patient_state` WRITE;
/*!40000 ALTER TABLE `patient_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `deathdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `birthtime` time DEFAULT NULL,
  `cause_of_death_non_coded` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_uuid_index` (`uuid`),
  KEY `person_birthdate` (`birthdate`),
  KEY `person_death_date` (`death_date`),
  KEY `person_died_because` (`cause_of_death`),
  KEY `user_who_changed_person` (`changed_by`),
  KEY `user_who_created_person` (`creator`),
  KEY `user_who_voided_person` (`voided_by`),
  CONSTRAINT `person_died_because` FOREIGN KEY (`cause_of_death`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_person` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_person` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_person` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'M',NULL,0,0,NULL,NULL,NULL,'2005-01-01 00:00:00',NULL,NULL,0,NULL,NULL,NULL,'1296b0dc-440a-11e6-a65c-00e04c680037',0,NULL,NULL),(2,'F',NULL,0,0,NULL,NULL,2,'2023-10-25 10:23:27',NULL,NULL,0,NULL,NULL,NULL,'660cd913-33d4-402c-8969-a6a8b55286cc',0,NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_address` (
  `person_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `address7` varchar(255) DEFAULT NULL,
  `address8` varchar(255) DEFAULT NULL,
  `address9` varchar(255) DEFAULT NULL,
  `address10` varchar(255) DEFAULT NULL,
  `address11` varchar(255) DEFAULT NULL,
  `address12` varchar(255) DEFAULT NULL,
  `address13` varchar(255) DEFAULT NULL,
  `address14` varchar(255) DEFAULT NULL,
  `address15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_address_id`),
  UNIQUE KEY `person_address_uuid_index` (`uuid`),
  KEY `patient_address_creator` (`creator`),
  KEY `address_for_person` (`person_id`),
  KEY `patient_address_void` (`voided_by`),
  KEY `person_address_changed_by` (`changed_by`),
  CONSTRAINT `address_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_address_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_address_void` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_address_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_address`
--

LOCK TABLES `person_address` WRITE;
/*!40000 ALTER TABLE `person_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `person_attribute_uuid_index` (`uuid`),
  KEY `attribute_changer` (`changed_by`),
  KEY `attribute_creator` (`creator`),
  KEY `defines_attribute_type` (`person_attribute_type_id`),
  KEY `identifies_person` (`person_id`),
  KEY `attribute_voider` (`voided_by`),
  CONSTRAINT `attribute_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `defines_attribute_type` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute`
--

LOCK TABLES `person_attribute` WRITE;
/*!40000 ALTER TABLE `person_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `name_of_attribute` (`name`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_type_creator` (`creator`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
INSERT INTO `person_attribute_type` VALUES (1,'Race','Group of persons related by common descent or heredity','java.lang.String',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,6,'8d871386-c2cc-11de-8d13-0010c6dffd0f'),(2,'Birthplace','Location of persons birth','java.lang.String',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,0,'8d8718c2-c2cc-11de-8d13-0010c6dffd0f'),(3,'Citizenship','Country of which this person is a member','java.lang.String',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,1,'8d871afc-c2cc-11de-8d13-0010c6dffd0f'),(4,'Mother\'s Name','First or last name of this person\'s mother','java.lang.String',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,5,'8d871d18-c2cc-11de-8d13-0010c6dffd0f'),(5,'Civil Status','Marriage status of this person','org.openmrs.Concept',1054,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,2,'8d871f2a-c2cc-11de-8d13-0010c6dffd0f'),(6,'Health District','District/region in which this patient\' home health center resides','java.lang.String',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,4,'8d872150-c2cc-11de-8d13-0010c6dffd0f'),(7,'Health Center','Specific Location of this person\'s home health center.','org.openmrs.Location',0,0,1,'2007-05-04 00:00:00',NULL,NULL,0,NULL,NULL,NULL,NULL,3,'8d87236c-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_merge_log`
--

DROP TABLE IF EXISTS `person_merge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_merge_log` (
  `person_merge_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner_person_id` int(11) NOT NULL,
  `loser_person_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `merged_data` longtext NOT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`),
  UNIQUE KEY `person_merge_log_unique_uuid` (`uuid`),
  KEY `person_merge_log_winner` (`winner_person_id`),
  KEY `person_merge_log_loser` (`loser_person_id`),
  KEY `person_merge_log_creator` (`creator`),
  KEY `person_merge_log_changed_by_fk` (`changed_by`),
  KEY `person_merge_log_voided_by_fk` (`voided_by`),
  CONSTRAINT `person_merge_log_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_loser` FOREIGN KEY (`loser_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_merge_log_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_winner` FOREIGN KEY (`winner_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_merge_log`
--

LOCK TABLES `person_merge_log` WRITE;
/*!40000 ALTER TABLE `person_merge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_merge_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_name`
--

DROP TABLE IF EXISTS `person_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_name` (
  `person_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_name_id`),
  UNIQUE KEY `person_name_uuid_index` (`uuid`),
  KEY `first_name` (`given_name`),
  KEY `last_name` (`family_name`),
  KEY `middle_name` (`middle_name`),
  KEY `family_name2` (`family_name2`),
  KEY `user_who_made_name` (`creator`),
  KEY `name_for_person` (`person_id`),
  KEY `user_who_voided_name` (`voided_by`),
  CONSTRAINT `name_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_name`
--

LOCK TABLES `person_name` WRITE;
/*!40000 ALTER TABLE `person_name` DISABLE KEYS */;
INSERT INTO `person_name` VALUES (1,1,1,NULL,'Super','',NULL,'User',NULL,NULL,NULL,1,'2005-01-01 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'1299c191-440a-11e6-a65c-00e04c680037'),(2,1,2,NULL,'Unknown',NULL,NULL,'Provider',NULL,NULL,NULL,2,'2023-10-25 10:23:27',0,NULL,NULL,NULL,NULL,NULL,'cb598c59-1ad5-4a07-8f94-6ffb68b8e8d6');
/*!40000 ALTER TABLE `person_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(255) NOT NULL,
  `description` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE KEY `privilege_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('Add Allergies','Add allergies','ca605a31-de8a-4e68-b027-dad31f5334f0'),('Add Cohorts','Able to add a cohort to the system','129a991e-440a-11e6-a65c-00e04c680037'),('Add Concept Proposals','Able to add concept proposals to the system','129a9a2f-440a-11e6-a65c-00e04c680037'),('Add Encounters','Able to add patient encounters','129a9a7a-440a-11e6-a65c-00e04c680037'),('Add HL7 Inbound Archive','Able to add an HL7 archive item','d73a9b2a-eb12-41f3-9837-50e92d684631'),('Add HL7 Inbound Exception','Able to add an HL7 error item','9191cf01-dddd-49e9-a23c-1af42629fee8'),('Add HL7 Inbound Queue','Able to add an HL7 Queue item','0fd8e147-54d0-45cb-bd3c-39a57f951a69'),('Add HL7 Source','Able to add an HL7 Source','5953079c-09f1-4b7a-9315-c84b3448671d'),('Add Observations','Able to add patient observations','129a9abd-440a-11e6-a65c-00e04c680037'),('Add Orders','Able to add orders','129a9af6-440a-11e6-a65c-00e04c680037'),('Add Patient Identifiers','Able to add patient identifiers','129a9b30-440a-11e6-a65c-00e04c680037'),('Add Patient Programs','Able to add patients to programs','129a9b6f-440a-11e6-a65c-00e04c680037'),('Add Patients','Able to add patients','129a9bab-440a-11e6-a65c-00e04c680037'),('Add People','Able to add person objects','129a9be1-440a-11e6-a65c-00e04c680037'),('Add Problems','Add problems','88c4f7c1-e062-44eb-b2ec-1d01f5c4c922'),('Add Relationships','Able to add relationships','129a9c0a-440a-11e6-a65c-00e04c680037'),('Add Report Objects','Able to add report objects','129a9c32-440a-11e6-a65c-00e04c680037'),('Add Reports','Able to add reports','129a9c58-440a-11e6-a65c-00e04c680037'),('Add Users','Able to add users to OpenMRS','129a9c7c-440a-11e6-a65c-00e04c680037'),('Add Visits','Able to add visits','c6fe41a5-0daf-4047-b579-5c06c136bb8a'),('App: adminui.configuremetadata','Able to access configure metadata app','49ca1e69-08bf-48cd-a250-ad235fb000b9'),('App: appointmentschedulingui.appointmentTypes','Access to the Manage Service Types app','42a16e8a-82bb-41a2-9df8-d1b1d7892e1b'),('App: appointmentschedulingui.home','Ability to view the appointment app on the home page','ae2c5bec-643a-4c3c-a66a-673fe0697b8e'),('App: appointmentschedulingui.providerSchedules','Access to the Manage Provider Schedules app','78b1a831-9a66-4e5b-b845-8d4d3480daa2'),('App: appointmentschedulingui.viewAppointments','Access to Manage Appointments and Daily Scheduled Appointments (but not the ability to book appointments from these pages)','55b6a5d4-4018-4a5b-920f-92e0f150885d'),('App: attachments.attachments.page','Allowed to access the main attachments page','d294b48d-8afe-4ef4-a1d3-602b23d959e1'),('App: coreapps.activeVisits','Able to access the active visits app','ff47c68e-1d43-4200-9a87-abc877c39e4b'),('App: coreapps.dataManagement','Able to access data management apps','8316489a-d408-47ad-8595-34f76fb457ee'),('App: coreapps.findPatient','Able to access the find patient app','d081d1ab-8bdf-41f7-840a-caf8022a7774'),('App: coreapps.mergePatient','Able to access the merge patient app','2f13576b-b08b-4de3-9e9f-3e3a6cca1711'),('App: coreapps.patientDashboard','Able to access the patient dashboard','831a650f-3135-45e5-b935-01df0c4a15c6'),('App: coreapps.patientVisits','Able to access the patient visits screen','56a003e8-5aaf-45f9-9afa-38388ed43e9a'),('App: coreapps.summaryDashboard','Able to access summary dashboards','02bc15bf-8f84-470b-9ae8-90202dfe7afb'),('App: referenceapplication.legacyAdmin','Able to access the advanced administration app','6cfb5eae-3679-4c81-9350-53c2f6f96796'),('App: referenceapplication.manageApps','Able to manage app definitions','59e7256f-b1cb-4bac-a905-8106dc96b380'),('App: referenceapplication.manageExtensions','Able to manage extension definitions','83fc8447-67ca-44a6-badb-bd598f31c119'),('App: referenceapplication.styleGuide','Able to access the style guide app','9f88174c-0151-49c9-a955-39652659555b'),('App: referenceapplication.vitals','Able to access the vitals app','e689a8e4-3125-4bb8-9671-f19fbc3a278a'),('App: registrationapp.registerPatient','Able to access the register patient app','d904c1fb-c7ae-48f2-9186-6e373d050372'),('Assign System Developer Role','Able to assign System Developer role','df29939d-d3fd-47a5-b706-c1a3e1dea4da'),('Configure Visits','Able to choose encounter visit handler and enable/disable encounter visits','fa15cf48-ae39-49bd-b007-415e9607ec36'),('Delete Cohorts','Able to add a cohort to the system','129a9ca2-440a-11e6-a65c-00e04c680037'),('Delete Concept Proposals','Able to delete concept proposals from the system','129a9cc7-440a-11e6-a65c-00e04c680037'),('Delete Conditions','Able to delete conditions','cf43accb-d3dc-44f9-9e80-bcba27e1f67a'),('Delete Diagnoses','Able to delete diagnoses','5f0d5825-43a4-44dc-851f-292012ebd883'),('Delete Encounters','Able to delete patient encounters','129a9cf2-440a-11e6-a65c-00e04c680037'),('Delete HL7 Inbound Archive','Able to delete/retire an HL7 archive item','ef7e9169-405b-455b-8c70-f935b8e04e6b'),('Delete HL7 Inbound Exception','Able to delete an HL7 archive item','1c5a4e99-91da-4a94-ac45-3fb1857bbd66'),('Delete HL7 Inbound Queue','Able to delete an HL7 Queue item','e2b5ce59-9b8f-4ca7-9394-7f55b4fce59e'),('Delete Notes','Able to delete patient notes','0ccd9b9f-80a5-437b-a778-8df3c75de61b'),('Delete Observations','Able to delete patient observations','129a9d18-440a-11e6-a65c-00e04c680037'),('Delete Orders','Able to delete orders','129a9d3c-440a-11e6-a65c-00e04c680037'),('Delete Patient Identifiers','Able to delete patient identifiers','129a9d62-440a-11e6-a65c-00e04c680037'),('Delete Patient Programs','Able to delete patients from programs','129a9d89-440a-11e6-a65c-00e04c680037'),('Delete Patients','Able to delete patients','129a9daf-440a-11e6-a65c-00e04c680037'),('Delete People','Able to delete objects','129a9dd5-440a-11e6-a65c-00e04c680037'),('Delete Relationships','Able to delete relationships','129a9dfa-440a-11e6-a65c-00e04c680037'),('Delete Report Objects','Able to delete report objects','129a9e21-440a-11e6-a65c-00e04c680037'),('Delete Reports','Able to delete reports','129a9e45-440a-11e6-a65c-00e04c680037'),('Delete Users','Able to delete users in OpenMRS','129a9e6a-440a-11e6-a65c-00e04c680037'),('Delete Visits','Able to delete visits','fdcc981a-5102-4294-b16b-4f9230d7aa17'),('Edit Allergies','Able to edit allergies','3dba9a6c-3ff3-46da-acfc-18a3d3e281a2'),('Edit Cohorts','Able to add a cohort to the system','129a9e8f-440a-11e6-a65c-00e04c680037'),('Edit Concept Proposals','Able to edit concept proposals in the system','129a9eb2-440a-11e6-a65c-00e04c680037'),('Edit Conditions','Able to edit conditions','a95abcae-9b88-4ab3-8d52-b80e022cac7a'),('Edit Diagnoses','Able to edit diagnoses','7c11f9e5-df84-4eb6-b506-110bd1f04bf9'),('Edit Encounters','Able to edit patient encounters','129a9ed8-440a-11e6-a65c-00e04c680037'),('Edit Notes','Able to edit patient notes','3de7fb98-ec93-42ad-a5d2-d5c36e6efbdb'),('Edit Observations','Able to edit patient observations','129a9efb-440a-11e6-a65c-00e04c680037'),('Edit Orders','Able to edit orders','129a9f1f-440a-11e6-a65c-00e04c680037'),('Edit Patient Identifiers','Able to edit patient identifiers','129a9f43-440a-11e6-a65c-00e04c680037'),('Edit Patient Programs','Able to edit patients in programs','129a9f68-440a-11e6-a65c-00e04c680037'),('Edit Patients','Able to edit patients','129a9f8d-440a-11e6-a65c-00e04c680037'),('Edit People','Able to edit person objects','129a9fb2-440a-11e6-a65c-00e04c680037'),('Edit Problems','Able to edit problems','72725628-b493-4a50-8bd1-24dddfc2ea38'),('Edit Relationships','Able to edit relationships','129a9fd7-440a-11e6-a65c-00e04c680037'),('Edit Report Objects','Able to edit report objects','129a9ffa-440a-11e6-a65c-00e04c680037'),('Edit Reports','Able to edit reports','129aa01f-440a-11e6-a65c-00e04c680037'),('Edit User Passwords','Able to change the passwords of users in OpenMRS','129aa044-440a-11e6-a65c-00e04c680037'),('Edit Users','Able to edit users in OpenMRS','129aa06c-440a-11e6-a65c-00e04c680037'),('Edit Visits','Able to edit visits','31889d58-cd72-4865-ac4a-fc17abeb0385'),('Form Entry','Allows user to access Form Entry pages/functions','129aa08f-440a-11e6-a65c-00e04c680037'),('Generate Batch of Identifiers','Allows user to generate a batch of identifiers to a file for offline use','aab869c0-1df9-4f8e-8927-260d77211f36'),('Get Allergies','Able to get allergies','d05118c6-2490-4d78-a41a-390e3596a220'),('Get Care Settings','Able to get Care Settings','8f5d8a41-5a49-4a67-a721-0d6203767471'),('Get Concept Attribute Types','Able to get concept attribute types','f03fc844-0d55-4f41-804e-e9eec8bfdc99'),('Get Concept Classes','Able to get concept classes','d05118c6-2490-4d78-a41a-390e3596a238'),('Get Concept Datatypes','Able to get concept datatypes','d05118c6-2490-4d78-a41a-390e3596a237'),('Get Concept Map Types','Able to get concept map types','d05118c6-2490-4d78-a41a-390e3596a230'),('Get Concept Proposals','Able to get concept proposals to the system','d05118c6-2490-4d78-a41a-390e3596a250'),('Get Concept Reference Terms','Able to get concept reference terms','d05118c6-2490-4d78-a41a-390e3596a229'),('Get Concept Sources','Able to get concept sources','d05118c6-2490-4d78-a41a-390e3596a231'),('Get Concepts','Able to get concept entries','d05118c6-2490-4d78-a41a-390e3596a251'),('Get Conditions','Able to get conditions','09dc26f6-3499-494d-af23-aeba4525d2c5'),('Get Database Changes','Able to get database changes from the admin screen','d05118c6-2490-4d78-a41a-390e3596a222'),('Get Diagnoses','Able to get diagnoses','b3e8b2bf-5d1d-44d6-9b83-f24baf51d16a'),('Get Diagnoses Attribute Types','Able to get diagnoses attribute types','61cf957a-4d67-48db-8ec0-fb7851db7578'),('Get Encounter Roles','Able to get encounter roles','d05118c6-2490-4d78-a41a-390e3596a210'),('Get Encounter Types','Able to get encounter types','d05118c6-2490-4d78-a41a-390e3596a247'),('Get Encounters','Able to get patient encounters','d05118c6-2490-4d78-a41a-390e3596a248'),('Get Field Types','Able to get field types','d05118c6-2490-4d78-a41a-390e3596a234'),('Get Forms','Able to get forms','d05118c6-2490-4d78-a41a-390e3596a240'),('Get Global Properties','Able to get global properties on the administration screen','d05118c6-2490-4d78-a41a-390e3596a226'),('Get HL7 Inbound Archive','Able to get an HL7 archive item','d05118c6-2490-4d78-a41a-390e3596a217'),('Get HL7 Inbound Exception','Able to get an HL7 error item','d05118c6-2490-4d78-a41a-390e3596a216'),('Get HL7 Inbound Queue','Able to get an HL7 Queue item','d05118c6-2490-4d78-a41a-390e3596a218'),('Get HL7 Source','Able to get an HL7 Source','d05118c6-2490-4d78-a41a-390e3596a219'),('Get Identifier Types','Able to get patient identifier types','d05118c6-2490-4d78-a41a-390e3596a239'),('Get Location Attribute Types','Able to get location attribute types','d05118c6-2490-4d78-a41a-390e3596a212'),('Get Locations','Able to get locations','d05118c6-2490-4d78-a41a-390e3596a246'),('Get Notes','Able to get patient notes','55550164-e5a1-4b45-b62c-1624096178f9'),('Get Observations','Able to get patient observations','d05118c6-2490-4d78-a41a-390e3596a245'),('Get Order Frequencies','Able to get Order Frequencies','09d7c8fb-6570-46cf-97df-cfea6c0fc3dc'),('Get Order Set Attribute Types','Able to get order set attribute types','9eaf4f3e-7df2-4f7b-b734-0955c4379396'),('Get Order Sets','Able to get order sets','fcd0e07b-1169-425e-af4c-bae2c5e6c217'),('Get Order Types','Able to get order types','d05118c6-2490-4d78-a41a-390e3596a233'),('Get Orders','Able to get orders','d05118c6-2490-4d78-a41a-390e3596a241'),('Get Patient Cohorts','Able to get patient cohorts','d05118c6-2490-4d78-a41a-390e3596a242'),('Get Patient Identifiers','Able to get patient identifiers','d05118c6-2490-4d78-a41a-390e3596a243'),('Get Patient Programs','Able to get which programs that patients are in','d05118c6-2490-4d78-a41a-390e3596a227'),('Get Patients','Able to get patients','d05118c6-2490-4d78-a41a-390e3596a244'),('Get People','Able to get person objects','d05118c6-2490-4d78-a41a-390e3596a224'),('Get Person Attribute Types','Able to get person attribute types','d05118c6-2490-4d78-a41a-390e3596a225'),('Get Privileges','Able to get user privileges','d05118c6-2490-4d78-a41a-390e3596a236'),('Get Problems','Able to get problems','d05118c6-2490-4d78-a41a-390e3596a221'),('Get Programs','Able to get patient programs','d05118c6-2490-4d78-a41a-390e3596a228'),('Get Providers','Able to get Providers','d05118c6-2490-4d78-a41a-390e3596a211'),('Get Relationship Types','Able to get relationship types','d05118c6-2490-4d78-a41a-390e3596a232'),('Get Relationships','Able to get relationships','d05118c6-2490-4d78-a41a-390e3596a223'),('Get Roles','Able to get user roles','d05118c6-2490-4d78-a41a-390e3596a235'),('Get Users','Able to get users in OpenMRS','d05118c6-2490-4d78-a41a-390e3596a249'),('Get Visit Attribute Types','Able to get visit attribute types','d05118c6-2490-4d78-a41a-390e3596a213'),('Get Visit Types','Able to get visit types','d05118c6-2490-4d78-a41a-390e3596a215'),('Get Visits','Able to get visits','d05118c6-2490-4d78-a41a-390e3596a214'),('Manage Address Hierarchy','Allows user to access/modify the defined address hierarchy','920bb881-17e8-41b6-b329-db260cb73ce1'),('Manage Address Templates','Able to add/edit/delete address templates','02ddc03c-c8b3-4a23-a8b3-0ad1696ceaad'),('Manage Alerts','Able to add/edit/delete user alerts','129aa0ca-440a-11e6-a65c-00e04c680037'),('Manage Appointment Types','Ability to add/edit/purge appointment types','e1d64259-0f42-4860-8378-96a2f4931b21'),('Manage Appointments Settings','Ability to manage the appointment scheduling module settings','af973461-20b2-4af4-b45d-4572766d8736'),('Manage Auto Generation Options','Allows user add, edit, and remove auto-generation options','2923855d-7e10-4a0f-b111-bcd516a8d779'),('Manage Cohort Definitions','Add/Edit/Remove Cohort Definitions','bdd23c19-c6dd-4421-abbe-3097a6795935'),('Manage Concept Attribute Types','Able to add/edit/retire concept attribute types','62f6fb15-34d1-4a5d-bc73-5f243f3823cd'),('Manage Concept Classes','Able to add/edit/retire concept classes','129aa10e-440a-11e6-a65c-00e04c680037'),('Manage Concept Datatypes','Able to add/edit/retire concept datatypes','129aa19d-440a-11e6-a65c-00e04c680037'),('Manage Concept Map Types','Able to add/edit/retire concept map types','69cb3944-e328-4155-b34a-b4e90068d341'),('Manage Concept Name tags','Able to add/edit/delete concept name tags','58e22b94-4d63-4b37-b05e-763d87cba490'),('Manage Concept Reference Terms','Able to add/edit/retire reference terms','4215be25-34e7-4427-b85b-e68ea4aef1a7'),('Manage Concept Sources','Able to add/edit/delete concept sources','129aa1f0-440a-11e6-a65c-00e04c680037'),('Manage Concept Stop Words','Able to view/add/remove the concept stop words','96e0c2c6-a387-4ef4-b6a0-9a6ca8e850f2'),('Manage Concepts','Able to add/edit/delete concept entries','129aa22e-440a-11e6-a65c-00e04c680037'),('Manage Data Set Definitions','Add/Edit/Remove Data Set Definitions','e3efca3f-969c-45d6-8d61-a4e1e825bda0'),('Manage Dimension Definitions','Add/Edit/Remove Dimension Definitions','a684ecf5-e15e-4eb4-b2ed-36cc0ef20779'),('Manage Encounter Roles','Able to add/edit/retire encounter roles','61307a3e-1429-4ae6-a85e-65c92eac7a73'),('Manage Encounter Types','Able to add/edit/delete encounter types','129aa27e-440a-11e6-a65c-00e04c680037'),('Manage Field Types','Able to add/edit/retire field types','129aa2ae-440a-11e6-a65c-00e04c680037'),('Manage FormEntry XSN','Allows user to upload and edit the xsns stored on the server','129aa2d2-440a-11e6-a65c-00e04c680037'),('Manage Forms','Able to add/edit/delete forms','129aa2f8-440a-11e6-a65c-00e04c680037'),('Manage Global Properties','Able to add/edit global properties','129aa31d-440a-11e6-a65c-00e04c680037'),('Manage HL7 Messages','Able to add/edit/delete HL7 messages','a2d1789b-f032-4438-9db0-19af0fc57372'),('Manage Identifier Sources','Allows user add, edit, and remove identifier sources','4d73bce7-2440-43fa-bb5e-dd0458221609'),('Manage Identifier Types','Able to add/edit/delete patient identifier types','129aa343-440a-11e6-a65c-00e04c680037'),('Manage Implementation Id','Able to view/add/edit the implementation id for the system','eb3c8909-1f36-45b2-b4fd-c452c74072a5'),('Manage Indicator Definitions','Add/Edit/Remove Indicator Definitions','7c6e9c43-5dcc-4a80-b705-e3bb7d9801fc'),('Manage Location Attribute Types','Able to add/edit/retire location attribute types','ed3c3f96-6118-4073-8adb-9ef1b7485967'),('Manage Location Tags','Able to add/edit/delete location tags','6bb71fbb-b1c6-4530-8637-67cfc65aa27e'),('Manage Locations','Able to add/edit/delete locations','129aa367-440a-11e6-a65c-00e04c680037'),('Manage Metadata Mapping','Able to manage metadata mappings','4078e052-bc3e-4588-82ec-24e4d29852ec'),('Manage Modules','Able to add/remove modules to the system','129aa38b-440a-11e6-a65c-00e04c680037'),('Manage Order Frequencies','Able to add/edit/retire Order Frequencies','029976e6-5173-423f-81c8-db390a112952'),('Manage Order Set Attribute Types','Able to add/edit/retire order set attribute types','5bc15de9-a633-4d0c-b799-fa7fc423385b'),('Manage Order Sets','Able to manage order sets','85139b5e-a8bd-415b-9b0b-420d773a4aa1'),('Manage Order Types','Able to add/edit/retire order types','129aa3b1-440a-11e6-a65c-00e04c680037'),('Manage OWA','Allows to configure OWA module, upload modules','1d21e879-b7ff-4cb1-aeab-9aebb8da8827'),('Manage Person Attribute Types','Able to add/edit/delete person attribute types','129aa3d4-440a-11e6-a65c-00e04c680037'),('Manage Privileges','Able to add/edit/delete privileges','129aa403-440a-11e6-a65c-00e04c680037'),('Manage Programs','Able to add/view/delete patient programs','129aa428-440a-11e6-a65c-00e04c680037'),('Manage Provider Schedules','Ability to add/edit/purge appointment blocks','7d38d242-75ed-450c-b164-e7534cd0ca0d'),('Manage Providers','Able to edit Provider','5652e96c-1718-4f95-8985-89a149e24d3d'),('Manage Relationship Types','Able to add/edit/retire relationship types','129aa44c-440a-11e6-a65c-00e04c680037'),('Manage Relationships','Able to add/edit/delete relationships','129aa474-440a-11e6-a65c-00e04c680037'),('Manage Report Definitions','Add/Edit/Remove Report Definitions','b5092c3a-d02f-4e76-8d48-a38376c5d212'),('Manage Report Designs','Add/Edit/Remove Report Designs','516ce71b-96a8-4235-9a4c-ddac401a9d55'),('Manage Reports','Base privilege for add/edit/delete reporting definitions. This gives access to the administrative menus, but you need to grant additional privileges to manage each specific type of reporting definition','52ff1336-3de6-4bec-9182-ab1dd3dffec1'),('Manage RESTWS','Allows to configure RESTWS module','e1affc20-d125-4033-b755-16b5731f98c3'),('Manage Roles','Able to add/edit/delete user roles','129aa499-440a-11e6-a65c-00e04c680037'),('Manage Rule Definitions','Allows creation and editing of user-defined rules','e6ae0588-b5cc-4293-b1db-fd93dc7195ee'),('Manage Scheduled Report Tasks','Manage Task Scheduling in Reporting Module','5e28eca4-3cf2-4ada-8b50-37ce0d0eb6f6'),('Manage Scheduler','Able to add/edit/remove scheduled tasks','129aa4bd-440a-11e6-a65c-00e04c680037'),('Manage Search Index','Able to manage the search index','79b3b581-c136-43d8-9b31-f962f7f3c378'),('Manage Token Registrations','Allows to create/update/delete token registrations','79a67a76-8588-4ce8-bff1-69c6fdb09544'),('Manage Tokens','Allows registering and removal of tokens','25e5779a-dd62-4e64-b958-e5f5b3ebfc8a'),('Manage Visit Attribute Types','Able to add/edit/retire visit attribute types','b62faa38-42f1-4aed-aa3a-207e4e67383c'),('Manage Visit Types','Able to add/edit/delete visit types','75ad24c1-a338-4978-8685-dfaf7257e1fc'),('Patient Dashboard - View Demographics Section','Able to view the \'Demographics\' tab on the patient dashboard','129aa4e2-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Encounters Section','Able to view the \'Encounters\' tab on the patient dashboard','129aa50c-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Forms Section','Allows user to view the Forms tab on the patient dashboard','129aa538-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Graphs Section','Able to view the \'Graphs\' tab on the patient dashboard','129aa561-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Overview Section','Able to view the \'Overview\' tab on the patient dashboard','129aa58b-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Patient Summary','Able to view the \'Summary\' tab on the patient dashboard','129aa5b8-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Regimen Section','Able to view the \'Regimen\' tab on the patient dashboard','129aa5e3-440a-11e6-a65c-00e04c680037'),('Patient Dashboard - View Visits Section','Able to view the \'Visits\' tab on the patient dashboard','811c6f3c-cd84-449a-b69e-231965988883'),('Patient Overview - View Allergies','Able to view the Allergies portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a261'),('Patient Overview - View Patient Actions','Able to view the Patient Actions portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a264'),('Patient Overview - View Problem List','Able to view the Problem List portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a260'),('Patient Overview - View Programs','Able to view the Programs portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a263'),('Patient Overview - View Relationships','Able to view the Relationships portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a262'),('Preview Forms','Allows user to preview Form Entry pages from files. This should be restricted to trusted users only.','62de89a9-6e8d-4bca-b5e2-be8ec04e0117'),('Provider Management - Admin','Allows access to admin pages of the provider management module','9f5fdfe8-e4bb-4ac6-bcbe-7c84aefa902b'),('Provider Management API','Allows access to all provider management service and provider suggestion service API method','c799b294-b147-4817-9a97-05440a56c0fd'),('Provider Management API - Read-only','Allows access to all provider management service and provider suggestion service API methods that are read-only','90d45546-c228-4849-8b0f-1e44405d33a3'),('Provider Management Dashboard - Edit Patients','Allows access to editing patient information on the provider management dashboard','e48584da-f76e-41e0-b669-9ebb2bfaee0a'),('Provider Management Dashboard - Edit Providers','Allows access to editing provider information on the provider management dashboard','5aa81def-fb52-4e5f-b5e8-898eb404bbed'),('Provider Management Dashboard - View Historical','Allows access to viewing historical patient (if user has view patients right) and supervisee information on the provider management dashboard','696cce33-c959-48e3-afa2-c2b04b4bf328'),('Provider Management Dashboard - View Patients','Allows access to viewing patient information on the provider management dashboard','a7ed7c2b-63a4-427d-af63-2b4e498ef31e'),('Provider Management Dashboard - View Providers','Allows access to viewing provider information on the provider management dashboard','e0c8d46b-f8aa-4df7-ae07-5fed06c6ea99'),('Purge Field Types','Able to purge field types','129aa612-440a-11e6-a65c-00e04c680037'),('Remove Allergies','Remove allergies','27cb9394-d387-4d7f-81e3-297debcd31f4'),('Remove Problems','Remove problems','b6f4d61f-fe31-48ac-9cb4-bae94f459053'),('Request Appointments','Ability to request new appointments','91718896-bb0d-467e-8036-0d846d9d6aef'),('Run Reports','Schedule the running of a report','1eb357fa-8441-4c63-98cd-e0b54d80cc4d'),('Schedule Appointments','Ability to schedule new appointments','09f8ffd4-f4b3-410c-8fba-24f210a79d39'),('Share Metadata','Allows user to export and import metadata','3a4463b8-2497-4229-964c-032e3e2b899f'),('Squeezing Appointments','Ability to override the constraints and schedule appointments into full slots','10c260a6-45fd-48a6-bd23-d2e4696cbfac'),('Task: appointmentschedulingui.bookAppointments','Ability book appointments, cancel appointments, and flag appointments as needs reschedule; Access to the Manage Rescheduled app','888f465e-c7e3-4bc3-a905-9816ecc531e7'),('Task: appointmentschedulingui.overbookAppointments','Ability to overbook time slots','3434827f-2894-49f8-9c4d-878a92082d39'),('Task: appointmentschedulingui.requestAppointments','Ability to request an appointment for a patient','39dafe30-9b6e-4647-8097-9ad3ab8e2748'),('Task: appointmentschedulingui.viewConfidential','Ability to see details of confidential appointments (you also need View Appointments privileges)','decde3ac-1296-4ccd-a1b4-727a71968bfb'),('Task: coreapps.createRetrospectiveVisit','Able to create a retrospective visit','81c1d5b8-dfed-4d9f-8c71-75a0823b0708'),('Task: coreapps.createVisit','Able to create a visit','922c9dcb-8356-4d66-90d8-246b3d460592'),('Task: coreapps.deletePatient','Able to delete a patient','28f8ca05-27ff-4c60-93a7-e2de707cf7b8'),('Task: coreapps.deletePatientProgram','Ability to delete a patient program via the program status widget','aed04073-aa5d-43a2-b814-3a368340b06a'),('Task: coreapps.editPatientProgram','Ability to edit a patient program via the program status widget','f0befea3-7652-41b6-bd86-46097c9ede17'),('Task: coreapps.editRelationships','Able to edit relationships','c55e0c65-e466-4897-9fe6-c990b5021751'),('Task: coreapps.endVisit','Able to end a visit','b3d8e3e2-ca32-40b2-933e-ff2fb7ba88a5'),('Task: coreapps.enrollInProgram','Ability to enroll a patient in a program via the program status widget','5d3e6418-4bdf-437f-8448-7d5cf33ded1b'),('Task: coreapps.markPatientDead','Ability to Mark a patient dead/deceased.','103704c4-ddd8-4f86-b34b-1603e0d5a683'),('Task: coreapps.mergeVisits','Able to merge visits','8d179610-9c63-433a-bd05-ee3a2b5cf7be'),('Task: Manage Condition Lists','Able to activate/inactivate/void condition lists.','97dcce58-06a0-464d-a285-52ebed879f7d'),('Task: Modify Allergies','Able to add, edit, delete allergies','d9a980c5-0229-479e-b0ed-96a4dde2cc94'),('Update Appointment Status','Ability to modify appointment states','91a1d3ba-6c12-4fe7-a347-20d6dd7e8aae'),('Update HL7 Inbound Archive','Able to update an HL7 archive item','e85bf2ff-319c-41a7-833f-4a3a51eb9cdf'),('Update HL7 Inbound Exception','Able to update an HL7 archive item','1f1ca308-60f3-4533-834c-15ee6d9d59a2'),('Update HL7 Inbound Queue','Able to update an HL7 Queue item','5ec6d080-c576-48c2-b289-b46b1266d4ec'),('Update HL7 Source','Able to update an HL7 Source','674c571b-dc22-4950-a2ad-276f867ed9d9'),('Upload Batch of Identifiers','Allows user to upload a batch of identifiers','c708e6cc-c090-40d8-98ba-36045e4f863d'),('Upload XSN','Allows user to upload/overwrite the XSNs defined for forms','129aa63c-440a-11e6-a65c-00e04c680037'),('View Administration Functions','Able to view the \'Administration\' link in the navigation bar','129aa661-440a-11e6-a65c-00e04c680037'),('View Allergies','Able to view allergies in OpenMRS','129aa68c-440a-11e6-a65c-00e04c680037'),('View Appointment Types','Ability to view appointment types','dc710639-5eca-49f6-972a-3f8fa9a505d1'),('View Appointments','Ability to view appointments','b930a6d2-0470-4995-8304-7ef8cb56e544'),('View Appointments Blocks','Ability to view the appointment blocks','70178056-5c0f-4491-884a-745740846725'),('View Appointments Statistics','Ability to view the appointments statistics page','1cede5dd-3da0-4eef-9f28-a413903b4858'),('View Calculations','Allows to view Calculations','3395ccfb-6628-49f9-a6b8-4f0e278c69a4'),('View Concept Classes','Able to view concept classes','129aa7b0-440a-11e6-a65c-00e04c680037'),('View Concept Datatypes','Able to view concept datatypes','129aa7dc-440a-11e6-a65c-00e04c680037'),('View Concept Map Types','Able to view concept map types','cb04f1fc-edde-42e3-896c-9d0aa77fab9c'),('View Concept Proposals','Able to view concept proposals to the system','129aa805-440a-11e6-a65c-00e04c680037'),('View Concept Reference Terms','Able to view concept reference terms','3c75e763-6a1b-4e2b-807e-fdb4da56ffb9'),('View Concept Sources','Able to view concept sources','129aa82c-440a-11e6-a65c-00e04c680037'),('View Concepts','Able to view concept entries','129aa850-440a-11e6-a65c-00e04c680037'),('View Data Entry Statistics','Able to view data entry statistics from the admin screen','129aa875-440a-11e6-a65c-00e04c680037'),('View Database Changes','Able to view database changes from the admin screen','1fa3f3a5-8352-49c9-a5e5-9c7775435fde'),('View Encounter Roles','Able to view encounter roles','404919ba-2342-406a-aa77-1a534fcb22c9'),('View Encounter Types','Able to view encounter types','129aa89c-440a-11e6-a65c-00e04c680037'),('View Encounters','Able to view patient encounters','129aa8c1-440a-11e6-a65c-00e04c680037'),('View Field Types','Able to view field types','129aa8e5-440a-11e6-a65c-00e04c680037'),('View Forms','Able to view forms','129aa90b-440a-11e6-a65c-00e04c680037'),('View Global Properties','Able to view global properties on the administration screen','129aa92f-440a-11e6-a65c-00e04c680037'),('View HL7 Inbound Archive','Able to view an HL7 archive item','9b73181b-921a-4e41-adeb-baa8c9cf91dd'),('View HL7 Inbound Exception','Able to view an HL7 archive item','bcaa6134-30d5-4faf-8aba-2faf522baf0e'),('View HL7 Inbound Queue','Able to view an HL7 Queue item','c8f22ace-31c3-422f-98fe-4dba4eb928d1'),('View HL7 Source','Able to view an HL7 Source','e17e9f4a-72ce-4a9f-8d13-4e2ce6b3b3af'),('View Identifier Types','Able to view patient identifier types','129aa954-440a-11e6-a65c-00e04c680037'),('View Location Attribute Types','Able to view location attribute types','a3df5c70-c951-4c23-a7c8-00167bb6bd1c'),('View Locations','Able to view locations','129aa979-440a-11e6-a65c-00e04c680037'),('View Metadata Via Mapping','Able to view metadata via a mapping','b195ee9b-4c1f-4d94-992c-f8d72366628e'),('View Navigation Menu','Ability to see the navigation menu','129aa99d-440a-11e6-a65c-00e04c680037'),('View Observations','Able to view patient observations','129aa9c2-440a-11e6-a65c-00e04c680037'),('View Order Types','Able to view order types','129aa9e7-440a-11e6-a65c-00e04c680037'),('View Orders','Able to view orders','129aaa0a-440a-11e6-a65c-00e04c680037'),('View Patient Appointment History','Ability to view the appointment history tab on the patient\'s dashboard','6e82bcd9-9c18-43ca-8966-6978abe78676'),('View Patient Cohorts','Able to view patient cohorts','129aaa2e-440a-11e6-a65c-00e04c680037'),('View Patient Identifiers','Able to view patient identifiers','129aaa54-440a-11e6-a65c-00e04c680037'),('View Patient Programs','Able to see which programs that patients are in','129aaa7b-440a-11e6-a65c-00e04c680037'),('View Patients','Able to view patients','129aaaa0-440a-11e6-a65c-00e04c680037'),('View People','Able to view person objects','129aaac5-440a-11e6-a65c-00e04c680037'),('View Person Attribute Types','Able to view person attribute types','129aaaeb-440a-11e6-a65c-00e04c680037'),('View Privileges','Able to view user privileges','129aab11-440a-11e6-a65c-00e04c680037'),('View Problems','Able to view problems in OpenMRS','129aab35-440a-11e6-a65c-00e04c680037'),('View Programs','Able to view patient programs','129aab59-440a-11e6-a65c-00e04c680037'),('View Provider Schedules','Ability to View Provider Schedules','b89f64cf-fc00-4d81-86b1-bafac668c5c9'),('View Providers','Able to view Provider','8202e173-7d10-4da9-b279-424f056ee7ec'),('View Relationship Types','Able to view relationship types','129aab7d-440a-11e6-a65c-00e04c680037'),('View Relationships','Able to view relationships','129aaba4-440a-11e6-a65c-00e04c680037'),('View Report Objects','Able to view report objects','129aabc8-440a-11e6-a65c-00e04c680037'),('View Reports','Able to view reports','129aabee-440a-11e6-a65c-00e04c680037'),('View RESTWS','Gives access to RESTWS in administration','35473549-b4cc-41e4-bc1c-8da6585c836c'),('View Roles','Able to view user roles','129aac14-440a-11e6-a65c-00e04c680037'),('View Rule Definitions','Allows viewing of user-defined rules. (This privilege is not necessary to run rules under normal usage.)','ee1809f0-b147-4947-8793-2c324ce9b1e0'),('View Token Registrations','Allows to view token registrations','011f5d5b-6668-47e7-bb3a-6635fd880bd7'),('View Unpublished Forms','Able to view and fill out unpublished forms','129aac3a-440a-11e6-a65c-00e04c680037'),('View Users','Able to view users in OpenMRS','129aac63-440a-11e6-a65c-00e04c680037'),('View Visit Attribute Types','Able to view visit attribute types','6ed39527-c5e0-4267-afb2-263dcd2c300b'),('View Visit Types','Able to view visit types','f82294e8-57d5-4f05-9b3e-05671ad5da20'),('View Visits','Able to view visits','0b67ced8-a59c-4476-af36-25498b096c8f');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `outcomes_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_uuid_index` (`uuid`),
  KEY `user_who_changed_program` (`changed_by`),
  KEY `program_concept` (`concept_id`),
  KEY `program_creator` (`creator`),
  KEY `program_outcomes_concept_id_fk` (`outcomes_concept_id`),
  CONSTRAINT `program_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_outcomes_concept_id_fk` FOREIGN KEY (`outcomes_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_program` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_attribute_type`
--

DROP TABLE IF EXISTS `program_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_attribute_type` (
  `program_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_attribute_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `program_attribute_type_creator_fk` (`creator`),
  KEY `program_attribute_type_changed_by_fk` (`changed_by`),
  KEY `program_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `program_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_attribute_type`
--

LOCK TABLES `program_attribute_type` WRITE;
/*!40000 ALTER TABLE `program_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow`
--

DROP TABLE IF EXISTS `program_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow` (
  `program_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE KEY `program_workflow_uuid_index` (`uuid`),
  KEY `workflow_changed_by` (`changed_by`),
  KEY `workflow_concept` (`concept_id`),
  KEY `workflow_creator` (`creator`),
  KEY `program_for_workflow` (`program_id`),
  CONSTRAINT `program_for_workflow` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `workflow_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `workflow_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow`
--

LOCK TABLES `program_workflow` WRITE;
/*!40000 ALTER TABLE `program_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow_state`
--

DROP TABLE IF EXISTS `program_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow_state` (
  `program_workflow_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT '0',
  `terminal` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE KEY `program_workflow_state_uuid_index` (`uuid`),
  KEY `state_changed_by` (`changed_by`),
  KEY `state_concept` (`concept_id`),
  KEY `state_creator` (`creator`),
  KEY `workflow_for_state` (`program_workflow_id`),
  CONSTRAINT `state_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_for_state` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow_state`
--

LOCK TABLES `program_workflow_state` WRITE;
/*!40000 ALTER TABLE `program_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  `provider_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_changed_by_fk` (`changed_by`),
  KEY `provider_person_id_fk` (`person_id`),
  KEY `provider_retired_by_fk` (`retired_by`),
  KEY `provider_creator_fk` (`creator`),
  KEY `provider_role_id_fk` (`role_id`),
  KEY `provider_speciality_id_fk` (`speciality_id`),
  KEY `provider_ibfk_1` (`provider_role_id`),
  CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `provider_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `provider_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `provider_speciality_id_fk` FOREIGN KEY (`speciality_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,2,NULL,'UNKNOWN',2,'2023-10-25 10:23:28',NULL,NULL,0,NULL,NULL,NULL,'f9badd80-ab76-11e2-9e96-0800200c9a66',NULL,NULL,NULL);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute`
--

DROP TABLE IF EXISTS `provider_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute` (
  `provider_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_provider_fk` (`provider_id`),
  KEY `provider_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `provider_attribute_creator_fk` (`creator`),
  KEY `provider_attribute_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `provider_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `provider_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute`
--

LOCK TABLES `provider_attribute` WRITE;
/*!40000 ALTER TABLE `provider_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute_type`
--

DROP TABLE IF EXISTS `provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute_type` (
  `provider_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_type_creator_fk` (`creator`),
  KEY `provider_attribute_type_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `provider_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute_type`
--

LOCK TABLES `provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role` (
  `provider_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_role_id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role`
--

LOCK TABLES `providermanagement_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_provider_attribute_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_provider_attribute_type` (
  `provider_role_id` int(11) NOT NULL,
  `provider_attribute_type_id` int(11) NOT NULL,
  KEY `providermanagement_prpat_provider_role_fk` (`provider_role_id`),
  KEY `providermanagement_prpat_provider_attribute_type_fk` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_attribute_type_fk` FOREIGN KEY (`provider_attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_provider_attribute_type`
--

LOCK TABLES `providermanagement_provider_role_provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_relationship_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_relationship_type` (
  `provider_role_id` int(11) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  KEY `providermanagement_provider_role_relationship_type_ibfk_1` (`provider_role_id`),
  KEY `providermanagement_provider_role_relationship_type_ibfk_2` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_2` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_relationship_type`
--

LOCK TABLES `providermanagement_provider_role_relationship_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_supervisee_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_supervisee_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_supervisee_provider_role` (
  `provider_role_id` int(11) NOT NULL,
  `supervisee_provider_role_id` int(11) NOT NULL,
  KEY `providermanagement_prspr_provider_role_fk` (`provider_role_id`),
  KEY `providermanagement_prspr_supervisee_role_fk` (`supervisee_provider_role_id`),
  CONSTRAINT `providermanagement_prspr_supervisee_role_fk` FOREIGN KEY (`supervisee_provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `providermanagement_prspr_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_supervisee_provider_role`
--

LOCK TABLES `providermanagement_provider_role_supervisee_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_provider_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_suggestion` (
  `provider_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_suggestion_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `providermanagement_provider_suggestion_ibfk_1` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_suggestion_ibfk_1` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_suggestion`
--

LOCK TABLES `providermanagement_provider_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_supervision_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_supervision_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_supervision_suggestion` (
  `supervision_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `provider_role_id` int(11) NOT NULL,
  `suggestion_type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`supervision_suggestion_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `providermanagement_supervision_suggestion_ibfk_1` (`provider_role_id`),
  CONSTRAINT `providermanagement_supervision_suggestion_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_supervision_suggestion`
--

LOCK TABLES `providermanagement_supervision_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_order`
--

DROP TABLE IF EXISTS `referral_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_source` int(11) DEFAULT NULL,
  `laterality` varchar(20) DEFAULT NULL,
  `clinical_history` text,
  `frequency` int(11) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `referral_order_location_fk` (`location`),
  KEY `referral_order_frequency_index` (`frequency`),
  KEY `referral_order_specimen_source_index` (`specimen_source`),
  CONSTRAINT `referral_order_location_fk` FOREIGN KEY (`location`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `referral_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `referral_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `referral_order_specimen_source_fk` FOREIGN KEY (`specimen_source`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_order`
--

LOCK TABLES `referral_order` WRITE;
/*!40000 ALTER TABLE `referral_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_a` int(11) NOT NULL,
  `relationship` int(11) NOT NULL DEFAULT '0',
  `person_b` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationship_uuid_index` (`uuid`),
  KEY `relation_creator` (`creator`),
  KEY `person_a_is_person` (`person_a`),
  KEY `person_b_is_person` (`person_b`),
  KEY `relationship_type_id` (`relationship`),
  KEY `relation_voider` (`voided_by`),
  KEY `relationship_changed_by` (`changed_by`),
  CONSTRAINT `person_a_is_person` FOREIGN KEY (`person_a`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_b_is_person` FOREIGN KEY (`person_b`) REFERENCES `person` (`person_id`),
  CONSTRAINT `relationship_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_type_id` FOREIGN KEY (`relationship`) REFERENCES `relationship_type` (`relationship_type_id`),
  CONSTRAINT `relation_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relation_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_type` (
  `relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` varchar(50) NOT NULL,
  `b_is_to_a` varchar(50) NOT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE KEY `relationship_type_uuid_index` (`uuid`),
  KEY `user_who_created_rel` (`creator`),
  KEY `user_who_retired_relationship_type` (`retired_by`),
  KEY `relationship_type_changed_by` (`changed_by`),
  CONSTRAINT `relationship_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_rel` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_relationship_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_type`
--

LOCK TABLES `relationship_type` WRITE;
/*!40000 ALTER TABLE `relationship_type` DISABLE KEYS */;
INSERT INTO `relationship_type` VALUES (1,'Doctor','Patient',0,0,'Relationship from a primary care provider to the patient',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d919b58-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(2,'Sibling','Sibling',0,0,'Relationship between brother/sister, brother/brother, and sister/sister',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a01c-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(3,'Parent','Child',0,0,'Relationship from a mother/father to the child',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a210-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(4,'Aunt/Uncle','Niece/Nephew',0,0,'Relationship from a parent\'s sibling to a child of that parent',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a3dc-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),(5,'Supervisor','Supervisee',0,0,'Provider supervisor to provider supervisee relationship',1,'2023-10-25 10:22:04',0,NULL,NULL,NULL,'2a5f4ff4-a179-4b8a-aa4c-40f71956ebbc',NULL,NULL);
/*!40000 ALTER TABLE `relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_object`
--

DROP TABLE IF EXISTS `report_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_object` (
  `report_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_object_type` varchar(255) NOT NULL,
  `report_object_sub_type` varchar(255) NOT NULL,
  `xml_data` text,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`report_object_id`),
  UNIQUE KEY `report_object_uuid_index` (`uuid`),
  KEY `user_who_changed_report_object` (`changed_by`),
  KEY `report_object_creator` (`creator`),
  KEY `user_who_voided_report_object` (`voided_by`),
  CONSTRAINT `report_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_report_object` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_report_object` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_object`
--

LOCK TABLES `report_object` WRITE;
/*!40000 ALTER TABLE `report_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_schema_xml`
--

DROP TABLE IF EXISTS `report_schema_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_schema_xml` (
  `report_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `xml_data` text NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`report_schema_id`),
  UNIQUE KEY `report_schema_xml_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_schema_xml`
--

LOCK TABLES `report_schema_xml` WRITE;
/*!40000 ALTER TABLE `report_schema_xml` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_schema_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design`
--

DROP TABLE IF EXISTS `reporting_report_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `renderer_type` varchar(255) NOT NULL,
  `properties` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_definition_uuid` char(38) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator_for_reporting_report_design` (`creator`),
  KEY `changed_by_for_reporting_report_design` (`changed_by`),
  KEY `retired_by_for_reporting_report_design` (`retired_by`),
  KEY `report_definition_uuid_for_reporting_report_design` (`report_definition_uuid`),
  CONSTRAINT `changed_by_for_reporting_report_design` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_design` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by_for_reporting_report_design` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design`
--

LOCK TABLES `reporting_report_design` WRITE;
/*!40000 ALTER TABLE `reporting_report_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design_resource`
--

DROP TABLE IF EXISTS `reporting_report_design_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_design_id` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(100) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `contents` longblob,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `report_design_id_for_reporting_report_design_resource` (`report_design_id`),
  KEY `creator_for_reporting_report_design_resource` (`creator`),
  KEY `changed_by_for_reporting_report_design_resource` (`changed_by`),
  KEY `retired_by_for_reporting_report_design_resource` (`retired_by`),
  CONSTRAINT `changed_by_for_reporting_report_design_resource` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_design_resource` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `report_design_id_for_reporting_report_design_resource` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by_for_reporting_report_design_resource` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design_resource`
--

LOCK TABLES `reporting_report_design_resource` WRITE;
/*!40000 ALTER TABLE `reporting_report_design_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_processor`
--

DROP TABLE IF EXISTS `reporting_report_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_processor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `processor_type` varchar(255) NOT NULL,
  `configuration` mediumtext,
  `run_on_success` tinyint(1) NOT NULL DEFAULT '1',
  `run_on_error` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_design_id` int(11) DEFAULT NULL,
  `processor_mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator_for_reporting_report_processor` (`creator`),
  KEY `changed_by_for_reporting_report_processor` (`changed_by`),
  KEY `retired_by_for_reporting_report_processor` (`retired_by`),
  KEY `reporting_report_processor_report_design` (`report_design_id`),
  CONSTRAINT `changed_by_for_reporting_report_processor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_processor` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_report_design` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by_for_reporting_report_processor` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_processor`
--

LOCK TABLES `reporting_report_processor` WRITE;
/*!40000 ALTER TABLE `reporting_report_processor` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_request`
--

DROP TABLE IF EXISTS `reporting_report_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `base_cohort_uuid` char(38) DEFAULT NULL,
  `base_cohort_parameters` text,
  `report_definition_uuid` char(38) NOT NULL,
  `report_definition_parameters` text,
  `renderer_type` varchar(255) NOT NULL,
  `renderer_argument` varchar(255) DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT '0',
  `request_datetime` datetime NOT NULL,
  `priority` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `evaluation_start_datetime` datetime DEFAULT NULL,
  `evaluation_complete_datetime` datetime DEFAULT NULL,
  `render_complete_datetime` datetime DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `process_automatically` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_days_to_preserve` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `requested_by_for_reporting_report_request` (`requested_by`),
  CONSTRAINT `requested_by_for_reporting_report_request` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_request`
--

LOCK TABLES `reporting_report_request` WRITE;
/*!40000 ALTER TABLE `reporting_report_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Anonymous','Privileges for non-authenticated users.','774b2af3-6437-4e5a-a310-547554c7c65c'),('Authenticated','Privileges gained once authentication has been established.','f7fd42ef-880e-40c5-972d-e4ae7c990de2'),('Privilege Level: Full','A role that has all API privileges','ab2160f6-0941-430c-9752-6714353fbd3c'),('Privilege Level: High','A role that has all API privileges except administrative privileges with security implications','f089471c-e00b-468e-96e8-46aea1b339af'),('Provider','All users with the \'Provider\' role will appear as options in the default Infopath ','8d94f280-c2cc-11de-8d13-0010c6dffd0f'),('System Developer','Developers of the OpenMRS .. have additional access to change fundamental structure of the database model.','8d94f852-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `privilege` varchar(255) NOT NULL,
  PRIMARY KEY (`privilege`,`role`),
  KEY `role_privilege_to_role` (`role`),
  CONSTRAINT `privilege_definitions` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `role_privilege_to_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES ('Authenticated','Get Concept Classes'),('Authenticated','Get Concept Datatypes'),('Authenticated','Get Encounter Types'),('Authenticated','Get Field Types'),('Authenticated','Get Global Properties'),('Authenticated','Get Identifier Types'),('Authenticated','Get Locations'),('Authenticated','Get Order Types'),('Authenticated','Get Person Attribute Types'),('Authenticated','Get Privileges'),('Authenticated','Get Relationship Types'),('Authenticated','Get Relationships'),('Authenticated','Get Roles'),('Authenticated','Patient Overview - View Relationships'),('Authenticated','View Concept Classes'),('Authenticated','View Concept Datatypes'),('Authenticated','View Encounter Types'),('Authenticated','View Field Types'),('Authenticated','View Global Properties'),('Authenticated','View Identifier Types'),('Authenticated','View Locations'),('Authenticated','View Order Types'),('Authenticated','View Person Attribute Types'),('Authenticated','View Privileges'),('Authenticated','View Relationship Types'),('Authenticated','View Relationships'),('Authenticated','View Roles'),('Privilege Level: Full','Add Allergies'),('Privilege Level: Full','Add Cohorts'),('Privilege Level: Full','Add Concept Proposals'),('Privilege Level: Full','Add Encounters'),('Privilege Level: Full','Add HL7 Inbound Archive'),('Privilege Level: Full','Add HL7 Inbound Exception'),('Privilege Level: Full','Add HL7 Inbound Queue'),('Privilege Level: Full','Add HL7 Source'),('Privilege Level: Full','Add Observations'),('Privilege Level: Full','Add Orders'),('Privilege Level: Full','Add Patient Identifiers'),('Privilege Level: Full','Add Patient Programs'),('Privilege Level: Full','Add Patients'),('Privilege Level: Full','Add People'),('Privilege Level: Full','Add Problems'),('Privilege Level: Full','Add Relationships'),('Privilege Level: Full','Add Report Objects'),('Privilege Level: Full','Add Reports'),('Privilege Level: Full','Add Users'),('Privilege Level: Full','Add Visits'),('Privilege Level: Full','Assign System Developer Role'),('Privilege Level: Full','Configure Visits'),('Privilege Level: Full','Delete Cohorts'),('Privilege Level: Full','Delete Concept Proposals'),('Privilege Level: Full','Delete Conditions'),('Privilege Level: Full','Delete Diagnoses'),('Privilege Level: Full','Delete Encounters'),('Privilege Level: Full','Delete HL7 Inbound Archive'),('Privilege Level: Full','Delete HL7 Inbound Exception'),('Privilege Level: Full','Delete HL7 Inbound Queue'),('Privilege Level: Full','Delete Notes'),('Privilege Level: Full','Delete Observations'),('Privilege Level: Full','Delete Orders'),('Privilege Level: Full','Delete Patient Identifiers'),('Privilege Level: Full','Delete Patient Programs'),('Privilege Level: Full','Delete Patients'),('Privilege Level: Full','Delete People'),('Privilege Level: Full','Delete Relationships'),('Privilege Level: Full','Delete Report Objects'),('Privilege Level: Full','Delete Reports'),('Privilege Level: Full','Delete Users'),('Privilege Level: Full','Delete Visits'),('Privilege Level: Full','Edit Allergies'),('Privilege Level: Full','Edit Cohorts'),('Privilege Level: Full','Edit Concept Proposals'),('Privilege Level: Full','Edit Conditions'),('Privilege Level: Full','Edit Diagnoses'),('Privilege Level: Full','Edit Encounters'),('Privilege Level: Full','Edit Notes'),('Privilege Level: Full','Edit Observations'),('Privilege Level: Full','Edit Orders'),('Privilege Level: Full','Edit Patient Identifiers'),('Privilege Level: Full','Edit Patient Programs'),('Privilege Level: Full','Edit Patients'),('Privilege Level: Full','Edit People'),('Privilege Level: Full','Edit Problems'),('Privilege Level: Full','Edit Relationships'),('Privilege Level: Full','Edit Report Objects'),('Privilege Level: Full','Edit Reports'),('Privilege Level: Full','Edit User Passwords'),('Privilege Level: Full','Edit Users'),('Privilege Level: Full','Edit Visits'),('Privilege Level: Full','Form Entry'),('Privilege Level: Full','Generate Batch of Identifiers'),('Privilege Level: Full','Get Allergies'),('Privilege Level: Full','Get Care Settings'),('Privilege Level: Full','Get Concept Attribute Types'),('Privilege Level: Full','Get Concept Classes'),('Privilege Level: Full','Get Concept Datatypes'),('Privilege Level: Full','Get Concept Map Types'),('Privilege Level: Full','Get Concept Proposals'),('Privilege Level: Full','Get Concept Reference Terms'),('Privilege Level: Full','Get Concept Sources'),('Privilege Level: Full','Get Concepts'),('Privilege Level: Full','Get Conditions'),('Privilege Level: Full','Get Database Changes'),('Privilege Level: Full','Get Diagnoses'),('Privilege Level: Full','Get Diagnoses Attribute Types'),('Privilege Level: Full','Get Encounter Roles'),('Privilege Level: Full','Get Encounter Types'),('Privilege Level: Full','Get Encounters'),('Privilege Level: Full','Get Field Types'),('Privilege Level: Full','Get Forms'),('Privilege Level: Full','Get Global Properties'),('Privilege Level: Full','Get HL7 Inbound Archive'),('Privilege Level: Full','Get HL7 Inbound Exception'),('Privilege Level: Full','Get HL7 Inbound Queue'),('Privilege Level: Full','Get HL7 Source'),('Privilege Level: Full','Get Identifier Types'),('Privilege Level: Full','Get Location Attribute Types'),('Privilege Level: Full','Get Locations'),('Privilege Level: Full','Get Notes'),('Privilege Level: Full','Get Observations'),('Privilege Level: Full','Get Order Frequencies'),('Privilege Level: Full','Get Order Set Attribute Types'),('Privilege Level: Full','Get Order Sets'),('Privilege Level: Full','Get Order Types'),('Privilege Level: Full','Get Orders'),('Privilege Level: Full','Get Patient Cohorts'),('Privilege Level: Full','Get Patient Identifiers'),('Privilege Level: Full','Get Patient Programs'),('Privilege Level: Full','Get Patients'),('Privilege Level: Full','Get People'),('Privilege Level: Full','Get Person Attribute Types'),('Privilege Level: Full','Get Privileges'),('Privilege Level: Full','Get Problems'),('Privilege Level: Full','Get Programs'),('Privilege Level: Full','Get Providers'),('Privilege Level: Full','Get Relationship Types'),('Privilege Level: Full','Get Relationships'),('Privilege Level: Full','Get Roles'),('Privilege Level: Full','Get Users'),('Privilege Level: Full','Get Visit Attribute Types'),('Privilege Level: Full','Get Visit Types'),('Privilege Level: Full','Get Visits'),('Privilege Level: Full','Manage Address Hierarchy'),('Privilege Level: Full','Manage Address Templates'),('Privilege Level: Full','Manage Alerts'),('Privilege Level: Full','Manage Appointment Types'),('Privilege Level: Full','Manage Appointments Settings'),('Privilege Level: Full','Manage Auto Generation Options'),('Privilege Level: Full','Manage Cohort Definitions'),('Privilege Level: Full','Manage Concept Attribute Types'),('Privilege Level: Full','Manage Concept Classes'),('Privilege Level: Full','Manage Concept Datatypes'),('Privilege Level: Full','Manage Concept Map Types'),('Privilege Level: Full','Manage Concept Name tags'),('Privilege Level: Full','Manage Concept Reference Terms'),('Privilege Level: Full','Manage Concept Sources'),('Privilege Level: Full','Manage Concept Stop Words'),('Privilege Level: Full','Manage Concepts'),('Privilege Level: Full','Manage Data Set Definitions'),('Privilege Level: Full','Manage Dimension Definitions'),('Privilege Level: Full','Manage Encounter Roles'),('Privilege Level: Full','Manage Encounter Types'),('Privilege Level: Full','Manage Field Types'),('Privilege Level: Full','Manage FormEntry XSN'),('Privilege Level: Full','Manage Forms'),('Privilege Level: Full','Manage Global Properties'),('Privilege Level: Full','Manage HL7 Messages'),('Privilege Level: Full','Manage Identifier Sources'),('Privilege Level: Full','Manage Identifier Types'),('Privilege Level: Full','Manage Implementation Id'),('Privilege Level: Full','Manage Indicator Definitions'),('Privilege Level: Full','Manage Location Attribute Types'),('Privilege Level: Full','Manage Location Tags'),('Privilege Level: Full','Manage Locations'),('Privilege Level: Full','Manage Metadata Mapping'),('Privilege Level: Full','Manage Modules'),('Privilege Level: Full','Manage Order Frequencies'),('Privilege Level: Full','Manage Order Set Attribute Types'),('Privilege Level: Full','Manage Order Sets'),('Privilege Level: Full','Manage Order Types'),('Privilege Level: Full','Manage OWA'),('Privilege Level: Full','Manage Person Attribute Types'),('Privilege Level: Full','Manage Privileges'),('Privilege Level: Full','Manage Programs'),('Privilege Level: Full','Manage Provider Schedules'),('Privilege Level: Full','Manage Providers'),('Privilege Level: Full','Manage Relationship Types'),('Privilege Level: Full','Manage Relationships'),('Privilege Level: Full','Manage Report Definitions'),('Privilege Level: Full','Manage Report Designs'),('Privilege Level: Full','Manage Reports'),('Privilege Level: Full','Manage RESTWS'),('Privilege Level: Full','Manage Roles'),('Privilege Level: Full','Manage Rule Definitions'),('Privilege Level: Full','Manage Scheduled Report Tasks'),('Privilege Level: Full','Manage Scheduler'),('Privilege Level: Full','Manage Search Index'),('Privilege Level: Full','Manage Token Registrations'),('Privilege Level: Full','Manage Tokens'),('Privilege Level: Full','Manage Visit Attribute Types'),('Privilege Level: Full','Manage Visit Types'),('Privilege Level: Full','Patient Dashboard - View Demographics Section'),('Privilege Level: Full','Patient Dashboard - View Encounters Section'),('Privilege Level: Full','Patient Dashboard - View Forms Section'),('Privilege Level: Full','Patient Dashboard - View Graphs Section'),('Privilege Level: Full','Patient Dashboard - View Overview Section'),('Privilege Level: Full','Patient Dashboard - View Patient Summary'),('Privilege Level: Full','Patient Dashboard - View Regimen Section'),('Privilege Level: Full','Patient Dashboard - View Visits Section'),('Privilege Level: Full','Patient Overview - View Allergies'),('Privilege Level: Full','Patient Overview - View Patient Actions'),('Privilege Level: Full','Patient Overview - View Problem List'),('Privilege Level: Full','Patient Overview - View Programs'),('Privilege Level: Full','Patient Overview - View Relationships'),('Privilege Level: Full','Preview Forms'),('Privilege Level: Full','Provider Management - Admin'),('Privilege Level: Full','Provider Management API'),('Privilege Level: Full','Provider Management API - Read-only'),('Privilege Level: Full','Provider Management Dashboard - Edit Patients'),('Privilege Level: Full','Provider Management Dashboard - Edit Providers'),('Privilege Level: Full','Provider Management Dashboard - View Historical'),('Privilege Level: Full','Provider Management Dashboard - View Patients'),('Privilege Level: Full','Provider Management Dashboard - View Providers'),('Privilege Level: Full','Purge Field Types'),('Privilege Level: Full','Remove Allergies'),('Privilege Level: Full','Remove Problems'),('Privilege Level: Full','Request Appointments'),('Privilege Level: Full','Run Reports'),('Privilege Level: Full','Schedule Appointments'),('Privilege Level: Full','Share Metadata'),('Privilege Level: Full','Squeezing Appointments'),('Privilege Level: Full','Update Appointment Status'),('Privilege Level: Full','Update HL7 Inbound Archive'),('Privilege Level: Full','Update HL7 Inbound Exception'),('Privilege Level: Full','Update HL7 Inbound Queue'),('Privilege Level: Full','Update HL7 Source'),('Privilege Level: Full','Upload Batch of Identifiers'),('Privilege Level: Full','Upload XSN'),('Privilege Level: Full','View Administration Functions'),('Privilege Level: Full','View Allergies'),('Privilege Level: Full','View Appointment Types'),('Privilege Level: Full','View Appointments'),('Privilege Level: Full','View Appointments Blocks'),('Privilege Level: Full','View Appointments Statistics'),('Privilege Level: Full','View Calculations'),('Privilege Level: Full','View Concept Classes'),('Privilege Level: Full','View Concept Datatypes'),('Privilege Level: Full','View Concept Map Types'),('Privilege Level: Full','View Concept Proposals'),('Privilege Level: Full','View Concept Reference Terms'),('Privilege Level: Full','View Concept Sources'),('Privilege Level: Full','View Concepts'),('Privilege Level: Full','View Data Entry Statistics'),('Privilege Level: Full','View Database Changes'),('Privilege Level: Full','View Encounter Roles'),('Privilege Level: Full','View Encounter Types'),('Privilege Level: Full','View Encounters'),('Privilege Level: Full','View Field Types'),('Privilege Level: Full','View Forms'),('Privilege Level: Full','View Global Properties'),('Privilege Level: Full','View HL7 Inbound Archive'),('Privilege Level: Full','View HL7 Inbound Exception'),('Privilege Level: Full','View HL7 Inbound Queue'),('Privilege Level: Full','View HL7 Source'),('Privilege Level: Full','View Identifier Types'),('Privilege Level: Full','View Location Attribute Types'),('Privilege Level: Full','View Locations'),('Privilege Level: Full','View Metadata Via Mapping'),('Privilege Level: Full','View Navigation Menu'),('Privilege Level: Full','View Observations'),('Privilege Level: Full','View Order Types'),('Privilege Level: Full','View Orders'),('Privilege Level: Full','View Patient Appointment History'),('Privilege Level: Full','View Patient Cohorts'),('Privilege Level: Full','View Patient Identifiers'),('Privilege Level: Full','View Patient Programs'),('Privilege Level: Full','View Patients'),('Privilege Level: Full','View People'),('Privilege Level: Full','View Person Attribute Types'),('Privilege Level: Full','View Privileges'),('Privilege Level: Full','View Problems'),('Privilege Level: Full','View Programs'),('Privilege Level: Full','View Provider Schedules'),('Privilege Level: Full','View Providers'),('Privilege Level: Full','View Relationship Types'),('Privilege Level: Full','View Relationships'),('Privilege Level: Full','View Report Objects'),('Privilege Level: Full','View Reports'),('Privilege Level: Full','View RESTWS'),('Privilege Level: Full','View Roles'),('Privilege Level: Full','View Rule Definitions'),('Privilege Level: Full','View Token Registrations'),('Privilege Level: Full','View Unpublished Forms'),('Privilege Level: Full','View Users'),('Privilege Level: Full','View Visit Attribute Types'),('Privilege Level: Full','View Visit Types'),('Privilege Level: Full','View Visits'),('Privilege Level: High','Add Allergies'),('Privilege Level: High','Add Cohorts'),('Privilege Level: High','Add Concept Proposals'),('Privilege Level: High','Add Encounters'),('Privilege Level: High','Add HL7 Inbound Archive'),('Privilege Level: High','Add HL7 Inbound Exception'),('Privilege Level: High','Add HL7 Inbound Queue'),('Privilege Level: High','Add HL7 Source'),('Privilege Level: High','Add Observations'),('Privilege Level: High','Add Orders'),('Privilege Level: High','Add Patient Identifiers'),('Privilege Level: High','Add Patient Programs'),('Privilege Level: High','Add Patients'),('Privilege Level: High','Add People'),('Privilege Level: High','Add Problems'),('Privilege Level: High','Add Relationships'),('Privilege Level: High','Add Users'),('Privilege Level: High','Add Visits'),('Privilege Level: High','Assign System Developer Role'),('Privilege Level: High','Configure Visits'),('Privilege Level: High','Delete Cohorts'),('Privilege Level: High','Delete Concept Proposals'),('Privilege Level: High','Delete Conditions'),('Privilege Level: High','Delete Diagnoses'),('Privilege Level: High','Delete Encounters'),('Privilege Level: High','Delete HL7 Inbound Archive'),('Privilege Level: High','Delete HL7 Inbound Exception'),('Privilege Level: High','Delete HL7 Inbound Queue'),('Privilege Level: High','Delete Notes'),('Privilege Level: High','Delete Observations'),('Privilege Level: High','Delete Orders'),('Privilege Level: High','Delete Patient Identifiers'),('Privilege Level: High','Delete Patient Programs'),('Privilege Level: High','Delete Patients'),('Privilege Level: High','Delete People'),('Privilege Level: High','Delete Relationships'),('Privilege Level: High','Delete Report Objects'),('Privilege Level: High','Delete Reports'),('Privilege Level: High','Delete Users'),('Privilege Level: High','Delete Visits'),('Privilege Level: High','Edit Allergies'),('Privilege Level: High','Edit Cohorts'),('Privilege Level: High','Edit Concept Proposals'),('Privilege Level: High','Edit Conditions'),('Privilege Level: High','Edit Diagnoses'),('Privilege Level: High','Edit Encounters'),('Privilege Level: High','Edit Notes'),('Privilege Level: High','Edit Observations'),('Privilege Level: High','Edit Orders'),('Privilege Level: High','Edit Patient Identifiers'),('Privilege Level: High','Edit Patient Programs'),('Privilege Level: High','Edit Patients'),('Privilege Level: High','Edit People'),('Privilege Level: High','Edit Problems'),('Privilege Level: High','Edit Relationships'),('Privilege Level: High','Edit User Passwords'),('Privilege Level: High','Edit Users'),('Privilege Level: High','Edit Visits'),('Privilege Level: High','Form Entry'),('Privilege Level: High','Generate Batch of Identifiers'),('Privilege Level: High','Get Allergies'),('Privilege Level: High','Get Care Settings'),('Privilege Level: High','Get Concept Attribute Types'),('Privilege Level: High','Get Concept Classes'),('Privilege Level: High','Get Concept Datatypes'),('Privilege Level: High','Get Concept Map Types'),('Privilege Level: High','Get Concept Proposals'),('Privilege Level: High','Get Concept Reference Terms'),('Privilege Level: High','Get Concept Sources'),('Privilege Level: High','Get Concepts'),('Privilege Level: High','Get Conditions'),('Privilege Level: High','Get Database Changes'),('Privilege Level: High','Get Diagnoses'),('Privilege Level: High','Get Diagnoses Attribute Types'),('Privilege Level: High','Get Encounter Roles'),('Privilege Level: High','Get Encounter Types'),('Privilege Level: High','Get Encounters'),('Privilege Level: High','Get Field Types'),('Privilege Level: High','Get Forms'),('Privilege Level: High','Get Global Properties'),('Privilege Level: High','Get HL7 Inbound Archive'),('Privilege Level: High','Get HL7 Inbound Exception'),('Privilege Level: High','Get HL7 Inbound Queue'),('Privilege Level: High','Get HL7 Source'),('Privilege Level: High','Get Identifier Types'),('Privilege Level: High','Get Location Attribute Types'),('Privilege Level: High','Get Locations'),('Privilege Level: High','Get Notes'),('Privilege Level: High','Get Observations'),('Privilege Level: High','Get Order Frequencies'),('Privilege Level: High','Get Order Set Attribute Types'),('Privilege Level: High','Get Order Sets'),('Privilege Level: High','Get Order Types'),('Privilege Level: High','Get Orders'),('Privilege Level: High','Get Patient Cohorts'),('Privilege Level: High','Get Patient Identifiers'),('Privilege Level: High','Get Patient Programs'),('Privilege Level: High','Get Patients'),('Privilege Level: High','Get People'),('Privilege Level: High','Get Person Attribute Types'),('Privilege Level: High','Get Privileges'),('Privilege Level: High','Get Problems'),('Privilege Level: High','Get Programs'),('Privilege Level: High','Get Providers'),('Privilege Level: High','Get Relationship Types'),('Privilege Level: High','Get Relationships'),('Privilege Level: High','Get Roles'),('Privilege Level: High','Get Users'),('Privilege Level: High','Get Visit Attribute Types'),('Privilege Level: High','Get Visit Types'),('Privilege Level: High','Get Visits'),('Privilege Level: High','Manage Address Hierarchy'),('Privilege Level: High','Manage Address Templates'),('Privilege Level: High','Manage Alerts'),('Privilege Level: High','Manage Appointment Types'),('Privilege Level: High','Manage Appointments Settings'),('Privilege Level: High','Manage Auto Generation Options'),('Privilege Level: High','Manage Cohort Definitions'),('Privilege Level: High','Manage Concept Attribute Types'),('Privilege Level: High','Manage Concept Classes'),('Privilege Level: High','Manage Concept Datatypes'),('Privilege Level: High','Manage Concept Map Types'),('Privilege Level: High','Manage Concept Name tags'),('Privilege Level: High','Manage Concept Reference Terms'),('Privilege Level: High','Manage Concept Sources'),('Privilege Level: High','Manage Concept Stop Words'),('Privilege Level: High','Manage Concepts'),('Privilege Level: High','Manage Data Set Definitions'),('Privilege Level: High','Manage Dimension Definitions'),('Privilege Level: High','Manage Encounter Roles'),('Privilege Level: High','Manage Encounter Types'),('Privilege Level: High','Manage Field Types'),('Privilege Level: High','Manage FormEntry XSN'),('Privilege Level: High','Manage Forms'),('Privilege Level: High','Manage Global Properties'),('Privilege Level: High','Manage HL7 Messages'),('Privilege Level: High','Manage Identifier Sources'),('Privilege Level: High','Manage Identifier Types'),('Privilege Level: High','Manage Implementation Id'),('Privilege Level: High','Manage Indicator Definitions'),('Privilege Level: High','Manage Location Attribute Types'),('Privilege Level: High','Manage Location Tags'),('Privilege Level: High','Manage Locations'),('Privilege Level: High','Manage Metadata Mapping'),('Privilege Level: High','Manage Modules'),('Privilege Level: High','Manage Order Frequencies'),('Privilege Level: High','Manage Order Set Attribute Types'),('Privilege Level: High','Manage Order Sets'),('Privilege Level: High','Manage Order Types'),('Privilege Level: High','Manage OWA'),('Privilege Level: High','Manage Person Attribute Types'),('Privilege Level: High','Manage Programs'),('Privilege Level: High','Manage Provider Schedules'),('Privilege Level: High','Manage Providers'),('Privilege Level: High','Manage Relationship Types'),('Privilege Level: High','Manage Relationships'),('Privilege Level: High','Manage Report Definitions'),('Privilege Level: High','Manage Report Designs'),('Privilege Level: High','Manage Reports'),('Privilege Level: High','Manage RESTWS'),('Privilege Level: High','Manage Roles'),('Privilege Level: High','Manage Rule Definitions'),('Privilege Level: High','Manage Scheduled Report Tasks'),('Privilege Level: High','Manage Scheduler'),('Privilege Level: High','Manage Search Index'),('Privilege Level: High','Manage Token Registrations'),('Privilege Level: High','Manage Tokens'),('Privilege Level: High','Manage Visit Attribute Types'),('Privilege Level: High','Manage Visit Types'),('Privilege Level: High','Patient Dashboard - View Demographics Section'),('Privilege Level: High','Patient Dashboard - View Encounters Section'),('Privilege Level: High','Patient Dashboard - View Forms Section'),('Privilege Level: High','Patient Dashboard - View Graphs Section'),('Privilege Level: High','Patient Dashboard - View Overview Section'),('Privilege Level: High','Patient Dashboard - View Patient Summary'),('Privilege Level: High','Patient Dashboard - View Regimen Section'),('Privilege Level: High','Patient Dashboard - View Visits Section'),('Privilege Level: High','Patient Overview - View Allergies'),('Privilege Level: High','Patient Overview - View Patient Actions'),('Privilege Level: High','Patient Overview - View Problem List'),('Privilege Level: High','Patient Overview - View Programs'),('Privilege Level: High','Patient Overview - View Relationships'),('Privilege Level: High','Preview Forms'),('Privilege Level: High','Provider Management - Admin'),('Privilege Level: High','Provider Management API'),('Privilege Level: High','Provider Management API - Read-only'),('Privilege Level: High','Provider Management Dashboard - Edit Patients'),('Privilege Level: High','Provider Management Dashboard - Edit Providers'),('Privilege Level: High','Provider Management Dashboard - View Historical'),('Privilege Level: High','Provider Management Dashboard - View Patients'),('Privilege Level: High','Provider Management Dashboard - View Providers'),('Privilege Level: High','Purge Field Types'),('Privilege Level: High','Remove Allergies'),('Privilege Level: High','Remove Problems'),('Privilege Level: High','Request Appointments'),('Privilege Level: High','Run Reports'),('Privilege Level: High','Schedule Appointments'),('Privilege Level: High','Squeezing Appointments'),('Privilege Level: High','Update Appointment Status'),('Privilege Level: High','Update HL7 Inbound Archive'),('Privilege Level: High','Update HL7 Inbound Exception'),('Privilege Level: High','Update HL7 Inbound Queue'),('Privilege Level: High','Update HL7 Source'),('Privilege Level: High','Upload Batch of Identifiers'),('Privilege Level: High','Upload XSN'),('Privilege Level: High','View Administration Functions'),('Privilege Level: High','View Allergies'),('Privilege Level: High','View Appointment Types'),('Privilege Level: High','View Appointments'),('Privilege Level: High','View Appointments Blocks'),('Privilege Level: High','View Appointments Statistics'),('Privilege Level: High','View Calculations'),('Privilege Level: High','View Concept Classes'),('Privilege Level: High','View Concept Datatypes'),('Privilege Level: High','View Concept Map Types'),('Privilege Level: High','View Concept Proposals'),('Privilege Level: High','View Concept Reference Terms'),('Privilege Level: High','View Concept Sources'),('Privilege Level: High','View Concepts'),('Privilege Level: High','View Data Entry Statistics'),('Privilege Level: High','View Database Changes'),('Privilege Level: High','View Encounter Roles'),('Privilege Level: High','View Encounter Types'),('Privilege Level: High','View Encounters'),('Privilege Level: High','View Field Types'),('Privilege Level: High','View Forms'),('Privilege Level: High','View Global Properties'),('Privilege Level: High','View HL7 Inbound Archive'),('Privilege Level: High','View HL7 Inbound Exception'),('Privilege Level: High','View HL7 Inbound Queue'),('Privilege Level: High','View HL7 Source'),('Privilege Level: High','View Identifier Types'),('Privilege Level: High','View Location Attribute Types'),('Privilege Level: High','View Locations'),('Privilege Level: High','View Metadata Via Mapping'),('Privilege Level: High','View Navigation Menu'),('Privilege Level: High','View Observations'),('Privilege Level: High','View Order Types'),('Privilege Level: High','View Orders'),('Privilege Level: High','View Patient Appointment History'),('Privilege Level: High','View Patient Cohorts'),('Privilege Level: High','View Patient Identifiers'),('Privilege Level: High','View Patient Programs'),('Privilege Level: High','View Patients'),('Privilege Level: High','View People'),('Privilege Level: High','View Person Attribute Types'),('Privilege Level: High','View Privileges'),('Privilege Level: High','View Problems'),('Privilege Level: High','View Programs'),('Privilege Level: High','View Provider Schedules'),('Privilege Level: High','View Providers'),('Privilege Level: High','View Relationship Types'),('Privilege Level: High','View Relationships'),('Privilege Level: High','View Report Objects'),('Privilege Level: High','View Reports'),('Privilege Level: High','View RESTWS'),('Privilege Level: High','View Roles'),('Privilege Level: High','View Rule Definitions'),('Privilege Level: High','View Token Registrations'),('Privilege Level: High','View Unpublished Forms'),('Privilege Level: High','View Users'),('Privilege Level: High','View Visit Attribute Types'),('Privilege Level: High','View Visit Types'),('Privilege Level: High','View Visits');
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `parent_role` varchar(50) NOT NULL DEFAULT '',
  `child_role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`,`child_role`),
  KEY `inherited_role` (`child_role`),
  CONSTRAINT `inherited_role` FOREIGN KEY (`child_role`) REFERENCES `role` (`role`),
  CONSTRAINT `parent_role` FOREIGN KEY (`parent_role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_role`
--

LOCK TABLES `role_role` WRITE;
/*!40000 ALTER TABLE `role_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config`
--

DROP TABLE IF EXISTS `scheduler_task_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config` (
  `task_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `schedulable_class` text,
  `start_time` datetime DEFAULT NULL,
  `start_time_pattern` varchar(50) DEFAULT NULL,
  `repeat_interval` int(11) NOT NULL DEFAULT '0',
  `start_on_startup` tinyint(1) NOT NULL DEFAULT '0',
  `started` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '2005-01-01 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `last_execution_time` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`task_config_id`),
  UNIQUE KEY `scheduler_task_config_uuid_index` (`uuid`),
  KEY `scheduler_changer` (`changed_by`),
  KEY `scheduler_creator` (`created_by`),
  CONSTRAINT `scheduler_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `scheduler_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config`
--

LOCK TABLES `scheduler_task_config` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config` DISABLE KEYS */;
INSERT INTO `scheduler_task_config` VALUES (2,'Auto Close Visits Task','Stops all active visits that match the visit type(s) specified by the value of the global property \'visits.autoCloseVisitType\'','org.openmrs.scheduler.tasks.AutoCloseVisitsTask','2011-11-28 23:59:59','MM/dd/yyyy HH:mm:ss',86400,0,0,1,'2016-07-07 08:14:55',NULL,NULL,NULL,'8c17b376-1a2b-11e1-a51a-00248140a5eb'),(3,'Initialize Logic Rule Providers',NULL,'org.openmrs.logic.task.InitializeLogicRuleProvidersTask','2016-07-07 08:15:37',NULL,1999999999,0,1,2,'2016-07-07 08:15:07',2,'2016-07-07 08:15:38','2016-07-07 08:15:38','eb9e447d-5ef9-4771-9e88-21916340b69c');
/*!40000 ALTER TABLE `scheduler_task_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config_property`
--

DROP TABLE IF EXISTS `scheduler_task_config_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config_property` (
  `task_config_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  `task_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_config_property_id`),
  KEY `task_config_for_property` (`task_config_id`),
  CONSTRAINT `task_config_for_property` FOREIGN KEY (`task_config_id`) REFERENCES `scheduler_task_config` (`task_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config_property`
--

LOCK TABLES `scheduler_task_config_property` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_task_config_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_object`
--

DROP TABLE IF EXISTS `serialized_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialized_object` (
  `serialized_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `serialization_class` varchar(255) NOT NULL,
  `serialized_data` mediumtext NOT NULL,
  `date_created` datetime NOT NULL,
  `creator` int(11) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(1000) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`serialized_object_id`),
  UNIQUE KEY `serialized_object_uuid_index` (`uuid`),
  KEY `serialized_object_creator` (`creator`),
  KEY `serialized_object_changed_by` (`changed_by`),
  KEY `serialized_object_retired_by` (`retired_by`),
  CONSTRAINT `serialized_object_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_object`
--

LOCK TABLES `serialized_object` WRITE;
/*!40000 ALTER TABLE `serialized_object` DISABLE KEYS */;
INSERT INTO `serialized_object` VALUES (1,'appointmentschedulingui.appointmentDataSetDefinition.dailyAppointments','appointmentschedulingui.appointmentDataSetDefinition.dailyAppointments','org.openmrs.module.reporting.dataset.definition.DataSetDefinition','org.openmrs.module.appointmentscheduling.reporting.dataset.definition.AppointmentDataSetDefinition','org.openmrs.module.reporting.serializer.ReportingSerializer','<org.openmrs.module.appointmentscheduling.reporting.dataset.definition.AppointmentDataSetDefinition id=\"1\" uuid=\"c1bf0730-e69e-11e3-ac10-0800200c9a66\" retired=\"false\">\n  <name>appointmentschedulingui.appointmentDataSetDefinition.dailyAppointments</name>\n  <description>appointmentschedulingui.appointmentDataSetDefinition.dailyAppointments</description>\n  <creator id=\"2\" uuid=\"A4F30A1B-5EB9-11DF-A648-37A07F9C90FB\"/>\n  <dateCreated id=\"3\">2023-10-25 08:27:10 UTC</dateCreated>\n  <changedBy reference=\"2\"/>\n  <dateChanged id=\"4\">2023-10-25 08:27:10 UTC</dateChanged>\n  <parameters id=\"5\">\n    <org.openmrs.module.reporting.evaluation.parameter.Parameter id=\"6\">\n      <name>date</name>\n      <label>date</label>\n      <type>java.util.Date</type>\n      <required>true</required>\n    </org.openmrs.module.reporting.evaluation.parameter.Parameter>\n    <org.openmrs.module.reporting.evaluation.parameter.Parameter id=\"7\">\n      <name>location</name>\n      <label>location</label>\n      <type>org.openmrs.Location</type>\n      <required>true</required>\n    </org.openmrs.module.reporting.evaluation.parameter.Parameter>\n  </parameters>\n  <id>1</id>\n  <columnDefinitions id=\"8\">\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"9\" uuid=\"c8b255b8-11d2-4e22-9510-fa62483c8e06\" retired=\"false\">\n      <name>identifier</name>\n      <parameters id=\"10\"/>\n      <dataDefinition id=\"11\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.PatientToAppointmentDataDefinition\" id=\"12\" uuid=\"441cd43e-91c6-48c9-bec9-b67c7c5aeff3\" retired=\"false\">\n          <parameters id=\"13\"/>\n          <joinedDefinition class=\"org.openmrs.module.reporting.data.patient.definition.PatientIdentifierDataDefinition\" id=\"14\" retired=\"false\">\n            <parameters id=\"15\"/>\n            <types id=\"16\">\n              <patientIdentifierType id=\"17\" uuid=\"05a29f94-c0ed-11e2-94be-8c13b969e334\"/>\n            </types>\n            <includeFirstNonNullOnly>true</includeFirstNonNullOnly>\n          </joinedDefinition>\n        </parameterizable>\n        <parameterMappings id=\"18\"/>\n        <converters id=\"19\">\n          <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"20\">\n            <typeToConvert>org.openmrs.PatientIdentifier</typeToConvert>\n            <propertyName>identifier</propertyName>\n          </org.openmrs.module.reporting.data.converter.PropertyConverter>\n          <org.openmrs.module.reporting.data.converter.ObjectFormatter id=\"21\"/>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"22\" uuid=\"2f685734-58e0-4532-9521-4de60bc8954a\" retired=\"false\">\n      <name>provider</name>\n      <parameters id=\"23\"/>\n      <dataDefinition id=\"24\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentProviderDataDefinition\" id=\"25\" uuid=\"298dfb6f-a4b0-4be7-9a34-69e03e6272af\" retired=\"false\">\n          <parameters id=\"26\"/>\n        </parameterizable>\n        <parameterMappings id=\"27\"/>\n        <converters id=\"28\">\n          <org.openmrs.module.reporting.data.converter.ObjectFormatter reference=\"21\"/>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"29\" uuid=\"e44f7333-97d0-44c9-a640-4651f59a2dfc\" retired=\"false\">\n      <name>providerUuid</name>\n      <parameters id=\"30\"/>\n      <dataDefinition id=\"31\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentProviderDataDefinition\" id=\"32\" uuid=\"99fa1303-4f12-490c-8332-c27e4ea70ed2\" retired=\"false\">\n          <parameters id=\"33\"/>\n        </parameterizable>\n        <parameterMappings id=\"34\"/>\n        <converters id=\"35\">\n          <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"36\">\n            <typeToConvert>java.lang.String</typeToConvert>\n            <propertyName>uuid</propertyName>\n          </org.openmrs.module.reporting.data.converter.PropertyConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"37\" uuid=\"3f3b73ae-b953-498a-8e0b-7e5f19b995d7\" retired=\"false\">\n      <name>appointmentType</name>\n      <parameters id=\"38\"/>\n      <dataDefinition id=\"39\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentTypeDataDefinition\" id=\"40\" uuid=\"c478b43e-40c0-408d-8123-1d50d6568a35\" retired=\"false\">\n          <parameters id=\"41\"/>\n        </parameterizable>\n        <parameterMappings id=\"42\"/>\n        <converters reference=\"28\"/>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"43\" uuid=\"cf4d301a-1c25-441b-b353-a4c9eab48155\" retired=\"false\">\n      <name>appointmentTypeUuid</name>\n      <parameters id=\"44\"/>\n      <dataDefinition id=\"45\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentTypeDataDefinition\" id=\"46\" uuid=\"0787d1d5-52f7-4d72-9edf-64d9f30036de\" retired=\"false\">\n          <parameters id=\"47\"/>\n        </parameterizable>\n        <parameterMappings id=\"48\"/>\n        <converters id=\"49\">\n          <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"50\">\n            <typeToConvert>java.lang.String</typeToConvert>\n            <propertyName>uuid</propertyName>\n          </org.openmrs.module.reporting.data.converter.PropertyConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"51\" uuid=\"b0d96395-9444-4ca8-afbd-db323a971b34\" retired=\"false\">\n      <name>providerUuid</name>\n      <parameters id=\"52\"/>\n      <dataDefinition id=\"53\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentProviderDataDefinition\" id=\"54\" uuid=\"dead132e-ad7e-4b61-b579-d060a5e77310\" retired=\"false\">\n          <parameters id=\"55\"/>\n        </parameterizable>\n        <parameterMappings id=\"56\"/>\n        <converters id=\"57\">\n          <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"58\">\n            <typeToConvert>java.lang.String</typeToConvert>\n            <propertyName>uuid</propertyName>\n          </org.openmrs.module.reporting.data.converter.PropertyConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"59\" uuid=\"53ffde15-dc2a-40fb-a0f7-ed5fed6c1510\" retired=\"false\">\n      <name>statusType</name>\n      <parameters id=\"60\"/>\n      <dataDefinition id=\"61\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentStatusDataDefinition\" id=\"62\" uuid=\"a5b9e220-b6a5-4ce7-ad97-58e4361f14ce\" retired=\"false\">\n          <parameters id=\"63\"/>\n        </parameterizable>\n        <parameterMappings id=\"64\"/>\n        <converters id=\"65\">\n          <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"66\">\n            <typeToConvert>org.openmrs.module.appointmentscheduling.Appointment$AppointmentStatusType</typeToConvert>\n            <propertyName>type</propertyName>\n          </org.openmrs.module.reporting.data.converter.PropertyConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"67\" uuid=\"6b4bde43-fbdd-40f1-bc32-a41a98606bb2\" retired=\"false\">\n      <name>localizedStatusType</name>\n      <parameters id=\"68\"/>\n      <dataDefinition id=\"69\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentStatusDataDefinition\" id=\"70\" uuid=\"9d515dc3-4cb2-4b8b-a4d9-166b5df91a1d\" retired=\"false\">\n          <parameters id=\"71\"/>\n        </parameterizable>\n        <parameterMappings id=\"72\"/>\n        <converters id=\"73\">\n          <org.openmrs.module.appointmentschedulingui.reporting.converter.AppointmentStatusToLocalizedStatusTypeConverter id=\"74\"/>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"75\" uuid=\"1b62b01e-3dce-41c6-8514-46e3021ca134\" retired=\"false\">\n      <name>patientName</name>\n      <parameters id=\"76\"/>\n      <dataDefinition id=\"77\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.PersonToAppointmentDataDefinition\" id=\"78\" uuid=\"7a51226a-2561-4b7e-92e8-e1c21e13a25a\" retired=\"false\">\n          <parameters id=\"79\"/>\n          <joinedDefinition class=\"org.openmrs.module.reporting.data.person.definition.PreferredNameDataDefinition\" id=\"80\" retired=\"false\">\n            <parameters id=\"81\"/>\n          </joinedDefinition>\n        </parameterizable>\n        <parameterMappings id=\"82\"/>\n        <converters reference=\"28\"/>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"83\" uuid=\"2543971b-b9c8-47d3-93d6-164b2f8eb8ec\" retired=\"false\">\n      <name>startDatetime</name>\n      <parameters id=\"84\"/>\n      <dataDefinition id=\"85\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentStartDateDataDefinition\" id=\"86\" uuid=\"1eb85849-3dad-4b72-a4be-ebc2e91f57aa\" retired=\"false\">\n          <parameters id=\"87\"/>\n        </parameterizable>\n        <parameterMappings id=\"88\"/>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"89\" uuid=\"13915224-ce19-411b-b722-56e6bbf3703e\" retired=\"false\">\n      <name>startTimeFormatted</name>\n      <parameters id=\"90\"/>\n      <dataDefinition id=\"91\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentStartDateDataDefinition\" id=\"92\" uuid=\"fefa1bf6-1e8b-401a-b6c3-b525054f6c2c\" retired=\"false\">\n          <parameters id=\"93\"/>\n        </parameterizable>\n        <parameterMappings id=\"94\"/>\n        <converters id=\"95\">\n          <org.openmrs.module.reporting.data.converter.DateConverter id=\"96\">\n            <dateFormat>hh:mm aa</dateFormat>\n          </org.openmrs.module.reporting.data.converter.DateConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"97\" uuid=\"eb69aa84-a937-4cec-a80d-4d8b5679c48d\" retired=\"false\">\n      <name>endTimeFormatted</name>\n      <parameters id=\"98\"/>\n      <dataDefinition id=\"99\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentEndDateDataDefinition\" id=\"100\" uuid=\"3ad5bda7-7883-483e-ae99-fb004b0f52fe\" retired=\"false\">\n          <parameters id=\"101\"/>\n        </parameterizable>\n        <parameterMappings id=\"102\"/>\n        <converters id=\"103\">\n          <org.openmrs.module.reporting.data.converter.DateConverter id=\"104\">\n            <dateFormat>hh:mm aa</dateFormat>\n          </org.openmrs.module.reporting.data.converter.DateConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n    <org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition id=\"105\" uuid=\"9c528124-2b8f-4459-ac76-5d8269536852\" retired=\"false\">\n      <name>creator</name>\n      <parameters id=\"106\"/>\n      <dataDefinition id=\"107\">\n        <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.data.definition.AppointmentCreatorDataDefinition\" id=\"108\" uuid=\"a9758fb5-e777-4aae-a6a2-42db09104fbf\" retired=\"false\">\n          <parameters id=\"109\"/>\n        </parameterizable>\n        <parameterMappings id=\"110\"/>\n        <converters id=\"111\">\n          <org.openmrs.module.reporting.data.converter.ChainedConverter id=\"112\">\n            <converters id=\"113\">\n              <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"114\">\n                <typeToConvert>org.openmrs.User</typeToConvert>\n                <propertyName>person</propertyName>\n              </org.openmrs.module.reporting.data.converter.PropertyConverter>\n              <org.openmrs.module.reporting.data.converter.PropertyConverter id=\"115\">\n                <typeToConvert>org.openmrs.Person</typeToConvert>\n                <propertyName>personName</propertyName>\n              </org.openmrs.module.reporting.data.converter.PropertyConverter>\n              <org.openmrs.module.reporting.data.converter.ObjectFormatter id=\"116\"/>\n            </converters>\n          </org.openmrs.module.reporting.data.converter.ChainedConverter>\n        </converters>\n      </dataDefinition>\n    </org.openmrs.module.reporting.dataset.column.definition.RowPerObjectColumnDefinition>\n  </columnDefinitions>\n  <sortCriteria id=\"117\">\n    <sortElements id=\"118\">\n      <org.openmrs.module.reporting.common.SortCriteria_-SortElement id=\"119\">\n        <elementName>startDatetime</elementName>\n        <direction>ASC</direction>\n        <outer-class reference=\"117\"/>\n      </org.openmrs.module.reporting.common.SortCriteria_-SortElement>\n      <org.openmrs.module.reporting.common.SortCriteria_-SortElement id=\"120\">\n        <elementName>provider</elementName>\n        <direction>ASC</direction>\n        <outer-class reference=\"117\"/>\n      </org.openmrs.module.reporting.common.SortCriteria_-SortElement>\n    </sortElements>\n  </sortCriteria>\n  <rowFilters id=\"121\">\n    <org.openmrs.module.reporting.evaluation.parameter.Mapped id=\"122\">\n      <parameterizable class=\"org.openmrs.module.appointmentscheduling.reporting.query.definition.BasicAppointmentQuery\" id=\"123\" uuid=\"21e6a2b6-7f2f-4a0d-b7d5-c483590fc9e5\" retired=\"false\">\n        <parameters id=\"124\">\n          <org.openmrs.module.reporting.evaluation.parameter.Parameter id=\"125\">\n            <name>onOrAfter</name>\n            <label>On or after</label>\n            <type>java.util.Date</type>\n            <required>true</required>\n          </org.openmrs.module.reporting.evaluation.parameter.Parameter>\n          <org.openmrs.module.reporting.evaluation.parameter.Parameter id=\"126\">\n            <name>onOrBefore</name>\n            <label>On or before</label>\n            <type>java.util.Date</type>\n            <required>true</required>\n          </org.openmrs.module.reporting.evaluation.parameter.Parameter>\n          <org.openmrs.module.reporting.evaluation.parameter.Parameter reference=\"7\"/>\n        </parameters>\n      </parameterizable>\n      <parameterMappings id=\"127\">\n        <entry>\n          <string>onOrBefore</string>\n          <string>${date}</string>\n        </entry>\n        <entry>\n          <string>location</string>\n          <string>${location}</string>\n        </entry>\n        <entry>\n          <string>onOrAfter</string>\n          <string>${date}</string>\n        </entry>\n      </parameterMappings>\n    </org.openmrs.module.reporting.evaluation.parameter.Mapped>\n  </rowFilters>\n</org.openmrs.module.appointmentscheduling.reporting.dataset.definition.AppointmentDataSetDefinition>','2023-10-25 10:27:10',2,'2023-10-25 10:27:10',2,0,NULL,NULL,NULL,'c1bf0730-e69e-11e3-ac10-0800200c9a66');
/*!40000 ALTER TABLE `serialized_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_order`
--

DROP TABLE IF EXISTS `test_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `specimen_source` int(11) DEFAULT NULL,
  `laterality` varchar(20) DEFAULT NULL,
  `clinical_history` text,
  `frequency` int(11) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `test_order_specimen_source_fk` (`specimen_source`),
  KEY `test_order_frequency_fk` (`frequency`),
  KEY `test_order_location_fk` (`location`),
  CONSTRAINT `test_order_location_fk` FOREIGN KEY (`location`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `test_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `test_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `test_order_specimen_source_fk` FOREIGN KEY (`specimen_source`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_order`
--

LOCK TABLES `test_order` WRITE;
/*!40000 ALTER TABLE `test_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiframework_user_defined_page_view`
--

DROP TABLE IF EXISTS `uiframework_user_defined_page_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiframework_user_defined_page_view` (
  `page_view_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `template_type` varchar(50) NOT NULL,
  `template_text` mediumtext NOT NULL,
  `uuid` varchar(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`page_view_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiframework_user_defined_page_view`
--

LOCK TABLES `uiframework_user_defined_page_view` WRITE;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(255) NOT NULL DEFAULT '',
  `property_value` longtext,
  PRIMARY KEY (`user_id`,`property`),
  CONSTRAINT `user_property_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
INSERT INTO `user_property` VALUES (1,'loginAttempts','0');
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`,`user_id`),
  KEY `user_role_to_users` (`user_id`),
  CONSTRAINT `role_definitions` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `user_role_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Provider'),(1,'System Developer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `user_creator` (`creator`),
  KEY `user_who_retired_this_user` (`retired_by`),
  KEY `person_id_for_user` (`person_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `person_id_for_user` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','ffba0fa0e7638c1ed511d497cd24afc6a5bcf5231eb9661a87fe215201ba4ede020152a656f02f7ffa5ba34360fe4b0d1e237fe0efed8509fb087a1fadae437d','0ce631e430099bfb05c83cbac134f4ace05a178f642b252517bc60be24eb4c3d4240b0f4421915c894eb9443e7e66f64dc89f5ab47139c1201fb9015df17ec45',NULL,NULL,1,'2005-01-01 00:00:00',1,'2016-07-07 08:15:10',1,0,NULL,NULL,NULL,'1c3db49d-440a-11e6-a65c-00e04c680037',NULL,NULL),(2,'daemon','daemon',NULL,NULL,NULL,NULL,1,'2010-04-26 13:25:00',NULL,NULL,1,0,NULL,NULL,NULL,'A4F30A1B-5EB9-11DF-A648-37A07F9C90FB',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_type_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `indication_concept_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_patient_index` (`patient_id`),
  KEY `visit_type_fk` (`visit_type_id`),
  KEY `visit_location_fk` (`location_id`),
  KEY `visit_creator_fk` (`creator`),
  KEY `visit_voided_by_fk` (`voided_by`),
  KEY `visit_changed_by_fk` (`changed_by`),
  KEY `visit_indication_concept_fk` (`indication_concept_id`),
  CONSTRAINT `visit_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_indication_concept_fk` FOREIGN KEY (`indication_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `visit_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visit_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `visit_type_fk` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `visit_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute`
--

DROP TABLE IF EXISTS `visit_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute` (
  `visit_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_visit_fk` (`visit_id`),
  KEY `visit_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `visit_attribute_creator_fk` (`creator`),
  KEY `visit_attribute_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `visit_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `visit_attribute_type` (`visit_attribute_type_id`),
  CONSTRAINT `visit_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_visit_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `visit_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute`
--

LOCK TABLES `visit_attribute` WRITE;
/*!40000 ALTER TABLE `visit_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute_type`
--

DROP TABLE IF EXISTS `visit_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute_type` (
  `visit_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute_type`
--

LOCK TABLES `visit_attribute_type` WRITE;
/*!40000 ALTER TABLE `visit_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'openmrs_core'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 16:30:37
