CREATE TABLE IF NOT EXISTS `getApFlrOulnInfo` (
    `rnum` INT(8), 
    `platPlc` VARCHAR(200), 
    `sigunguCd` VARCHAR(5), 
    `bjdongCd` VARCHAR(5), 
    `platGbCd` CHAR(1), 
    `bun` VARCHAR(4), 
    `ji` VARCHAR(4), 
    `mgmFlrOulnPk` VARCHAR(33), 
    `mgmDongOulnPk` VARCHAR(33), 
    `mgmPmsrgstPk` VARCHAR(33), 
    `bldNm` VARCHAR(100), 
    `splotNm` VARCHAR(200), 
    `block` VARCHAR(20), 
    `lot` VARCHAR(20), 
    `strctCd` CHAR(1), 
    `strctCdNm` VARCHAR(100), 
    `mainPurpsCd` VARCHAR(5), 
    `mainPurpsCdNm` VARCHAR(100), 
    `flrNo` INT(4), 
    `flrArea` FLOAT, 
    `flrGbCd` VARCHAR(2), 
    `flrGbCdNm` VARCHAR(100), 
    `archGbCdNm` VARCHAR(4), 
    `archGbCd` VARCHAR(100), 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE=`euckr_korean_ci`;