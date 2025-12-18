-- **********************************************************************************
-- SQL Assignment: WHERE, AND, OR (PostgreSQL)
-- **********************************************************************************

-- 1) List all suppliers located in India.
SELECT supplier_name 
FROM suppliers
WHERE country = 'India';



-- 2) Find suppliers where supplier_name contains 'Tech' and country is not 'USA'.
SELECT supplier_id,supplier_name 
FROM suppliers
WHERE supplier_name 
LIKE('%Tech%') and country != 'USA';



-- 3) Show suppliers created after 2024-01-01 and before 2024-12-31 (inclusive).
SELECT supplier_name 
FROM suppliers
where created_at BETWEEN '2024-01-01' AND '2024-12-31';



-- 4) Return suppliers where contact_person IS NULL OR email IS NULL.
SELECT supplier_name 
FROM suppliers
WHERE contact_person is NULL 
OR email is NULL;




-- 5) Get suppliers whose phone_number starts with '+91' AND email ends with '.com'.
SELECT supplier_name 
FROM suppliers
WHERE phone_number LIKE ('+91%')
AND 
email LIKE('%.com');



-- 6) List warehouses in the state 'Maharashtra' OR city = 'Pune'.
SELECT warehouse_name 
FROM warehouses
WHERE state = 'Maharashtra'
OR 
city = 'Pune';




-- 7) Find warehouses in India AND capacity_units >= 10000.
SELECT warehouse_name 
FROM warehouses
WHERE country = 'India'
AND
capacity_units >= 1000;




-- 8) Show warehouses where warehouse_name ILIKE '%central%' AND country = 'India'.
SELECT warehouse_name 
FROM warehouses
WHERE warehouse_name LIKE('%central%')
AND
country = 'India';




-- 9) Return warehouses created in the last 30 days (use current_date) OR capacity_units <1000.
SELECT warehouse_name 
FROM
warehouses
WHERE 
created_at >= CURRENT_DATE - INTERVAL '30 days'
OR
capacity_units < 1000;




-- 10) Get warehouses where state IS NULL OR city IS NULL (missing location details)
SELECT warehouse_name 
FROM warehouses
WHERE state IS NULL
OR city IS NULL;




-- 11) List customers with email ending in '@gmail.com' AND country = 'India'.
SELECT customer_name 
FROM customers
WHERE email LIKE('%@gmail.com')
AND country = 'India';




-- 12) Find customers whose city IN ('Mumbai', 'Pune', 'Delhi') OR phone_number LIKE '022%'.
SELECT customer_name 
FROM customers
WHERE city IN('Mumbai', 'Pune', 'Delhi')
OR
phone_number LIKE('022%');




-- 13) Show customers created_at between two dates, e.g., 2025-01-01 AND 2025-06-30.
SELECT customer_name 
FROM customers
WHERE created_at BETWEEN '2025-01-01' AND '2025-06-30';





-- 14) Return customers where customer_name ILIKE '%store%' OR ILIKE '%mart%'.
SELECT customer_name 
FROM customers
WHERE customer_name LIKE('%store%') 
OR customer_name LIKE('%mart%');




-- 15) Get customers with missing phone_number OR invalid phone_number (NOT LIKE '+%').
SELECT customer_name 
FROM customers
WHERE 
phone_number = ''
OR
phone_number NOT LIKE('+%');




-- 16) List purchase orders where status = 'Pending' OR status = 'Approved'.
SELECT * 
FROM purchase_orders
WHERE status = 'Pending'
OR 
status = 'Approved';




-- 17) Find purchase orders for supplier_id = 5 AND total_amount > 100000.
SELECT * 
FROM purchase_orders
WHERE supplier_id = 5
AND
total_amount > 100000;




-- 18) Show purchase orders expected_date < po_date (late entry) OR expected_date IS NULL.
SELECT * 
FROM purchase_orders
WHERE expected_date < po_date
OR expected_date IS NULL;




-- 19) Return purchase orders in 2025 (po_date between 2025-01-01 and 2025-12-31).
SELECT * 
FROM purchase_orders
WHERE po_date BETWEEN '2025-01-01' AND '2025-12-31';




-- 20) Get purchase orders with total_amount BETWEEN 5000 AND 20000 AND status <> 'Cancelled'.
SELECT * 
FROM purchase_orders
WHERE total_amount BETWEEN 5000 AND 20000
AND status <> 'Cancelled';




-- 21) List PO items where quantity >= 100 AND unit_price <= 50.
SELECT * 
FROM purchase_order_items
WHERE quantity >= 100
AND
unit_price <= 50;




-- 22) Find PO items for a given po_id (e.g., 101) OR product_id IN (10, 20, 30).
SELECT * 
FROM purchase_order_items
WHERE po_id = 101
OR 
product_id IN (10, 20, 30);





-- 23) Show PO items created_at IS NOT NULL AND quantity % 2 = 0 (even quantities).
SELECT * 
FROM purchase_order_items
WHERE created_at IS NOT NULL 
AND
quantity % 2 = 0;




-- 24) Return PO items where unit_price * quantity > 5000 OR unit_price IS NULL.
SELECT * 
FROM purchase_order_items
WHERE unit_price * quantity > 5000
OR 
unit_price IS NULL;




-- 25) Get PO items with quantity BETWEEN 1 AND 10 AND NOT (unit_price > 100).
SELECT * 
FROM purchase_order_items
WHERE quantity BETWEEN 1 AND 10
AND NOT (unit_price > 100);




-- 26) List inventory rows where quantity_on_hand < reorder_level OR quantity_on_hand = 0.
SELECT * 
FROM inventory
WHERE quantity_on_hand < reorder_level
OR
quantity_on_hand = 0;




-- 27) Find inventory for warehouse_id = 3 AND product_id = 1001.
SELECT * 
FROM inventory
WHERE warehouse_id = 3
AND
product_id = 1001;





-- 28) Show inventory last_updated > now() - interval '7 days' OR quantity_on_hand > 1000.
SELECT *
FROM inventory
WHERE last_updated > NOW() - INTERVAL '7 days'
OR 
quantity_on_hand > 1000;





-- 29) Return inventory with product_id IN (SELECT product_id FROM purchase_order_items) AND quantity_on_hand > 0.
SELECT *
FROM inventory
WHERE product_id IN (SELECT product_id FROM purchase_order_items)
AND
quantity_on_hand > 0 ;





-- 30) Get inventory records where warehouse_id IN (SELECT warehouse_id FROM warehouses WHERE country = 'India') AND reorder_level >= 50.
SELECT *
FROM inventory
WHERE warehouse_id IN (SELECT warehouse_id FROM warehouses WHERE country = 'India')
AND 
reorder_level >= 50;





-- 31) List sales orders where status IN ('Pending','Shipped') AND total_amount > 20000.
SELECT * 
FROM sales_orders
WHERE status IN ('Pending','Shipped') 
AND 
total_amount > 20000;





-- 32) Find sales order items for sales_order_id = 200 OR quantity >= 50.
SELECT * 
FROM sales_order_items 
WHERE sales_order_id = 200 
OR 
quantity >= 50;





-- 33) Show shipments where shipment_status = 'Delivered' AND delivery_date BETWEEN '2025-01-01' AND '2025-12-31'.
SELECT *
FROM shipments
WHERE shipment_status = 'Delivered' 
AND 
delivery_date BETWEEN '2025-01-01' AND '2025-12-31';
