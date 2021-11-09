# Report

## Present the SQL instructions to create the data warehouse tables

The codeshould be formatted and indented in a way that makes it easy to read for a human.

[northwind_dw.sql](../sql/northwind_dw.sql)

## Transformations & Jobs

### [DimCustomer](../etl/DimCustomer.ktr)

![Transformation](screenshots/DimCustomer/DimCustomer.png)

Table Input

![Configuration](screenshots/DimCustomer/TableInput.configuration.png)
![Preview](screenshots/DimCustomer/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimCustomer/InsertUpdate.configuration.png)
![Preview](screenshots/DimCustomer/InsertUpdate.preview.png)

### [DimShipper](../etl/DimShipper.ktr)

![Transformation](screenshots/DimShipper/DimShipper.png)

Table Input

![Configuration](screenshots/DimShipper/TableInput.configuration.png)
![Preview](screenshots/DimShipper/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimShipper/InsertUpdate.configuration.png)
![Preview](screenshots/DimShipper/InsertUpdate.preview.png)

### [DimSupplier](../etl/DimSupplier.ktr)

![Transformation](screenshots/DimSupplier/DimSupplier.png)

Table Input

![Configuration](screenshots/DimSupplier/TableInput.configuration.png)
![Preview](screenshots/DimSupplier/TableInput.preview.png)

Insert/Update

![Configuration](screenshots/DimSupplier/InsertUpdate.configuration.png)
![Preview](screenshots/DimSupplier/InsertUpdate.preview.png)

### [DimTime](../etl/DimTime.ktr)

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

### [DimProduct](../etl/DimProduct.ktr)

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

### [FactOrder](../etl/FactOrder.ktr)

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

### Job to Populate the Data Warehouse

![LoadDw](screenshots/LoadDw.png)

## Present the XML code for the cube definition. The code should be formatted and indented in a way that makes it easy to read for a human

[XML code](../olap/northwind_dw.xml)

## For each analysis query that you develop in Saiku, present one of the following

If you developed the query bydrag-and-drop, present a screenshot of the Saiku user interface, showing the measures, columns, rows and filters used in the query, together with the query results.
•If you developed the query in MDX mode, present the MDX code together with **a screenshot of the query results**.

1. [Customer country and year](../analysis/customer-country-year.md)
2. [Product category and year](../analysis/product-category-year.md)
3. [Shipping company and year](../analysis/shipping-company-year.md)
4. [Customer country and product category](../analysis/customer-country-product-category.md)
5. [Supplier country and customer country](../analysis/supplier-country-customer-country.md)
6. [Product category and shipping company](../analysis/product-category-shipping-company.md)
