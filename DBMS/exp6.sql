create table borrower(rollin integer not null,name varchar(20),date_of_issue date,name_of_book varchar(20),status varchar(5));
Query OK, 0 rows affected (1.70 sec)

mysql> insert into borrower values(1,"Suma Gadepalli","2023-10-10","Java Programming","I");
Query OK, 1 row affected (0.17 sec)

mysql> insert into borrower values(2,"Tanvi Zuluk","2023-9-10","dbms","I");
Query OK, 1 row affected (0.06 sec)

mysql> insert into borrower values(3,"Rajat Totla","2023-09-01","C++","I");
Query OK, 1 row affected (0.57 sec)

mysql> insert into borrower values(4,"Shalin Chore","2023-08-25","Python","I");
Query OK, 1 row affected (0.04 sec)

mysql> select * from borrower;
+--------+------------------+---------------+------------------+--------+
| rollin | name             | date_of_issue | name_of_book     | status |
+--------+------------------+---------------+------------------+--------+
|      1 | Suma Gadepalli   | 2023-10-10    | Java Programming | I      |
|      2 | Tanvi Zuluk      | 2023-09-10    | dbms             | I      |
|      3 | Rajat Totla      | 2023-09-01    | C++              | I      |
|      4 | Shalin Chore     | 2023-08-25    | Python           | I      |
+--------+------------------+---------------+------------------+--------+
4 rows in set (0.49 sec)

mysql> create table fine(roll_no integer,Date_of_return date,amt integer);
Query OK, 0 rows affected (0.45 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE FINECALC(RNO INT)
    -> begin
    -> declare days int default 0;
    -> declare issuedate date default now();
    -> declare fine float default 0;
    -> select date_of_issue into issuedate from borrower where rollin=RNO;
    -> select issuedate;
    -> set days=datediff(now(),issuedate);
    -> select days;
    -> if(days>15 and days<30) then
    -> set fine=days*5;
    -> else
    -> if(days>=30) then
    -> set fine=days*50;
    -> end if;
    -> insert into fine values(rno,now(),fine);
    -> end if;
    -> select fine;
    -> update borrower set status='R' where rollin=RNO;
    -> end $$
Query OK, 0 rows affected (0.84 sec)

mysql> select * from fine;
Empty set(0.24 sec)

mysql> select * from borrower;
+--------+------------------+---------------+------------------+--------+
| rollin | name             | date_of_issue | name_of_book     | status |
+--------+------------------+---------------+------------------+--------+
|      1 | Suma Gadepalli   | 2023-10-10    | Java Programming | I      |
|      2 | Tanvi Zuluk      | 2023-09-10    | dbms             | I      |
|      3 | Rajat Totla      | 2023-09-01    | C++              | I      |
|      4 | Shalin Chore     | 2023-08-25    | Python           | I      |
+--------+------------------+---------------+------------------+--------+
4 rows in set (0.49 sec)

mysql> call finecalc(1);
+------------+
| ISSUEDATE  |
+------------+
| 2023-10-10 |
+------------+
1 row in set (0.001 sec)

+------+
| DAYS |
+------+
| 8    |
+------+
1 row in set (0.019 sec)

+------+
| FINE |
+------+
| 0    |
+------+
1 row in set (0.128 sec)
Query OK, 3 rows affected (0.170 sec)

mysql> call finecalc(2);
+------------+
| ISSUEDATE  |
+------------+
| 2023-09-10 |
+------------+
1 row in set (0.001 sec)
+------+
| DAYS |
+------+
| 38   |
+------+
1 row in set (0.018 sec)
+------+
| FINE |
+------+
| 1900 |
+------+
1 row in set (0.150 sec)
Query OK, 3 rows affected (0.238 sec)

mysql> call finecalc(3);
+------------+
| ISSUEDATE  |
+------------+
| 2023-09-01 |
+------------+
1 row in set (0.001 sec)
+------+
| DAYS |
+------+
| 47 |
+------+
1 row in set (0.019 sec)
+------+
| FINE |
+------+
| 2350 |
+------+
1 row in set (0.067 sec)
Query OK, 3 rows affected (0.120 sec)

MariaDB [assignment6]> select * from fine;
+---------+----------------+------+
| roll_no | Date_of_return | amt  |
+---------+----------------+------+
| 1       | 2023-10-18     | 0    |
| 2       | 2023-10-18     | 1900 |
| 3       | 2023-10-18     | 2350 | 
+---------+----------------+------+
3 rows in set (0.000 sec)

MariaDB [assignment6]> select * from borrower;
+--------+------------------+---------------+------------------+--------+
| rollin | name             | date_of_issue | name_of_book     | status |
+--------+------------------+---------------+------------------+--------+
|      1 | Suma Gadepalli   | 2023-10-10    | Java Programming | R      |
|      2 | Tanvi Zuluk      | 2023-09-10    | dbms             | R      |
|      3 | Rajat Totla      | 2023-09-01    | C++              | R      |
|      4 | Shalin Chore     | 2023-08-25    | Python           | I      |
+--------+------------------+---------------+------------------+--------+
4 rows in set (0.49 sec)

mysql> notee;
    -> Terminal close -- exit!