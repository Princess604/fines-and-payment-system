CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Fines (
    fine_id      INT AUTO_INCREMENT PRIMARY KEY,
    loan_id      INT NOT NULL,
    member_id    INT NOT NULL,
    fine_amount  DECIMAL(8,2) NOT NULL,
    days_overdue INT NOT NULL,
    issued_date  DATE NOT NULL,
    status       ENUM('Pending','Paid','Waived') DEFAULT 'Pending',
    FOREIGN KEY (loan_id)   REFERENCES Loans(loan_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Payments (
    payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    fine_id        INT NOT NULL,
    member_id      INT NOT NULL,
    amount_paid    DECIMAL(8,2) NOT NULL,
    payment_date   DATETIME NOT NULL,
    payment_method ENUM('Cash','MobileMoney','Card') DEFAULT 'Cash',
    received_by    INT,
    FOREIGN KEY (fine_id)     REFERENCES Fines(fine_id),
    FOREIGN KEY (member_id)   REFERENCES Members(member_id),
    FOREIGN KEY (received_by) REFERENCES Staff(staff_id)
);