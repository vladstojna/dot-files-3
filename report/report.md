# Report

## SQL Instructions to Create the Data Warehouse Tables

```sql
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
```

## Transformations & Jobs

For readability purposes, all preview results have been limited to 10 rows if 10 or more rows exist.

---

### [Customer Dimension](../etl/DimCustomer.ktr)

![Transformation](screenshots/DimCustomer/DimCustomer.png)

Table Input

![Configuration](screenshots/DimCustomer/TableInput.configuration.png)
![Preview](screenshots/DimCustomer/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimCustomer/InsertUpdate.configuration.png)
![Preview](screenshots/DimCustomer/InsertUpdate.preview.png)

---

### [Shipper Dimension](../etl/DimShipper.ktr)

![Transformation](screenshots/DimShipper/DimShipper.png)

Table Input

![Configuration](screenshots/DimShipper/TableInput.configuration.png)
![Preview](screenshots/DimShipper/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimShipper/InsertUpdate.configuration.png)
![Preview](screenshots/DimShipper/InsertUpdate.preview.png)

---

### [Supplier Dimension](../etl/DimSupplier.ktr)

![Transformation](screenshots/DimSupplier/DimSupplier.png)

Table Input

![Configuration](screenshots/DimSupplier/TableInput.configuration.png)
![Preview](screenshots/DimSupplier/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimSupplier/InsertUpdate.configuration.png)
![Preview](screenshots/DimSupplier/InsertUpdate.preview.png)

---

### [Time Dimension](../etl/DimTime.ktr)

![Transformation](screenshots/DimTime/DimTime.png)

Table Input

![Configuration](screenshots/DimTime/TableInput.configuration.png)
![Preview](screenshots/DimTime/TableInput.preview.png)

Calculator

![Configuration](screenshots/DimTime/Calculator.configuration.png)
![Preview](screenshots/DimTime/Calculator.preview.png)

Value Mapper

![Configuration](screenshots/DimTime/ValueMapper.configuration.png)
![Preview](screenshots/DimTime/ValueMapper.preview.png)

Insert/Update

![Configuration](screenshots/DimTime/InsertUpdate.configuration.png)
![Preview](screenshots/DimTime/InsertUpdate.preview.png)

---

### [Product Dimension](../etl/DimProduct.ktr)

![Transformation](screenshots/DimProduct/DimProduct.png)

Table Input (1)

![Configuration](screenshots/DimProduct/TableInput.1.configuration.png)
![Preview](screenshots/DimProduct/TableInput.1.preview.png)

Select Values (1)

![Configuration](screenshots/DimProduct/SelectValues.1.configuration.png)
![Preview](screenshots/DimProduct/SelectValues.1.preview.png)

Table Input (2)

![Configuration](screenshots/DimProduct/TableInput.2.configuration.png)
![Preview](screenshots/DimProduct/TableInput.2.preview.png)

Select Values (2)

![Configuration](screenshots/DimProduct/SelectValues.2.configuration.png)
![Preview](screenshots/DimProduct/SelectValues.2.preview.png)

Join Rows

![Configuration](screenshots/DimProduct/JoinRows.configuration.png)
![Preview](screenshots/DimProduct/JoinRows.preview.png)

Dimension Lookup/Update

![Configuration](screenshots/DimProduct/DimensionLookupUpdate.configuration.png)
![Preview](screenshots/DimProduct/DimensionLookupUpdate.preview.png)

---

### [Orders Fact Table](../etl/FactOrder.ktr)

![Transformation](screenshots/FactOrder/FactOrder.png)

Table Input (1)

![Configuration](screenshots/FactOrder/TableInput.1.configuration.png)
![Preview](screenshots/FactOrder/TableInput.1.preview.png)

Select Values (1)

![Configuration](screenshots/FactOrder/SelectValues.1.configuration.png)
![Preview](screenshots/FactOrder/SelectValues.1.preview.png)

Table Input (2)

![Configuration](screenshots/FactOrder/TableInput.2.configuration.png)
![Preview](screenshots/FactOrder/TableInput.2.preview.png)

Select Values (2)

![Configuration](screenshots/FactOrder/SelectValues.2.configuration.png)
![Preview](screenshots/FactOrder/SelectValues.2.preview.png)

Join Rows

![Configuration](screenshots/FactOrder/JoinRows.configuration.png)
![Preview](screenshots/FactOrder/JoinRows.preview.png)

Calculator

![Configuration](screenshots/FactOrder/Calculator.configuration.png)
![Preview](screenshots/FactOrder/Calculator.preview.png)

Database Lookup

![Configuration](screenshots/FactOrder/DatabaseLookup.configuration.png)
![Preview](screenshots/FactOrder/DatabaseLookup.preview.png)

Insert/Update

![Configuration](screenshots/FactOrder/InsertUpdate.configuration.png)
![Preview](screenshots/FactOrder/InsertUpdate.preview.png)

---

### [Job to Populate the Data Warehouse](../etl/LoadDw.kjb)

![LoadDw](screenshots/LoadDw.png)

## XML OLAP Cube Definition

