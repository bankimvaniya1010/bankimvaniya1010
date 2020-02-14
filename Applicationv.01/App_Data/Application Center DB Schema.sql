/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table GTE_Prod.accommodationplan
CREATE TABLE IF NOT EXISTS `accommodationplan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.admincomments
CREATE TABLE IF NOT EXISTS `admincomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `formid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `fieldname` varchar(200) NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `adminaction` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_applicantdetails_adminComments_idx` (`applicantid`),
  KEY `fk_university_master_adminComments_idx` (`universityid`),
  KEY `fk_frommaster_admincomments_idx` (`formid`),
  KEY `fk_adminusers_admincomments_idx` (`adminid`),
  CONSTRAINT `fk_adminusers_admincomments` FOREIGN KEY (`adminid`) REFERENCES `adminusers` (`adminid`),
  CONSTRAINT `fk_applicantdetails_admincomments` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `fk_frommaster_admincomments` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `fk_university_master_admincomments` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.admintooltips
CREATE TABLE IF NOT EXISTS `admintooltips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formid` int(1) NOT NULL,
  `fieldid` int(1) NOT NULL,
  `tooltips` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admintooltips_formmaster_idx` (`formid`),
  KEY `fk_admintooltips_primaryfieldmaster_idx` (`fieldid`),
  CONSTRAINT `fk_admintooltips_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `fk_admintooltips_primaryfieldmaster` FOREIGN KEY (`fieldid`) REFERENCES `primaryfieldmaster` (`primaryfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.adminuniversitywisetooltips
CREATE TABLE IF NOT EXISTS `adminuniversitywisetooltips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) NOT NULL,
  `formid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `tooltips` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_adminuniversitywisetooltips_formmaster_idx` (`formid`),
  KEY `fk_adminuniversitywisetooltips_primaryfieldmaster_idx` (`fieldid`),
  KEY `fk_adminuniversitywisetooltips_university_master_idx` (`universityid`),
  CONSTRAINT `fk_adminuniversitywisetooltips_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `fk_adminuniversitywisetooltips_primaryfieldmaster` FOREIGN KEY (`fieldid`) REFERENCES `primaryfieldmaster` (`primaryfieldid`),
  CONSTRAINT `fk_adminuniversitywisetooltips_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.adminusers
CREATE TABLE IF NOT EXISTS `adminusers` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(1) NOT NULL,
  `universityId` int(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`adminid`),
  KEY `FK_adminusers_rolemaster` (`roleid`),
  CONSTRAINT `FK_adminusers_rolemaster` FOREIGN KEY (`roleid`) REFERENCES `rolemaster` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.agentmaster
