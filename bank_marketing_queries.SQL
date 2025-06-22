                                                                            🔟 SQL Questions Using All Key Functions 
                                                               
-- QUERY 1) Which product received the most 'yes' responses?
SELECT p.product_name, COUNT(r.response) AS positive_responses
FROM responses r
JOIN campaigns c ON r.campaign_id = c.campaign_id
JOIN products p ON c.product_id = p.product_id
WHERE r.response = 'yes'
GROUP BY p.product_name
ORDER BY positive_responses DESC;

-- 	Query 2) Rank customers based on total campaign duration
 SELECT c.customer_id, c.age, SUM(cp.duration) AS total_duration,
       RANK() OVER (ORDER BY SUM(cp.duration) DESC) AS duration_rank
FROM customers c
JOIN campaigns cp ON c.customer_id = cp.customer_id
GROUP BY c.customer_id, c.age;

-- Query 3) Which job type had the highest campaign success rate?
select c.job, 
     round(avg(case when r.response = 'yes' then 1 else 0 end) * 100, 2) as success_rate
from customers c join campaigns cp on  c.customer_id = cp.customer_id
join responses r on cp.campaign_id = r.campaign_id
group by c.job
order by success_rate desc

-- QUERY 4) Find customers who had a ‘yes’ response but also had more than 1 previous contact
SELECT c.customer_id, c.job, COUNT(*) AS more_contact , 'yes' 
from customers c
join campaigns cp on c.customer_id = cp.customer_id
join responses r on cp.campaign_id = r.campaign_id
where r.response = "yes"  group by c.customer_id
HAVING more_contact >= 1;

-- Query 5) Show average campaign duration per contact month
SELECT cp.contact_month, ROUND(AVG(cp.duration), 2) AS avg_duration
FROM campaigns cp
GROUP BY cp.contact_month
ORDER BY avg_duration DESC;

-- Query 6) Find customers whose campaign duration was above the average of all customers
select c.customer_id, cp.duration as max_campaigns
 from customers c 
join campaigns cp on c.customer_id = cp.customer_id
 where cp.duration > (
        select avg(duration) from campaigns )
 
 -- Query 7) For each product, rank customers by campaign duration
 SELECT p.product_name, c.customer_id, cp.duration,
       RANK() OVER (PARTITION BY p.product_name ORDER BY cp.duration DESC) AS duration_rank
FROM campaigns cp
JOIN customers c ON c.customer_id = cp.customer_id
JOIN products p ON p.product_id = cp.product_id;

-- Query 8) Compare average duration of 'yes' vs 'no' responses
 select r.response, round(avg(duration),2) as average_duration 
 from campaigns cp join responses r on cp.campaign_id = r.campaign_id
 group by r.response 
 
 -- Query 9) Find the product that required the most average number of contacts to succeed
SELECT p.product_name,
       ROUND(AVG(CASE WHEN r.response = 'yes' THEN cp.campaign_id ELSE NULL END), 2) AS avg_contacts_to_succesed
FROM products p
JOIN campaigns cp ON p.product_id = cp.product_id
JOIN responses r ON cp.campaign_id = r.campaign_id
GROUP BY p.product_name
ORDER BY avg_contacts_to_succesed DESC;

-- Query 10) List customers who responded ‘yes’ and rank them by euribor3m (in financial_context)
SELECT c.customer_id, r.response,
       RANK() OVER () AS euribor_rank
FROM customers c
JOIN campaigns cp ON c.customer_id = cp.customer_id
JOIN responses r ON cp.campaign_id = r.campaign_id
WHERE r.response = 'yes'