```xml
<Schema name="northwind_dw">
  <Cube name="Orders" visible="true" cache="true" enabled="true">
    <Table name="FactOrder">
    </Table>
    <Dimension type="StandardDimension" visible="true" foreignKey="CustomerID" highCardinality="false" name="Customer">
      <Hierarchy name="Customer Hierarchy" visible="true" hasAll="true" allMemberName="All Customers" primaryKey="CustomerID">
        <Table name="DimCustomer">
        </Table>
        <Level name="Country" visible="true" column="Country" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
        <Level name="City" visible="true" column="City" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
        <Level name="Company Name" visible="true" column="CompanyName" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
      </Hierarchy>
    </Dimension>
    <Dimension type="StandardDimension" visible="true" foreignKey="ProductSurrogateID" highCardinality="false" name="Product">
      <Hierarchy name="Product Hierarchy" visible="true" hasAll="true" allMemberName="All Products" primaryKey="ProductSurrogateID">
        <Table name="DimProduct">
        </Table>
        <Level name="Category Name" visible="true" column="CategoryName" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
        <Level name="Product Name" visible="true" column="ProductName" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
      </Hierarchy>
    </Dimension>
    <Dimension type="StandardDimension" visible="true" foreignKey="SupplierID" highCardinality="false" name="Supplier">
      <Hierarchy name="Supplier Hierarchy" visible="true" hasAll="true" allMemberName="All Suppliers" primaryKey="SupplierID">
        <Table name="DimSupplier">
        </Table>
        <Level name="Country" visible="true" column="Country" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
        <Level name="City" visible="true" column="City" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
        <Level name="Company Name" visible="true" column="CompanyName" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
      </Hierarchy>
    </Dimension>
    <Dimension type="StandardDimension" visible="true" foreignKey="ShipperID" highCardinality="false" name="Shipper">
      <Hierarchy name="Shipper Hierarchy" visible="true" hasAll="true" allMemberName="All Shippers" primaryKey="ShipperID">
        <Table name="DimShipper">
        </Table>
        <Level name="Company Name" visible="true" column="CompanyName" type="String" uniqueMembers="false" levelType="Regular" hideMemberIf="Never">
        </Level>
      </Hierarchy>
    </Dimension>
    <Dimension type="TimeDimension" visible="true" foreignKey="TimeID" highCardinality="false" name="Time">
      <Hierarchy name="Time Hierarchy" visible="true" hasAll="true" allMemberName="All Years" primaryKey="TimeID">
        <Table name="DimTime">
        </Table>
        <Level name="Year" visible="true" column="YearID" type="Integer" uniqueMembers="false" levelType="TimeYears" hideMemberIf="Never">
        </Level>
        <Level name="Month" visible="true" column="MonthName" ordinalColumn="MonthID" type="String" uniqueMembers="false" levelType="TimeMonths" hideMemberIf="Never">
        </Level>
        <Level name="Day" visible="true" column="DayID" type="Integer" uniqueMembers="false" levelType="TimeDays" hideMemberIf="Never">
        </Level>
      </Hierarchy>
    </Dimension>
    <Measure name="Sales" column="TotalCost" datatype="Numeric" formatString="$ #,###.00" aggregator="sum" visible="true">
    </Measure>
    <Measure name="Quantity" column="Quantity" datatype="Integer" formatString="#,###" aggregator="sum" visible="true">
    </Measure>
  </Cube>
</Schema>
```

## Analysis Queries

### a) [Analyze sales by customer country and year to discover the country, the year, and the pair country-year with the most sales](../analysis/customer-country-year.md)

Customer country with most sales

![Results](screenshots/queries/customer-country-most-sales.png)

Year with most sales

![Results](screenshots/queries/year-most-sales.png)

Customer country and year pair with most sales

![Results](screenshots/queries/customer-country-year-pair-most-sales.png)

### b) [Analyze sales by product category and year to discover the category, the year, and the pair category-year with the most sales](../analysis/product-category-year.md)

Product category with most sales

![Results](screenshots/queries/product-category-most-sales.png)

Year with most sales

![Results](screenshots/queries/year-most-sales.png)

Product category and year pair with most sales

![Results](screenshots/queries/product-category-year-most-sales.png)

### c) [Analyze quantity by shipping company and year to discover the shipper, the year, and the pair shipper-year with the most quantity](../analysis/shipping-company-year.md)

Shipping company with the most quantity shipped

![Results](screenshots/queries/shipper-most-quantity.png)

Year with the most quantity shipped

![Results](screenshots/queries/year-most-quantity.png)

Shipping company and year pair with the most quantity shipped

![Results](screenshots/queries/shipper-year-pair-most-quantity.png)

### d) [Analyze sales by customer country and product category to identify the pairs of country-category with no sales at all](../analysis/customer-country-product-category.md)

Customer country and category pairs with no sales

![Results](screenshots/queries/customer-country-product-category-no-sales.png)

### e) [Analyze quantity by supplier country and customer country to identify the pairs of countries with no quantities being shipped between them](../analysis/supplier-country-customer-country.md)

Country pairs with no quantity shipped: the first column represents the country shipped from,
i.e., the supplier's country; the second column represents the country shipped to,
i.e., the customer's country.

![Results](screenshots/queries/country-pairs-with-no-quantity-shipped.1.png)
![Results](screenshots/queries/country-pairs-with-no-quantity-shipped.2.png)

### f) [Analyze quantity by product category and shipping company to identify the pairs of category-shipper with no quantity at all](../analysis/product-category-shipping-company.md)

Category-shipper pairs with no quantity

![Results](screenshots/queries/category-shipper-pairs-with-no-quantity.1.png)

The table is empty, which means there was no product category which had not been
shipped by any shipping company registered.
This can be confirmed by executing the following query:

TODO: insert mdx query

![Results](screenshots/queries/category-shipper-pairs-with-no-quantity.2.png)

The table has no empty cells, therefore all categories have been shipped by all shipping companies.

## Appendix

For additional information, developed code can be found
[here](https://github.com/vladstojna/dot-files-3).
