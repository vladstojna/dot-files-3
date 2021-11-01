# MDX Queries

## Product Category & Shipping Company Analysis

List the quantities shipped per product category and shipping companies:

```mdx
SELECT
    NON EMPTY Product.[Category Name].Members ON COLUMNS,
    Shipper.[Company Name].Members ON ROWS
FROM Orders
WHERE Measures.Quantity
```

Get the category-shipper pairs with no quantity:

```mdx
WITH
SET ValidCategories AS
    Filter(
        Product.[Category Name].Members,
        Cast(Product.[Category Name].CurrentMember.Properties('Key') AS STRING) <> '#null')

MEMBER Measures.[Any Quantity Shipped] AS
    NOT Measures.Quantity IS EMPTY

SELECT
    Measures.[Any Quantity Shipped] ON COLUMNS,
    Filter(
        CrossJoin(Shipper.[Company Name].Members, ValidCategories),
        NOT Cast(Measures.[Any Quantity Shipped] AS BOOLEAN)) ON ROWS
FROM Orders
```
