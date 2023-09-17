-- 3.1 Create 3 users: GIANGVIEN, GIAOVU and STUDENT, set a password arbitrarily
USE QLDT
CREATE LOGIN GIANGVIEN with PASSWORD = '123456'
CREATE LOGIN GIAOVU with PASSWORD = '123456'
CREATE LOGIN SINHVIEN with PASSWORD = '123456'

create user GIANGVIEN for login GIANGVIEN
create user GIAOVU for login GIAOVU
create user SINHVIEN for login SINHVIEN

create role R4 authorization dbo
-- Tạo GROUP
SP_ADDROLEMEMBER 'R4', 'GIANGVIEN'
GO
SP_ADDROLEMEMBER 'R4', 'GIAOVU'
GO
SP_ADDROLEMEMBER 'R4', 'SINHVIEN'
GO
-- GIAOVU has the right to view and edit (update) on all tables 
GRANT SELECT, UPDATE ON ALL TABLES TO GIAOVU
-- LECTURER 
-- Have the right to view on tables related to teacher information, topics that teachers guide, -
-- criticize or act as a member, view council information and lists of existing topics.
-- Have the right to update their information.
GRANT SELECT ON GV_HDDT TO GIANGVIEN
GRANT SELECT ON GV_PBDT TO GIANGVIEN
GRANT SELECT ON GV_UVDT TO GIANGVIEN
GRANT SELECT,UPDATE ON GIAOVIEN TO GIANGVIEN
GRANT SELECT ON HOIDONG TO GIANGVIEN
GRANT SELECT ON DETAI TO GIANGVIEN
-- STUDENTS have the right to view student information, panel information and a list of available topics
GRANT SELECT ON SINHVIEN TO SINHVIEN
GRANT SELECT ON HOIDONG TO SINHVIEN
GRANT SELECT ON DETAI TO SINHVIEN
-- All of the above users do not have the right to delete information
REVOKE DELETE ON ALL TABLES FROM PUBLIC TO ALL USERS