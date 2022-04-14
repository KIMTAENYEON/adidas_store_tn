CREATE SCHEMA `adidas_store_tn` ;
use adidas_store_tn;
CREATE TABLE `member` (
	`me_email`	varchar(255)	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_name`	varchar(30)	NULL,
	`me_address`	varchar(255)	NULL,
	`me_phone`	char(13)	NULL,
	`me_authority`	varchar(10)	NULL,
	`me_postnum`	varchar(10)	NULL,
	`me_address_detail`	varchar(255)	NULL
);

CREATE TABLE `goods` (
	`gd_num`	int	NOT NULL,
	`gd_img`	varchar(255)	NULL,
	`gd_name`	varchar(30)	NULL,
	`gd_gender`	varchar(6)	NULL,
	`gd_price`	int	NULL,
	`gd_date`	datetime	NULL,
	`gd_title`	varchar(30)	NULL,
	`gd_content`	longtext	NULL,
	`gd_code`	char(6)	NULL,
	`gd_material`	varchar(30)	NULL,
	`gd_color`	varchar(100)	NULL,
	`gd_country`	varchar(30)	NULL,
	`gd_made_date`	char(6)	NULL,
	`gd_made_company`	varchar(30)	NULL,
	`gd_importer`	varchar(30)	NULL,
	`gd_ca_num`	int	NOT NULL,
	`gd_sub_num`	int	NOT NULL
);

CREATE TABLE `category` (
	`ca_num`	int	NOT NULL,
	`ca_name`	varchar(30)	NULL
);

CREATE TABLE `subcategory` (
	`sub_num`	int	NOT NULL,
	`sub_name`	varchar(30)	NULL,
	`sub_ca_num`	int	NOT NULL
);

CREATE TABLE `order` (
	`or_num`	int	NOT NULL,
	`or_date`	datetime	NULL,
	`or_name`	varchar(30)	NULL,
	`or_address`	varchar(255)	NULL,
	`or_phone`	char(13)	NULL,
	`or_me_email`	varchar(255)	NOT NULL,
	`or_postnum`	varchar(10)	NULL,
	`or_address_detail`	varchar(255)	NULL
);

CREATE TABLE `mylist` (
	`my_num`	int	NOT NULL,
	`my_amount`	int	NULL,
	`my_list_state`	varchar(10)	NULL,
	`my_me_email`	varchar(255)	NOT NULL,
	`my_gd_num`	int	NOT NULL,
	`my_check_state`	varchar(2)	NULL
);

CREATE TABLE `orderlist` (
	`ol_num`	int	NOT NULL,
	`ol_gd_num`	int	NOT NULL,
	`ol_or_num`	int	NOT NULL,
	`ol_total_price`	int	NULL,
	`ol_amount`	int	NULL,
    `ol_state` VARCHAR(10) NOT NULL DEFAULT '주문완료'
);

CREATE TABLE `option` (
	`op_num`	int	NOT NULL,
	`gd_num`	int	NOT NULL,
	`op_size`	varchar(5)	NULL,
	`op_amount`	int	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_email`
);

ALTER TABLE `goods` ADD CONSTRAINT `PK_GOODS` PRIMARY KEY (
	`gd_num`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`ca_num`
);

ALTER TABLE `subcategory` ADD CONSTRAINT `PK_SUBCATEGORY` PRIMARY KEY (
	`sub_num`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`or_num`
);

ALTER TABLE `mylist` ADD CONSTRAINT `PK_MYLIST` PRIMARY KEY (
	`my_num`
);

ALTER TABLE `orderlist` ADD CONSTRAINT `PK_ORDERLIST` PRIMARY KEY (
	`ol_num`
);

