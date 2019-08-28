CREATE DATABASE ggh_bbs CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON ggh_bbs.* TO user_bbs@localhost IDENTIFIED BY '123456';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS ggh_bbs.reply;
DROP TABLE IF EXISTS ggh_bbs.board;
DROP TABLE IF EXISTS ggh_bbs.user;

CREATE TABLE `ggh_bbs`.`user` (
  `u_no` INT NOT NULL AUTO_INCREMENT,
  `u_id` VARCHAR(50) NOT NULL,
  `u_pass` VARCHAR(50) NOT NULL,
  `u_kanjiname` VARCHAR(20) NOT NULL,
  `u_kananame` VARCHAR(20) NOT NULL,
  `u_nickname` VARCHAR(20) NOT NULL,
  `u_birthdate` VARCHAR(8) NOT NULL,
  `admin_check` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`u_no`));


CREATE TABLE `ggh_bbs`.`board` (
  `b_id` INT NOT NULL AUTO_INCREMENT,
  `b_title` VARCHAR(100) NOT NULL,
  `b_content` VARCHAR(4000) NOT NULL,
  `b_writer` INT NOT NULL,
  `b_createdate` DATETIME NOT NULL DEFAULT current_timestamp ,
  `b_hit` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`b_id`),
  INDEX `fk_user_idx` (`b_writer` ASC),
  CONSTRAINT `fk_user` FOREIGN KEY (`b_writer`) REFERENCES `ggh_bbs`.`user` (`u_no`)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE `ggh_bbs`.`reply` (
  `r_id` INT NOT NULL AUTO_INCREMENT,
  `r_content` VARCHAR(200) NOT NULL,
  `r_writer` INT NOT NULL,
  `r_board` INT NOT NULL,
  PRIMARY KEY (`r_id`),
  INDEX `fk_r_user_idx` (`r_writer` ASC),
  INDEX `fk_board_idx` (`r_board` ASC),
  CONSTRAINT `fk_r_user` FOREIGN KEY (`r_writer`)  REFERENCES `ggh_bbs`.`user` (`u_no`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_board` FOREIGN KEY (`r_board`) REFERENCES `ggh_bbs`.`board` (`b_id`)
    ON DELETE CASCADE ON UPDATE CASCADE);
