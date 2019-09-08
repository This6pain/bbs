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
  `admin_check` INT NOT NULL,
  PRIMARY KEY (`u_no`));

CREATE TABLE `ggh_bbs`.`board` (
  `b_id` INT NOT NULL AUTO_INCREMENT,
  `b_title` VARCHAR(100) NOT NULL,
  `b_content` VARCHAR(4000) NOT NULL,
  `b_writer` INT NOT NULL,
  `b_nick` VARCHAR(20) NOT NULL,
  `b_createdate` DATETIME NOT NULL,
  `b_hit` INT NOT NULL,
  PRIMARY KEY (`b_id`),
  INDEX `fk_user_idx` (`b_writer` ASC),
  CONSTRAINT `fk_user` FOREIGN KEY (`b_writer`) REFERENCES `ggh_bbs`.`user` (`u_no`)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE `ggh_bbs`.`reply` (
  `r_id` INT NOT NULL AUTO_INCREMENT,
  `r_content` VARCHAR(200) NOT NULL,
  `r_writer` INT NOT NULL,
  `b_nick` VARCHAR(20) NOT NULL,
  `r_board` INT NOT NULL,
  PRIMARY KEY (`r_id`),
  INDEX `fk_r_user_idx` (`r_writer` ASC),
  INDEX `fk_board_idx` (`r_board` ASC),
  CONSTRAINT `fk_r_user` FOREIGN KEY (`r_writer`)  REFERENCES `ggh_bbs`.`user` (`u_no`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_board` FOREIGN KEY (`r_board`) REFERENCES `ggh_bbs`.`board` (`b_id`)
    ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO ggh_bbs.user(u_id, u_pass, u_kanjiname, u_kananame, u_nickname, u_birthdate) VALUES('admin', '1234', 'admin', 'admin', 'admin', 19870903);
INSERT INTO ggh_bbs.user(u_id, u_pass, u_kanjiname, u_kananame, u_nickname, u_birthdate) VALUES('user1@gmail.com', '1234', 'user1', 'user1', 'user1', 19870903);

INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard1', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard2', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard3', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard4', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard5', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard6', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard7', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard8', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard9', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard10', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard11', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard12', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard13', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard14', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard15', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard16', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard17', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard18', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard19', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard20', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard21', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard22', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard23', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard24', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard25', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard26', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard27', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard28', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard29', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard30', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard31', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard32', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard33', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard34', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard35', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard36', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard37', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard38', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard39', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard40', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard41', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard42', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard43', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard44', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard45', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard46', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard47', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard48', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard49', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard50', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard51', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard52', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard53', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard54', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard55', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard56', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard57', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard58', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard59', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard60', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard61', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard62', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard63', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard64', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard65', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard66', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard67', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard68', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard69', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard70', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard71', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard72', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard73', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard74', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard75', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard76', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard77', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard78', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard79', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard80', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard81', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard82', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard83', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard84', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard85', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard86', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard87', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard88', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard89', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard90', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard91', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard92', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard93', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard94', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard95', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard96', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard97', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard98', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard99', 'TestBoard1', 1, 'admin');
INSERT INTO ggh_bbs.board(b_title, b_content, b_writer, b_nick) VALUES('TestBoard00', 'TestBoard1', 1, 'admin');
