CREATE TABLE IF NOT EXISTS `getApPklotInfo` (
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
    `indrAutoUtcnt` INT(6), 
    `indrAutoArea` FLOAT, 
    `oudrAutoUtcnt` INT(6), 
    `oudrAutoArea` FLOAT, 
    `indrMechUtcnt` INT(6), 
    `indrMechArea` FLOAT, 
    `oudrMechUtcnt` INT(6), 
    `oudrMechArea` FLOAT, 
    `neigAutoUtcnt` INT(6), 
    `neigAutoArea` FLOAT, 
    `neigMechUtcnt` INT(6), 
    `neigMechArea` FLOAT, 
    `exmptUtcnt` INT(6), 
    `crtnDay` VARCHAR(8), 
	UNIQUE INDEX `bjdongCd_crtnDay_rnum_sigunguCd` (`bjdongCd`, `crtnDay`, `rnum`, `sigunguCd`)
)
COLLATE='euckr_korean_ci';