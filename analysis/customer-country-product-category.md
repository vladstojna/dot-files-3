# MDX Queries

## Customer Country & Product Category Analysis

List the sales per customer country and product category:

```mdx
SELECT
    NON EMPTY Product.[Category Name].Members ON COLUMNS,
    Customer.Country.Members ON ROWS
FROM Orders
WHERE Measures.Sales
```

Get the country-category pairs with no sales:

```mdx
WITH
SET ValidCategories AS
    Filter(
        Product.[Category Name].Members,
        Cast(Product.[Category Name].CurrentMember.Properties('Key') AS STRING) <> '#null')

SET ValidCountries AS
    Filter(
        Customer.Country.Members,
        Cast(Customer.Country.CurrentMember.Properties('Key') AS STRING) <> '#null')

MEMBER Measures.[Has Sales] AS
    NOT Measures.Sales IS EMPTY

SELECT
    Measures.[Has Sales] ON COLUMNS,
    Filter(
        CrossJoin(ValidCountries, ValidCategories),
        NOT Cast(Measures.[Has Sales] AS BOOLEAN)) ON ROWS
FROM Orders
```