CREATE TABLE IF NOT EXISTS `agentmaster` (
  `agentid` int(11) NOT NULL AUTO_INCREMENT,
  `agentname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.alternateadressproofmaster
CREATE TABLE IF NOT EXISTS `alternateadressproofmaster` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.alternatedobproof
CREATE TABLE IF NOT EXISTS `alternatedobproof` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.alternateidproofmaster
CREATE TABLE IF NOT EXISTS `alternateidproofmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.answermaster
CREATE TABLE IF NOT EXISTS `answermaster` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `answerdescription` varchar(200) DEFAULT NULL,
  `gteqscore` int(1) DEFAULT NULL,
  `riskqscore` int(1) DEFAULT NULL,
  PRIMARY KEY (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.answeroptionssecondary
CREATE TABLE IF NOT EXISTS `answeroptionssecondary` (
  `answeroptionid` int(11) NOT NULL AUTO_INCREMENT,
  `optionid` int(1) DEFAULT NULL,
  `secondaryfieldnamelanguage` varchar(5) DEFAULT NULL,
  `secondaryfieldnamevalue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`answeroptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table GTE_Prod.answer_mastersecondarylanguage
CREATE TABLE IF NOT EXISTS `answer_mastersecondarylanguage` (
  `secondaryanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `answerid` int(11) DEFAULT NULL,
  `secondaryfieldnamelanguage` varchar(2) DEFAULT NULL,
  `secondaryfieldnamevalue` mediumtext,
  PRIMARY KEY (`secondaryanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table GTE_Prod.applcantdetailfieldvalidationmaster
CREATE TABLE IF NOT EXISTS `applcantdetailfieldvalidationmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantcampaign
CREATE TABLE IF NOT EXISTS `applicantcampaign` (
  `campaignid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `email1sent` bit(1) DEFAULT NULL,
  `email2sent` bit(1) DEFAULT NULL,
  `email3sent` bit(1) DEFAULT NULL,
  `email4sent` bit(1) DEFAULT NULL,
  `email5sent` bit(1) DEFAULT NULL,
  `email6sent` bit(1) DEFAULT NULL,
  `email7sent` bit(1) DEFAULT NULL,
  `email8sent` bit(1) DEFAULT NULL,
  `email9sent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`campaignid`),
  KEY `fk_applicantcampaign_students_idx` (`applicantid`),
  CONSTRAINT `fk_applicantcampaign_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantdatavalidation
CREATE TABLE IF NOT EXISTS `applicantdatavalidation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyid` int(1) DEFAULT NULL,
  `isvalid` int(1) DEFAULT NULL,
  `proofofvalidation` varchar(200) DEFAULT NULL,
  `lastvalidatedtime` datetime DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantdetails
CREATE TABLE IF NOT EXISTS `applicantdetails` (
  `applicantpersonaldetailsid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  `title` int(1) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `ispassportfirstname` bit(1) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `ispassportlastname` bit(1) DEFAULT NULL,
  `prefferedname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `ispassportmiddlename` bit(1) DEFAULT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `nationality2` int(11) DEFAULT NULL,
  `hasdualcitizenship` bit(1) DEFAULT NULL,
  `chinesecodenumber` varchar(50) DEFAULT NULL,
  `haschinesecodenumber` bit(1) DEFAULT NULL,
  `patronymicname` varchar(50) DEFAULT NULL,
  `countryofbirth` int(11) DEFAULT NULL,
  `maritalstatus` int(1) DEFAULT NULL,
  `ismarried` bit(1) DEFAULT NULL,
  `spousename` varchar(50) DEFAULT NULL,
  `spousenationality` int(11) DEFAULT NULL,
  `spousedob` datetime DEFAULT NULL,
  `marriagedate` datetime DEFAULT NULL,
  `higheststudycompleted` int(10) DEFAULT NULL,
  `fieldofhigheststudy` int(10) DEFAULT NULL,
  `countryofhigheststudy` int(10) DEFAULT NULL,
  `studycompletedate` varchar(7) DEFAULT NULL,
  `isdisable` int(1) DEFAULT NULL,
  `disabilitydescription` varchar(50) DEFAULT NULL,
  `postaladdrees1` varchar(200) DEFAULT NULL,
  `postaladdrees2` varchar(200) DEFAULT NULL,
  `postaladdrees3` varchar(200) DEFAULT NULL,
  `postalcity` varchar(45) DEFAULT NULL,
  `postalstate` varchar(45) DEFAULT NULL,
  `postalcountry` int(11) DEFAULT NULL,
  `postalpostcode` varchar(8) DEFAULT NULL,
  `residentailpostcode` varchar(8) DEFAULT NULL,
  `residentialaddress1` varchar(200) DEFAULT NULL,
  `residentialaddress2` varchar(200) DEFAULT NULL,
  `residentialaddress3` varchar(200) DEFAULT NULL,
  `residentialcity` varchar(45) DEFAULT NULL,
  `residentialstate` varchar(45) DEFAULT NULL,
  `residentialcountry` int(1) DEFAULT NULL,
  `haspreviousresidence` bit(1) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `homephone` varchar(45) DEFAULT NULL,
  `workphone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `skypeid` varchar(45) DEFAULT NULL,
  `haveskypeid` int(1) DEFAULT NULL,
  `whatsappno` varchar(15) DEFAULT NULL,
  `isdifferentwhatsapp` int(1) DEFAULT NULL,
  `issameaspostal` int(1) DEFAULT NULL,
  `nomineefullname` varchar(100) DEFAULT NULL,
  `relationshipwithnominee` varchar(45) DEFAULT NULL,
  `nomineeemail` varchar(45) DEFAULT NULL,
  `nomineemobile` varchar(15) DEFAULT NULL,
  `nomineeverificationkey` varchar(50) DEFAULT NULL,
  `isnomineeverified` bit(1) DEFAULT NULL,
  `passportno` varchar(20) DEFAULT NULL,
  `passportissuedate` datetime DEFAULT NULL,
  `passportexpirydate` datetime DEFAULT NULL,
  `verifiedpassportnamedob` bit(1) DEFAULT NULL,
  `alternativeIdentityproofId` int(1) DEFAULT NULL,
  `passportissuecity` varchar(45) DEFAULT NULL,
  `alternativeIdentityproofno` varchar(45) DEFAULT NULL,
  `alternativeproofdobId` int(1) DEFAULT NULL,
  `alternativeproofdobno` varchar(45) DEFAULT NULL,
  `alternativeresidenceproofId` int(1) DEFAULT NULL,
  `alternativeresidenceproofno` varchar(45) DEFAULT NULL,
  `linkedprofile` varchar(200) DEFAULT NULL,
  `havelinkedinaccount` bit(1) DEFAULT NULL,
  `facebookprofle` varchar(200) DEFAULT NULL,
  `havefacebookaccount` bit(1) DEFAULT NULL,
  `twiterprofile` varchar(200) DEFAULT NULL,
  `havetwitteraccount` bit(1) DEFAULT NULL,
  `othertitle` varchar(20) DEFAULT NULL,
  `personaldetailsavedtime` datetime DEFAULT NULL,
  `ispersonaldetailspresent` bit(1) NOT NULL,
  `contactdetailsavetime` datetime DEFAULT NULL,
  `iscontactdetailspresent` bit(1) NOT NULL,
  `identificationsavetime` datetime DEFAULT NULL,
  `isidentificationpresent` bit(1) NOT NULL,
  `socialprofilesavetime` datetime DEFAULT NULL,
  `issocialprofilepresent` bit(1) NOT NULL,
  `passportissuecountry` varchar(5) DEFAULT NULL,
  `havewhatsup` int(1) DEFAULT NULL,
  `agentid` int(1) DEFAULT NULL,
  `isstudentreferbyagent` int(1) DEFAULT NULL,
  `motivationreason` varchar(50) DEFAULT NULL,
  `haveworkexperience` bit(1) DEFAULT NULL,
  `totalyearofexperience` varchar(50) DEFAULT NULL,
  `studentsegment` char(2) DEFAULT NULL,
  `studentstatus` int(1) DEFAULT NULL,
  `visaverfied_date` datetime DEFAULT NULL,
  `visasubmittedtodepartment_date` datetime DEFAULT NULL,
  `visadecisionreceived_date` datetime DEFAULT NULL,
  `visagranted` int(10) DEFAULT NULL,
  `visaremarks` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`applicantpersonaldetailsid`),
  KEY `FK_applicantdetails_students` (`applicantid`),
  CONSTRAINT `FK_applicantdetails_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantdocumentmaster
CREATE TABLE IF NOT EXISTS `applicantdocumentmaster` (
  `documentid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `documentname` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `uploadedtime` datetime DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentid`),
  KEY `applicantid` (`applicantid`),
  KEY `universityid` (`universityid`),
  CONSTRAINT `FK_applicantdocumentmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicantdocumentmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicanteducationdetails
CREATE TABLE IF NOT EXISTS `applicanteducationdetails` (
  `applicantdeducationdetailsid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `ishighschooldone` int(1) DEFAULT NULL,
  `highschoolcountry` int(1) DEFAULT NULL,
  `highschoolstartdate` varchar(7) DEFAULT NULL,
  `highschoolendate` varchar(7) DEFAULT NULL,
  `highschoolname` varchar(45) DEFAULT NULL,
  `highschoolqualificationtype` int(1) DEFAULT NULL,
  `highschoolmodeid` int(1) DEFAULT NULL,
  `highschoolmediumid` int(1) DEFAULT NULL,
  `highschoolgradetypeid` int(1) DEFAULT NULL,
  `highschoolgradedeclared` int(1) DEFAULT NULL,
  `highschoolreusltdate` datetime DEFAULT NULL,
  `highschoolverificationname` varchar(100) DEFAULT NULL,
  `highschoolverificationrelationship` int(1) DEFAULT NULL,
  `highschoolverificationemail` varchar(100) DEFAULT NULL,
  `highschoolverificationmobile` varchar(15) DEFAULT NULL,
  `highschoolverificationkey` varchar(50) DEFAULT NULL,
  `ishighschoolverified` bit(1) DEFAULT NULL,
  `issecondarydone` int(1) DEFAULT NULL,
  `secondarycountry` int(1) DEFAULT NULL,
  `secondarystartdate` varchar(7) DEFAULT NULL,
  `secondaryendate` varchar(7) DEFAULT NULL,
  `secondaryname` varchar(45) DEFAULT NULL,
  `secondaryqualificationtype` int(1) DEFAULT NULL,
  `secondarymodestudy` int(1) DEFAULT NULL,
  `secondarymediumstudy` int(1) DEFAULT NULL,
  `secondarygradetypeid` int(1) DEFAULT NULL,
  `secondarygradedeclared` int(1) DEFAULT NULL,
  `secondaryresultdate` datetime DEFAULT NULL,
  `secondaryverificationname` varchar(100) DEFAULT NULL,
  `secondaryverificationrelationship` int(1) DEFAULT NULL,
  `secondaryverificationemail` varchar(100) DEFAULT NULL,
  `secondaryverificationmobile` varchar(15) DEFAULT NULL,
  `secondaryverificationkey` varchar(50) DEFAULT NULL,
  `issecondaryverified` bit(1) DEFAULT NULL,
  `highschoolsecondaryschoolgapreason` varchar(100) DEFAULT NULL,
  `isdiplomadone` int(1) DEFAULT NULL,
  `diplomacountry` int(1) DEFAULT NULL,
  `diplomastartdate` varchar(7) DEFAULT NULL,
  `diplomaendate` varchar(7) DEFAULT NULL,
  `diplomaschoolname` varchar(45) DEFAULT NULL,
  `diplomaqualificationtype` int(1) DEFAULT NULL,
  `diplomastudymodeid` int(1) DEFAULT NULL,
  `diplomamediumid` int(1) DEFAULT NULL,
  `diplomagradetypeid` int(1) DEFAULT NULL,
  `diplomagradeachieved` int(1) DEFAULT NULL,
  `diplomaresultdate` datetime DEFAULT NULL,
  `diplomaverificationname` varchar(100) DEFAULT NULL,
  `diplomaverificationrelationship` int(1) DEFAULT NULL,
  `diplomaverificationemail` varchar(100) DEFAULT NULL,
  `diplomaverificationmobile` varchar(50) DEFAULT NULL,
  `diplomaverificationkey` varchar(50) DEFAULT NULL,
  `isdiplomaverified` bit(1) DEFAULT NULL,
  `ishighereducation` int(1) DEFAULT NULL,
  `lastsavetime` datetime DEFAULT NULL,
  `iseducationdetailspresent` bit(1) NOT NULL,
  `haveyoustudiedbefore` int(1) DEFAULT NULL,
  `haveusi_number` int(10) DEFAULT NULL,
  `usi_number` varchar(100) DEFAULT NULL,
  `studentinstitutionID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicantdeducationdetailsid`),
  KEY `FK_applicanteducationdetails_students` (`applicantid`),
  KEY `FK_applicanteducationdetails_university_master` (`universityid`),
  CONSTRAINT `FK_applicanteducationdetails_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicanteducationdetails_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantemployerdetails
CREATE TABLE IF NOT EXISTS `applicantemployerdetails` (
  `employerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `wishtoaddemployer` int(1) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` int(1) DEFAULT NULL,
  `contactpersonwithdetails` varchar(200) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `durationfrom` date DEFAULT NULL,
  `durationto` date DEFAULT NULL,
  `iscurrentworking` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `briefdescription` varchar(500) DEFAULT NULL,
  `nameofreportingmanger` varchar(45) DEFAULT NULL,
  `relationshipwithcontact` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `linkedinidofcontact` varchar(45) DEFAULT NULL,
  `employerverificationkey` varchar(50) DEFAULT NULL,
  `isemployerdetailverified` bit(1) DEFAULT NULL,
  `verifyrecord_refereeresponse` varchar(200) DEFAULT NULL,
  `howlongyouknow_refereeresponse` varchar(200) DEFAULT NULL,
  `opinionforstudycourse_refereeresponse` varchar(200) DEFAULT NULL,
  `biggeststrenthknown_refereeresponse` varchar(200) DEFAULT NULL,
  `getalongwithmanagement_refereeresponse` varchar(200) DEFAULT NULL,
  `wouldyourehire_refereeresponse` varchar(200) DEFAULT NULL,
  `lastsavedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`employerid`),
  KEY `FK_applicantemployerdetails_students` (`applicantid`),
  KEY `FK_applicantemployerdetails_university_master` (`universityid`),
  CONSTRAINT `FK_applicantemployerdetails_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicantemployerdetails_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantformmaster
CREATE TABLE IF NOT EXISTS `applicantformmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formname` int(1) DEFAULT NULL,
  `primaryfieldid` int(1) DEFAULT NULL,
  `secondaryfieldnamelanguage` varchar(5) DEFAULT NULL,
  `secondaryfielddnamevalue` varchar(500) DEFAULT NULL,
  `fieldnameinstructions` varchar(500) DEFAULT NULL,
  `secondaryfieldnameinstructions` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table GTE_Prod.applicantfundingmaster
CREATE TABLE IF NOT EXISTS `applicantfundingmaster` (
  `applicantfundingmasterid` int(10) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `studyoption` int(1) DEFAULT NULL,
  `familymember` int(1) DEFAULT NULL,
  `adultmemberCount` int(1) DEFAULT NULL,
  `childrenmemberCount` int(1) DEFAULT NULL,
  `accommodationplan` int(1) DEFAULT NULL,
  `managemeal` int(1) DEFAULT NULL,
  `transportchoice` int(1) DEFAULT NULL,
  `trips` int(1) DEFAULT NULL,
  `entertainment` int(1) DEFAULT NULL,
  `credittransfer` int(1) DEFAULT NULL,
  `PrivateFinancePercentage` decimal(5,2) DEFAULT NULL,
  `ScholarshipPercentage` decimal(5,2) DEFAULT NULL,
  `studentLoanPercentage` decimal(5,2) DEFAULT NULL,
  `SponsorshipPercentage` decimal(5,2) DEFAULT NULL,
  `PartTimeWorkPercentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`applicantfundingmasterid`),
  KEY `FK_applicantfundingmaster_students` (`applicantid`),
  KEY `FK_applicantfundingmaster_university_master` (`universityid`),
  CONSTRAINT `FK_applicantfundingmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicantfundingmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicanthighereducation
CREATE TABLE IF NOT EXISTS `applicanthighereducation` (
  `applicanthighereducationid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `coursename` varchar(45) DEFAULT NULL,
  `countryofhighereducation` varchar(5) DEFAULT NULL,
  `startdate` varchar(7) DEFAULT NULL,
  `endate` varchar(7) DEFAULT NULL,
  `schoolname` varchar(45) DEFAULT NULL,
  `qualificationtype` varchar(45) DEFAULT NULL,
  `studymodeid` int(1) DEFAULT NULL,
  `studymediumid` int(1) DEFAULT NULL,
  `gradetypeid` int(1) DEFAULT NULL,
  `finalgradeacheived` int(1) DEFAULT NULL,
  `resultdate` datetime DEFAULT NULL,
  `verificationname` varchar(100) DEFAULT NULL,
  `relationshipwithverification` int(1) DEFAULT NULL,
  `verificationemail` varchar(100) DEFAULT NULL,
  `verificationmobile` varchar(15) DEFAULT NULL,
  `highereducationverificationkey` varchar(50) DEFAULT NULL,
  `ishighereducationverified` bit(1) DEFAULT NULL,
  `secondaryschoolhighereducationgapreason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicanthighereducationid`),
  KEY `FK_applicanthighereducation_students` (`applicantid`),
  KEY `FK_applicanthighereducation_university_master` (`universityid`),
  CONSTRAINT `FK_applicanthighereducation_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicanthighereducation_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantlanguagecompetency
CREATE TABLE IF NOT EXISTS `applicantlanguagecompetency` (
  `applicantlanguagecompetencyid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `homelanuage` int(10) DEFAULT NULL,
  `isenglishintesive` int(1) DEFAULT NULL,
  `countryofcourse` varchar(5) DEFAULT NULL,
  `yearofcompletion` datetime DEFAULT NULL,
  `instituename` varchar(45) DEFAULT NULL,
  `studymode` int(1) DEFAULT NULL,
  `qualificationtype` int(10) DEFAULT NULL,
  `qualificationname` varchar(50) DEFAULT NULL,
  `gradetype` varchar(45) DEFAULT NULL,
  `giveenglishtest` int(1) DEFAULT NULL,
  `testname` varchar(45) DEFAULT NULL,
  `centerno` varchar(45) DEFAULT NULL,
  `isfinalgradeachieved` int(1) DEFAULT NULL,
  `expectedgraderesult` datetime DEFAULT NULL,
  `candidateno` varchar(45) DEFAULT NULL,
  `candidateid` varchar(45) DEFAULT NULL,
  `examdate` datetime DEFAULT NULL,
  `testcentercountrty` int(10) DEFAULT NULL,
  `testtakerId` varchar(20) DEFAULT NULL,
  `registrationNo` varchar(20) DEFAULT NULL,
  `overallscore` varchar(10) DEFAULT NULL,
  `speakingscore` varchar(10) DEFAULT NULL,
  `listeningscore` varchar(10) DEFAULT NULL,
  `readingscore` varchar(10) DEFAULT NULL,
  `writingscore` varchar(10) DEFAULT NULL,
  `cefrlevel` varchar(3) DEFAULT NULL,
  `testreportreferenceno` varchar(45) DEFAULT NULL,
  `lastsavedtime` datetime DEFAULT NULL,
  `islanguagecompetencypresent` bit(1) NOT NULL,
  PRIMARY KEY (`applicantlanguagecompetencyid`),
  KEY `FK_applicantlanguagecompetency_students` (`applicantid`),
  KEY `FK_applicantlanguagecompetency_university_master` (`universityid`),
  CONSTRAINT `FK_applicantlanguagecompetency_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicantlanguagecompetency_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantprogressbar
CREATE TABLE IF NOT EXISTS `applicantprogressbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `profile` int(1) DEFAULT '0',
  `question` int(1) DEFAULT '0',
  `declarationdone` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_applicantprogressbar_students` (`applicantid`),
  KEY `FK_applicantprogressbar_university_master` (`universityid`),
  CONSTRAINT `FK_applicantprogressbar_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicantprogressbar_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantreferencecheck
CREATE TABLE IF NOT EXISTS `applicantreferencecheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `isverified` int(1) DEFAULT NULL,
  `referncekey` varchar(50) DEFAULT NULL,
  `requestsenttime` datetime DEFAULT NULL,
  `referenceverifiedtime` datetime DEFAULT NULL,
  `howlongyouknow_refereesponse` varchar(100) DEFAULT NULL,
  `describeskill_refereesponse` varchar(100) DEFAULT NULL,
  `greateststrength_refereesponse` varchar(100) DEFAULT NULL,
  `whyyouchoosetoreferthisstudent_refereesponse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantresidencehistory
CREATE TABLE IF NOT EXISTS `applicantresidencehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `residencestartdate` datetime DEFAULT NULL,
  `residenceenddate` datetime DEFAULT NULL,
  `residenceaddress1` varchar(200) DEFAULT NULL,
  `residenceaddress2` varchar(200) DEFAULT NULL,
  `residenceaddress3` varchar(200) DEFAULT NULL,
  `residencepostcode` varchar(8) DEFAULT NULL,
  `residentialstate` varchar(50) DEFAULT NULL,
  `residentialcity` varchar(50) DEFAULT NULL,
  `residentialcountry` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantscores
CREATE TABLE IF NOT EXISTS `applicantscores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `answerid` int(11) DEFAULT NULL,
  `answervalue` int(1) DEFAULT NULL,
  `timetakentoanswervalue` int(1) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantsubjectwisegrade
CREATE TABLE IF NOT EXISTS `applicantsubjectwisegrade` (
  `applicantgradeid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(20) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `gradeid` int(1) DEFAULT NULL,
  `othersubject` varchar(50) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `subjectid` int(1) DEFAULT NULL,
  PRIMARY KEY (`applicantgradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.applicantvideomaster
CREATE TABLE IF NOT EXISTS `applicantvideomaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `videofilename` varchar(45) DEFAULT NULL,
  `uploadedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicantvisadetails
CREATE TABLE IF NOT EXISTS `applicantvisadetails` (
  `applicantvisadetailsid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  `hasvisa` int(1) DEFAULT NULL,
  `applicantvisatype` varchar(45) DEFAULT NULL,
  `validityfrom` datetime DEFAULT NULL,
  `validityto` datetime DEFAULT NULL,
  `visano` varchar(45) DEFAULT NULL,
  `visaapplied` int(1) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `firstvisit` datetime DEFAULT NULL,
  `havelivedearlier` int(1) DEFAULT NULL,
  `haveparent` int(1) DEFAULT NULL,
  `isvisadenied` int(1) DEFAULT NULL,
  `isparentvisadenied` int(1) DEFAULT NULL,
  PRIMARY KEY (`applicantvisadetailsid`),
  KEY `FK_applicantvisadetails_university_master` (`universityid`),
  CONSTRAINT `FK_applicantvisadetails_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicant_education
CREATE TABLE IF NOT EXISTS `applicant_education` (
  `applicationeduId` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` bigint(20) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `board_universityname` varchar(100) DEFAULT NULL,
  `Institute` varchar(100) DEFAULT NULL,
  `percentage` varchar(10) DEFAULT NULL,
  `course_startdate` date DEFAULT NULL,
  `course_enddate` date DEFAULT NULL,
  `repeats_backlog` varchar(200) DEFAULT NULL,
  `othercourse_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicationeduId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.applicant_meeting_schedule
CREATE TABLE IF NOT EXISTS `applicant_meeting_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `applicant_email_id` varchar(100) NOT NULL,
  `utc_meeting_time` datetime NOT NULL,
  `applicant_time_zone` datetime NOT NULL,
  `schedule_once_meeting_id` int(11) DEFAULT NULL,
  `is_otp_generated` bit(1) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `is_meeting_completed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.applicant_scholarships
CREATE TABLE IF NOT EXISTS `applicant_scholarships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `scholarship_id` int(11) NOT NULL,
  `upload_form` varchar(200) NOT NULL,
  `approval_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_applicantScholarship_scholarships` (`scholarship_id`),
  CONSTRAINT `FK_applicantScholarship_scholarships` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.applicationmaster
CREATE TABLE IF NOT EXISTS `applicationmaster` (
  `applicationmasterid` int(10) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `preferenceid` int(11) DEFAULT '0',
  `college-universityname` varchar(50) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `modeofstudy` int(11) DEFAULT NULL,
  `majorofdiscipline` int(11) DEFAULT NULL,
  `coursetype` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `commencementdate` varchar(50) DEFAULT NULL,
  `current_status` int(11) DEFAULT NULL,
  `dateofapplication` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateofdecision` datetime DEFAULT NULL,
  `decision` int(11) DEFAULT NULL,
  `condition_statement` varchar(2000) DEFAULT NULL,
  `admission_remark` varchar(2000) DEFAULT NULL,
  `activity_ip` varchar(50) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `deferment_date` date DEFAULT NULL,
  `deferment_remark` varchar(100) DEFAULT NULL,
  `deferment_decision` varchar(50) DEFAULT NULL,
  `rejection_reason` int(11) DEFAULT NULL,
  `rejection_remark` varchar(100) DEFAULT NULL,
  `offer_letter_file` varchar(200) DEFAULT NULL,
  `coe_letter_file` varchar(200) DEFAULT NULL,
  `coe_download_time` datetime DEFAULT NULL,
  `eligibility_response` int(10) DEFAULT NULL,
  PRIMARY KEY (`applicationmasterid`),
  KEY `FK_applicationmaster_students` (`applicantid`),
  KEY `FK_applicationmaster_university_master` (`universityid`),
  CONSTRAINT `FK_applicationmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_applicationmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.application_status_master
CREATE TABLE IF NOT EXISTS `application_status_master` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status_description` varchar(100) NOT NULL,
  `status_for` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.australiavisadetailmaster
CREATE TABLE IF NOT EXISTS `australiavisadetailmaster` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `termsandcondition` bit(1) DEFAULT NULL,
  `noofpeopleincluded` varchar(50) DEFAULT NULL,
  `applyingfor` int(10) DEFAULT NULL,
  `familyname` varchar(50) DEFAULT NULL,
  `givenname` varchar(50) DEFAULT NULL,
  `knownbyanothername` int(10) DEFAULT NULL,
  `anotherfamilyname` varchar(50) DEFAULT NULL,
  `anothergivenname` varchar(50) DEFAULT NULL,
  `ownlanguagename1` varchar(50) DEFAULT NULL,
  `ownlanguagename2` varchar(50) DEFAULT NULL,
  `gender` int(10) DEFAULT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `cityofbirth` varchar(50) DEFAULT NULL,
  `countryofbirth` int(10) DEFAULT NULL,
  `maritalstatus` int(10) DEFAULT NULL,
  `countryofcitizenship` int(10) DEFAULT NULL,
  `holdothercitizenship` int(10) DEFAULT NULL,
  `anothercountryofcitizenship` int(10) DEFAULT NULL,
  `havepassport` int(10) DEFAULT NULL,
  `passportno` varchar(50) DEFAULT NULL,
  `countryofpassport` int(10) DEFAULT NULL,
  `dateofissue` datetime DEFAULT NULL,
  `dateofexpiry` datetime DEFAULT NULL,
  `placeofissue` varchar(50) DEFAULT NULL,
  `applicableidentificationno` varchar(50) DEFAULT NULL,
  `anotherIdentitytype1` varchar(50) DEFAULT NULL,
  `anotherIdentityNo1` varchar(50) DEFAULT NULL,
  `anotherIdentitytype2` varchar(50) DEFAULT NULL,
  `anotherIdentityNo2` varchar(50) DEFAULT NULL,
  `residencecountry` int(10) DEFAULT NULL,
  `residenceaddressLine1` varchar(200) DEFAULT NULL,
  `residenceaddressLine2` varchar(200) DEFAULT NULL,
  `residenceaddresspostalcode` varchar(50) DEFAULT NULL,
  `officehoursContactNoOutsideaustralia` varchar(11) DEFAULT NULL,
  `afterhoursContactNoOutsideaustralia` varchar(11) DEFAULT NULL,
  `australiaresidentialaddline1` varchar(200) DEFAULT NULL,
  `australiaresidentialaddline2` varchar(200) DEFAULT NULL,
  `australiaresidentialpostalcode` varchar(50) DEFAULT NULL,
  `officehrContactNoInAustralia` varchar(11) DEFAULT NULL,
  `afterhrContactNoInAustralia` varchar(11) DEFAULT NULL,
  `correspondenceaddressline1` varchar(200) DEFAULT NULL,
  `correspondenceaddressline2` varchar(200) DEFAULT NULL,
  `correspondenceaddresspoastalcode` varchar(50) DEFAULT NULL,
  `agreetocommunicate` int(10) DEFAULT NULL,
  `faxno` varchar(50) DEFAULT NULL,
  `emailaddress` varchar(50) DEFAULT NULL,
  `applicationentrolledinschool` int(10) DEFAULT NULL,
  `solelegalrights` int(10) DEFAULT NULL,
  `guardiansfamilyname` varchar(50) DEFAULT NULL,
  `guardiansgivenname` varchar(50) DEFAULT NULL,
  `guardiansresidentialaddress` varchar(200) DEFAULT NULL,
  `guardianspostalcode` varchar(50) DEFAULT NULL,
  `guardianscontactnumber` varchar(11) DEFAULT NULL,
  `guardiansrealtionwithstudent` varchar(50) DEFAULT NULL,
  `guardiansnatureoflegalrights` varchar(50) DEFAULT NULL,
  `guardiansstatutorydeclartion` int(11) DEFAULT NULL,
  `guardiansfamilyname1` varchar(50) DEFAULT NULL,
  `guardiansgivenname1` varchar(50) DEFAULT NULL,
  `guardiansresidentialaddress1` varchar(200) DEFAULT NULL,
  `guardianspostalcode1` varchar(50) DEFAULT NULL,
  `guardianscontactnumber1` varchar(11) DEFAULT NULL,
  `guardiansrealtionwithstudent1` varchar(50) DEFAULT NULL,
  `guardiansnatureoflegalrights1` varchar(50) DEFAULT NULL,
  `guardiansstatutorydeclartion1` int(11) DEFAULT NULL,
  `subjectofcourtorder` int(10) DEFAULT NULL,
  `appliesforAustalianvisa` int(10) DEFAULT NULL,
  `currentlyholdaustralianvisa` int(10) DEFAULT NULL,
  `awaitingforaustralianvisa` int(10) DEFAULT NULL,
  `nameonvisa` varchar(50) DEFAULT NULL,
  `typeofvisa` varchar(50) DEFAULT NULL,
  `placeofissuevisa` varchar(50) DEFAULT NULL,
  `dateissuevisa` datetime DEFAULT NULL,
  `applicationrefusedorgranted` int(11) DEFAULT NULL,
  `grantedvisalabelno` varchar(50) DEFAULT NULL,
  `visagrantnumber` varchar(50) DEFAULT NULL,
  `nameonvisa1` varchar(50) DEFAULT NULL,
  `typeofvisa1` varchar(50) DEFAULT NULL,
  `placeofissuevisa1` varchar(50) DEFAULT NULL,
  `dateissuevisa1` datetime DEFAULT NULL,
  `applicationrefusedorgranted1` int(10) DEFAULT NULL,
  `grantedvisalabelno1` varchar(50) DEFAULT NULL,
  `visagrantnumber1` varchar(50) DEFAULT NULL,
  `applyingfortype` int(11) DEFAULT NULL,
  `partB` int(11) DEFAULT NULL,
  `applyinginaustralia` int(11) DEFAULT NULL,
  `docurrentlyholdstudentvisa` int(11) DEFAULT NULL,
  `highestqualification` varchar(50) DEFAULT NULL,
  `nameofeducationprovider1` varchar(50) DEFAULT NULL,
  `nameofeducationprovider2` varchar(50) DEFAULT NULL,
  `addressofeducationprovider` varchar(200) DEFAULT NULL,
  `educationproviderpostalcode` varchar(50) DEFAULT NULL,
  `commencementdate` datetime DEFAULT NULL,
  `finishdate` datetime DEFAULT NULL,
  `educationdocumentattached` int(11) DEFAULT NULL,
  `otherundertakcoursename1` varchar(50) DEFAULT NULL,
  `othernameofeducationprovider1` varchar(50) DEFAULT NULL,
  `othernameofeducationprovider2` varchar(50) DEFAULT NULL,
  `otheraddressofeducationprovider1` varchar(200) DEFAULT NULL,
  `othereduproviderpostalcode1` varchar(50) DEFAULT NULL,
  `othercommencementdate1` datetime DEFAULT NULL,
  `otherfinishdate1` datetime DEFAULT NULL,
  `otherdocumentattached1` int(10) DEFAULT NULL,
  `otherundertakcoursename2` varchar(50) DEFAULT NULL,
  `othernameofeducationprovider21` varchar(50) DEFAULT NULL,
  `othernameofeducationprovider22` varchar(50) DEFAULT NULL,
  `otheraddressofeducationprovider2` varchar(200) DEFAULT NULL,
  `othereduproviderpostalcode2` varchar(50) DEFAULT NULL,
  `othercommencementdate2` datetime DEFAULT NULL,
  `otherfinishdate2` datetime DEFAULT NULL,
  `otherdocumentattached2` int(10) DEFAULT NULL,
  `ispreviouslystudiedinaustralia` int(10) DEFAULT NULL,
  `previouslycoursename` varchar(50) DEFAULT NULL,
  `previouslycourseeducationproviderName` varchar(50) DEFAULT NULL,
  `previouslycourseDateFrom` datetime DEFAULT NULL,
  `previouslycourseDateTo` datetime DEFAULT NULL,
  `previouslycoursename1` varchar(50) DEFAULT NULL,
  `previouslycourseeducationproviderName1` varchar(50) DEFAULT NULL,
  `previouslycourseDateFrom1` datetime DEFAULT NULL,
  `previouslycourseDateTo1` datetime DEFAULT NULL,
  `intendcoursename` varchar(50) DEFAULT NULL,
  `intendedprovidername` varchar(50) DEFAULT NULL,
  `intendedcommencementdate` datetime DEFAULT NULL,
  `intendedfinishdate` datetime DEFAULT NULL,
  `haveenrolment` int(11) DEFAULT NULL,
  `haveenrolmentevidence` int(11) DEFAULT NULL,
  `intendcoursename1` varchar(50) DEFAULT NULL,
  `intendedprovidername1` varchar(50) DEFAULT NULL,
  `intendedcommencementdate1` datetime DEFAULT NULL,
  `intendedfinishdate1` datetime DEFAULT NULL,
  `haveenrolment1` int(11) DEFAULT NULL,
  `haveenrolmentevidence1` int(11) DEFAULT NULL,
  `intendcoursename2` varchar(50) DEFAULT NULL,
  `intendedprovidername2` varchar(50) DEFAULT NULL,
  `intendedcommencementdate2` datetime DEFAULT NULL,
  `intendedfinishdate2` datetime DEFAULT NULL,
  `haveenrolment2` int(11) DEFAULT NULL,
  `haveenrolmentevidence2` int(11) DEFAULT NULL,
  `applicantassesmentlevel` int(10) DEFAULT NULL,
  `englishlangtest` int(10) DEFAULT NULL,
  `englishlangtestname` varchar(50) DEFAULT NULL,
  `englishlangtestDate` datetime DEFAULT NULL,
  `englishlangtestcetificateno` varchar(50) DEFAULT NULL,
  `studiedmorethan5yrinothercountry` int(10) DEFAULT NULL,
  `employmenthistoryFromDate` datetime DEFAULT NULL,
  `employmenthistoryToDate` datetime DEFAULT NULL,
  `employerInfoL0` varchar(50) DEFAULT NULL,
  `employerInfoL1` varchar(50) DEFAULT NULL,
  `typeofbusiness` varchar(50) DEFAULT NULL,
  `employeroccupation` varchar(50) DEFAULT NULL,
  `salarylevel` varchar(50) DEFAULT NULL,
  `leavingdocAttch` int(11) DEFAULT NULL,
  `employmenthistoryFromDate1` datetime DEFAULT NULL,
  `employmenthistoryToDate1` datetime DEFAULT NULL,
  `employerInfoL2` varchar(11) DEFAULT NULL,
  `employerInfoL3` varchar(11) DEFAULT NULL,
  `typeofbusiness1` varchar(11) DEFAULT NULL,
  `employeroccupation1` varchar(11) DEFAULT NULL,
  `salarylevel1` varchar(11) DEFAULT NULL,
  `leavingdocAttch1` int(11) DEFAULT NULL,
  `currentlyemployed` int(11) DEFAULT NULL,
  `ifnoThenOption` int(11) DEFAULT NULL,
  `otherdescription1` varchar(50) DEFAULT NULL,
  `otherdescription2` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `employername` varchar(50) DEFAULT NULL,
  `employeraddress` varchar(200) DEFAULT NULL,
  `employercontactno` varchar(50) DEFAULT NULL,
  `evidenceofemployement` int(11) DEFAULT NULL,
  `currentlystudentinaustralia` int(11) DEFAULT NULL,
  `joboffered` int(11) DEFAULT NULL,
  `kindofemployementseeking` varchar(50) DEFAULT NULL,
  `jobofferedname` varchar(50) DEFAULT NULL,
  `jobofferedaddress` varchar(200) DEFAULT NULL,
  `jobofferedcontactno` varchar(50) DEFAULT NULL,
  `titleofpositionofferef` varchar(50) DEFAULT NULL,
  `immediaterelativename` varchar(50) DEFAULT NULL,
  `immediaterelativerelationship` varchar(50) DEFAULT NULL,
  `immediaterelativeDob` datetime DEFAULT NULL,
  `immediaterelativeaddress` varchar(200) DEFAULT NULL,
  `immediaterelativepostalcode` varchar(50) DEFAULT NULL,
  `immediaterelativeimmigrationstatus` varchar(50) DEFAULT NULL,
  `immediaterelativeDateofarrival` datetime DEFAULT NULL,
  `immediaterelativename1` varchar(50) DEFAULT NULL,
  `immediaterelativerelationship1` varchar(50) DEFAULT NULL,
  `immediaterelativeDob1` datetime DEFAULT NULL,
  `immediaterelativeaddress1` varchar(200) DEFAULT NULL,
  `immediaterelativepostalcode1` varchar(50) DEFAULT NULL,
  `immediaterelativeimmigrationstatus1` varchar(50) DEFAULT NULL,
  `immediaterelativedateofarrival1` datetime DEFAULT NULL,
  `closestrelativename` varchar(50) DEFAULT NULL,
  `closestrelativeaddress` varchar(200) DEFAULT NULL,
  `closestrelativerelationship` varchar(50) DEFAULT NULL,
  `closestrelativepostalcode` varchar(50) DEFAULT NULL,
  `closestrelativecontactnumber` varchar(50) DEFAULT NULL,
  `applyinaustraliaassecschool` int(10) DEFAULT NULL,
  `issufficientfund` int(10) DEFAULT NULL,
  `declarationDate42` datetime DEFAULT NULL,
  `declarationSign42` varchar(50) DEFAULT NULL,
  `ifFamilyunitcompletedformpartC` int(11) DEFAULT NULL,
  `studymorethanthreemonthpartC` int(11) DEFAULT NULL,
  `studentnamepartC` varchar(50) DEFAULT NULL,
  `relationshiptostudentpartC` varchar(50) DEFAULT NULL,
  `studentdobpartC` datetime DEFAULT NULL,
  `citizenshipofstudentpartC` varchar(50) DEFAULT NULL,
  `studentaddresspartC` varchar(200) DEFAULT NULL,
  `studentaddpostalcodepartC` varchar(50) DEFAULT NULL,
  `typeofstudentvisaheldpartC` varchar(50) DEFAULT NULL,
  `assessmentlevelpartC` varchar(50) DEFAULT NULL,
  `assessmentgrantdatepartC` datetime DEFAULT NULL,
  `assessmentexpirydatepartC` datetime DEFAULT NULL,
  `isstudentjoiningdeclarepartC` int(10) DEFAULT NULL,
  `isstudentjoiningsatisfiedconditionpartC` int(10) DEFAULT NULL,
  `suficientfundpartC` int(10) DEFAULT NULL,
  `partD` int(10) DEFAULT NULL,
  `livedoutsidecountryc` int(10) DEFAULT NULL,
  `familymembername` varchar(50) DEFAULT NULL,
  `familyresidencecountry` int(10) DEFAULT NULL,
  `familyresidenceFromdate` datetime DEFAULT NULL,
  `familyresidenceTodate` datetime DEFAULT NULL,
  `familymembername1` varchar(50) DEFAULT NULL,
  `familyresidencecountry1` int(11) DEFAULT NULL,
  `familyresidenceFromdate1` datetime DEFAULT NULL,
  `familyresidenceTodate1` datetime DEFAULT NULL,
  `familymembername2` varchar(50) DEFAULT NULL,
  `familyresidencecountry2` int(11) DEFAULT NULL,
  `familyresidenceFromdate2` datetime DEFAULT NULL,
  `familyresidenceTodate2` datetime DEFAULT NULL,
  `haveworkforaustralianhospital` int(11) DEFAULT NULL,
  `descriptionofhospitalwork` varchar(100) DEFAULT NULL,
  `haveworkforaustralianpreschool` int(10) DEFAULT NULL,
  `descriptionofpreschoolwork` varchar(100) DEFAULT NULL,
  `haveanyhealthissue` int(10) DEFAULT NULL,
  `detailofhealthissue` varchar(50) DEFAULT NULL,
  `requireassistancewithmobility` int(10) DEFAULT NULL,
  `descriptionofmobility` varchar(50) DEFAULT NULL,
  `haevmedicalprocedures` int(10) DEFAULT NULL,
  `proceduresdescription` varchar(50) DEFAULT NULL,
  `havemedicalfollowup` int(10) DEFAULT NULL,
  `medicalfollowupdescription` varchar(50) DEFAULT NULL,
  `haveconvictedofcrime` int(10) DEFAULT NULL,
  `havechargeoffence` int(10) DEFAULT NULL,
  `havecriminaloffence` int(10) DEFAULT NULL,
  `haveremovedfromcountry` int(10) DEFAULT NULL,
  `havetoavoidbeingremoved` int(10) DEFAULT NULL,
  `havebeenexcluded` int(10) DEFAULT NULL,
  `havehumanrightscrime` int(10) DEFAULT NULL,
  `haverisktonationalsecurity` int(10) DEFAULT NULL,
  `haveoutstandingdebets` int(10) DEFAULT NULL,
  `haveconvictedoffence` int(10) DEFAULT NULL,
  `haveservedinmilitaryforce` int(10) DEFAULT NULL,
  `descripofcharacterdeclaration` varchar(200) DEFAULT NULL,
  `under18age` int(10) DEFAULT NULL,
  `parentsituation` int(10) DEFAULT NULL,
  `holdorappliedVisa` int(10) DEFAULT NULL,
  `parentfamilynamePartD` varchar(50) DEFAULT NULL,
  `parentgivennamePartD` varchar(50) DEFAULT NULL,
  `parentDateofBirthpartD` datetime DEFAULT NULL,
  `parentaddresspartD` varchar(200) DEFAULT NULL,
  `parentaddresspostalcodepartD` varchar(50) DEFAULT NULL,
  `parentvisastatusPartD` int(10) DEFAULT NULL,
  `parentvisalabelno` varchar(50) DEFAULT NULL,
  `parentvisadigitno` varchar(50) DEFAULT NULL,
  `parentvisaperiodofstay` varchar(50) DEFAULT NULL,
  `parentvisaexpirydate` datetime DEFAULT NULL,
  `parentvisaappliedgovtofficename` varchar(50) DEFAULT NULL,
  `havearrangementwithrelative` int(10) DEFAULT NULL,
  `familyNameofrelative` varchar(50) DEFAULT NULL,
  `givenNameofrelative` varchar(50) DEFAULT NULL,
  `dateOfBirthofrelative` datetime DEFAULT NULL,
  `addressofRelative` varchar(200) DEFAULT NULL,
  `relationshipofrelative` varchar(50) DEFAULT NULL,
  `relativeresideasstatus` int(10) DEFAULT NULL,
  `permitedtostayfor` varchar(50) DEFAULT NULL,
  `permitedtostayDate` datetime DEFAULT NULL,
  `guardianvisasatus` int(11) DEFAULT NULL,
  `guardianvisano` varchar(50) DEFAULT NULL,
  `guardianvisaperiodofstay` varchar(50) DEFAULT NULL,
  `guardianvisaperiodofstayDate` datetime DEFAULT NULL,
  `govermentoffName` varchar(50) DEFAULT NULL,
  `periodofstayofguardian` varchar(50) DEFAULT NULL,
  `havewelfarearrangements` int(11) DEFAULT NULL,
  `parentsignature` varchar(50) DEFAULT NULL,
  `parentsignatureDate` datetime DEFAULT NULL,
  `parentFullname` varchar(50) DEFAULT NULL,
  `parentRelationshipwithstudent` varchar(50) DEFAULT NULL,
  `parentsignature1` varchar(50) DEFAULT NULL,
  `parentsignatureDate1` datetime DEFAULT NULL,
  `parentFullname1` varchar(50) DEFAULT NULL,
  `parentRelationshipwithstudent1` varchar(50) DEFAULT NULL,
  `havesolelegalrights` int(11) DEFAULT NULL,
  `personname` varchar(50) DEFAULT NULL,
  `personaddress` varchar(200) DEFAULT NULL,
  `personcontactno` varchar(50) DEFAULT NULL,
  `personrelationship` varchar(50) DEFAULT NULL,
  `personnatureoflegalrights` varchar(50) DEFAULT NULL,
  `parentsignatur67` varchar(50) DEFAULT NULL,
  `signDate` datetime DEFAULT NULL,
  `fullname67` varchar(50) DEFAULT NULL,
  `relationship67` varchar(50) DEFAULT NULL,
  `parentsignatur671` varchar(50) DEFAULT NULL,
  `signDate1` datetime DEFAULT NULL,
  `fullname671` varchar(50) DEFAULT NULL,
  `relationship671` varchar(50) DEFAULT NULL,
  `havereceiveassistance` int(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `othertitle` varchar(50) DEFAULT NULL,
  `assistedpersonfamilyname` varchar(50) DEFAULT NULL,
  `assistedpersongivenname` varchar(50) DEFAULT NULL,
  `assistedpersonaddress` varchar(200) DEFAULT NULL,
  `assistedpersonofficeno` varchar(50) DEFAULT NULL,
  `assistedpersonmobileno` varchar(50) DEFAULT NULL,
  `isregisteredwithMARA` int(10) DEFAULT NULL,
  `haveeducationagent` int(10) DEFAULT NULL,
  `businessname` varchar(50) DEFAULT NULL,
  `registrationno` varchar(50) DEFAULT NULL,
  `educationagentaddress` varchar(200) DEFAULT NULL,
  `educationagentemail` varchar(50) DEFAULT NULL,
  `educationagentofficeno` varchar(50) DEFAULT NULL,
  `educationagentphoneno` varchar(50) DEFAULT NULL,
  `educationagentfaxno` varchar(50) DEFAULT NULL,
  `haveagentinaustralia` int(10) DEFAULT NULL,
  `havepaytoassistance` int(10) DEFAULT NULL,
  `howmuchyoupay` varchar(50) DEFAULT NULL,
  `giftgiven` varchar(50) DEFAULT NULL,
  `valueofgift` varchar(50) DEFAULT NULL,
  `havewrittencommunications` int(10) DEFAULT NULL,
  `haveauthorisedperson` int(10) DEFAULT NULL,
  `authorisedpersontitle` varchar(50) DEFAULT NULL,
  `authorizedothertitle` varchar(50) DEFAULT NULL,
  `authorisedpersofamilynname` varchar(50) DEFAULT NULL,
  `authorisedpersongivenname` varchar(50) DEFAULT NULL,
  `authorisedpersonaddress` varchar(200) DEFAULT NULL,
  `authorisedpersonofficeno` varchar(50) DEFAULT NULL,
  `authorisedpersonmobileno` varchar(50) DEFAULT NULL,
  `haveagreetocommunicate` int(10) DEFAULT NULL,
  `Faxnumber` varchar(50) DEFAULT NULL,
  `authorizedpersonEmailaddress` varchar(200) DEFAULT NULL,
  `signatureauthorizedperson` varchar(50) DEFAULT NULL,
  `dateofsign` datetime DEFAULT NULL,
  `migratioagentNo` varchar(50) DEFAULT NULL,
  `offshoreagentId` varchar(50) DEFAULT NULL,
  `agenttitle` varchar(50) DEFAULT NULL,
  `otheragenttitle` varchar(50) DEFAULT NULL,
  `agentfamilyname` varchar(50) DEFAULT NULL,
  `agentgivenname` varchar(50) DEFAULT NULL,
  `agentcompanyname` varchar(50) DEFAULT NULL,
  `agenntaddress` varchar(200) DEFAULT NULL,
  `agentofficeno` varchar(50) DEFAULT NULL,
  `agentmobileno` varchar(50) DEFAULT NULL,
  `agentagreetocommunicate` int(10) DEFAULT NULL,
  `agentfaxno` varchar(50) DEFAULT NULL,
  `agentemailaddress` varchar(200) DEFAULT NULL,
  `agentsignature` varchar(50) DEFAULT NULL,
  `agentsigndate` datetime DEFAULT NULL,
  `paymentmethod` int(10) DEFAULT NULL,
  `paymentby` int(10) DEFAULT NULL,
  `amountinaustraliandollars` varchar(50) DEFAULT NULL,
  `creditcardno` varchar(50) DEFAULT NULL,
  `creditcardexpirydate` datetime DEFAULT NULL,
  `cardholdarname` varchar(50) DEFAULT NULL,
  `contactnumber` varchar(50) DEFAULT NULL,
  `addressofcardholder` varchar(200) DEFAULT NULL,
  `signatureofcardholder` varchar(50) DEFAULT NULL,
  `declarationsignature` varchar(50) DEFAULT NULL,
  `declarationdate` datetime DEFAULT NULL,
  `declarationsignature1` varchar(50) DEFAULT NULL,
  `declarationdate1` datetime DEFAULT NULL,
  `declarationsignature2` varchar(50) DEFAULT NULL,
  `declarationdate2` datetime DEFAULT NULL,
  `declarationsignature3` varchar(50) DEFAULT NULL,
  `declarationdate3` datetime DEFAULT NULL,
  `recordsaved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_australiavisadetailmaster_students` (`applicantid`),
  KEY `FK_australiavisadetailmaster_university_master` (`universityid`),
  CONSTRAINT `FK_australiavisadetailmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_australiavisadetailmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.australiavisadocumentmaster
CREATE TABLE IF NOT EXISTS `australiavisadocumentmaster` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `documentId` int(10) DEFAULT '0',
  `documenttype` varchar(200) DEFAULT '0',
  `documentpath` varchar(50) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_australiavisadocumentmaster_students` (`applicantid`),
  KEY `FK_australiavisadocumentmaster_university_master` (`universityid`),
  CONSTRAINT `FK_australiavisadocumentmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_australiavisadocumentmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.australiavisaFamilydetailmaster
CREATE TABLE IF NOT EXISTS `australiavisaFamilydetailmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `familyInfoID` int(10) NOT NULL DEFAULT '0',
  `applicantid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  `aboutfamilyname` varchar(50) DEFAULT NULL,
  `aboutfamilygivenname` varchar(50) DEFAULT NULL,
  `relationshiptoyou` varchar(50) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `dobfamilymember` datetime DEFAULT NULL,
  `isfamilymemberhavepassport` int(10) DEFAULT NULL,
  `passportno` varchar(50) DEFAULT NULL,
  `countryofpassport` int(10) DEFAULT NULL,
  `passportdateofissue` datetime DEFAULT NULL,
  `passportdateofexpiry` datetime DEFAULT NULL,
  `passportplaceofissue` varchar(50) DEFAULT NULL,
  `studyinAustralia` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_australiavisaFamilydetailmaster_students` (`applicantid`),
  KEY `FK_australiavisaFamilydetailmaster_university_master` (`universityid`),
  CONSTRAINT `FK_australiavisaFamilydetailmaster_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_australiavisaFamilydetailmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.careeroutcomes_master
CREATE TABLE IF NOT EXISTS `careeroutcomes_master` (
  `careerID` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`careerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.careeroutcomes_position_master
CREATE TABLE IF NOT EXISTS `careeroutcomes_position_master` (
  `careerpositionID` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `careerID` int(10) DEFAULT NULL,
  PRIMARY KEY (`careerpositionID`),
  KEY `FK_careeroutcomes_position_master_careeroutcomes_master` (`careerID`),
  CONSTRAINT `FK_careeroutcomes_position_master_careeroutcomes_master` FOREIGN KEY (`careerID`) REFERENCES `careeroutcomes_master` (`careerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.careerposition_course_mapping
CREATE TABLE IF NOT EXISTS `careerposition_course_mapping` (
  `mappingID` int(10) NOT NULL AUTO_INCREMENT,
  `courseID` int(10) DEFAULT NULL,
  `careeroutcomeId` int(10) DEFAULT NULL,
  `positionID` int(10) DEFAULT NULL,
  PRIMARY KEY (`mappingID`),
  KEY `FK_careerposition_course_mapping_coursemaster` (`courseID`),
  KEY `FK_careerposition_course_mapping_careeroutcomes_master` (`careeroutcomeId`),
  KEY `FK_careerposition_course_mapping_careeroutcomes_position_master` (`positionID`),
  CONSTRAINT `FK_careerposition_course_mapping_careeroutcomes_master` FOREIGN KEY (`careeroutcomeId`) REFERENCES `careeroutcomes_master` (`careerID`),
  CONSTRAINT `FK_careerposition_course_mapping_careeroutcomes_position_master` FOREIGN KEY (`positionID`) REFERENCES `careeroutcomes_position_master` (`careerpositionID`),
  CONSTRAINT `FK_careerposition_course_mapping_coursemaster` FOREIGN KEY (`courseID`) REFERENCES `coursemaster` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.cefrlevelmaster
CREATE TABLE IF NOT EXISTS `cefrlevelmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(44) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.citymaster
CREATE TABLE IF NOT EXISTS `citymaster` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) NOT NULL DEFAULT '0',
  `cost_of_living` varchar(2000) NOT NULL DEFAULT '0',
  `around` varchar(2000) NOT NULL DEFAULT '0',
  `weather` varchar(2000) NOT NULL DEFAULT '0',
  `geting_there` varchar(2000) NOT NULL DEFAULT '0',
  `name` varchar(2000) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `FK_cityMaster_countriesMaster` FOREIGN KEY (`country_id`) REFERENCES `countriesmaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.clarificationquestionsmaster
CREATE TABLE IF NOT EXISTS `clarificationquestionsmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `questiontype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.clarificationquestion_university_mapping
CREATE TABLE IF NOT EXISTS `clarificationquestion_university_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) NOT NULL,
  `clarificationquestionid` int(11) NOT NULL,
  `clarificationquestionanswer` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `universityid` (`universityid`),
  KEY `clarificationquestionid` (`clarificationquestionid`),
  CONSTRAINT `FK_clarificationmaster_clarificationquestion_mapping` FOREIGN KEY (`clarificationquestionid`) REFERENCES `clarificationquestionsmaster` (`id`),
  CONSTRAINT `FK_university_clarificationquestion_mapping` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.controlmaster
CREATE TABLE IF NOT EXISTS `controlmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controltype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.countriesmaster
CREATE TABLE IF NOT EXISTS `countriesmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `dual_citizenship_allowed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table GTE_Prod.countrywisealternateidproofmaster
CREATE TABLE IF NOT EXISTS `countrywisealternateidproofmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `alternateidproofID` int(10) DEFAULT NULL,
  `countryID` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__alternateidproofmaster` (`alternateidproofID`),
  KEY `FK__countriesmaster` (`countryID`),
  CONSTRAINT `FK__alternateidproofmaster` FOREIGN KEY (`alternateidproofID`) REFERENCES `alternateidproofmaster` (`id`),
  CONSTRAINT `FK__countriesmaster` FOREIGN KEY (`countryID`) REFERENCES `countriesmaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.coursemaster
CREATE TABLE IF NOT EXISTS `coursemaster` (
  `courseid` int(10) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(200) DEFAULT NULL,
  `majordisciplineId` int(1) DEFAULT NULL,
  `modeofstudyId` int(1) DEFAULT NULL,
  `levelofstudyId` int(1) DEFAULT NULL,
  `universityid` int(1) DEFAULT NULL,
  `coursefee` decimal(10,2) DEFAULT NULL,
  `courseeligibility` varchar(2000) DEFAULT NULL,
  `courseurl` varchar(500) DEFAULT NULL,
  `courseduration` varchar(500) DEFAULT NULL,
  `coursedescription` varchar(2000) DEFAULT NULL,
  `currencyid` int(10) DEFAULT NULL,
  `isactive` bit(1) DEFAULT b'0',
  `isdomestic_course` bit(1) DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `FK_coursemaster_studymodemaster` (`modeofstudyId`),
  KEY `FK_coursemaster_studylevelmaster` (`levelofstudyId`),
  KEY `FK_coursemaster_majordiscipline_master` (`majordisciplineId`),
  KEY `universityid` (`universityid`),
  KEY `FK_coursemaster_currency_master` (`currencyid`),
  CONSTRAINT `FK_coursemaster_currency_master` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `FK_coursemaster_majordiscipline_master` FOREIGN KEY (`majordisciplineId`) REFERENCES `majordiscipline_master` (`id`),
  CONSTRAINT `FK_coursemaster_studylevelmaster` FOREIGN KEY (`levelofstudyId`) REFERENCES `studylevelmaster` (`studylevelid`),
  CONSTRAINT `FK_coursemaster_studymodemaster` FOREIGN KEY (`modeofstudyId`) REFERENCES `studymodemaster` (`id`),
  CONSTRAINT `FK_coursemaster_universitymaster` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.coursetypemaster
CREATE TABLE IF NOT EXISTS `coursetypemaster` (
  `coursetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `coursetypename` varchar(45) DEFAULT NULL,
  `universityid` int(1) DEFAULT NULL,
  PRIMARY KEY (`coursetypeid`),
  KEY `FK_coursetypemaster_university_master` (`universityid`),
  CONSTRAINT `FK_coursetypemaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.course_campus_mapping
CREATE TABLE IF NOT EXISTS `course_campus_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `campusid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_courseMapping_coursemaster` (`courseid`),
  KEY `FK_courseMapping_universitycampus` (`campusid`),
  CONSTRAINT `FK_courseMapping_coursemaster` FOREIGN KEY (`courseid`) REFERENCES `coursemaster` (`courseid`),
  CONSTRAINT `FK_courseMapping_universitycampus` FOREIGN KEY (`campusid`) REFERENCES `universitycampus` (`campusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.course_dates
CREATE TABLE IF NOT EXISTS `course_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `commencementdate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `FK_courseDates_coursemaster_` FOREIGN KEY (`courseid`) REFERENCES `coursemaster` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.course_defermentdates
CREATE TABLE IF NOT EXISTS `course_defermentdates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `defermentdate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `FK_defermentDate_coursemaster` FOREIGN KEY (`courseid`) REFERENCES `coursemaster` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.credentialmaster
CREATE TABLE IF NOT EXISTS `credentialmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `overall_rank_type1` varchar(50) NOT NULL,
  `overall_rank_type2` varchar(50) NOT NULL,
  `overall_rank_type3` varchar(50) NOT NULL,
  `awards` varchar(200) NOT NULL,
  `ranking_by_subject` varchar(50) NOT NULL,
  `ranking_by_region` varchar(50) NOT NULL,
  `rank_improved` bit(1) NOT NULL,
  `university_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `university_id` (`university_id`),
  CONSTRAINT `FK_credential_university` FOREIGN KEY (`university_id`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.currency_master
CREATE TABLE IF NOT EXISTS `currency_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_symbol` varchar(50) NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Dumping structure for table GTE_Prod.customfieldmaster
CREATE TABLE IF NOT EXISTS `customfieldmaster` (
  `customfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(1) NOT NULL,
  `formid` int(1) NOT NULL,
  `labeldescription` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customfieldid`),
  KEY `FK_customfieldmaster_formmaster` (`formid`),
  KEY `FK_customfieldmaster_university_master` (`universityid`),
  CONSTRAINT `FK_customfieldmaster_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `FK_customfieldmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.customfieldvalue
CREATE TABLE IF NOT EXISTS `customfieldvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `customfieldid` int(1) NOT NULL,
  `value` varchar(200) NOT NULL,
  `formid` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_customfieldvalue_customfieldmaster` (`customfieldid`),
  KEY `FK_customfieldvalue_students` (`applicantid`),
  CONSTRAINT `FK_customfieldvalue_customfieldmaster` FOREIGN KEY (`customfieldid`) REFERENCES `customfieldmaster` (`customfieldid`),
  CONSTRAINT `FK_customfieldvalue_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.declaration_master
CREATE TABLE IF NOT EXISTS `declaration_master` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `header_description` varchar(2000) DEFAULT NULL,
  `statement_description` varchar(10000) DEFAULT NULL,
  `universityId` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_declaration_master_university_master` (`universityId`),
  CONSTRAINT `FK_declaration_master_university_master` FOREIGN KEY (`universityId`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.disabilitymaster
CREATE TABLE IF NOT EXISTS `disabilitymaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.documentvalidationbyagent
CREATE TABLE IF NOT EXISTS `documentvalidationbyagent` (
  `documentvalidationid` int(11) NOT NULL AUTO_INCREMENT,
  `documentid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`documentvalidationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.educationdetailcheck_referee_response
CREATE TABLE IF NOT EXISTS `educationdetailcheck_referee_response` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `applicantId` int(10) DEFAULT NULL,
  `universityId` int(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `verifieddetailsresponse` int(10) DEFAULT NULL,
  `howlongknoweachresponse` varchar(200) DEFAULT NULL,
  `performancedescription` varchar(200) DEFAULT NULL,
  `greateststrengthresponse` varchar(200) DEFAULT NULL,
  `additionalInforesponse` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.educationmediummaster
CREATE TABLE IF NOT EXISTS `educationmediummaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.educationverificationcontactmaster
CREATE TABLE IF NOT EXISTS `educationverificationcontactmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.entertainment
CREATE TABLE IF NOT EXISTS `entertainment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.facilitiesmaster
CREATE TABLE IF NOT EXISTS `facilitiesmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.facility_campus_mapping
CREATE TABLE IF NOT EXISTS `facility_campus_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campusId` int(11) NOT NULL,
  `facilityId` int(11) NOT NULL,
  `IsFree` bit(1) NOT NULL,
  `cost` int(11) DEFAULT '0',
  `facility_site` varchar(50) NOT NULL,
  `distance` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facilityId` (`facilityId`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `FK_mapping_campusdetail` FOREIGN KEY (`campusId`) REFERENCES `universitycampus` (`campusid`),
  CONSTRAINT `FK_mapping_facilitiesMaster` FOREIGN KEY (`facilityId`) REFERENCES `facilitiesmaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.familymember
CREATE TABLE IF NOT EXISTS `familymember` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for procedure GTE_Prod.fetchapplicantDetail
DELIMITER //
CREATE DEFINER=`hcommadmin`@`%` PROCEDURE `fetchapplicantDetail`()
BEGIN
select DATEDIFF(now(),creationtime) as Days,applicantID,name,passport_no,mobile_no, email from Applicant_master
where  DATEDIFF(now(),creationtime)<4 order by Days and (isanswerdquestion is null or isanswerdquestion=0);
END//
DELIMITER ;

-- Dumping structure for table GTE_Prod.fieldvalidationmaster
CREATE TABLE IF NOT EXISTS `fieldvalidationmaster` (
  `fieldvalidationid` int(11) NOT NULL AUTO_INCREMENT,
  `formfieldid` int(11) DEFAULT NULL,
  `regularexpression` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fieldvalidationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.formfieldmapping
CREATE TABLE IF NOT EXISTS `formfieldmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formfieldid` int(11) DEFAULT NULL,
  `formid` int(1) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  `displayorder` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.formfieldmaster
CREATE TABLE IF NOT EXISTS `formfieldmaster` (
  `formfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `tooltips` varchar(500) DEFAULT NULL,
  `isvalidation` int(1) DEFAULT '0',
  `isdepedent` bit(1) DEFAULT NULL,
  `depedentformfieldid` int(11) DEFAULT NULL,
  `depedentformfieldvalue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`formfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.formmaster
CREATE TABLE IF NOT EXISTS `formmaster` (
  `formid` int(1) NOT NULL AUTO_INCREMENT,
  `formname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`formid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.grademaster
CREATE TABLE IF NOT EXISTS `grademaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for view GTE_Prod.GTE.documentverification
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `GTE.documentverification` (
	`documentid` INT(11) NOT NULL,
	`applicantid` INT(11) NULL,
	`documentname` VARCHAR(100) NULL COLLATE 'latin1_swedish_ci',
	`documentvalidationId` INT(11) NULL,
	`agentid` INT(11) NULL,
	`lastupdatedate` DATETIME NULL,
	`remarks` VARCHAR(200) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table GTE_Prod.gtepreliminarysection_applicantanswers
CREATE TABLE IF NOT EXISTS `gtepreliminarysection_applicantanswers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `applicantId` int(10) NOT NULL,
  `gte_preliminary_section_question_id` int(10) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `answersubmittedtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.gte_answer_master
CREATE TABLE IF NOT EXISTS `gte_answer_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(250) NOT NULL,
  `gte_score` int(10) NOT NULL,
  `gte_risk_score` int(10) NOT NULL,
  `gte_question_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gte_question_id` (`gte_question_id`),
  CONSTRAINT `FK_answer_gteQuestion` FOREIGN KEY (`gte_question_id`) REFERENCES `gte_questions_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_applicantdetails
CREATE TABLE IF NOT EXISTS `gte_applicantdetails` (
  `gte_applicantdetailsid` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `countryofbirth` int(11) DEFAULT NULL,
  `maritalstatus` int(11) DEFAULT NULL,
  `dateofmarriage` datetime DEFAULT NULL,
  `nationalityofspouse` int(11) DEFAULT NULL,
  `highestqualificationname` varchar(50) DEFAULT NULL,
  `highestqualifiactionachieved` varchar(11) DEFAULT NULL,
  `highestqualificationfield` int(11) DEFAULT NULL,
  `highestqualificationdate` varchar(10) DEFAULT NULL,
  `highestqualificationcountry` int(11) DEFAULT NULL,
  `levelofcourse` varchar(11) DEFAULT NULL,
  `fieldofstudyapplied` int(11) DEFAULT NULL,
  `campusid` int(11) DEFAULT NULL,
  `coursename` varchar(50) DEFAULT NULL,
  `commencementdate` varchar(50) DEFAULT NULL,
  `workexperience` int(11) DEFAULT NULL,
  `typeofworkexperience` int(11) DEFAULT NULL,
  `residencecountry` int(11) DEFAULT NULL,
  `tuitionandlivingcost` int(11) DEFAULT NULL,
  `nameofuniversityappliedfor` int(11) DEFAULT NULL,
  `cityofeducationInstitution` int(11) DEFAULT NULL,
  `isstudentreferbyagent` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `profilepicturepath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gte_applicantdetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_applicantdocument
CREATE TABLE IF NOT EXISTS `gte_applicantdocument` (
  `applicantdocumentid` int(10) NOT NULL AUTO_INCREMENT,
  `universityid` int(10) DEFAULT NULL,
  `applicantid` int(10) DEFAULT NULL,
  `documentpath` varchar(100) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`applicantdocumentid`),
  KEY `FK__students` (`applicantid`),
  CONSTRAINT `FK__students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_clarification_applicantresponse
CREATE TABLE IF NOT EXISTS `gte_clarification_applicantresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `clarification_question_id` int(11) NOT NULL,
  `applicant_response` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clarification_question_id` (`clarification_question_id`),
  CONSTRAINT `FK_response_clarification_questionmaster` FOREIGN KEY (`clarification_question_id`) REFERENCES `gte_clarification_questionmaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_clarification_questionmaster
CREATE TABLE IF NOT EXISTS `gte_clarification_questionmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gte_master1_id` int(11) DEFAULT NULL,
  `clarification_question` varchar(400) NOT NULL,
  `display_condition` bit(1) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gte_master1_id` (`gte_master1_id`),
  CONSTRAINT `FK_clarification_gte_master_part2` FOREIGN KEY (`gte_master1_id`) REFERENCES `gte_question_master_part2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_declaration_master
CREATE TABLE IF NOT EXISTS `gte_declaration_master` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `universityId` int(10) DEFAULT NULL,
  `statementdescription` varchar(10000) DEFAULT NULL,
  `header_description` varchar(2000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_gte_declaration_master_university_master` (`universityId`),
  CONSTRAINT `FK_gte_declaration_master_university_master` FOREIGN KEY (`universityId`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_preliminaryapplicantanswers
CREATE TABLE IF NOT EXISTS `gte_preliminaryapplicantanswers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `gte_preliminary_question_id` int(1) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `answersubmittedtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_preliminary_questionmaster
CREATE TABLE IF NOT EXISTS `gte_preliminary_questionmaster` (
  `gte_preliminaryid` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer1` varchar(500) DEFAULT NULL,
  `answer2` varchar(500) DEFAULT NULL,
  `answer3` varchar(500) DEFAULT NULL,
  `answer4` varchar(500) DEFAULT NULL,
  `correctanswer` varchar(45) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `answer1_description` varchar(1000) DEFAULT NULL,
  `answer2_description` varchar(1000) DEFAULT NULL,
  `answer3_description` varchar(1000) DEFAULT NULL,
  `answer4_description` varchar(1000) DEFAULT NULL,
  `question_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gte_preliminaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.gte_preliminary_section_questionmaster
CREATE TABLE IF NOT EXISTS `gte_preliminary_section_questionmaster` (
  `gte_questionID` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  `answer1` varchar(10) DEFAULT NULL,
  `answer2` varchar(10) DEFAULT NULL,
  `correctanswer` varchar(10) DEFAULT NULL,
  `answer1_description` varchar(1000) DEFAULT NULL,
  `answer2_description` varchar(1000) DEFAULT NULL,
  `question_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gte_questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.gte_progressbar
CREATE TABLE IF NOT EXISTS `gte_progressbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) NOT NULL,
  `is_gte_tutorial_completed` bit(1) DEFAULT NULL,
  `is_gte_preliminarysection1_completed` bit(1) DEFAULT NULL,
  `is_gte_preliminarysection2_completed` bit(1) DEFAULT NULL,
  `is_gte_declaration_completed` bit(1) DEFAULT NULL,
  `is_gte_certificate_generated` bit(1) DEFAULT NULL,
  `certificate_name` varchar(50) DEFAULT NULL,
  `certificate_creation_date` date DEFAULT NULL,
  `performance_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_questions_applicant_response
CREATE TABLE IF NOT EXISTS `gte_questions_applicant_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gte_question_id` int(11) NOT NULL,
  `gte_answer_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `applicant_response_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gte_question_id` (`gte_question_id`),
  KEY `gte_answer_id` (`gte_answer_id`),
  CONSTRAINT `FK_response_question` FOREIGN KEY (`gte_question_id`) REFERENCES `gte_questions_master` (`id`),
  CONSTRAINT `FK_resposne_answer` FOREIGN KEY (`gte_answer_id`) REFERENCES `gte_answer_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_questions_master
CREATE TABLE IF NOT EXISTS `gte_questions_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_question_master_part2
CREATE TABLE IF NOT EXISTS `gte_question_master_part2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) NOT NULL,
  `tag` varchar(200) NOT NULL,
  `true_gte_score` int(1) NOT NULL,
  `true_risk_score` int(1) NOT NULL,
  `false_gte_score` int(1) NOT NULL,
  `false_risk_score` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_question_part2_applicant_response
CREATE TABLE IF NOT EXISTS `gte_question_part2_applicant_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `applicant_response` bit(1) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `response_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `FK_response_gteQuestionPart2` FOREIGN KEY (`question_id`) REFERENCES `gte_question_master_part2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_report_admin_comment
CREATE TABLE IF NOT EXISTS `gte_report_admin_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_sop_id` int(10) NOT NULL,
  `applicant_id` int(10) NOT NULL,
  `university_id` int(10) NOT NULL,
  `para1_comments` varchar(1000) DEFAULT NULL,
  `para2_comments` varchar(1000) DEFAULT NULL,
  `para3_comments` varchar(1000) DEFAULT NULL,
  `para4_comments` varchar(1000) DEFAULT NULL,
  `para5_comments` varchar(1000) DEFAULT NULL,
  `student_video_comments` varchar(1000) DEFAULT NULL,
  `student_document_comments` varchar(1000) DEFAULT NULL,
  `student_recommended` varchar(100) DEFAULT NULL,
  `final_recommendation` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_sop_id` (`student_sop_id`),
  CONSTRAINT `FK_reportFeedBack_studentSop` FOREIGN KEY (`student_sop_id`) REFERENCES `gte_student_sop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_statementofpurpose
CREATE TABLE IF NOT EXISTS `gte_statementofpurpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` varchar(400) NOT NULL,
  `condition_applicable` bit(1) DEFAULT NULL,
  `question_id` varchar(100) NOT NULL,
  `question_section` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `paragraph` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_student_sop
CREATE TABLE IF NOT EXISTS `gte_student_sop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(10) NOT NULL,
  `universityid` int(10) NOT NULL,
  `gte_sop_para1` varchar(4000) NOT NULL,
  `gte_sop_para2` varchar(4000) NOT NULL,
  `gte_sop_para3` varchar(4000) NOT NULL,
  `gte_sop_para4` varchar(4000) NOT NULL,
  `gte_sop_para5` varchar(4000) NOT NULL,
  `applicant_generated_sop_para1` varchar(4000) NOT NULL,
  `applicant_generated_sop_para2` varchar(4000) NOT NULL,
  `applicant_generated_sop_para3` varchar(4000) NOT NULL,
  `applicant_generated_sop_para4` varchar(4000) NOT NULL,
  `applicant_generated_sop_para5` varchar(4000) NOT NULL,
  `is_sop_submitted_by_applicant` bit(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `edited_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_tutorialmaster
CREATE TABLE IF NOT EXISTS `gte_tutorialmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `documentpath` varchar(200) DEFAULT NULL,
  `videourl` varchar(100) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.gte_videouploadmaster
CREATE TABLE IF NOT EXISTS `gte_videouploadmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `applicantid` int(10) DEFAULT '0',
  `universityid` int(10) DEFAULT '0',
  `videourl` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.health_insurance
CREATE TABLE IF NOT EXISTS `health_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.inferencemaster
CREATE TABLE IF NOT EXISTS `inferencemaster` (
  `inferenceid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`inferenceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.invalidatamaster
CREATE TABLE IF NOT EXISTS `invalidatamaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `passportno` varchar(45) DEFAULT NULL,
  `creationtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isfollowupdone` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.majordiscipline_master
CREATE TABLE IF NOT EXISTS `majordiscipline_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.manageaccomdationplan
CREATE TABLE IF NOT EXISTS `manageaccomdationplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accomdationid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_manageaccomdationplan_accomation_idx` (`accomdationid`),
  KEY `fk_manageaccomdationplan_cureency_idx` (`currencyid`),
  KEY `FK_manageaccomdationplan_citymaster` (`cityid`),
  CONSTRAINT `FK_manageaccomdationplan_citymaster` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_manageaccomdationplan_accomation` FOREIGN KEY (`accomdationid`) REFERENCES `accommodationplan` (`id`),
  CONSTRAINT `fk_manageaccomdationplan_cureency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.manageentertainment
CREATE TABLE IF NOT EXISTS `manageentertainment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainmentid` int(11) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_manageentertainment_entertainment_idx` (`entertainmentid`),
  KEY `fk_manageentertainment_currency_idx` (`currencyid`),
  KEY `fk_manageentertainment_city_idx` (`cityid`),
  CONSTRAINT `fk_manageentertainment_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_manageentertainment_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_manageentertainment_entertainment` FOREIGN KEY (`entertainmentid`) REFERENCES `entertainment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managehealth_insurance
CREATE TABLE IF NOT EXISTS `managehealth_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insuranceid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_amount` decimal(10,2) DEFAULT NULL,
  `extra_child_amount` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_managehealth_insurance_health_idx` (`insuranceid`),
  KEY `fk_managehealth_insurance_currency_idx` (`currencyid`),
  KEY `fk_managehealth_insurance_city_idx` (`cityid`),
  CONSTRAINT `fk_managehealth_insurance_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_managehealth_insurance_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_managehealth_insurance_health` FOREIGN KEY (`insuranceid`) REFERENCES `health_insurance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managemeal
CREATE TABLE IF NOT EXISTS `managemeal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managemealplan
CREATE TABLE IF NOT EXISTS `managemealplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mealid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_managemealplan_meal_idx` (`mealid`),
  KEY `fk_managemealplan_currency_idx` (`currencyid`),
  KEY `fk_managemealplan_city_idx` (`cityid`),
  CONSTRAINT `fk_managemealplan_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_managemealplan_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_managemealplan_meal` FOREIGN KEY (`mealid`) REFERENCES `managemeal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managetransportchoice
CREATE TABLE IF NOT EXISTS `managetransportchoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transportchoice` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_managetransportchoice_transportchoice_idx` (`transportchoice`),
  KEY `fk_managetransportchoice_currency_idx` (`currencyid`),
  KEY `fk_managetransportchoice_city_idx` (`cityid`),
  CONSTRAINT `fk_managetransportchoice_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_managetransportchoice_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_managetransportchoice_transportchoice` FOREIGN KEY (`transportchoice`) REFERENCES `transportchoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managetrips
CREATE TABLE IF NOT EXISTS `managetrips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tripid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_managetrips_trips_idx` (`tripid`),
  KEY `fk_managetrips_currency_idx` (`currencyid`),
  KEY `fk_managetrips_city_idx` (`cityid`),
  CONSTRAINT `fk_managetrips_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_managetrips_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_managetrips_trips` FOREIGN KEY (`tripid`) REFERENCES `trips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.manageutilities
CREATE TABLE IF NOT EXISTS `manageutilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilityid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `extra_adult_percentage` decimal(10,2) DEFAULT NULL,
  `extra_child_percentage` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_manageutilities_utilities_idx` (`utilityid`),
  KEY `fk_manageutilities_currency_idx` (`currencyid`),
  KEY `fk_manageutilities_city_idx` (`cityid`),
  CONSTRAINT `fk_manageutilities_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_manageutilities_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `fk_manageutilities_utilities` FOREIGN KEY (`utilityid`) REFERENCES `utilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.managevisa
CREATE TABLE IF NOT EXISTS `managevisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visaid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extra_adult_amount` decimal(10,2) DEFAULT NULL,
  `extra_child_amount` decimal(10,2) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_managevisa_visa_idx` (`visaid`),
  KEY `fk_managevisa_currency_idx` (`currencyid`),
  KEY `fk_managevisa_city_idx` (`cityid`),
  CONSTRAINT `fk_managevisa_city` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`),
  CONSTRAINT `fk_managevisa_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_managevisa_visa` FOREIGN KEY (`visaid`) REFERENCES `visa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.maritalstatusmaster
CREATE TABLE IF NOT EXISTS `maritalstatusmaster` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.master_name
CREATE TABLE IF NOT EXISTS `master_name` (
  `masterid` int(1) NOT NULL AUTO_INCREMENT,
  `mastername` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`masterid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.payment_description_mappings
CREATE TABLE IF NOT EXISTS `payment_description_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_description_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_description_id` (`payment_description_id`),
  KEY `university_id` (`university_id`),
  CONSTRAINT `FK_payment_description_mappings_payment_description_master` FOREIGN KEY (`payment_description_id`) REFERENCES `payment_description_master` (`id`),
  CONSTRAINT `FK_payment_description_mappings_university_master` FOREIGN KEY (`university_id`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.payment_description_master
CREATE TABLE IF NOT EXISTS `payment_description_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.payment_details
CREATE TABLE IF NOT EXISTS `payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `payment_for` int(2) NOT NULL,
  `due_date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `instruction` varchar(2000) NOT NULL,
  `payment_proof_file_name` varchar(100) DEFAULT NULL,
  `payment_status` int(10) NOT NULL,
  `payment_verified_date` date DEFAULT NULL,
  `applicationmaster_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applicant_id` (`applicant_id`),
  KEY `university_id` (`university_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `FK_payment_details_applicantdetails` FOREIGN KEY (`applicant_id`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_payment_details_currency_master` FOREIGN KEY (`currency_id`) REFERENCES `currency_master` (`id`),
  CONSTRAINT `FK_payment_details_university_master` FOREIGN KEY (`university_id`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.payment_status_master
CREATE TABLE IF NOT EXISTS `payment_status_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.predeparturetutorialmaster
CREATE TABLE IF NOT EXISTS `predeparturetutorialmaster` (
  `predeparturetutorialid` int(10) NOT NULL AUTO_INCREMENT,
  `universityid` int(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `documentpath` varchar(200) DEFAULT NULL,
  `videourl` varchar(100) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `crearted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`predeparturetutorialid`),
  KEY `FK_predeparturetutorialmaster_university_master` (`universityid`),
  CONSTRAINT `FK_predeparturetutorialmaster_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.preliminaryapplicantanswers
CREATE TABLE IF NOT EXISTS `preliminaryapplicantanswers` (
  `preliminaryapplicantanswersid` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `preliminaryid` int(1) DEFAULT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `answersubmittedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`preliminaryapplicantanswersid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.preliminary_questionmaster
CREATE TABLE IF NOT EXISTS `preliminary_questionmaster` (
  `preliminaryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(200) DEFAULT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  `answer4` varchar(45) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `correctanswer` varchar(45) DEFAULT NULL,
  `universityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`preliminaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.primaryfieldmaster
CREATE TABLE IF NOT EXISTS `primaryfieldmaster` (
  `primaryfieldid` int(1) NOT NULL AUTO_INCREMENT,
  `formid` int(1) DEFAULT NULL,
  `primaryfiledname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`primaryfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.profilemaster
CREATE TABLE IF NOT EXISTS `profilemaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicantid` int(11) DEFAULT NULL,
  `basicinfo` int(1) DEFAULT NULL,
  `educationinfo` int(1) DEFAULT NULL,
  `employerinfo` int(1) DEFAULT NULL,
  `finacialinfo` int(1) DEFAULT NULL,
  `englishtest` int(1) DEFAULT NULL,
  `sponsorsdetails` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.qualificationcountriesmapping
CREATE TABLE IF NOT EXISTS `qualificationcountriesmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualificationid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qualificationmaster_qualificationcountrymapping_idx` (`qualificationid`),
  KEY `FK_qualificationcountriesmapping_countriesmaster` (`countryid`),
  CONSTRAINT `FK_qualificationcountriesmapping_countriesmaster` FOREIGN KEY (`countryid`) REFERENCES `countriesmaster` (`id`),
  CONSTRAINT `FK_qualificationmaster_qualificationcountrymapping` FOREIGN KEY (`qualificationid`) REFERENCES `qualificationmaster` (`qualificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.qualificationmaster
CREATE TABLE IF NOT EXISTS `qualificationmaster` (
  `qualificationid` int(11) NOT NULL AUTO_INCREMENT,
  `qualificationname` varchar(200) NOT NULL,
  PRIMARY KEY (`qualificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.question_master
CREATE TABLE IF NOT EXISTS `question_master` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `isprimary` int(1) DEFAULT NULL,
  `infrencecategoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.realtionshipmaster
CREATE TABLE IF NOT EXISTS `realtionshipmaster` (
  `relationshiptid` int(10) NOT NULL AUTO_INCREMENT,
  `relationshipname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`relationshiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.registrationcourses
CREATE TABLE IF NOT EXISTS `registrationcourses` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(200) NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.rejection_reasonmaster
CREATE TABLE IF NOT EXISTS `rejection_reasonmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.relative_master
CREATE TABLE IF NOT EXISTS `relative_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantid` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `isinautralia` int(1) DEFAULT NULL,
  `isdependent` int(1) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `passport_no` varchar(15) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.rolemaster
CREATE TABLE IF NOT EXISTS `rolemaster` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.scholarships
CREATE TABLE IF NOT EXISTS `scholarships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `eligibility` varchar(200) NOT NULL,
  `application_deadline` datetime NOT NULL,
  `scholarship_form` varchar(200) NOT NULL,
  `award_amount` varchar(200) NOT NULL,
  `awarded_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.secondarylanguagemaster
CREATE TABLE IF NOT EXISTS `secondarylanguagemaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languagecode` varchar(5) DEFAULT NULL,
  `secondarylanguagename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for procedure GTE_Prod.shell_creation
DELIMITER //
CREATE DEFINER=`hcommadmin`@`%` PROCEDURE `shell_creation`(in username varchar(25),in pwd varchar(20),in aId int,in name varchar(100),in email varchar(50))
BEGIN
declare profile_id int;
  INSERT INTO user (username,password,usercreationdate,status,role,name,email) Values
              (username,pwd,now(),1,3,name,email);
   SET profile_id = LAST_INSERT_ID(); 
UPDATE Applicant_master SET userid = profile_id,isusercreated=1,creationtime=now() WHERE applicantID = aId;
INSERT INTO profilemaster (applicantID,basicinfo,educationinfo,
employerinfo,finacialinfo,englishtest,sponsorsdetails)
 values(aId,1,1,1,1,1,1);

END//
DELIMITER ;

-- Dumping structure for table GTE_Prod.studentcoursemapping
CREATE TABLE IF NOT EXISTS `studentcoursemapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_studentcoursemapping_students` (`studentid`),
  KEY `FK_studentcoursemapping_registrationcourses` (`courseid`),
  CONSTRAINT `FK_studentcoursemapping_registrationcourses` FOREIGN KEY (`courseid`) REFERENCES `registrationcourses` (`courseid`),
  CONSTRAINT `FK_studentcoursemapping_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.students
CREATE TABLE IF NOT EXISTS `students` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enrollmentyear` int(11) NOT NULL,
  `studylevelid` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verificationkey` varchar(50) NOT NULL,
  `isverified` bit(1) NOT NULL DEFAULT b'0',
  `otp` int(11) NOT NULL,
  `ispasswordset` bit(1) DEFAULT b'0',
  `isDomesticStudent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  KEY `FK_students_studylevelmaster` (`studylevelid`),
  CONSTRAINT `FK_students_studylevelmaster` FOREIGN KEY (`studylevelid`) REFERENCES `studylevelmaster` (`studylevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.student_sop
CREATE TABLE IF NOT EXISTS `student_sop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `student_sop` varchar(2000) NOT NULL,
  `student_submitted_sop` varchar(2000) NOT NULL,
  `is_student_sop_submitted` bit(1) NOT NULL DEFAULT b'0',
  `submitted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.studylevelmaster
CREATE TABLE IF NOT EXISTS `studylevelmaster` (
  `studylevelid` int(11) NOT NULL AUTO_INCREMENT,
  `studylevel` varchar(100) NOT NULL,
  `levelofcode` varchar(100) NOT NULL,
  PRIMARY KEY (`studylevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.studymodemaster
CREATE TABLE IF NOT EXISTS `studymodemaster` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `universityid` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.studyoptionmaster
CREATE TABLE IF NOT EXISTS `studyoptionmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.subjectmaster
CREATE TABLE IF NOT EXISTS `subjectmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.subjectwisecountrymapping
CREATE TABLE IF NOT EXISTS `subjectwisecountrymapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subjectmaster_countrywisesubjectmapping_idx` (`subjectid`),
  CONSTRAINT `FK_subjectmaster_subjectwisecountrymapping` FOREIGN KEY (`subjectid`) REFERENCES `subjectmaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.supervisorcomments
CREATE TABLE IF NOT EXISTS `supervisorcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisorid` int(11) NOT NULL,
  `formid` int(1) NOT NULL,
  `universityid` int(1) NOT NULL,
  `applicantid` int(1) NOT NULL,
  `supervisoraction` int(1) NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_supervisorcomments_adminusers_idx` (`supervisorid`),
  KEY `fk_supervisorcomments_formmaster_idx` (`formid`),
  KEY `fk_supervisorcomments_university_master_idx` (`universityid`),
  KEY `fk_supervisorcomments_students_idx` (`applicantid`),
  CONSTRAINT `fk_supervisorcomments_adminusers` FOREIGN KEY (`supervisorid`) REFERENCES `adminusers` (`adminid`),
  CONSTRAINT `fk_supervisorcomments_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `fk_supervisorcomments_students` FOREIGN KEY (`applicantid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `fk_supervisorcomments_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.supportservicemaster
CREATE TABLE IF NOT EXISTS `supportservicemaster` (
  `supportservicemasterId` int(10) NOT NULL AUTO_INCREMENT,
  `servicetype` varchar(100) DEFAULT NULL,
  `serviceprovider_name` varchar(100) DEFAULT NULL,
  `serviceprovider_phonenumber` varchar(50) DEFAULT NULL,
  `serviceprovider_email` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `imagepath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`supportservicemasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.supportservices_enquiries
CREATE TABLE IF NOT EXISTS `supportservices_enquiries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `supportserviceId` int(10) DEFAULT NULL,
  `universityid` int(10) DEFAULT NULL,
  `applicantid` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.timezonemaster
CREATE TABLE IF NOT EXISTS `timezonemaster` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `time_zone_name` varchar(200) NOT NULL DEFAULT '0',
  `time_zone_value` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.titlemaster
CREATE TABLE IF NOT EXISTS `titlemaster` (
  `titleid` int(11) NOT NULL AUTO_INCREMENT,
  `titlename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`titleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.tooltipmaster
CREATE TABLE IF NOT EXISTS `tooltipmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) NOT NULL,
  `tooltips` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `formid` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tooltips_primaryfieldmaster_idx` (`fieldid`),
  KEY `FK_tooltips_formmaster_idx` (`formid`),
  CONSTRAINT `FK_tooltips_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `FK_tooltips_primaryfieldmaster` FOREIGN KEY (`fieldid`) REFERENCES `primaryfieldmaster` (`primaryfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.transportchoice
CREATE TABLE IF NOT EXISTS `transportchoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.trips
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.tuitionAndlivingcostmaster
CREATE TABLE IF NOT EXISTS `tuitionAndlivingcostmaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.tutorialmaster
CREATE TABLE IF NOT EXISTS `tutorialmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `documentpath` varchar(200) DEFAULT NULL,
  `videourl` varchar(100) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.typemaster
CREATE TABLE IF NOT EXISTS `typemaster` (
  `typemasterid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `formfieldid` int(11) DEFAULT NULL,
  PRIMARY KEY (`typemasterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.typeofworkexperiencemaster
CREATE TABLE IF NOT EXISTS `typeofworkexperiencemaster` (
  `workexperiencetypesid` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workexperiencetypesid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitycampus
CREATE TABLE IF NOT EXISTS `universitycampus` (
  `campusid` int(11) NOT NULL AUTO_INCREMENT,
  `campusname` varchar(45) NOT NULL,
  `universityid` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `research` varchar(2000) NOT NULL,
  `faculty_description` varchar(2000) NOT NULL,
  `cityid` int(11) NOT NULL,
  PRIMARY KEY (`campusid`),
  KEY `universityid` (`universityid`),
  KEY `FK_universitycampus_citymaster` (`cityid`),
  CONSTRAINT `FK_campus_universityMaster` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`),
  CONSTRAINT `FK_universitycampus_citymaster` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table GTE_Prod.universitygrouping
CREATE TABLE IF NOT EXISTS `universitygrouping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupingheaduniversityid` int(11) NOT NULL,
  `universityid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parentUniID_universitymaster` (`groupingheaduniversityid`),
  KEY `universityid` (`universityid`),
  CONSTRAINT `FK_childsuniversityid_universitymaster` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`),
  CONSTRAINT `FK_parentUniID_universitymaster` FOREIGN KEY (`groupingheaduniversityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywisefieldmapping
CREATE TABLE IF NOT EXISTS `universitywisefieldmapping` (
  `universitywisefieldmappingid` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(1) DEFAULT NULL,
  `primaryfieldid` int(1) DEFAULT NULL,
  `formid` int(1) DEFAULT NULL,
  PRIMARY KEY (`universitywisefieldmappingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywiseformmapping
CREATE TABLE IF NOT EXISTS `universitywiseformmapping` (
  `universitywiseformmappingid` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) DEFAULT NULL,
  `formid` int(1) DEFAULT NULL,
  PRIMARY KEY (`universitywiseformmappingid`),
  KEY `FK_universitywiseformmapping_formmaster` (`formid`),
  CONSTRAINT `FK_universitywiseformmapping_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywisemastermapping
CREATE TABLE IF NOT EXISTS `universitywisemastermapping` (
  `universitywisemastermappingid` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) DEFAULT '0',
  `masterid` int(1) DEFAULT '0',
  `mastervalueid` int(1) DEFAULT '0',
  `created_by` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`universitywisemastermappingid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywisetooltipmaster
CREATE TABLE IF NOT EXISTS `universitywisetooltipmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(1) NOT NULL,
  `fieldid` int(1) NOT NULL,
  `tooltips` varchar(200) NOT NULL,
  `formid` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_universitywisetooltipmasterr_primaryfieldmaster_idx` (`fieldid`),
  KEY `FK_universitywisetooltipmaster_universitymaster_idx` (`universityid`),
  KEY `FK_universitywisetooltipmaster_formmaster_idx` (`formid`),
  CONSTRAINT `FK_universitywisetooltipmaster_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `FK_universitywisetooltipmaster_primaryfieldmaster` FOREIGN KEY (`fieldid`) REFERENCES `primaryfieldmaster` (`primaryfieldid`),
  CONSTRAINT `FK_universitywisetooltipmaster_universitymaster` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywise_faqmapping
CREATE TABLE IF NOT EXISTS `universitywise_faqmapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `faq_questionID` int(10) DEFAULT NULL,
  `universityid` int(10) DEFAULT NULL,
  `formid` int(10) DEFAULT NULL,
  `questionranking` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_universitywise_faqmapping_faq` (`faq_questionID`),
  KEY `FK_universitywise_faqmapping_university_master` (`universityid`),
  KEY `FK_universitywise_faqmapping_formmaster` (`formid`),
  CONSTRAINT `FK_universitywise_faqmapping_faq` FOREIGN KEY (`faq_questionID`) REFERENCES `faq` (`id`),
  CONSTRAINT `FK_universitywise_faqmapping_formmaster` FOREIGN KEY (`formid`) REFERENCES `formmaster` (`formid`),
  CONSTRAINT `FK_universitywise_faqmapping_university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywise_rejectionreasonmapping
CREATE TABLE IF NOT EXISTS `universitywise_rejectionreasonmapping` (
  `reasonmappingID` int(10) NOT NULL AUTO_INCREMENT,
  `universityid` int(10) DEFAULT NULL,
  `reasonid` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reasonmappingID`),
  KEY `FK__university_master` (`universityid`),
  KEY `FK__rejection_reasonmaster` (`reasonid`),
  CONSTRAINT `FK__rejection_reasonmaster` FOREIGN KEY (`reasonid`) REFERENCES `rejection_reasonmaster` (`id`),
  CONSTRAINT `FK__university_master` FOREIGN KEY (`universityid`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywise_scholarshipmapping
CREATE TABLE IF NOT EXISTS `universitywise_scholarshipmapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `universityId` int(10) DEFAULT NULL,
  `scholarshipId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_universitywise_scholarshipmapping_university_master` (`universityId`),
  KEY `FK_universitywise_scholarshipmapping_scholarships` (`scholarshipId`),
  CONSTRAINT `FK_universitywise_scholarshipmapping_scholarships` FOREIGN KEY (`scholarshipId`) REFERENCES `scholarships` (`id`),
  CONSTRAINT `FK_universitywise_scholarshipmapping_university_master` FOREIGN KEY (`universityId`) REFERENCES `university_master` (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.universitywise_supportservicemapping
CREATE TABLE IF NOT EXISTS `universitywise_supportservicemapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `universityid` int(10) DEFAULT NULL,
  `supportserviceID` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_universitywise_supportservicemapping_university_master` (`universityid`),
  KEY `FK_universitywise_supportservicemapping_supportservicemaster` (`supportserviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.university_application_decision_master
CREATE TABLE IF NOT EXISTS `university_application_decision_master` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `decision_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.university_master
CREATE TABLE IF NOT EXISTS `university_master` (
  `universityid` int(11) NOT NULL AUTO_INCREMENT,
  `university_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `website` varchar(45) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `chatid` varchar(50) NOT NULL,
  `affiliation` varchar(50) NOT NULL,
  `type` varchar(200) NOT NULL,
  `year_established` varchar(20) NOT NULL,
  `short_description` varchar(1000) NOT NULL,
  `long_description` varchar(2000) NOT NULL,
  `cityid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `latitude` decimal(10,5) NOT NULL,
  `longitude` decimal(10,5) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  `closest_airport` varchar(100) NOT NULL,
  `distance_from_airport` varchar(50) NOT NULL,
  `distance_from_railway` varchar(50) NOT NULL,
  `getting_around` varchar(200) NOT NULL,
  `acceptedmaxage` int(10) NOT NULL,
  `acceptedminage` int(10) NOT NULL,
  `full_service` bit(1) NOT NULL DEFAULT b'0',
  `notes_disclaimer` varchar(1000) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `headerstripcolor` varchar(100) NOT NULL,
  `verticalnavigationcolor` varchar(100) NOT NULL,
  `fontcolor` varchar(100) NOT NULL,
  `sop_instruction_for_applicant` varchar(20000) NOT NULL,
  `scholarship_instruction` varchar(2000) NOT NULL,
  `application_instruction` varchar(2000) NOT NULL,
  `fee_payment_instructions` varchar(2000) NOT NULL,
  `coe_instruction` varchar(2000) NOT NULL,
  `acceptance_terms` varchar(2000) DEFAULT NULL,
  `deferment_terms` varchar(2000) DEFAULT NULL,
  `rejection_terms` varchar(2000) DEFAULT NULL,
  `withdrawn_terms` varchar(2000) DEFAULT NULL,
  `supprot_service_instructions` varchar(2000) NOT NULL,
  `visa_instructions` varchar(2000) NOT NULL,
  `hosturl` varchar(100) NOT NULL,
  `university_gtm_code` varchar(100) NOT NULL,
  PRIMARY KEY (`universityid`),
  KEY `FK_universityMaster_cityMaster` (`cityid`),
  CONSTRAINT `FK_universityMaster_cityMaster` FOREIGN KEY (`cityid`) REFERENCES `citymaster` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.utilities
CREATE TABLE IF NOT EXISTS `utilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.visa
CREATE TABLE IF NOT EXISTS `visa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.visatype
CREATE TABLE IF NOT EXISTS `visatype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table GTE_Prod.workexperienceyearsmaster
CREATE TABLE IF NOT EXISTS `workexperienceyearsmaster` (
  `workexperienceyearsid` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`workexperienceyearsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for view GTE_Prod.GTE.documentverification
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `GTE.documentverification`;
CREATE ALGORITHM=UNDEFINED DEFINER=`hcommadmin`@`%` SQL SECURITY DEFINER VIEW `GTE.documentverification` AS select `adm`.`documentid` AS `documentid`,`adm`.`applicantid` AS `applicantid`,`adm`.`documentname` AS `documentname`,`dva`.`documentvalidationid` AS `documentvalidationId`,`dva`.`agentid` AS `agentid`,`dva`.`lastupdatedate` AS `lastupdatedate`,`dva`.`remarks` AS `remarks` from (`applicantdocumentmaster` `adm` left join `documentvalidationbyagent` `dva` on((`dva`.`documentid` = `adm`.`documentid`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
