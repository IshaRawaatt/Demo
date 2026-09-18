CREATE SCHEMA finance;

# Task 3.1 Create a schema named finance, set it as the default schema, and
#create tables using cc_data_dec19.csv and location_data.csv

USE finance;
SELECT * from finance.cc_data_dec19;
SELECT * from finance.location_data;

# Task 4.1 Calculate the total number of transactions in the cc_data_dec19table

USE finance;
SELECT COUNT(*) AS total_transactions FROM cc_data_dec19;

# Task 4.2 Identify the top 10 most frequent merchants in the cc_data_dec19 table

SELECT merchant, COUNT(*) AS transaction_count
FROM cc_data_dec19
GROUP BY merchant
ORDER BY transaction_count DESC
LIMIT 10;

#Task 4.3 Find the average transaction amount for each category of
# transactions in the cc_data_dec19 table

select category, AVG(amt) AS average_transaction_amount
FROM cc_data_dec19
GROUP BY category;

#Task 4.4 Determine the number of fraudulent transactions and the
# percentage of total transactions that they represent

SELECT
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions,
    (SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_of_total
FROM cc_data_dec19;


#Task 4.5 Join the cc_data_dec19 and location_data tables to identify the
# latitude and longitude of each transaction

SELECT cc.*, ld.lat, ld.long
FROM cc_data_dec19 cc
JOIN location_data ld ON cc.cc_num = ld.cc_num;

# Task 4.6 Identify the city with the highest population in the location_data table

SELECT
    city,
    MAX(city_pop) AS highest_population
FROM
    cc_data_dec19
GROUP BY
    city
ORDER BY
    highest_population DESC limit 1;
    

# Task 4.7 Find the earliest and the latest transaction dates in the cc_data_dec19 table

SELECT
    MIN(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS earliest_transaction_date,
    MAX(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS latest_transaction_date
FROM cc_data_dec19;

# Task 5.1 What is the total amount spent across all transactions in the cc_data_dec19 table?

SELECT SUM(amt) AS total_amount_spent FROM cc_data_dec19;

# Task 5.2 How many transactions occurred in each category in the cc_data_dec19 table?

SELECT category, COUNT(*) AS transaction_count
FROM cc_data_dec19
GROUP BY category;

# Task 5.3 What is the average transaction amount for each gender in the cc_data_dec19 table?

select
gender,
AVG(amt) as average_transaction_amount
from cc_data_dec19
group by gender
order by gender;

# Task 5.4 Which day of the week has the highest average transaction amount in the cc_data_dec19 table?

SELECT
    DAYNAME(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS day_of_week,
    AVG(amt) AS average_transaction_amount
FROM cc_data_dec19
GROUP BY day_of_week
ORDER BY average_transaction_amount DESC
LIMIT 1;



