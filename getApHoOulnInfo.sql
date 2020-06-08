CREATE TABLE IF NOT EXISTS `getApHoOulnInfo` (
    `rnum` INT(8), 
    `platPlc` VARCHAR(200), 
    `sigunguCd` VARCHAR(5), 
    `bjdongCd` VARCHAR(5), 
    `platGbCd` CHAR(1), 
    `bun` VARCHAR(4), 
    `ji` VARCHAR(4), 
    `mgmHoDetlPk` VARCHAR(33), 
    `mgmDongOulnPk` VARCHAR(33), 
    `mgmPmsrgstPk` VARCHAR(33), 
    `splotNm` VARCHAR(200), 
    `block` VARCHAR(20), 
    `lot` VARCHAR(20), 
    `hoNo` INT(6), 
    `hoNm` VARCHAR(100), 
    `pngtypGbNm` VARCHAR(100), 
    `flrNo` INT(4), 
    `flrGbCd` VARCHAR(2), 
    `flrGbCdNm` VARCHAR(100), 
    `changGbCd` VARCHAR(1), 
    `changGbCdNm` VARCHAR(100), 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE=`euckr_korean_ci`;