# Report

## SQL Instructions to Create the Data Warehouse Tables

[northwind_dw.sql](../sql/northwind_dw.sql)

## Transformations & Jobs

For readability purposes, all preview results have been limited to 10 rows if 10 or more rows exist.

### [Customer Dimension](../etl/DimCustomer.ktr)

![Transformation](screenshots/DimCustomer/DimCustomer.png)

Table Input

![Configuration](screenshots/DimCustomer/TableInput.configuration.png)
![Preview](screenshots/DimCustomer/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimCustomer/InsertUpdate.configuration.png)
![Preview](screenshots/DimCustomer/InsertUpdate.preview.png)

### [Shipper Dimension](../etl/DimShipper.ktr)

![Transformation](screenshots/DimShipper/DimShipper.png)

Table Input

![Configuration](screenshots/DimShipper/TableInput.configuration.png)
![Preview](screenshots/DimShipper/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimShipper/InsertUpdate.configuration.png)
![Preview](screenshots/DimShipper/InsertUpdate.preview.png)

### [Supplier Dimension](../etl/DimSupplier.ktr)

![Transformation](screenshots/DimSupplier/DimSupplier.png)

Table Input

![Configuration](screenshots/DimSupplier/TableInput.configuration.png)
![Preview](screenshots/DimSupplier/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimSupplier/InsertUpdate.configuration.png)
![Preview](screenshots/DimSupplier/InsertUpdate.preview.png)

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

### [Job to Populate the Data Warehouse](../etl/LoadDw.kjb)

![LoadDw](screenshots/LoadDw.png)

## XML OLAP Cube Definition

[XML code](../olap/northwind_dw.xml)

## Analysis Queries

1. [Customer country and year](../analysis/customer-country-year.md)
2. [Product category and year](../analysis/product-category-year.md)
3. [Shipping company and year](../analysis/shipping-company-year.md)
4. [Customer country and product category](../analysis/customer-country-product-category.md)
5. [Supplier country and customer country](../analysis/supplier-country-customer-country.md)
6. [Product category and shipping company](../analysis/product-category-shipping-company.md)
