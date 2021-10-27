
DROP DATABASE IF EXISTS northwind_dw;

CREATE DATABASE northwind_dw;

USE northwind_dw;

CREATE TABLE DimCustomer (
    CustomerID VARCHAR(5),
    CompanyName VARCHAR(40) NOT NULL,
    City VARCHAR(15),
    Country VARCHAR(15),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE DimProduct (
    ProductSurrogateID INTEGER,
    ProductID INTEGER,
    ProductName VARCHAR(40),
    CategoryName VARCHAR(15),
    Version INTEGER NOT NULL,
    DateFrom DATETIME,
    DateTo DATETIME,
    PRIMARY KEY (ProductSurrogateID)
);

CREATE TABLE DimSupplier (
    SupplierID INTEGER,
    CompanyName VARCHAR(40) NOT NULL,
    City VARCHAR(15),
    Country VARCHAR(15),
    PRIMARY KEY (SupplierID)
);

CREATE TABLE DimShipper (
    ShipperID INTEGER,
    CompanyName VARCHAR(40) NOT NULL,
    PRIMARY KEY (ShipperID)
);

CREATE TABLE DimTime (
    TimeID DATE,
    YearID INTEGER NOT NULL,
    MonthID INTEGER NOT NULL,
    MonthName CHAR(3) NOT NULL,
    DayID INTEGER NOT NULL,
    PRIMARY KEY (TimeID)
);

CREATE TABLE FactOrder (
    OrderID INTEGER,
    ProductID INTEGER,
    UnitPrice DECIMAL(10,4) NOT NULL,
    Quantity SMALLINT(2) NOT NULL,
    Discount REAL NOT NULL,
    TotalCost DOUBLE NOT NULL,
    CustomerID VARCHAR(5) NOT NULL,
    ProductSurrogateID INTEGER NOT NULL,
    SupplierID INTEGER NOT NULL,
    ShipperID INTEGER NOT NULL,
    TimeID DATE NOT NULL,
    CONSTRAINT PK_FactOrder PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID),
    FOREIGN KEY (ProductSurrogateID) REFERENCES DimProduct (ProductSurrogateID),
    FOREIGN KEY (SupplierID) REFERENCES DimSupplier (SupplierID),
    FOREIGN KEY (ShipperID) REFERENCES DimShipper (ShipperID),
    FOREIGN KEY (TimeID) REFERENCES DimTime (TimeID)
);
