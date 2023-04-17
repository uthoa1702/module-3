CREATE DATABASE production;
USE production;
CREATE TABLE products(
id INT PRIMARY KEY ,
product_code VARCHAR(5) ,
product_name VARCHAR(50) NOT NULL,
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(50),
product_status bit
);


INSERT INTO products VALUES 
(1, 'a001', 'iphone 11', 1000, 10, null , 1),
(2, 'a002', 'iphone 12', 2000, 10, null , 1),
(3, 'a003', 'iphone 13', 3000, 10, null , 0),
(4, 'a004', 'iphone 14', 4000, 10, null , 1),
(5, 'a005', 'iphone 14 pro max', 4500, 10, null , 0);



-- BƯỚC 3------------
SELECT * from products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

ALTER TABLE products ADD UNIQUE INDEX idx_product_code (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

CREATE INDEX idx_products_name_price ON products (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

EXPLAIN SELECT * FROM products;

-- So sánh câu truy vấn trước và sau khi tạo index

SELECT * FROM products
WHERE product_code like '%a001%';


-- BƯỚC 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_info AS
SELECT product_code, product_name, product_price, product_status 
FROM products;

SELECT * 
FROM product_info;

-- Tiến hành sửa đổi view:

ALTER VIEW product_info 
AS SELECT product_code, product_name, product_price, product_status 
FROM products
WHERE product_status = 1;

-- Tiến hành xoá view

DROP VIEW product_info;

-- BƯỚC 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER // 
CREATE PROCEDURE get_all_product_infor()
BEGIN 
SELECT * FROM products;
END //


CALL get_all_product_infor();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER // 
CREATE PROCEDURE get_new_product_infor(
IN id INT,
 IN product_code VARCHAR(5),
  IN product_name VARCHAR(50),
 IN product_price DOUBLE,
 IN product_amount INT,
 IN product_description VARCHAR(50),
 IN product_status bit)
BEGIN 
 INSERT INTO products(
 id,
  product_code,
  product_name,
  product_price,
  product_amount,
  product_description,
  product_status
 ) VALUES (
 id,
  product_code,
  product_name,
  product_price,
  product_amount,
  product_description,
  product_status
 );
END //
DELIMITER ;
CALL get_new_product_infor(44,'a009','iphone 8','10000', 1, null, 0);


-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //
CREATE PROCEDURE updates_product(
IN p_id INT,
 IN p_product_code VARCHAR(5),
  IN p_product_name VARCHAR(50),
 IN p_product_price DOUBLE,
 IN p_product_amount INT,
 IN p_product_description VARCHAR(50),
 IN p_product_status bit)
BEGIN 
 UPDATE products 
 SET
 id = p_id,
  product_code = p_product_code,
  product_name = p_product_name,
  product_price = p_product_price,
  product_amount = p_product_amount,
  product_description = p_product_description,
  product_status = p_product_status
WHERE
id = p_id;
END //
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product(IN product_id INT)
BEGIN
    DELETE FROM products WHERE id = product_id;
    SELECT CONCAT("Product with ID ", product_id, " has been deleted.") AS message;
END//
DELIMITER ;






select * from products;
drop PROCEDURE get_new_product_infor;
