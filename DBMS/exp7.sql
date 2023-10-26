mysql>  create table old_roll(roll int,name varchar(20));
Query OK, 0 rows affected (0.19 sec)

mysql> create table new_roll(roll int,name varchar(20));
Query OK, 0 rows affected (0.22 sec)

mysql> insert into old_roll values(1,'Suma Gadepalli');
Query OK, 1 row affected (0.08 sec)

mysql> insert into new_roll values(2,'Rajat Totla');
Query OK, 1 row affected (0.04 sec)

mysql> insert into old_roll values(3,'Vaibhav Shinde');
Query OK, 1 row affected (0.03 sec)

mysql> insert into old_roll values(4,'Shalin Chore');
Query OK, 1 row affected (0.04 sec)

mysql> insert into old_roll values(5,'Tanvi Zuluk');
Query OK, 1 row affected (0.02 sec)



mysql> insert into new_roll values(5,'Tanvi Zuluk');
Query OK, 1 row affected (0.02 sec)

mysql>  insert into new_roll values(1,'Suma Gadepalli');
Query OK, 1 row affected (0.04 sec)

mysql>  select * from old_roll;
+------+-----------------+
| roll | name            |
+------+-----------------+
|    1 | Suma Gadepalli  |
|    2 | Rajat Totla     |
|    3 | Vaibhav Shinde  |
|    4 | Shalin Chore    |
|    5 | Tanvi Zuluk     |
+------+-----------------+
5 rows in set (0.00 sec)

mysql>  select * from new_roll;
+------+-----------------+
| roll | name            |
+------+-----------------+
|    5 | Tanvi Zuluk     |
|    1 | Suma Gadepalli  |
+------+-----------------+
2 rows in set (0.00 sec)

mysql> delimiter $
mysql> create procedure roll_list()
    -> begin
    -> declare oldrollnumber int;
    -> declare oldname varchar(10);
    -> declare newrollnumber int;
    -> declare newname varchar(10);
    -> declare done int default false;
    -> declare c1 cursor for select roll,name from old_roll;
    -> declare c2 cursor for select roll,name from new_roll;
    -> declare continue handler for not found set done=true;
    -> open c1;
    -> loop1:loop
    -> fetch c1 into oldrollnumber,oldname;
    -> if done then
    -> leave loop1;
    -> end if;
    -> open c2;
    -> loop2:loop
    -> fetch c2 into newrollnumber,newname;
    -> if done then
    -> insert into new_roll values(oldrollnumber,oldname);
    -> set done=false;
    -> close c2;
    -> leave loop2;
    -> end if;
    -> if oldrollnumber=newrollnumber then
    -> close c2;
    -> leave loop2;
    -> end if;
    -> end loop;
    -> end loop;
    -> close c1;
    -> end $
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql> call roll_list();
Query OK, 0 rows affected (0.05 sec)

mysql> select * from new_roll;
+------+----------------+
| roll | name           |
+------+----------------+
|    5 | Tanvi Zuluk    |
|    1 | Suma Gadepalli |
|    2 | Rajat Totla    |
|    3 | Vaibhav Shinde |
|    4 | Shalin Chore   |
+------+----------------+
5 rows in set (0.00 sec)

