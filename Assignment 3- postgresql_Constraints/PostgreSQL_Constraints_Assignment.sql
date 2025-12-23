

-- ----------------------------------------------------------------------------
CREATE TABLE suppliers(
	supplier_id SERIAL PRIMARY KEY,
	supplier_name VARCHAR(150) NOT NULL,
	contact_person VARCHAR(100),
	phone_number VARCHAR(20), 
	email VARCHAR(150) NOT NULL UNIQUE,
	country VARCHAR(100) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- ----------------------------------------------------------------------------
CREATE TABLE warehouses(
	warehouse_id SERIAL PRIMARY KEY,
	warehouse_name VARCHAR(150) NOT NULL,
	city VARCHAR(100) NOT NULL,
	state VARCHAR(100),
	country VARCHAR(100) NOT NULL,
	capacity_units INT NOT NULL CHECK (capacity_units >= 0),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ----------------------------------------------------------------------------
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(150) NOT NULL,
	phone_number VARCHAR(20),
	email VARCHAR(150) NOT NULL UNIQUE,
	city VARCHAR(100),
	country VARCHAR(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ------------------------------------------------------------------------------
CREATE TABLE purchase_orders(
	po_id SERIAL PRIMARY KEY,
	supplier_id INT NOT NULL,
	po_date DATE NOT NULL,
	expected_date DATE CHECK (expected_date IS NULL OR expected_date >= po_date),
	status VARCHAR(50) NOT NULL DEFAULT 'Pending',
	total_amount NUMERIC(12,2) NOT NULL DEFAULT 0.00 CHECK (total_amount >= 0),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);
-- ---------------------------------------------------------------------------------
CREATE TABLE purchase_order_items(
	po_item_id SERIAL PRIMARY KEY,
	po_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
	unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT unique_po_product UNIQUE (po_id,product_id),
	FOREIGN KEY(po_id) REFERENCES purchase_orders(po_id)
);
-- -----------------------------------------------------------------------------------
CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	warehouse_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity_on_hand INT NOT NULL DEFAULT 0 CHECK (quantity_on_hand >= 0),
	reorder_level INT NOT NULL DEFAULT 10 CHECK (reorder_level >= 0),
	last_updated TIMESTAMP,
	CONSTRAINT unique_warehouse_product UNIQUE (warehouse_id,product_id),
	FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id)
);
-- ----------------------------------------------------------------------------------
CREATE TABLE sales_orders(
	sales_order_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL,
	order_date DATE NOT NULL,
	status VARCHAR(50) NOT NULL DEFAULT 'Pending',
	total_amount NUMERIC(12,2) NOT NULL DEFAULT 0.00 CHECK (total_amount >= 0),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
-- ----------------------------------------------------------------------------------
CREATE TABLE sales_order_items(
	so_item_id SERIAL PRIMARY KEY,
	sales_order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL CHECK ( quantity > 0),
	unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT unique_sales_product UNIQUE (sales_order_id, product_id),
	FOREIGN KEY (sales_order_id) REFERENCES sales_orders(sales_order_id)
);
-- ---------------------------------------------------------------------------------
CREATE TABLE shipments(
	shipment_id SERIAL PRIMARY KEY,
	sales_order_id INT NOT NULL,
	warehouse_id INT NOT NULL,
	shipment_date DATE NOT NULL,
	delivery_date DATE CHECK (delivery_date IS NULL OR delivery_date >= shipment_date),
	shipment_status VARCHAR(50) NOT NULL DEFAULT 'Created',
	tracking_number VARCHAR(100) UNIQUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(sales_order_id) REFERENCES sales_orders(sales_order_id),
	FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id)
);
-- ----------------------------------------------------------------------------------




