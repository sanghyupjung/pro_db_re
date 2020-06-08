CREATE TABLE IF NOT EXISTS `getApRoadRgstInfo` (
    `rnum` INT(8), 
    `platPlc` VARCHAR(200), 
    `sigunguCd` VARCHAR(5), 
    `bjdongCd` VARCHAR(5), 
    `platGbCd` CHAR(1), 
    `bun` VARCHAR(4), 
    `ji` VARCHAR(4), 
    `mgmPmsrgstPk` VARCHAR(33), 
    `splotNm` VARCHAR(200), 
    `block` VARCHAR(20), 
    `lot` VARCHAR(20), 
    `ranoYear` VARCHAR(4), 
    `ranoSeqno` INT(8), 
    `rdasnGbCd` CHAR(1), 
    `rdasnGbCdNm` VARCHAR(100), 
    `rdasnDay` VARCHAR(8), 
    `roadChangDay` VARCHAR(8), 
    `roadChangOdr` INT(5), 
    `roadCloseDay` VARCHAR(8), 
    `mgmSigunguCd` VARCHAR(5), 
    `rdasnChangDay` VARCHAR(8), 
    `roadLenTotal` FLOAT, 
    `roadWidthTotal` FLOAT, 
    `roadAreaTotal` FLOAT, 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE='euckr_korean_ci';