--DROP TABLE IF EXISTS USER;
--DROP TABLE IF EXISTS ROLE;
--DROP TABLE IF EXISTS USER_ROLES;
--DROP TABLE IF EXISTS COMMENT;
--
--CREATE TABLE USER (
--    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    username VARCHAR(255) UNIQUE NOT NULL,
--    password VARCHAR(255) not null,
--    name VARCHAR(255) not null,
--    email VARCHAR(255) not null,
--    img TEXT not null DEFAULT 'https://firebasestorage.googleapis.com/v0/b/userprofile-47d10.appspot.com/o/user%2Fdefault.png?alt=media&token=37dc1ece-c3dc-4da3-897e-0fbce05249ed'
--);
--
--CREATE TABLE ROLE (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    name VARCHAR(255) UNIQUE not null
--);
--
--INSERT INTO ROLE
--VALUES  (DEFAULT, 'ROLE_USER'),
--        (DEFAULT, 'ROLE_MANAGER'),
--        (DEFAULT, 'ROLE_ADMIN');
--
--CREATE TABLE USER_ROLES (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    user_id BIGINT not null,
--    role_id BIGINT not null
--);

--CREATE TABLE OAUTH2_USER (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    user_id BIGINT not null,
--    oauth2_name VARCHAR(255) UNIQUE not null,
--    provider VARCHAR(255) not null
--);

--CREATE TABLE BOARD (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    title VARCHAR(255) not null,
--    content LONGTEXT not null,
--    user_id BIGINT not null
--);

--ALTER TABLE BOARD ADD COLUMN view_count INT NOT NULL DEFAULT 0;

--CREATE TABLE board_like (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    board_id BIGINT not null,
--    user_id BIGINT not null
--);

--CREATE TABLE COMMENT (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    board_id BIGINT not null,
--    parent_id BIGINT null,
--    content TEXT not null,
--    writer_id BIGINT not null,
--    create_date DATETIME not null
--);


--CREATE TRIGGER before_delete_comment
--BEFORE DELETE ON comment
--FOR EACH ROW
--BEGIN
--    DELETE FROM comment WHERE parent_id = OLD.id;
--END;

ALTER TABLE USER ADD COLUMN email_valid INT NOT NULL DEFAULT 0;