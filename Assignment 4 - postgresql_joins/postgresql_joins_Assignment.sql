-- 1) INNER JOIN
SELECT p.po_id,p.po_date,p.status,s.supplier_name
FROM purchase_orders p
INNER JOIN
suppliers s
ON p.po_id = s.supplier_id;



-- 2) LEFT JOIN
SELECT c.customer_name,s.sales_order_id,s.order_date
FROM customers c
LEFT JOIN
sales_orders s
ON c.customer_id = s.customer_id;


-- 3) RIGHT JOIN
SELECT s.sales_order_id,s.order_date,c.customer_name
FROM sales_orders s
RIGHT JOIN
customers c
ON c.customer_id = s.customer_id;



-- 4) FULL OUTER JOIN
SELECT s.supplier_name,w.warehouse_name
FROM suppliers s
FULL JOIN warehouses w
ON s.country = w.country;


-- 5) INNER JOIN
SELECT s.sales_order_id,s.order_date,ship.shipment_date,ship.shipment_status
FROM sales_orders s
INNER JOIN 
shipments ship
ON s.sales_order_id = ship.sales_order_id;


-- 6) LEFT JOIN
SELECT w.warehouse_name,i.product_id,i.quantity_on_hand
FROM warehouses w
LEFT JOIN
inventory i
ON w.warehouse_id = i.warehouse_id;


-- 7) FULL OUTER JOIN
SELECT purchase_orders.po_id,purchase_order_items.po_item_id
FROM purchase_orders
FULL JOIN 
purchase_order_items
ON purchase_orders.po_id = purchase_order_items.po_id;


-- 8) INNER JOIN
SELECT c.customer_name,p.product_id,p.quantity
FROM customers c
INNER JOIN 
purchase_order_items p
ON  c.customer_id = p.po_id;



-- 9) LEFT JOIN
SELECT s.supplier_name,p.po_id,p.status
FROM suppliers s
LEFT JOIN purchase_orders p
ON s.supplier_id = p.supplier_id;




-- 10) RIGHT JOIN
SELECT w.warehouse_name,i.product_id
FROM warehouses w
RIGHT JOIN
inventory i
ON w.warehouse_id = i.warehouse_id;



-- 11) FULL OUTER JOIN
SELECT c.customer_name,s.supplier_name
FROM customers c
FULL JOIN 
suppliers s
ON c.customer_id = s.supplier_id;


-- 12) INNER JOIN
SELECT s.shipment_id,w.warehouse_name,s.shipment_status
FROM warehouses w
INNER JOIN
shipments s
ON w.warehouse_id = s.warehouse_id;


-- 13) LEFT JOIN
SELECT s.sales_order_id,ship.shipment_date
FROM sales_orders s
LEFT JOIN 
shipments ship
ON s.sales_order_id = ship.sales_order_id;


-- 14) RIGHT JOIN
SELECT p.po_id,s.supplier_name
FROM purchase_orders p
RIGHT JOIN
suppliers s
ON p.supplier_id = s.supplier_id;

-- 15) FULL OUTER JOIN
SELECT s.sales_order_id,p.po_id
FROM sales_orders s
FULL JOIN
purchase_orders p
ON s.sales_order_id = p.po_id;



-- 16) INNER JOIN
SELECT i.product_id,p.unit_price
FROM inventory i
INNER JOIN
purchase_order_items p
ON i.product_id = p.product_id;


-- 17) LEFT JOIN
SELECT c.customer_name,s.shipment_status
FROM customers c
LEFT JOIN
shipments s
ON c.customer_id = s.sales_order_id;


-- 18) RIGHT JOIN
SELECT w.warehouse_name,s.shipment_status
FROM warehouses w
RIGHT JOIN
shipments s
ON w.warehouse_id = s.warehouse_id;


-- 19) FULL OUTER JOIN
SELECT i.product_id,s.quantity
FROM inventory i
FULL JOIN
sales_order_items s
ON i.product_id = s.product_id;


-- 20) INNER JOIN
SELECT p.po_item_id,p.po_id,po.po_date,po.status
FROM purchase_order_items p
INNER JOIN
purchase_orders po
ON p.po_id = po.po_id;


