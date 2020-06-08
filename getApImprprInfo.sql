CREATE TABLE IF NOT EXISTS `getApImprprInfo` (
    `rnum` INT(8), 
    `platPlc` VARCHAR(200), 
    `sigunguCd` VARCHAR(5), 
    `bjdongCd` VARCHAR(5), 
    `platGbCd` CHAR(1), 
    `bun` VARCHAR(4), 
    `ji` VARCHAR(4), 
    `mgmPmsrgstPk` VARCHAR(33), 
    `bldNm` VARCHAR(100), 
    `splotNm` VARCHAR(200), 
    `block` VARCHAR(20), 
    `lot` VARCHAR(20), 
    `imprprGbCd` VARCHAR(2), 
    `imprprGbCdNm` VARCHAR(100), 
    `imprprChangGbCd` CHAR(1), 
    `imprprChangGbCdNm` VARCHAR(100), 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE='euckr_korean_ci';