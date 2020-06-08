CREATE TABLE IF NOT EXISTS `getApWclfInfo` (
    `rnum` INT(8), 
    `platPlc` VARCHAR(200), 
    `sigunguCd` VARCHAR(5), 
    `bjdongCd` VARCHAR(5), 
    `platGbCd` CHAR(1), 
    `bun` VARCHAR(4), 
    `ji` VARCHAR(4), 
    `mgmPmsrgstPk` VARCHAR(33), 
    `newPlatPlc` VARCHAR(200), 
    `splotNm` VARCHAR(200), 
    `block` VARCHAR(20), 
    `lot` VARCHAR(20), 
    `reprYn` VARCHAR(1), 
    `wclfModeCd` VARCHAR(3), 
    `wclfModeCdNm` VARCHAR(100), 
    `mainDongGbCd` VARCHAR(1), 
    `mainDongGbCdNm` VARCHAR(100), 
    `capaPsper` FLOAT, 
    `capaLube` FLOAT, 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE='euckr_korean_ci';