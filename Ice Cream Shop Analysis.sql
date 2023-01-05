.mode markdown 
.header on
-- dim_customers_table1
CREATE table customers (
  	customer_id INT PRIMARY KEY,
  	firstname TEXT,
  	lastname TEXT,
  	phoneNo TEXT,
  	age TEXT,
  	gender TEXT
);

Insert into customers VALUES
	  (1, 'Leo', 'Sue', '0600000000', '22', 'M'),
    (2, 'Sawadee', 'Wanpen', '0600000001', '28', 'F'),
    (3, 'Kolby', 'John', '0600000002', '40', 'M'),
	  (4, 'Mary', 'Hussle', '0600000003', '35', 'F'),
    (5, 'Adam', 'Wong', '0600000004', '20', 'M'),
    (6, 'Lee', 'Kim', '0600000005', '30', 'F'),
    (7, 'Yamada', 'Keio', '0600000006', '25', 'M'),
    (8, 'Kento', 'Miyaura', '0600000007', '23', 'M');

---dim_menuitems_table2
Create table menuitems (
	menu_id INT PRIMARY key,
  	name TEXT,
  	price real
);

INSERT into menuitems values 
  	(1, 'Frizzycotton', 450),
    (2, 'SummerRaisin', 425),
    (3, 'VanilaBlend', 395),
    (4, 'MidnightCookies', 500),
    (5, 'RhymeLime', 400);

---dim_branches_table03
CREATE table branches (
	branch_id INT PRIMARY KEY,
  	location TEXT
);

INSERT INTO branches VALUES
	  (1, 'Central World'),
    (2, 'Siam Paragon'),
    (3, 'Icon Siam'),
    (4, 'Ari Soi 4');

---dim_deliver_platforms_table04
CREATE table delivery_platforms (
  platform_id INT PRIMARY KEY,
  platform_name TEXT,
  delivery_fee REAL
);
  
insert into delivery_platforms VALUES
	  (1, 'Umber', 0),
    (2, 'Grob', 15),
    (3, 'Coala', 10);

---fact_orders
Create table orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  menu_id INT,
  branch_id INT,
  platform_id INT,
  FOREIGN key (customer_id) REFERENCES customers(customer_id),
  FOREIGN key (menu_id) REFERENCES menuitems(menu_id),
  FOREIGN key (branch_id) REFERENCES branches(branch_id),
  FOREIGN key (platform_id) REFERENCES delivery_platforms(platform_id)
  );
  
INSERT INTO orders VALUES
	  (1, 1, 2, 1, 3),
    (2, 6, 4, 2, 2),
    (3, 2, 2, 4, 3),
    (4, 3, 1, 4, 1),
    (5, 5, 5, 3, 1),
    (6, 7, 5, 3, 1),
    (7, 1, 3, 4, 2),
    (8, 8, 5, 4, 3),
    (9, 8, 3, 2, 1),
    (10, 1, 3, 1, 2);

---SELECT * FROM orders;

---query1 - Overall Report (Total Prices each order)
SELECT 
  ord.order_id AS OrderId,
  ctm.firstname || ' ' || ctm.lastname AS CustomerName,
  mi.name AS PurchasedItem,
  mi.price AS ItemPrice,
  b.location AS PurchasedLocation,
  dp.platform_name AS PlatformUse,
  CASE 
    WHEN delivery_fee = 0 then 'Free Delivery'
      ELSE delivery_fee
    END AS DeliveryFee,
  (mi.price + delivery_fee) AS Total 
FROM orders AS ord 
join customers as ctm on ord.customer_id = ctm.customer_id
JOIN menuitems AS mi ON ord.menu_id = mi.menu_id
join branches AS b ON ord.branch_id = b.branch_id
JOin delivery_platforms AS dp ON ord.platform_id = dp.platform_id;

---query2 - Report the total sales (each menu) 
SELECT 
	mi.name,
    COUNT (*) AS amount,
    SUM (mi.price) as total_sales
FROM orders AS ord
JOIN menuitems AS mi on ord.menu_id = mi.menu_id
GROUp BY mi.name
order BY  SUM (mi.price) DESC;

---query3 - How much does each delivery platform get a fee from customers? 
SELECT 
	dp.platform_name as PlatformName,
    COUNT (*) AS amount,
    SUM(dp.delivery_fee) AS total_fees  
from orders AS ord
JOIN delivery_platforms as dp ON ord.platform_id = dp.platform_id
GROUP BY platform_name
ORDER BY SUM(dp.delivery_fee) DESC;

---query4 - Customer Segmentation (Gender, Age)
SELECT 
  ctm.gender AS gender,
  COUNT(*) AS QTY,
  ROUND(AVG(ctm.age), 1) AS Avg_age 
FROM orders AS ord
JOIN customers AS ctm ON ord.customer_id = ctm.customer_id
GROUP BY ctm.gender;

--- with/ supquery
--- Store Categorisation 
WITH sub AS (
  SELECT 
  location AS Location,
  CASE
    WHEN location IN ('Ari Soi 4', 'Siam Paragon') THEN 'Flagship Store'
    WHEN location = 'Central World' THEN 'Concept Store'
    WHEN location = 'Icon Siam' THEN 'Pop-up Store'
    ELSE 'N/A'
  END AS store_types
  FROM branches
)
SELECT 
  store_types,
  COUNT(*) AS N_stores
FROM sub
GROUP BY 1
ORDER BY 2 DESC;