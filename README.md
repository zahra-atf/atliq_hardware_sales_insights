# atliq_hardware_sales_insights

### Collaborators
- [@Collaborator1: zahra_atf](https://github.com/zahra-atf)

- [@Collaborator2: nomaan2048](https://github.com/nomaan2048)

Welcome to the Atliq Hardware Data Analytics Challenge repository!

Atliq Hardware is a prominent computer hardware producer in India with a growing global presence. As part of our expansion, we're seeking talented individuals to join our data analytics team. To ensure we find candidates proficient in both technical and soft skills, we've designed an SQL challenge simulating real-world business scenarios.
The atliq_hardware database includes information for six main tables:

1. dim_customer: contains customer-related data
2. dim_product: contains product-related data
3. fact_gross_price: contains gross price information for each product
4. fact_manufacturing_cost: contains the cost incurred in the production of each product
5. fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
6. fact_sales_monthly: contains monthly sales data for each product.

### Ad Hoc Requests

The challenge involves addressing 10 ad hoc requests, each crucial for understanding various aspects of Atliq Hardwares' business operations. Here's a breakdown of the specific queries required to derive insights:

1. **Market Analysis for "AtliqExclusive" in APAC Region**
   
   - Retrieve a list of markets where customer "AtliqExclusive" operates its business within the APAC region.

   
![Screen Shot 2024-01-03 at 10 26 33 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/d04d0f62-272c-4b47-90ed-81a805acd57a)

2. **Percentage Increase in Unique Products (2020 vs. 2021)**
   
   - Calculate the percentage increase in unique products between 2020 and 2021.

     
![Screen Shot 2024-01-03 at 10 27 29 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/732d16ed-de89-4e75-ac69-289e170be9ac)

3. **Segment-wise Unique Product Counts**
   
   - Generate a report displaying unique product counts for each segment, sorted in descending order of product counts.

     
![Screen Shot 2024-01-03 at 10 27 52 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/61a0dd9a-7a9b-4270-bf39-59f0e540cfc1)

4. **Segment with Highest Increase in Unique Products (2020 vs. 2021)**
   
   - Determine the segment that experienced the most increase in unique products during 2021 compared to 2020.

     
![Screen Shot 2024-01-03 at 10 28 25 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/1568caa4-7f81-4933-be3a-d862cbafe538)

5. **Highest and Lowest Manufacturing Cost Products**

   - Retrieve products with the highest and lowest manufacturing costs. 


![Screen Shot 2024-01-03 at 10 28 48 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/f3b6e8d6-24c8-47bf-861f-6eae97728b54)

6. **Top 5 Customers with High Average Pre-Invoice Discount (FY 2021, Indian Market)**
   
   - Generate a report listing the top 5 customers with the highest average pre-invoice discount percentage for fiscal year 2021 within the Indian market.

     
![Screen Shot 2024-01-03 at 10 29 17 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/d1679ad2-04c6-4f74-abd5-0f77a8bd9603)

7. **Monthly Gross Sales Amount for "Atliq Exclusive"**
   
   - Obtain a comprehensive report detailing the gross sales amount for the customer "Atliq Exclusive" for each month. This analysis aids in understanding monthly performance variations for strategic decision-making.

     
![Screen Shot 2024-01-03 at 10 29 51 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/bd83732a-1cc0-42a3-ba26-69583f134dfd)

8. **Quarterly Maximum Total Sold Quantity (2020)**
   
   - Identify the quarter in 2020 with the maximum total_sold_quantity, sorted by the total_sold_quantity.

     
![Screen Shot 2024-01-03 at 10 30 19 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/f7750747-cd14-4ab8-94d3-20fc09ceeeeb)

9. **Channel Contribution to Gross Sales (FY 2021)**
    
   - Determine the channel that contributed the most to gross sales in fiscal year 2021, along with the percentage of contribution.


![Screen Shot 2024-01-03 at 10 30 46 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/32b2f4a8-770a-4f33-93dc-89704acc670f)

10. **Top 3 Products with High Total Sold Quantity in Each Division (FY 2021)**
    - Fetch the top 3 products with a high total_sold_quantity in each division for the fiscal year 2021.

![Screen Shot 2024-01-03 at 10 31 11 AM](https://github.com/zahra-atf/atliq_hardware_sales_insights/assets/21101529/4bda7a01-c49b-44d9-af70-b3c2bdeb89c6)

These requests cover diverse aspects of market analysis, product performance, customer behavior, and sales channels, providing a comprehensive understanding of Atliq Hardwares' business landscape.
