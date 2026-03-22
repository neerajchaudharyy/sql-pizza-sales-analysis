-- Retrieve the total number of orders placed.
SELECT DISTINCT(COUNT(order_id)) AS TOTAL_ORDERS FROM orders;

-- Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(od.quantity * p.price),2) AS TOTAL_REVENUE 
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id;

-- Identify the highest-priced-pizza
 SELECT pt.name, MAX(p.price) AS price
 FROM pizza_types pt
 JOIN pizzas p
 ON pt.pizza_type_id = p.pizza_type_id
 GROUP BY pt.name
 ORDER BY price DESC
 LIMIT 1;
 
 -- Identify the most common pizza size ordered
 SELECT p.size, COUNT(*) Total_order
 FROM pizzas p 
 JOIN order_details od
 ON p.pizza_id = od.pizza_id
 GROUP BY p.size
 ORDER BY Total_order DESC
 LIMIT 1;
 
 -- List the top 5 most ordered pizza types along with their quantity
 SELECT pt.name, SUM(od.quantity) AS total_quantity
 FROM pizzas p
 JOIN order_details od
 ON p.pizza_id = od.pizza_id
 JOIN pizza_types pt
 ON pt.pizza_type_id = p.pizza_type_id
 GROUP BY pt.name
 ORDER BY total_quantity DESC
 LIMIT 5;
 
  -- Join the necessary tables to find the total quantity of each pizza category ordered
  SELECT pt.category, SUM(od.quantity) AS total_quantity
  FROM pizzas p
  JOIN order_details od
  ON p.pizza_id = od.pizza_id
  JOIN pizza_types pt
  ON p.pizza_type_id = pt.pizza_type_id
  GROUP BY pt.category;
  
  -- Determine the distribution of orders by hour of the day
  SELECT HOUR(time) AS order_hour, COUNT(order_id) AS total_orders
  FROM orders
  GROUP BY order_hour
  ORDER BY order_hour;
  
  -- Join relevent tables to find the category-wise distribution of pizzas
  SELECT pt.category, COUNT(*) AS total_orders
  FROM order_details od
  JOIN pizzas p
  ON od.pizza_id = p.pizza_id
  JOIN pizza_types pt
  ON pt.pizza_type_id = p.pizza_type_id
  GROUP BY pt.category;
  
  -- Group the orders by date and calculate the average number of pizzas ordered per day
SELECT ROUND(AVG(daily_total), 2) AS avg_pizzas_per_day
FROM (
    SELECT o.order_date, SUM(od.quantity) AS daily_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_date
) AS daily_orders;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pt.name,
       SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT pt.name,
       ROUND(SUM(od.quantity * p.price) /
       (SELECT SUM(od2.quantity * p2.price)
        FROM order_details od2
        JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id) * 100, 2) AS percentage
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY percentage DESC;

-- Analyze the cumulative revenue generated over time.
SELECT o.order_date,
       SUM(SUM(od.quantity * p.price)) OVER (ORDER BY o.order_date) AS cumulative_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT *
FROM (
    SELECT pt.category,
           pt.name,
           SUM(od.quantity * p.price) AS revenue,
           RANK() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS rnk
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) ranked
WHERE rnk <= 3;

-- THANKYOUU