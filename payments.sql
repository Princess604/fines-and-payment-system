CREATE DATABASE payments_db;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> USE payments_db;
Database changed
MariaDB [payments_db]> CREATE TABLE Fines (
    -> fine_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->  loan_id      INT NOT NULL,
    ->   member_id    INT NOT NULL,
    -> fine_amount  DECIMAL(8,2) NOT NULL,
    -> days_overdue INT NOT NULL,
    ->   issued_date  DATE NOT NULL,
    ->  status       ENUM('Pending','Paid','Waived') DEFAULT 'Pending'
    -> );
Query OK, 0 rows affected (0.019 sec)

MariaDB [payments_db]> CREATE TABLE Payments (
    ->  payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    ->  fine_id        INT NOT NULL,
    ->  member_id      INT NOT NULL,
    -> amount_paid    DECIMAL(8,2) NOT NULL,
    ->   payment_date   DATETIME NOT NULL,
    ->  payment_method ENUM('Cash','MobileMoney','Card') DEFAULT 'Cash',  received_by    INT
    -> );
Query OK, 0 rows affected (0.022 sec)

MariaDB [payments_db]> INSERT INTO Payments(fine_id,amount_paid,payment_date,payment_method,received_by)
    -> VALUES
    -> (2,2,1OOOO.00,'2026-05-02 10:30:00','Cash',1),
    -> (1,1,2500.00,'2026-05-04 14:00:00','MobileMoney',2);
ERROR 1054 (42S22): Unknown column '1OOOO.00' in 'field list'
MariaDB [payments_db]> (2,1OOOO.00,'2026-05-02 10:30:00','Cash',1),
    -> (1,2500.00,'2026-05-04 14:00:00','MobileMoney',2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '2,1OOOO.00,'2026-05-02 10:30:00','Cash',1),
(1,2500.00,'2026-05-04 14:00:00',...' at line 1
MariaDB [payments_db]> INSERT INTO Fines(loan_id,member_id,fine_amount,days_overdue,issued_date,status)
    -> VALUES
    -> (101,1,5000.00,5,'2026-05-01','Pending'),
    -> (102,2,10000.00,7,'2026-05-03','Pending');
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [payments_db]> SELECT *FROM Fines;
+---------+---------+-----------+-------------+--------------+-------------+---------+
| fine_id | loan_id | member_id | fine_amount | days_overdue | issued_date | status  |
+---------+---------+-----------+-------------+--------------+-------------+---------+
|       1 |     101 |         1 |     5000.00 |            5 | 2026-05-01  | Pending |
|       2 |     102 |         2 |    10000.00 |            7 | 2026-05-03  | Pending |
+---------+---------+-----------+-------------+--------------+-------------+---------+
2 rows in set (0.001 sec)