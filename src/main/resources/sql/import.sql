

DROP TABLE IF EXISTS city;

-- create table city (id int primary key auto_increment, name varchar, state varchar, country varchar);
CREATE TABLE city (id INT PRIMARY KEY AUTO_INCREMENT, NAME VARCHAR(20), state VARCHAR(20), country VARCHAR(20));

INSERT INTO city (NAME, state, country) VALUES ('San Francisco', 'CA', 'US');



DROP TABLE IF EXISTS tb_user;
CREATE TABLE `tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(32) DEFAULT NULL COMMENT '编码',
  `name` VARCHAR(128) DEFAULT NULL,
  `create_date` DATETIME DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='user表';


INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx1','maning',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx2','maning',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx3','maning',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx4','maning',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx5','maning',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx6','maning',NOW());

