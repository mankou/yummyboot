

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
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx2','张三',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx3','王五',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx4','max',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx5','王七',NOW());
INSERT INTO tb_user(CODE,NAME,create_date) VALUES('xx6','李四',NOW());



DROP TABLE IF EXISTS test_table;
create table test_table
(
    id          int auto_increment primary key,
    code        varchar(32)  null comment '编码',
    name        varchar(128) null,
    create_date datetime     null comment '时间'
)comment 'test_table' charset = utf8;
INSERT INTO test_table (id, code, name, create_date) VALUES (20, '001', '小天', '2020-03-29 21:06:36');
INSERT INTO test_table (id, code, name, create_date) VALUES (21, '002', '大地', '2020-09-01 10:32:52');


