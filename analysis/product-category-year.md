# MDX Queries

## Product Category & Year Analysis

List the sales per product category:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Product.[Category Name].Members ON ROWS
FROM Orders
```

Ordered by sales amount in descending order:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Order(Product.[Category Name].Members, Measures.Sales, DESC) ON ROWS
FROM Orders
```

Get the product category with most sales:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    TopCount(Product.[Category Name].Members, 1, Measures.Sales) ON ROWS
FROM Orders
```

List the sales per product category and year:

```mdx
SELECT
    Time.Year.Members ON COLUMNS,
    Product.[Category Name].Members ON ROWS
FROM Orders
WHERE Measures.Sales
```

Get the country-year pair with most sales:

```mdx
SELECT Measures.Sales ON COLUMNS,
    TopCount(
        NonEmptyCrossJoin(Product.[Category Name].Members, Time.Year.Members),
    1, Measures.Sales) ON ROWS
FROM Orders
```
