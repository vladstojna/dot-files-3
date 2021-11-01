# MDX Queries

## Supplier Country & Customer Country Analysis

List the quantities shipped per supplier country and customer country:

```mdx
SELECT
    Supplier.Country.Members ON COLUMNS,
    Customer.Country.Members ON ROWS
FROM Orders
WHERE Measures.Quantity
```

Get the country-country pairs with no quantity shipped between them:

```mdx
WITH
SET ValidCountries AS
    Filter(
        Customer.Country.Members,
        Cast(Customer.Country.CurrentMember.Properties('Key') AS STRING) <> '#null')

MEMBER Measures.[Any Quantity Shipped] AS
    NOT Measures.Quantity IS EMPTY

SELECT
    Measures.[Any Quantity Shipped] ON COLUMNS,
    Filter(
        CrossJoin(Supplier.Country.Members, ValidCountries),
        NOT Cast(Measures.[Any Quantity Shipped] AS BOOLEAN)) ON ROWS
FROM Orders
```
