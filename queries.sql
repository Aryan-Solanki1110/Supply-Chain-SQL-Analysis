select * from supply_data limit 10;
describe supply_data;
select count(*) from supply_data;

# Slowest Products (Highest lead time). and lead time in descending order
select `Product type`, avg(`lead time`) as avg_lead from supply_data group by `Product type` having avg_lead > 10 order by avg_lead desc; 

# Average Shipping Time per Carrier
select `shipping carriers`, avg(`shipping times`) as avg_ship from supply_data group by `shipping carriers` order by avg_ship desc;

# Analyzing revenue of different product types
select `product type`, sum(`revenue generated`) as total_revenue from supply_data group by `product type` order by total_revenue desc;

# Analyzing cost of transportation mode
select `transportation modes`, avg(`Costs`) as avg_cost from supply_data group by `transportation modes` order by avg_cost desc;

# Products with low stocks
select `product type`, avg(`stock levels`) from supply_data group by `product type` order by avg(`stock levels`) desc; 

# Product with highest defect rate
select `product type`, avg(`defect rates`) as avg_defects from supply_data group by `product type` order by avg_defects desc;

# Product with highest lead time and defect rates
select `product type`, avg(`lead time`) as avg_lead, avg(`defect rates`) as avg_defects from supply_data
group by `product type` order by avg_lead desc, avg_defects desc;

# Carrier having shipping time greater than average of all carriers
select `shipping carriers`, avg(`shipping times`) as avg_ship from supply_data group by `shipping carriers`
having avg_ship > (select avg(`shipping times`) from supply_data);

# Produts with low stocks but high demands
select `product type`, avg(`number of products sold`) as avg_sales, avg(`stock levels`) as avg_stocks from supply_data group by `product type`
having avg_stocks <  (select avg(`Stock levels`) from supply_data) and 
avg_sales > (select avg(`Number of products sold`) from supply_data); 

# Transport mode which is cheap but still fast.
select `transportation modes`, avg(`Costs`) as avg_cost, avg(`shipping times`) as avg_ship from supply_data group by `transportation modes` 
having avg_cost < (select avg(`costs`) from supply_data) and
avg_ship < (select avg(`shipping times`) from supply_data);

# Product which is worst overall(based on lead time + defects + cost).
select `Product type`, avg(`lead time`) as avg_lead, avg(`defect rates`) as avg_defect, avg(`Costs`) as avg_cost from supply_data 
group by `Product type` order by avg_lead desc, avg_defect desc, avg_cost desc;



