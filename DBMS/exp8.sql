
mysql> create table stud_marks(roll int , name varchar(20), total_marks int); 
Query OK, 0 rows affected (0.32 sec) 

mysql> create table result(roll int, name varchar(20), class varchar(20)); 
Query OK, 0 rows affected (0.75 sec) 

mysql> insert into stud_marks  values(1,'Shalin Chore', 1200); 
Query OK, 1 row affected (0.13 sec) 

mysql> insert into stud_marks  values(2,'Vaibhav Shinde', 900); 
Query OK, 1 row affected (0.18 sec) 

mysql> insert into stud_marks  values(3,'Suma Gadepalli', 850); 
Query OK, 1 row affected (0.30 sec) 

mysql> insert into stud_marks  values(4,'Tanvi Zuluk', 750); 
Query OK, 1 row affected (0.19 sec) 

mysql> insert into stud_marks  values(5,'Rajat Totla', 600); 
Query OK, 1 row affected (0.18 sec) 

mysql> insert into stud_marks  values(6,'Aman Choudhari', 500); 
Query OK, 1 row affected (0.13 sec) 

mysql> select * from stud_marks; 
+------+-------------------+-------------+ 
| roll | name              | total_marks | 
+------+-------------------+-------------+ 
|    1 | Shalin Chore      |        1200 | 
|    2 | Vaibhav Shinde    |         900 | 
|    3 | Suma Gadepalli    |         850 | 
|    4 | Tanvi Zuluk       |         750 | 
|    5 | Rajat Totla       |         600 | 
|    6 | Aman Choudhari    |         500 | 
+------+-------------------+-------------+ 
6 rows in set (0.00 sec) 

mysql> select * from  result; 
Empty set (0.00 sec)

DELIMITER $
CREATE PROCEDURE proc_grade()

  DECLARE
    marks INT;
    old_roll_number INT;
    old_name VARCHAR2(20);
    new_roll_number INT;
    new_name VARCHAR2(20);
    done INT DEFAULT FALSE;
    c1 CURSOR FOR SELECT roll, name FROM stud_marks;
    c2 CURSOR FOR SELECT roll, name FROM result;
  BEGIN
    OPEN c1;
    LOOP1: LOOP
      FETCH c1 INTO old_roll_number, old_name;

      IF done = TRUE THEN
        LEAVE LOOP1;
      END IF;

      OPEN c2;
      LOOP2: LOOP
        FETCH c2 INTO new_roll_number, new_name;

        IF done = TRUE THEN
          INSERT INTO result VALUES (old_roll_number, old_name, NULL);
          SELECT total_marks INTO marks FROM stud_marks WHERE roll = old_roll_number;

          IF marks >= 990 AND marks <= 1500 THEN
            UPDATE result SET class = 'Distinction' WHERE roll = old_roll_number;
          ELSIF marks >= 900 AND marks <= 989 THEN
            UPDATE result SET class = 'First Class' WHERE roll = old_roll_number;
          ELSIF marks >= 825 AND marks <= 899 THEN
            UPDATE result SET class = 'HSC' WHERE roll = old_roll_number;
          ELSIF marks >= 750 AND marks <= 824 THEN
            UPDATE result SET class = 'SC' WHERE roll = old_roll_number;
          ELSIF marks >= 600 AND marks <= 749 THEN
            UPDATE result SET class = 'PC' WHERE roll = old_roll_number;
          ELSE
            UPDATE result SET class = 'Fail' WHERE roll = old_roll_number;
          END IF;

          SET done = FALSE;
          CLOSE c2;
          LEAVE LOOP2;
        END IF;

        IF old_roll_number = new_roll_number THEN
          LEAVE LOOP2;
        END IF;
      END LOOP;

      CLOSE c2;
    END LOOP;

    CLOSE c1;
  END;
END proc_grade;
end $


 mysql> delimiter ; 
 mysql> call proc_grade(); 
 Query OK, 0 rows affected (1.17 sec) 

mysql> select * from result; 
+------+-------------------+-------------+ 
| roll | name              | class       | 
+------+-------------------+-------------+ 
|    1 | Shalin Chore      | Distinction | 
|    2 | Vaibhav Shinde    | Fist class  | 
|    3 | Suma Gadepalli    | HSC         | 
|    4 | Tanvi Zuluk       | SC          | 
|    5 | Rajat Totla       | PC          | 
|    6 | Aman Choudhari    | Fail        | 
+------+-------------------+-------------+ 
6 rows in set (0.00 sec) 