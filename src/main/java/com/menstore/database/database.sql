Use Menstore
DROP TABLE OrderDetail
DROP TABLE Orders
DROP TABLE Voucher
DROP TABLE Users
DROP TABLE Product
DROP TABLE Category
Go

CREATE TABLE Product (
    ProductID varchar(20) NOT NULL,
    ProductName nvarchar(255) NOT NULL,
    Status varchar(255),
    Discount float,
	Price int,
	Quantity int,
	Size varchar(5),
	CategoryID varchar(20),
	Link_image varchar(255),
    PRIMARY KEY (ProductID),
)
go

CREATE TABLE Category (
	CategoryID varchar(20),
	CategoryName nvarchar(255),
    PRIMARY KEY (CategoryID)
)
go

CREATE TABLE Users (
	UserID varchar(20),
	NameOfUser nvarchar(255),
	UserName varchar(50),
	Password varchar(50),
	Role varchar(10),
	Point int,
	Address nvarchar(255),
	PhoneNumber varchar(15),
    PRIMARY KEY (UserID)
)
go

CREATE TABLE Voucher (
	VoucherID varchar(20),
	Discount float,
	DueDate Date,
	Maximum_discount int,
	Required int,
	Description nvarchar(255),
    PRIMARY KEY (VoucherID)
)
Go

CREATE TABLE Orders (
	InvoiceID varchar(20),
	DiscountedPrice int,
	OrderDate Date,
	Total int,
	Note nvarchar(255),
	Status nvarchar(255),
	UserID varchar(20),
	VoucherID varchar(20),
    PRIMARY KEY (InvoiceID)
)
Go

CREATE TABLE OrderDetail (
	InvoiceID varchar(20),
	ProductID varchar(20),
	SoldPrice int,
	Quantity int,
    PRIMARY KEY (InvoiceID,ProductID)
)
go

ALTER TABLE OrderDetail
ADD FOREIGN KEY (InvoiceID) REFERENCES Orders(InvoiceID) On Delete Cascade
go
ALTER TABLE OrderDetail
ADD FOREIGN KEY (ProductID) REFERENCES Product(ProductID) On Delete Cascade
go
ALTER TABLE Product
ADD FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) 
go
ALTER TABLE Orders
ADD FOREIGN KEY (UserID) REFERENCES Users(UserID)
go
ALTER TABLE Orders
ADD FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID)
go

