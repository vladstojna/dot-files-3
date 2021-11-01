# MDX Queries

## Shipping Company & Year Analysis

List the quantity per shipping company:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    Shipper.[Company Name].Members ON ROWS
FROM Orders
```

Ordered by quantity in descending order:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    Order(Shipper.[Company Name].Members, Measures.Quantity, DESC) ON ROWS
FROM Orders
```

Get the shipping company with the highest quantity shipped:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    TopCount(Shipper.[Company Name].Members, 1, Measures.Quantity) ON ROWS
FROM Orders
```

List the quantity per year:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    Time.Year.Members ON ROWS
FROM Orders
```

Ordered by quantity in descending order:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    Order(Time.Year.Members, Measures.Quantity, DESC) ON ROWS
FROM Orders
```

Get the year with the highest quantity shipped:

```mdx
SELECT
    Measures.Quantity ON COLUMNS,
    TopCount(Time.Year.Members, 1, Measures.Quantity) ON ROWS
FROM Orders
```

List the quantity per shipping company and year:

```mdx
SELECT
    Time.Year.Members ON COLUMNS,
    Shipper.[Company Name].Members ON ROWS
FROM Orders
WHERE Measures.Quantity
```

Get the country-year pair with the highest quantity shipped:

```mdx
SELECT Measures.Quantity ON COLUMNS,
    TopCount(
        NonEmptyCrossJoin(Shipper.[Company Name].Members, Time.Year.Members),
    1, Measures.Quantity) ON ROWS
FROM Orders
```
