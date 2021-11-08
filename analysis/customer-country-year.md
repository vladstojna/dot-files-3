# MDX Queries

## Customer Country & Year Analysis

List the sales per customer country:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Customer.Country.Members ON ROWS
FROM Orders
```

Ordered by sales amount in descending order:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Order(Customer.Country.Members, Measures.Sales, DESC) ON ROWS
FROM Orders
```

Get the country with most sales:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    TopCount(Customer.Country.Members, 1, Measures.Sales) ON ROWS
FROM Orders
```

List the sales per year:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Time.Year.Members ON ROWS
FROM Orders
```

Ordered by sales amount in descending order:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    Order(Time.Year.Members, Measures.Sales, DESC) ON ROWS
FROM Orders
```

Get the year with most sales:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    TopCount(Time.Year.Members, 1, Measures.Sales) ON ROWS
FROM Orders
```

List the sales per customer country and year:

```mdx
SELECT
    Time.Year.Members ON COLUMNS,
    Customer.Country.Members ON ROWS
FROM Orders
WHERE Measures.Sales
```

Get the country-year pair with most sales:

```mdx
SELECT
    Measures.Sales ON COLUMNS,
    TopCount(
        NonEmptyCrossJoin(Customer.Country.Members, Time.Year.Members),
    1, Measures.Sales) ON ROWS
FROM Orders
```
