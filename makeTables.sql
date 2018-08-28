CREATE TABLE Branch (
branch_number CHAR(8) PRIMARY KEY,
phone CHAR(10),
street VARCHAR(32),
city VARCHAR(32),
zip CHAR(5)
);

CREATE TABLE Employee (
employee_id CHAR(8) PRIMARY KEY,
name VARCHAR(32),
phone CHAR(10),
job VARCHAR(11),
CHECK (job in ('manager','supervisor')) 
);

CREATE TABLE Owner (
owner_id CHAR(8) PRIMARY KEY,
name VARCHAR(32),
street VARCHAR(32),
city VARCHAR(32),
zip CHAR(5),
phone CHAR(10)
);

CREATE TABLE Property (
prop_id Integer PRIMARY KEY,
street VARCHAR(32),
city VARCHAR(32),
zip CHAR(5),
num_rooms Integer,
monthly_rent NUMBER(*,2),
status VARCHAR(11) DEFAULT 'available',
avail_start_date DATE,
CHECK (status in ('available','leased')) 
);

CREATE TABLE Employs (
branch_number CHAR(8),
employee_id CHAR(8),
FOREIGN KEY (branch_number) REFERENCES Branch(branch_number),
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) 
);

CREATE TABLE Supervises (
manager_id CHAR(8),
supervisor_id CHAR(8) PRIMARY KEY, 
FOREIGN KEY (manager_id) REFERENCES Employee(employee_id),
FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id) 
);

CREATE TABLE Manages (
supervisor_id CHAR(8),
prop_id Integer PRIMARY KEY,
FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
FOREIGN KEY (prop_id) REFERENCES Property(prop_id) ON DELETE CASCADE
);

CREATE TABLE Owns (
prop_id Integer PRIMARY KEY,
owner_id CHAR(8),
FOREIGN KEY (prop_id) REFERENCES Property(prop_id) ON DELETE CASCADE,
FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

CREATE TABLE Renter (
rname VARCHAR(32),
rhome CHAR(10),
rwork CHAR(10),
renter_id CHAR(8) PRIMARY KEY
);

CREATE TABLE lease (
renter_id CHAR(8),
start_date DATE,
end_date DATE,
deposit_amt NUMBER(*,2),
supervisor_id CHAR(8),
lease_id Integer PRIMARY KEY,
prop_id Integer,
CHECK ((end_date - start_date <= 365) AND (end_date - start_date >= 182)),
FOREIGN KEY (prop_id) REFERENCES Property(prop_id) ON DELETE CASCADE,
FOREIGN KEY (renter_id) REFERENCES renter(renter_id),
FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id)
);
