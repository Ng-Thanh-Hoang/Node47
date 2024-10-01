-- tạo cơ sở dữ liệu 
CREATE DATABASE node47
Use node47

-- tạo table,data
-- tạo table users
-- 3 kiểu dữ liệu chính:
/* 
 +Number: interger,float,...
 +String: varchar, text,...
 +Datetime (timestamp, day,...)
*/
Create Table users(
   full_name VARCHAR(100),
   email VARCHAR(255),
   age Int,
   pass_word VARCHAR(255)
)

INSERT INTO users (full_name, email, age, pass_word) VALUES 
('Nguyen Van A', 'nguyenvana@example.com', 25, 'password123'),
('Le Thi B', 'lethib@example.com', 30, 'passw0rd!'),
('Tran Van C', 'tranvanc@example.com', 22, 'mypassword456'),
('Pham Thi D', 'phamthid@example.com', 27, 'abc123xyz'),
('Do Quang Khai', 'khaidq@example.com', 23, 'KhaiPassword!'),
('Nguyen Thi E', 'nguyenthie@example.com', 26, 'securepass789'),
('Le Van F', 'levanf@example.com', 21, 'strongpass111'),
('Tran Thi G', 'tranthig@example.com', 29, 'passkey2021'),
('Nguyen Van H', 'nguyenvanh@example.com', 24, 'password789'),
('Le Thi I', 'lethii@example.com', 31, 'passme2022'),
('Tran Van J', 'tranvanj@example.com', 28, 'jpasspassword!'),
('Pham Van K', 'phamvank@example.com', 22, 'vank_pass432'),
('Do Thi L', 'dothil@example.com', 27, 'secretpass100'),
('Nguyen Van M', 'nguyenvanm@example.com', 24, 'mypassword999'),
('Le Thi N', 'lethin@example.com', 25, 'newpassword123'),
('Tran Van O', 'tranvano@example.com', 26, 'opassword567'),
('Pham Thi P', 'phamthip@example.com', 30, 'strongpassp@ss'),
('Do Van Q', 'dovanq@example.com', 28, 'quypasspass!'),
('Nguyen Thi R', 'nguyenthir@example.com', 23, 'securepassR@123'),
('Le Van S', 'levans@example.com', 21, 'Spasswordstrong!');

INSERT INTO users (email,age,pass_word) VALUE ('ahihi@gmail.com',35,'1234567')

-- viết câu lệnh query để get data
-- *: lấy hết tất cả data trong table
SELECT * FROM users
SELECT full_name As 'Họ tên', email FROM users

-- lấy những người có tuổi từ 20-25 age và sắp xếp tăng dần (giảm dần)
-- Cách 1:
SELECT * FROM users
Where age >= 20 and age <=25
ORDER By age Desc -- keyword để sắp xếp data: order by.....(asc,desc)
LIMIT 5

-- Cach 2:
SELECT * FROM users
Where age BETWEEN 20 and 25
LIMIT 10

-- thêm 2 column address và phone cho table users
-- => update table thay vì xoá table và tạo lại
ALTER TABLE users
ADD COLUMN address VARCHAR(255),
ALTER TABLE users
ADD COLUMN phone VARCHAR(15)

-- thay đổi kiểu dữ liệu cho columns đó (address)
ALTER TABLE users
modify address VARCHAR(100)

-- thêm ràng buộc (constraint) cho column
ALTER TABLE users
modify COLUMN full_name VARCHAR(100) not null

INSERT INTO users(email,age, pass_word, address) VALUES
('test@gmail.com',30,'123456','Quan3')
-- => error: Field 'full_name' doesn't have a default value

-- liệt kê những người có tuổi lớn nhất
-- Cách 1:
-- B1: tìm tuổi lớn nhất trong danh sách users
-- B2: lấy những người có tuổi lớn nhất
/* SELECT * FROM users
 ORDER By age DESC
 LIMIT 1*/
 SELECT *FROM users
 WHERE age = (SELECT age FROM users order by age DESC limit 1)
 
-- Cách 2: keyword MAX hoặc MIN
 SELECT * FROM users
 WHERE age = (SELECT max(age) FROM users)
 
-- tìm những người có họ Lê trong danh sách
-- => keyword Like (tìm tương đối)
SELECT * FROM users
WHERE full_name like '%Lê%'
/* 
  Le%: tìm những người có chữ Le ở đầu chuỗi: L1, Le Van, Le Thi,...
  %Le: tìm những người có chữ Le ở cuối chuỗi: Nguyen Van Le, Trai Le,...
  %Le%: tìm những người có chữ Le bất kì ở đâu
*/

-- liệt kê tất cả full_name nếu trùng nhau chỉ lấy 1
SELECT DISTINCT full_name FROM users

-- đếm có bao nhiêu users trong table sử dụng hàm count
SELECT COUNT(*) FROM users

-- khoá chính (primary key)
-- column trong table nhưng dùng để xác định data đó là duy nhất, để query 1 phần tử
alter TABLE users 
ADD COLUMN user_id Int PRIMARY key auto_increment

INSERT into users (full_name, age, email) VALUES ('cyber',30,'cybersoft@gmail.com')
SELECT * FROM users 

/* Tổng kết
   create database, table, column, data
   query (select ... from <tên table>)
   filter(where)
   tìm data trong khoảng...(BETWEEN....AND)
   update table (add column mới, update datatype column, thêm ràng buộc) => alter table <tên table>...
   sub query (tìm người có tuổi lớn nhất (nhỏ nhất))
   tìm kiếm chuỗi (Like)
*/
-- query, insert, update, delete