ALTER TABLE `option` ADD CONSTRAINT `PK_OPTION` PRIMARY KEY (
	`op_num`
);
ALTER TABLE `adidas_store_tn`.`goods` 
CHANGE COLUMN `gd_num` `gd_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `gd_img` `gd_img` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `gd_name` `gd_name` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `gd_gender` `gd_gender` VARCHAR(6) NOT NULL ,
CHANGE COLUMN `gd_price` `gd_price` INT NOT NULL ,
CHANGE COLUMN `gd_date` `gd_date` DATETIME NOT NULL DEFAULT now() ,
CHANGE COLUMN `gd_title` `gd_title` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `gd_content` `gd_content` LONGTEXT NOT NULL ,
CHANGE COLUMN `gd_code` `gd_code` CHAR(6) NOT NULL ,
CHANGE COLUMN `gd_material` `gd_material` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `gd_color` `gd_color` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `gd_country` `gd_country` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `gd_made_date` `gd_made_date` CHAR(6) NOT NULL ,
CHANGE COLUMN `gd_made_company` `gd_made_company` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `gd_importer` `gd_importer` VARCHAR(30) NULL DEFAULT '아디다스코리아[유]' ;

ALTER TABLE `adidas_store_tn`.`category` 
CHANGE COLUMN `ca_num` `ca_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `ca_name` `ca_name` VARCHAR(30) NOT NULL ;

ALTER TABLE `adidas_store_tn`.`member` 
CHANGE COLUMN `me_pw` `me_pw` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `me_name` `me_name` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `me_address` `me_address` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `me_phone` `me_phone` CHAR(13) NOT NULL ,
CHANGE COLUMN `me_authority` `me_authority` VARCHAR(10) NULL DEFAULT '회원' ,
CHANGE COLUMN `me_postnum` `me_postnum` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `me_address_detail` `me_address_detail` VARCHAR(255) NULL ;

ALTER TABLE `adidas_store_tn`.`mylist` 
CHANGE COLUMN `my_num` `my_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `my_amount` `my_amount` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `my_list_state` `my_list_state` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `my_check_state` `my_check_state` VARCHAR(2) NOT NULL ;

ALTER TABLE `adidas_store_tn`.`option` 
CHANGE COLUMN `op_num` `op_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `op_size` `op_size` varchar(5) NOT NULL ,
CHANGE COLUMN `op_amount` `op_amount` INT NOT NULL ;

ALTER TABLE `adidas_store_tn`.`option` 
CHANGE COLUMN `gd_num` `op_gd_num` INT NOT NULL ;


ALTER TABLE `adidas_store_tn`.`order` 
CHANGE COLUMN `or_num` `or_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `or_date` `or_date` DATETIME NOT NULL DEFAULT now() ,
CHANGE COLUMN `or_name` `or_name` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `or_address` `or_address` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `or_phone` `or_phone` CHAR(13) NOT NULL ,
CHANGE COLUMN `or_postnum` `or_postnum` VARCHAR(10) NOT NULL ;

ALTER TABLE `adidas_store_tn`.`orderlist` 
CHANGE COLUMN `ol_num` `ol_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `ol_total_price` `ol_total_price` INT NOT NULL ,
CHANGE COLUMN `ol_amount` `ol_amount` INT NOT NULL ;

