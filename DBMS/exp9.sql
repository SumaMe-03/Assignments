mysql> CREATE TABLE products ( 
    ->     product_id INT PRIMARY KEY AUTO_INCREMENT, 
    ->     product_name VARCHAR(255), 
    ->     category VARCHAR(255), 
    ->     stock INT, 
    ->     price DECIMAL(10, 2) 
    ->     ); 
 
mysql> CREATE TABLE products_audit ( 
    ->     audit_id INT PRIMARY KEY AUTO_INCREMENT, 
    ->     operation_type VARCHAR(10), 
    ->     product_id INT, 
    ->     product_name VARCHAR(255), 
    ->     category VARCHAR(255), 
    ->     old_stock INT, 
    ->     old_price DECIMAL(10, 2), 
    ->     audit_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); 

mysql> DELIMITER // 
mysql> CREATE TRIGGER products_before_insert 
    -> BEFORE INSERT ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     -- Placeholder logic for BEFORE INSERT 
    ->     SET NEW.stock = NEW.stock + 10; 
    ->     SET NEW.price = NEW.price * 1.1; -- Increase price by 10% 
    ->    END; 
    -> // 
mysql> DELIMITER ; 

  
AFTER INSERT trigger 
mysql> DELIMITER // 
mysql> CREATE TRIGGER products_after_insert 
    -> AFTER INSERT ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     INSERT INTO products_audit (operation_type, product_id, product_name, category, old_stock, old_price) 
    ->     VALUES ('INSERT', NEW.product_id, NEW.product_name, NEW.category, NEW.stock,NEW.price); 
    -> END; 
    -> // 
mysql> DELIMITER ; 

BEFORE UPDATE trigger 
mysql> DELIMITER // 
mysql> CREATE TRIGGER products_before_update 
    -> BEFORE UPDATE ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     -- Placeholder logic for BEFORE UPDATE 
    ->     IF NEW.price < OLD.price THEN 
    ->         SET NEW.price = OLD.price; -- Prevent price decrease 
    ->     END IF; 
    -> END; 
    -> // 
mysql> DELIMITER ;  
 
-- AFTER UPDATE trigger 
mysql> DELIMITER // 
mysql> CREATE TRIGGER products_after_update 
    -> AFTER UPDATE ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     -- Placeholder logic for AFTER UPDATE 
    ->     INSERT INTO products_audit (operation_type, product_id, product_name, category, old_stock, old_price) 
    ->     VALUES ('UPDATE', OLD.product_id, OLD.product_name, OLD.category, OLD.stock, OLD.price); 
    -> END; 
    -> // 
mysql> DELIMITER ; 

--BEFORE DELETE trigger 
mysql> DELIMITER // 
mysql> CREATE TRIGGER products_before_delete 
    -> BEFORE DELETE ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     insert into products_audit values(old.bookid,old.bookname,old.price); 
    -> END; 
    -> // 
mysql> DELIMITER ; 

-- AFTER DELETE trigger 
mysql> DELIMITER // 
mysql> CREATE TRIGGER products_after_delete 
    -> AFTER DELETE ON products 
    -> FOR EACH ROW 
    -> BEGIN 
    ->     INSERT INTO products_audit (operation_type, product_id, product_name, category,old_stock, old_price) 
    ->     VALUES ('DELETE', OLD.product_id, OLD.product_name, OLD.category, OLD.stock, OLD.price); 
    -> END; 
    -> // 
mysql> DELIMITER ; 

-- Insert sample data into products table 
mysql> INSERT INTO products (product_name, category, stock, price) VALUES ('Laptop', 'Electronics', 50, 599.99); 
Query OK, 1 row affected (0.03 sec) 

mysql> INSERT INTO products (product_name, category, stock, price) VALUES ('Smartphone','Electronics', 30, 299.99); 
Query OK, 1 row affected (0.04 sec) 

mysql> UPDATE products SET stock = 60, price = 649.99 WHERE product_id = 1; 
Query OK, 0 rows affected (0.05 sec) 

Rows matched: 1  Changed: 0  Warnings: 0 

mysql> DELETE FROM products WHERE product_id = 2; 
Query OK, 0 rows affected (0.01 sec) 

mysql> SELECT * FROM products; 
+------------+--------------+-------------+-------+--------+ 
| product_id | product_name | category    | stock | price  | 
+------------+--------------+-------------+-------+--------+ 
|          1 | Laptop       | Electronics |    60 | 599.99 | 
|          3 | Laptop       | Electronics |    60 | 649.99 | 
|          4 | Smartphone   | Electronics |    40 | 299.99 | 
+------------+--------------+-------------+-------+--------+ 
3 rows in set (0.00 sec) 

mysql> SELECT * FROM products_audit; 
+----------+----------------+------------+--------------+-------------+-----------+-----------+---------------------+ 
| audit_id | operation_type | product_id | product_name | category    | old_stock | old_price | 
audit_timestamp     | 
1 | INSERT         
+----------+----------------+------------+--------------+-------------+-----------+-----------+---------------------+ 
|        
|          
09:04:55 | 
|        
2 | INSERT         
09:04:55 | 
|        
3 | UPDATE         
09:04:55 | 
|        
4 | DELETE         
09:04:55 | 
|        
5 | INSERT         
09:12:16 | 
|        
6 | INSERT         
09:12:16 | 
|        
7 | UPDATE         
09:12:16 | 
|          
|          
|          
|          
1 | Laptop       
| Electronics |        
2 | Smartphone   | Electronics |        
|          
|          
1 | Laptop       
| Electronics |        
2 | Smartphone   | Electronics |        
3 | Laptop       
| Electronics |        
4 | Smartphone   | Electronics |        
1 | Laptop       
| Electronics |        
60 |    599.99 | 2023-10-19 
40 |    299.99 | 2023-10-19 
60 |    599.99 | 2023-10-19 
40 |    299.99 | 2023-10-19 
60 |    599.99 | 2023-10-19 
40 |    299.99 | 2023-10-19 
60 |    649.99 | 2023-10-19 
+----------+----------------+------------+--------------+-------------+-----------+-----------+-