CREATE  TABLE `portal`.`notify` (  `NId` INT NOT NULL ,  `datetime` DATETIME NOT NULL ,  `author` VARCHAR(20) NOT NULL ,  `content` LONGTEXT NOT NULL ,  `accessory` VARCHAR(255) NULL ,  `title` VARCHAR(45) NOT NULL ,  PRIMARY KEY (`NId`) );

ALTER TABLE `portal`.`notify` CHANGE COLUMN `NId` `NId` INT(11) NOT NULL AUTO_INCREMENT  ;