ALTER TABLE `adidas_store_tn`.`subcategory` 
CHANGE COLUMN `sub_num` `sub_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `sub_name` `sub_name` VARCHAR(30) NOT NULL ;

ALTER TABLE `adidas_store_tn`.`goods` 
ADD INDEX `gd_ca_num_idx` (`gd_ca_num` ASC) VISIBLE,
ADD INDEX `gd_sub_num_idx` (`gd_sub_num` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`goods` 
ADD CONSTRAINT `gd_ca_num`
  FOREIGN KEY (`gd_ca_num`)
  REFERENCES `adidas_store_tn`.`category` (`ca_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `gd_sub_num`
  FOREIGN KEY (`gd_sub_num`)
  REFERENCES `adidas_store_tn`.`subcategory` (`sub_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `adidas_store_tn`.`mylist` 
ADD INDEX `my_me_email_idx` (`my_me_email` ASC) VISIBLE,
ADD INDEX `my_gd_num_idx` (`my_gd_num` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`mylist` 
ADD CONSTRAINT `my_me_email`
  FOREIGN KEY (`my_me_email`)
  REFERENCES `adidas_store_tn`.`member` (`me_email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `my_gd_num`
  FOREIGN KEY (`my_gd_num`)
  REFERENCES `adidas_store_tn`.`goods` (`gd_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `adidas_store_tn`.`option` 
ADD INDEX `op_gd_num_idx` (`op_gd_num` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`option` 
ADD CONSTRAINT `op_gd_num`
  FOREIGN KEY (`op_gd_num`)
  REFERENCES `adidas_store_tn`.`goods` (`gd_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `adidas_store_tn`.`order` 
ADD INDEX `or_me_email_idx` (`or_me_email` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`order` 
ADD CONSTRAINT `or_me_email`
  FOREIGN KEY (`or_me_email`)
  REFERENCES `adidas_store_tn`.`member` (`me_email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `adidas_store_tn`.`orderlist` 
ADD INDEX `ol_gd_num_idx` (`ol_gd_num` ASC) VISIBLE,
ADD INDEX `ol_or_num_idx` (`ol_or_num` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`orderlist` 
ADD CONSTRAINT `ol_gd_num`
  FOREIGN KEY (`ol_gd_num`)
  REFERENCES `adidas_store_tn`.`goods` (`gd_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `ol_or_num`
  FOREIGN KEY (`ol_or_num`)
  REFERENCES `adidas_store_tn`.`order` (`or_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `adidas_store_tn`.`subcategory` 
ADD INDEX `sub_ca_num_idx` (`sub_ca_num` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`subcategory` 
ADD CONSTRAINT `sub_ca_num`
  FOREIGN KEY (`sub_ca_num`)
  REFERENCES `adidas_store_tn`.`category` (`ca_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `adidas_store_tn`.`emailcheck` (
  `em_num` INT NOT NULL AUTO_INCREMENT,
  `em_email` VARCHAR(255) NOT NULL,
  `em_checknum` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`em_num`));

ALTER TABLE `adidas_store_tn`.`member` 
ADD COLUMN `me_session_id` VARCHAR(255) NULL AFTER `me_address_detail`,
ADD COLUMN `me_session_limit` DATETIME NULL AFTER `me_session_id`;

ALTER TABLE `adidas_store_tn`.`orderlist` 
DROP FOREIGN KEY `ol_gd_num`;
ALTER TABLE `adidas_store_tn`.`orderlist` 
CHANGE COLUMN `ol_gd_num` `ol_op_num` INT NOT NULL ,
ADD INDEX `ol_op_num_idx` (`ol_op_num` ASC) VISIBLE,
DROP INDEX `ol_gd_num_idx` ;
;
ALTER TABLE `adidas_store_tn`.`orderlist` 
ADD CONSTRAINT `ol_op_num`
  FOREIGN KEY (`ol_op_num`)
  REFERENCES `adidas_store_tn`.`option` (`op_num`);

ALTER TABLE `adidas_store_tn`.`mylist` 
DROP FOREIGN KEY `my_gd_num`;
ALTER TABLE `adidas_store_tn`.`mylist` 
CHANGE COLUMN `my_gd_num` `my_op_num` INT NOT NULL ,
ADD INDEX `my_op_num_idx` (`my_op_num` ASC) VISIBLE,
DROP INDEX `my_gd_num_idx` ;
;
ALTER TABLE `adidas_store_tn`.`mylist` 
ADD CONSTRAINT `my_op_num`
  FOREIGN KEY (`my_op_num`)
  REFERENCES `adidas_store_tn`.`option` (`op_num`);

ALTER TABLE `adidas_store_tn`.`mylist` 
DROP COLUMN `my_check_state`;

ALTER TABLE `adidas_store_tn`.`mylist` 
DROP COLUMN `my_list_state`;

CREATE TABLE `adidas_store_tn`.`choice` (
  `ch_num` INT NOT NULL AUTO_INCREMENT,
  `ch_state` INT NOT NULL DEFAULT 0,
  `ch_me_email` VARCHAR(255) NOT NULL,
  `ch_gd_num` INT NOT NULL,
  PRIMARY KEY (`ch_num`),
  INDEX `ch_me_email_idx` (`ch_me_email` ASC) VISIBLE,
  INDEX `ch_gd_num_idx` (`ch_gd_num` ASC) VISIBLE,
  CONSTRAINT `ch_me_email`
    FOREIGN KEY (`ch_me_email`)
    REFERENCES `adidas_store_tn`.`member` (`me_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ch_gd_num`
    FOREIGN KEY (`ch_gd_num`)
    REFERENCES `adidas_store_tn`.`goods` (`gd_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- 2022-03-22 (결제코드) 추가
ALTER TABLE `adidas_store_tn`.`orderlist` 
ADD COLUMN `ol_uid` VARCHAR(255) NOT NULL AFTER `ol_state`;
-- 2022-03-24 (review테이블) 추가
CREATE TABLE `adidas_store_tn`.`review` (
  `re_num` INT NOT NULL AUTO_INCREMENT,
  `re_title` VARCHAR(255) NOT NULL,
  `re_content` LONGTEXT NOT NULL,
  `re_star` INT NOT NULL DEFAULT 1,
  `re_date` DATETIME NOT NULL DEFAULT now(),
  `re_state` INT NOT NULL DEFAULT 0,
  `re_gd_num` INT NULL,
  `re_me_email` VARCHAR(255) NULL,
  PRIMARY KEY (`re_num`),
  INDEX `re_gd_num_idx` (`re_gd_num` ASC) VISIBLE,
  INDEX `re_me_email_idx` (`re_me_email` ASC) VISIBLE,
  CONSTRAINT `re_gd_num`
    FOREIGN KEY (`re_gd_num`)
    REFERENCES `adidas_store_tn`.`goods` (`gd_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `re_me_email`
    FOREIGN KEY (`re_me_email`)
    REFERENCES `adidas_store_tn`.`member` (`me_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--  2022-03-28 (review테이블 수정), likes테이블 추가
ALTER TABLE `adidas_store_tn`.`review` 
DROP FOREIGN KEY `re_gd_num`,
DROP FOREIGN KEY `re_me_email`;
ALTER TABLE `adidas_store_tn`.`review` 
CHANGE COLUMN `re_gd_num` `re_gd_num` INT NOT NULL ,
CHANGE COLUMN `re_me_email` `re_me_email` VARCHAR(255) NOT NULL ;
ALTER TABLE `adidas_store_tn`.`review` 
ADD CONSTRAINT `re_gd_num`
  FOREIGN KEY (`re_gd_num`)
  REFERENCES `adidas_store_tn`.`goods` (`gd_num`),
ADD CONSTRAINT `re_me_email`
  FOREIGN KEY (`re_me_email`)
  REFERENCES `adidas_store_tn`.`member` (`me_email`);
ALTER TABLE `adidas_store_tn`.`review` 
DROP COLUMN `re_state`;
CREATE TABLE `adidas_store_tn`.`likes` (
  `li_num` INT NOT NULL AUTO_INCREMENT,
  `li_state` INT NOT NULL DEFAULT 0,
  `li_me_email` VARCHAR(255) NOT NULL,
  `li_re_num` INT NOT NULL,
  PRIMARY KEY (`li_num`));
ALTER TABLE `adidas_store_tn`.`review` 
ADD COLUMN `re_up` INT NULL AFTER `re_me_email`,
ADD COLUMN `re_down` INT NULL AFTER `re_up`;
ALTER TABLE `adidas_store_tn`.`review` 
CHANGE COLUMN `re_up` `re_up` INT NULL DEFAULT 0 ,
CHANGE COLUMN `re_down` `re_down` INT NULL DEFAULT 0 ;
--  2022-04-01 (goods테이블 수정)
ALTER TABLE `adidas_store_tn`.`goods` 
ADD COLUMN `gd_del` VARCHAR(5) NOT NULL DEFAULT 'N' AFTER `gd_sub_num`;
-- 2022-04-14 (likes외래키 지정)
ALTER TABLE `adidas_store_tn`.`likes` 
ADD INDEX `li_re_num_idx` (`li_re_num` ASC) VISIBLE,
ADD INDEX `li_me_email_idx` (`li_me_email` ASC) VISIBLE;
;
ALTER TABLE `adidas_store_tn`.`likes` 
ADD CONSTRAINT `li_re_num`
  FOREIGN KEY (`li_re_num`)
  REFERENCES `adidas_store_tn`.`review` (`re_num`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `li_me_email`
  FOREIGN KEY (`li_me_email`)
  REFERENCES `adidas_store_tn`.`member` (`me_email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;





