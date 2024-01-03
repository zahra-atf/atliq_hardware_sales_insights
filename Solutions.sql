-- Q1:

SELECT DISTINCT
    (market)
FROM
    dim_customer
WHERE
    customer = 'Atliq Exclusive'
        AND region = 'APAC'
ORDER BY market;

-- Q2:

WITH product_counts AS (
    SELECT 
        COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END) AS unique_products_2020,
        COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) AS unique_products_2021
    FROM 
        fact_sales_monthly
)
SELECT 
    unique_products_2020,
    unique_products_2021,
    ROUND(((unique_products_2021 - unique_products_2020) / unique_products_2020) * 100, 2) AS percentage_chg
FROM 
    product_counts;
    
-- Q3:

SELECT 
    segment, COUNT(product_code) AS product_count
FROM
    dim_product
GROUP BY segment
ORDER BY product_count DESC;


-- Q4:

WITH product_counts AS (
    SELECT
		segment,
        COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN fs.product_code END) AS product_count_2020,
        COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN fs.product_code END) AS product_count_2021
    FROM 
        fact_sales_monthly fs
	JOIN dim_product d ON fs.product_code = d.product_code
	GROUP BY segment
)
SELECT 
	segment,
    product_count_2020,
    product_count_2021,
    (product_count_2021 - product_count_2020) AS difference
FROM 
    product_counts
ORDER BY difference DESC;
    
-- Q5:

SELECT 
    d.product_code, product, manufacturing_cost
FROM
    dim_product d
        JOIN
    fact_manufacturing_cost USING (product_code)
WHERE
    manufacturing_cost IN (SELECT 
            MAX(manufacturing_cost)
        FROM
            fact_manufacturing_cost UNION SELECT 
            MIN(manufacturing_cost)
        FROM
            fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;

-- Q6:

SELECT 
    c.customer_code,
    c.customer,
    ROUND(AVG(pre_invoice_discount_pct),5) AS avg_discount
FROM
    dim_customer c
        JOIN
    fact_pre_invoice_deductions f
    ON c.customer_code = f.customer_code
WHERE
    f.fiscal_year = 2021 AND c.market = 'India'
GROUP BY c.customer_code , c.customer
ORDER BY avg_discount DESC
LIMIT 5;


-- Q7:

SELECT 
    MONTHNAME(fs.date) AS Month,
    YEAR(fs.date) AS Year,
    ROUND(SUM(fs.sold_quantity * fg.gross_price),2) AS Gross_sales_Amount
FROM
    fact_gross_price fg
        JOIN
    fact_sales_monthly fs USING (product_code)
        JOIN
    dim_customer f USING (customer_code)
WHERE
    f.customer = 'Atliq Exclusive'
GROUP BY Month , Year
ORDER BY Year, Month;

-- Q8:

SELECT 
    CASE
        WHEN MONTH(date) BETWEEN 9 AND 11 THEN 'Q1'
        WHEN MONTH(date) BETWEEN 3 AND 5 THEN 'Q3'
        WHEN MONTH(date) BETWEEN 6 AND 8 THEN 'Q4'
        ELSE 'Q2'
    END AS Quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity DESC;

-- Q9:
        
WITH gross_sale AS 
(
   SELECT
      d.channel,
      Sum(fs.sold_quantity * fg.gross_price) AS total_sales 
   FROM
      fact_sales_monthly fs
      JOIN
         fact_gross_price fg using (product_code) 
      JOIN
         dim_customer d using (customer_code) 
   WHERE
      fs.fiscal_year = 2021 
   GROUP BY
      d.channel 
   ORDER BY
      total_sales DESC
)
SELECT
   channel,
   Concat(Round(total_sales / 1000000, 2), ' M') AS gross_sales_in_millions,
   Concat(Round(total_sales / ( Sum(total_sales) OVER() ) * 100, 2), ' %') AS percentage 
FROM
   gross_sale;


-- Q10

WITH Ranked_products AS (
    SELECT
        p.division,
        fs.product_code,
        p.product,
        SUM(fs.sold_quantity) AS total_sold_quantity,
        ROW_NUMBER() OVER (PARTITION BY p.division ORDER BY SUM(fs.sold_quantity) DESC) AS rank_order
    FROM
        fact_sales_monthly fs
    JOIN
        dim_product p ON fs.product_code = p.product_code
    WHERE
        fs.fiscal_year = 2021
    GROUP BY
        p.division, fs.product_code, p.product
)
SELECT * 
FROM
    Ranked_products
WHERE
    rank_order <= 3
ORDER BY
    division, rank_order;
















