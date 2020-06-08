CREATE TABLE IF NOT EXISTS `getApJijiguInfo` (
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
    `jijiguGbCd` VARCHAR(1), 
    `jijiguGbCdNm` VARCHAR(100), 
    `jijiguCd` VARCHAR(6), 
    `jijiguCdNm` VARCHAR(100), 
    `reprYn` VARCHAR(1), 
    `mainDongGbCd` VARCHAR(1), 
    `mainDongGbCdNm` VARCHAR(100), 
    `jijiguNm` VARCHAR(100), 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE='euckr_korean_ci';