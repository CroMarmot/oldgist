# Common commands 

## General

```sql
/* login to mysql [https://dev.mysql.com/doc/refman/5.7/en/connecting.html]*/
mysql -u {user_name} -h 127.0.0.1 --port=13306 --database="DATABASENAME" --execute="SELECT User, Host FROM mysql.user" -p

/* export database to dump*/
mysqldump --single-transaction -u {user_name} -p {database_name} > /tmp/{file_name}.dump

/* import database from dump*/
mysql -u {user_name} -p {database_name} < /tmp/{file_name}.dump

/* use database change*/
use {database_name}
```

## Create

```sql
/*Create a database*/
CREATE DATABASE savetheworld;

/*Create a table*/
CREATE TABLE superheros(
  id int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
  superhero varchar(25) NOT NULL,
  password varchar(25) NOT NULL,     
  email varchar(40) NOT NULL);
```

## Read

```sql
/*Show all databases*/
SHOW DATABASES;

/*Show all tables*/
SHOW TABLES;

/*List schema for a specific table*/
DESC superheros;

/*List all values from specific table*/
SELECT * FROM superheros;

/*List all values from specific table and order by a column name*/
SELECT * FROM superheros ORDER BY superhero;

/*List all values that contain a specific word*/
SELECT * FROM superheros WHERE email RLIKE('batman');

/*Returns the number of rows in a table*/
SELECT COUNT(*) FROM superheros;

/*List distinct values in a table without duplicates*/
SELECT DISTINCT superhero FROM superheros;

/*Display the length of a column's values as an alias*/
SELECT email LENGTH(email) AS 'Email Length' FROM superheros;

/* check foreign key constraints*/
show create table {table_name}
```

## Update

```sql
/*Update specific table column value  */
UPDATE superheros SET email = 'slightlybetterpassword' WHERE superhero = 'batman';

/* change column name*/
alter table {table_name} change {current_column_name} {new_colunm_name} {type_info}
```

## Delete

```sql
/*Delete a database  */
DROP DATABASE savetheworld;

/*Delete a table  */
DROP TABLE superheros;

/*Delete a value from database table column  */
DELETE FROM superheros WHERE superhero = 'superman';

/*Delete multiple values from database table columns  */
DELETE FROM superheros WHERE superhero IN('batman', 'spiderman');

/*Delete a column from a database table  */
ALTER TABLE superheros DROP COLUMN email;

/* delete foreign key constraint*/
alter table {table_name} drop foreign key {constraint_name}
```

## Functions

```sql
/*Trim white space from a column's values  */
SELECT TRIM(*) FROM superheros;

/*Converts a column's values into uppercase  */
SELECT UPPER(email) FROM superheros;

/*Converts a column's values into lowercase  */
SELECT LOWER(email) FROM superheros;

/*Returns absolute value of a number  */
SELECT ABS(-12);  

/*Rounds a column  */
SELECT ROUND(age) FROM superheros;

/*Sums a column  */
SELECT SUM(age) FROM superheros;

/* get max value of id*/
select max(id) from {table_name};
```

# USER MANAGEMENT

[user-account-management](https://dev.mysql.com/doc/refman/5.7/en/user-account-management.html)

# RESET ROOT PASSWORD

> if you have old password just use `mysql -uroot -p` login mysql and skip to `step 2`

1. first login without password

```bash
# Stop and start the MySQL service
# (Ubuntu, Debian, Deepin) Run the following command:
sudo /etc/init.d/mysql stop

# (CentOS, Fedora, and Red Hat Enterprise Linux) Run the following command:
sudo /etc/init.d/mysqld stop

# Start MySQL without a password
sudo mysqld_safe --skip-grant-tables &

# Connect to MySQL
mysql -uroot
```

2. next set new password

```bash
# MySQL 5.7.5 and earlier:
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');
# MySQL 5.7.6 and later:
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';

mysql> flush privileges;
mysql> quit
```

3. then rerun the service

```bash
# (Ubuntu, Debian,Deepin) Run the following commands:
sudo service mysql stop
sudo service mysql start
# (CentOS, Fedora, and Red Hat Enterprise Linux) Run the following commands:
sudo service mysqld stop
sudo service mysqld start
```

4. Log in to the database with password
 
```bash
mysql -u root -p
```
