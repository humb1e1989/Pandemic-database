--         table creation script

--
-- Table structure for table `virsus type`
--

CREATE TABLE `virsus type` (
  `Virus Type` varchar(40) NOT NULL,
  `Type Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `travelhistorytracking`
--

CREATE TABLE `travelhistorytracking` (
  `SimcardID` varchar(40) NOT NULL,
  `SimCardConnectionTime` datetime(6) NOT NULL,
  `SimCardDisconnectTime` datetime(6) NOT NULL,
  `TrackingID` varchar(20) NOT NULL,
  `BSID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `Name` varchar(40) NOT NULL,
  `MobileID` varchar(40) NOT NULL DEFAULT 'Not null',
  `Age` int(3) NOT NULL,
  `Sex` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Hospital_ID` varchar(40) NOT NULL,
  `Hospital_Name` varchar(40) NOT NULL DEFAULT 'Not null',
  `DistrictID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `gps`
--

CREATE TABLE `gps` (
  `GPSID` int(11) NOT NULL,
  `E/W` char(10) NOT NULL,
  `N/S` char(10) NOT NULL,
  `Longtitude` varchar(20) NOT NULL,
  `Latitude` varchar(20) NOT NULL,
  `BSID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DocID` varchar(40) NOT NULL,
  `Doc Name` varchar(40) NOT NULL,
  `HospitalID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `district`
--


CREATE TABLE `district` (
  `DistrictID` varchar(40) NOT NULL,
  `RIskLevel` varchar(20) NOT NULL DEFAULT 'Not Null',
  `District_name` varchar(40) NOT NULL,
  `Region` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `detection`
--


CREATE TABLE `detection` (
  `MobileID` varchar(40) DEFAULT 'Not null',
  `Sample Test Time` datetime(6) NOT NULL,
  `Sample Report Time` datetime(6) NOT NULL,
  `Sample Result` text NOT NULL DEFAULT 'Not null',
  `Sample Collect Time` datetime(6) NOT NULL,
  `DetectionID` varchar(20) NOT NULL,
  `DocID` varchar(40) NOT NULL,
  `Sample Type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `bs`
--

CREATE TABLE `bs` (
  `BSID` varchar(255) NOT NULL DEFAULT 'Not Null',
  `DistrictID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--

The data below can be used for all the cases except CASE5！



--
-- Indexes for dumped tables
--

--
-- Indexes for table `bs`
--
ALTER TABLE `bs`
  ADD PRIMARY KEY (`BSID`),
  ADD KEY `DistrictID` (`DistrictID`);

--
-- Indexes for table `detection`
--
ALTER TABLE `detection`
  ADD PRIMARY KEY (`DetectionID`),
  ADD KEY `DocID` (`DocID`),
  ADD KEY `MobileID` (`MobileID`),
  ADD KEY `Sample Type` (`Sample Type`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`DistrictID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DocID`),
  ADD KEY `HospitalID` (`HospitalID`);

--
-- Indexes for table `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`GPSID`),
  ADD KEY `BSID` (`BSID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Hospital_ID`),
  ADD KEY `DistrictID` (`DistrictID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`MobileID`);

--
-- Indexes for table `travelhistorytracking`
--
ALTER TABLE `travelhistorytracking`
  ADD PRIMARY KEY (`TrackingID`),
  ADD KEY `BSID` (`BSID`),
  ADD KEY `SimcardID` (`SimcardID`);

--
-- Indexes for table `virsus type`
--
ALTER TABLE `virsus type`
  ADD PRIMARY KEY (`Virus Type`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bs`
--
ALTER TABLE `bs`
  ADD CONSTRAINT `bs_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`);

--
-- Constraints for table `detection`
--
ALTER TABLE `detection`
  ADD CONSTRAINT `detection_ibfk_1` FOREIGN KEY (`DocID`) REFERENCES `doctor` (`DocID`),
  ADD CONSTRAINT `detection_ibfk_2` FOREIGN KEY (`MobileID`) REFERENCES `person` (`MobileID`),
  ADD CONSTRAINT `detection_ibfk_3` FOREIGN KEY (`Sample Type`) REFERENCES `virsus type` (`Virus Type`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`Hospital_ID`);

--
-- Constraints for table `gps`
--
ALTER TABLE `gps`
  ADD CONSTRAINT `gps_ibfk_1` FOREIGN KEY (`BSID`) REFERENCES `bs` (`BSID`);

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`);

--
-- Constraints for table `travelhistorytracking`
--
ALTER TABLE `travelhistorytracking`
  ADD CONSTRAINT `travelhistorytracking_ibfk_1` FOREIGN KEY (`BSID`) REFERENCES `bs` (`BSID`),
  ADD CONSTRAINT `travelhistorytracking_ibfk_2` FOREIGN KEY (`SimcardID`) REFERENCES `person` (`MobileID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



--   Following are the test data for all the 18 cases 


INSERT INTO `bs` (`BSID`, `DistrictID`) VALUES
('4045', '213'),
('4046', '213'),
('4041', '404'),
('4047', '404');

INSERT INTO `detection` (`MobileID`, `Sample Test Time`, `Sample Report Time`, `Sample Result`, `Sample Collect Time`, `DetectionID`, `DocID`, `Sample Type`) VALUES
('23652546', '2021-10-19 19:00:00.000000', '2021-10-19 19:30:00.000000', 'positive', '2021-10-19 16:00:00.000000', 'D013', 'D03', 'Panic21'),
('233636', '2021-10-09 19:00:00.000000', '2021-10-09 19:30:00.000000', 'positive', '2021-10-09 16:00:00.000000', 'De01', 'D01', 'Panic21'),
('+86 7777777', '2021-10-03 02:00:00.000000', '2021-10-03 19:30:00.000000', 'negative', '2021-10-03 01:00:00.000000', 'De018', 'D01', 'Panic21'),
('+86 7777777', '2021-10-04 03:00:00.000000', '2021-10-04 19:30:00.000000', 'negative', '2021-10-03 02:00:00.000000', 'De019', 'D01', 'Panic21'),
('87539454', '2021-10-04 19:00:00.000000', '2021-10-04 19:28:00.000000', 'positive', '2021-10-04 16:00:00.000000', 'De02', 'D01', 'Panic21'),
('86534343', '2021-10-03 19:00:00.000000', '2021-10-09 19:30:00.000000', 'negative', '2021-10-03 16:00:00.000000', 'De020', 'D02', 'Panic21'),
('86534343', '2021-10-03 19:05:00.000000', '2021-10-09 19:30:00.000000', 'negative', '2021-10-03 19:00:00.000000', 'De021', 'D02', 'Panic21'),
('45675865', '2021-10-04 19:00:00.000000', '2021-10-04 19:30:00.000000', 'positive', '2021-10-04 16:00:00.000000', 'De03', 'D03', 'Panic21'),
('231425534', '2021-10-05 19:00:00.000000', '2021-10-05 19:05:00.000000', 'positive', '2021-10-05 16:00:00.000000', 'De04', 'D04', 'Panic21'),
('34536344', '2021-10-05 19:00:00.000000', '2021-10-05 19:04:00.000000', 'negative', '2021-10-05 16:00:00.000000', 'De05', 'D04', 'Panic21'),
('86545865', '2021-10-05 19:00:00.000000', '2021-10-05 19:02:00.000000', 'negative', '2021-10-05 16:00:00.000000', 'De06', 'D06', 'Panic21'),
('28784343', '2021-10-05 19:00:00.000000', '2021-10-05 19:01:00.000000', 'negative', '2021-10-05 16:00:00.000000', 'De07', 'D08', 'Panic21'),
('233636', '2021-10-04 19:00:00.000000', '2021-10-04 19:05:00.000000', 'negative', '2021-10-03 16:00:00.000000', 'De08', 'D01', 'Panic21'),
('233636', '2021-10-05 19:07:00.000000', '2021-10-05 19:30:00.000000', 'negative', '2021-10-05 19:06:00.000000', 'De09', 'D01', 'Panic21'),
('4567564', '2021-10-03 00:00:00.000000', '2021-10-04 19:30:00.000000', 'negative', '2021-10-02 00:00:00.000000', 'De10', 'D01', 'Panic21'),
('4567564', '2021-10-04 00:00:00.000000', '2021-10-05 19:30:00.000000', 'negative', '2021-10-03 16:00:00.000000', 'De11', 'D01', 'Panic21'),
('4567564', '2021-10-05 00:00:00.000000', '2021-10-06 19:30:00.000000', 'negative', '2021-10-04 16:00:00.000000', 'De12', 'D01', 'Panic21'),
('4567564', '2021-10-19 00:00:00.000000', '2021-10-19 19:30:00.000000', 'positive', '2021-10-19 16:00:00.000000', 'De14', 'D01', 'Panic21'),
('86545865', '2021-11-09 19:00:00.000000', '2021-11-09 19:30:00.000000', 'positive', '2021-11-09 16:00:00.000000', 'De15', 'D01', 'Unknown'),
('28784343', '2021-11-09 19:00:00.000000', '2021-11-09 19:30:00.000000', 'positive', '2021-11-09 16:00:00.000000', 'De16', 'D02', 'Unknown'),
('5324342', '2021-11-09 19:00:00.000000', '2021-11-09 19:30:00.000000', 'positive', '2021-11-09 16:00:00.000000', 'De17', 'D03', 'Unknown');

INSERT INTO `district` (`DistrictID`, `RIskLevel`, `District_name`, `Region`) VALUES
('213', 'high', 'Centre Lukewarm Hillside', 'central'),
('303', 'low', 'Raspberry town', 'west'),
('404', 'mid', 'Glow Sand district', 'central'),
('415', 'low', 'Bunny Tail district', 'east'),
('718', 'high', 'Lenny town', 'south');

INSERT INTO `doctor` (`DocID`, `Doc Name`, `HospitalID`) VALUES
('D01', 'Singed', 'H01'),
('D02', 'Akali', 'H01'),
('D03', 'Sin', 'H02'),
('D04', 'Strange', 'H02'),
('D05', 'Tony stark', 'H03'),
('D06', 'peper', 'H03'),
('D07', 'Drake', 'H04'),
('D08', 'Laroi', 'H04'),
('D09', 'Mengduo', 'H05');

INSERT INTO `gps` (`GPSID`, `E/W`, `N/S`, `Longtitude`, `Latitude`, `BSID`) VALUES
(1, 'E', 'N', '118.429390', '34.107824', '4041'),
(2, 'E', 'S', '118.350562', '34.098976', '4047'),
(3, 'W', 'N', '82.277592', '42.589128', '4045'),
(4, 'E', 'N', '74.890385', '43.359051', '4046');

INSERT INTO `hospital` (`Hospital_ID`, `Hospital_Name`, `DistrictID`) VALUES
('H01', 'Central Lukewarm First Kingdom Hospital', '213'),
('H02', 'Central Lukewarm Second Kingdom Hospital', '213'),
('H03', 'Glow Sand district First Hospital', '404'),
('H04', 'Glow Sand district Second Hospital', '404'),
('H05', 'Raspberry town first Hospital', '303');

INSERT INTO `virsus type` (`Virus Type`, `Type Description`) VALUES
('Panic21', 'Do not panic if this happen'),
('Phasmophobia21', 'It is coming!'),
('Unknown', 'null');


INSERT INTO `travelhistorytracking` (`SimcardID`, `SimCardConnectionTime`, `SimCardDisconnectTime`, `TrackingID`, `BSID`) VALUES
('233636', '2021-10-07 19:30:00.000000', '2021-10-08 19:30:00.000000', 'T01', '4041'),
('233636', '2021-10-08 19:30:00.000000', '2021-10-09 19:30:00.000000', 'T02', '4046'),
('8906453', '2021-10-07 19:30:00.000000', '2021-10-08 19:30:00.000000', 'T03', '4041'),
('231425534', '2021-10-08 19:30:00.000000', '2021-10-09 19:30:00.000000', 'T04', '4045'),
('64253465', '2021-10-10 19:30:00.000000', '2021-10-10 19:31:00.000000', 'T05', '4045'),
('64253465', '2021-10-10 19:30:00.000000', '2021-10-10 19:31:00.000000', 'T06', '4045'),
('4567564', '2021-10-17 19:30:00.000000', '2021-10-18 19:30:00.000000', 'T07', '4045');



INSERT INTO `person` (`Name`, `MobileID`, `Age`, `Sex`) VALUES
('Cnangzhang', '+86 7777777', 16, 'male'),
('Bren joy', '202020', 70, 'male'),
('Powder', '231425534', 15, 'female'),
('Mark', '233636', 42, 'male'),
('Suga', '23652546', 27, 'male'),
('Melee', '28784343', 26, 'male'),
('Kiana', '34536344', 15, 'female'),
('Arene', '4567564', 18, 'male'),
('Caitlyn', '45675865', 25, 'Female'),
('Blemishine', '5324342', 18, 'female'),
('Carnelian', '64253465', 33, 'female'),
('Whisperain', '86534343', 23, 'female'),
('Indigo', '86545865', 20, 'female'),
('Vi', '87539454', 24, 'female'),
('Heavyrain', '8906453', 15, 'female');







--         Important use cases
--  !!! both test data and SELECT statements are needed
-- use case 1
select DISTINCT SimcardID
from `travelhistorytracking`,`bs`
where bs.DistrictID in
(select districtID
from travelhistorytracking,bs
where SimcardID = '233636')
AND   SimCardConnectionTime >= '2021-10-07 19:30:00'
AND   SimCardConnectionTime <='2021-10-09 19:30:00'

-- use case 2
-- In this case, we set this person's name is "Carnelian" a "female" ages "33" and the phone number is "64253465"
-- And she enters the range of the base station at 2021-10-10 19:30:00.
INSERT INTO `travelhistorytracking`(`SimcardID`, `SimCardConnectionTime`, `SimCardDisconnectTime`, `TrackingID`, `BSID`) 
VALUES 
("64253465",'2021-10-10 19:30:00','','T06','4045')
-- when the user moves out of the range
UPDATE `travelhistorytracking` SET
`SimCardDisconnectTime`='2021-10-10 19:31:00'
 WHERE TrackingID = 'T06';

-- use case 3
SELECT Hospital_Name FROM 
(SELECT `Hospital_Name`, AVG(TimeStampDiff(second,`Sample test time` , `Sample report time`)) AS `Report generation time` 
FROM (`hospital`INNER JOIN `doctor` ON hospital.Hospital_ID = doctor.HospitalID) INNER JOIN `detection` ON doctor.DocID = Detection.DocID 
GROUP BY `hospital`.`Hospital_Name`
ORDER BY `Report generation time` ASC
LIMIT 1) AS `newTable`

-- use case 4
select `MobileID` From detection where 
`Sample test time`>='2021-10-03 00:00'
and `Sample Test Time` <='2021-10-05 00:00'
 GROUP BY MobileID
 HAVING
 COUNT(MobileID) = 2
 and timediff(max(`Sample Test Time`),min(`Sample Test Time`)) > '24:00:00';

-- use case 5
SELECT `District_name`,`RIskLevel`FROM `district` 
ORDER BY CASE `RIskLevel` 
WHEN 'high'THEN 1 
WHEN 'mid' then 2 
WHEN 'low' THEN 3 
END

-- use case 6
select `Name`, person.MobileID 
From `person`INNER JOIN`detection` INNER JOIN `district` INNER JOIN `hospital` INNER JOIN `doctor` 
WHERE(district.DistrictID = hospital.DistrictID) 
AND(hospital.Hospital_ID = doctor.HospitalID) 
AND(doctor.DocID = detection.DocID) 
AND(detection.MobileID = person.MobileID) 
AND( `Sample result` = 'positive') 
AND( `Sample report time` BETWEEN '2021-10-04 00:00:00' AND '2021-10-04 23:59:59') 
AND district.District_name = 'Centre Lukewarm Hillside' 

-- use case 7
SELECT COUNT(DISTINCT D2.MobileID)- COUNT(DISTINCT D1.MobileID) AS `Increment` FROM `detection` D1, `detection` D2 
WHERE (D1.`Sample Test Time` LIKE '2021-10-04%') 
AND(D2.`Sample Test Time` LIKE '2021-10-05%') 
AND (D1.`Sample Result` = 'positive') 
AND(D2.`Sample Result` = 'positive') 

-- use case 8
SELECT COUNT(DISTINCT T2.SimcardID)/ COUNT(DISTINCT T1.simcardID) AS `Spread rate` FROM `travelhistorytracking` T1, `travelhistorytracking` T2,`bs`B1,`bs` B2,`detection`,`district`
WHERE T1.SimcardID IN
(select DISTINCT SimcardID
from `travelhistorytracking`, `bs` B1
where B1.DistrictID in
(select districtID
from travelhistorytracking,bs
where SimcardID = '233636')
AND   SimCardConnectionTime >= '2021-10-07 19:30:00'
AND   SimCardConnectionTime <='2021-10-09 19:30:00')
AND T2.SimcardID
IN(
SELECT DISTINCT SimcardID FROM `detection` INNER JOIN `travelhistorytracking` INNER JOIN `bs` INNER JOIN `district`  
ON detection.MobileID = travelhistorytracking.SimcardID 
AND travelhistorytracking.BSID = bs.BSID 
and bs.DistrictID = district.DistrictID 
WHERE `Sample Result` = 'Positive' AND B2.districtID = B1.DistrictID AND  `Simcardconnectiontime` BETWEEN '2021-10-09 19:30:00' AND '2021-10-23 19:30:00');




--          Extended use cases
--  !!! both test data and SELECT statements are needed
-- use case 1
SELECT DISTINCT SimcardID FROM travelhistorytracking INNER JOIN bs INNER JOIN district ON travelhistorytracking.BSID = bs.BSID AND bs.DistrictID = district.DistrictID
WHERE District.RIskLevel = 'high'

-- use case 2
SELECT DISTINCT District.DistrictID FROM `detection` INNER JOIN `travelhistorytracking` INNER JOIN `bs` INNER JOIN `district`  
ON detection.MobileID = travelhistorytracking.SimcardID 
AND travelhistorytracking.BSID = bs.BSID 
and bs.DistrictID = district.DistrictID 
WHERE `Sample Result` = 'Positive' AND `Simcardconnectiontime` BETWEEN '2021-10-09 19:30:00' AND '2021-10-23 19:30:00';

-- use case 3
SELECT DISTINCT district.DistrictID FROM district INNER JOIN hospital INNER JOIN doctor INNER JOIN detection INNER JOIN `virsus type` 
ON district.DistrictID = hospital.DistrictID 
AND hospital.Hospital_ID =doctor.HospitalID 
AND detection.DocID = doctor.DocID 
AND detection.`Sample Type` =`virsus type`.`Virus Type` 
WHERE (`virus type`) = "unknown" AND (SELECT COUNT(detection.MobileID) >= "3" FROM `detection`);

-- use case 4
SELECT DISTINCT doctor.DocID  FROM doctor INNER JOIN detection 
ON doctor.DocID = detection.DocID 
WHERE detection.`Sample Result` = 'Positive'

-- use case 5
SELECT DocID FROM
(SELECT doctor.`Doc Name`, hospital.Hospital_Name,doctor.DocID, district.RIskLevel FROM doctor INNER JOIN hospital INNER JOIN district ON
doctor.HospitalID = hospital.Hospital_ID AND hospital.DistrictID = district.DistrictID)
AS `new` WHERE RIskLevel = 'low'

-- use case 6
SELECT DISTINCT SimcardID FROM travelhistorytracking 
WHERE SimCardConnectionTime BETWEEN '2021-10-15 00:00' AND '21-10-20 00:00'

-- use case 7
SELECT COUNT(Name) FROM
(SELECT DISTINCT Name FROM
(SELECT MobileID, Name FROM `person` WHERE  Age > 40) AS `new` INNER JOIN detection ON new.mobileID = detection.MobileID WHERE `Sample result` = 'positive')
AS `counter`

-- use case 8
SELECT (SELECT COUNT(Name) FROM
(SELECT DISTINCT Name FROM
(SELECT MobileID, Name FROM `person` WHERE  Age > 40) AS `new` INNER JOIN detection ON new.mobileID = detection.MobileID WHERE `Sample result` = 'positive')
AS `counter1`
) -(SELECT COUNT(Name) FROM
(SELECT DISTINCT Name FROM
(SELECT MobileID, Name FROM `person` WHERE  Age < 30) AS `new` INNER JOIN detection ON new.mobileID = detection.MobileID WHERE `Sample result` = 'positive')
AS `counter2`
) AS `result`

-- use case 9
UPDATE `district` SET `RIskLevel`='high'WHERE `DistrictID` = '415'

-- use case 10
SELECT * FROM `person` WHERE MobileID = '5324342' ;