DROP DATABASE store;

CREATE DATABASE store;

USE store;

-- 1. Crear las tablas requeridas con las relaciones necesarias

-- Crear tabla de proveedor

CREATE TABLE provider(
	id_provider INT NOT NULL,
	nit VARCHAR(20) NOT NULL UNIQUE,
	name_provider VARCHAR(80) NOT NULL,
	address VARCHAR(80) NOT NULL,
	phone VARCHAR(80) NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_provider)
);

-- CREACION DE LA TABLA VENDEDOR

CREATE TABLE salesman(
	id_salesman INT NOT NULL,
	document_number VARCHAR(11) NOT NULL,
	name_saleman VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_salesman)
);

-- CREACION DE LA TABLA PRODUCTO

CREATE TABLE product(
	id_product INT NOT NULL,
	provider_id INT NOT NULL,
	name_product VARCHAR(80) NOT NULL,
	description VARCHAR(100) NOT NULL,
	price BIGINT NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_product),
	FOREIGN KEY(provider_id) REFERENCES provider(id_provider)
);

-- CREACION DE LA TABLA CLIENTE

CREATE TABLE customer(
	id_customer FLOAT NOT NULL,
	type_document VARCHAR(3) NOT NULL,
	document_number VARCHAR(11) UNIQUE NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_customer)
	-- INDEX document_index ON customer (type_document, document_number)
);
-- CREACION DE LA TABLA VENTA

CREATE TABLE sale(
	id_sale INT NOT NULL,
	customer_id INT NOT NULL,
	salesman_id INT NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_sale),
	FOREIGN KEY(customer_id) REFERENCES customer(id_customer),
	FOREIGN KEY(salesman_id) REFERENCES salesman(id_salesman)
);

-- CREACION DE LA TABLA INTERMEDIA DE VENTA Y PRODUCTO

CREATE TABLE sale_has_product(
	id_sale_product INT NOT NULL,
	sale_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity_sold INT NOT NULL,
	CONSTRAINT IDENTITY PRIMARY KEY (id_sale_product),
	FOREIGN KEY(sale_id) REFERENCES sale(id_sale) ON DELETE CASCADE,
	FOREIGN KEY(product_id) REFERENCES product(id_product) ON DELETE CASCADE
);


-- 2. Llenar las tablas con informacion previa para poder manipular la base de datos a nivel de datos

-- insertando datos para la tabla proveedor

INSERT INTO provider(id_provider, nit, name_provider, address, phone, create_at)
VALUES('10001','2589103479', 'Star Vending Service', 'cll 78 sur #25-2', '8458386764',CURRENT_TIMESTAMP);

INSERT INTO provider(id_provider, nit, name_provider, address, phone, create_at)
VALUES('10002','3124687950', 'Hands-On-Candy', 'cll 88 sur #15-5', '8492447357', CURRENT_TIMESTAMP);

INSERT INTO provider(id_provider, nit, name_provider, address, phone, create_at)
VALUES('10003','9782031467', 'Advenia Foods', 'cra 88 norte #55-33', '3492487957', CURRENT_TIMESTAMP);

INSERT INTO provider(id_provider, nit, name_provider, address, phone, create_at)
VALUES('10004','0315874209', 'QC Delicias', 'cra 80 sur #30-12', '4235842100', CURRENT_TIMESTAMP);

INSERT INTO provider(id_provider, nit, name_provider, address, phone, create_at)
VALUES('10005','1589463782', 'Juliette Baker', 'cra 64 sur #25-3', '7894232540', CURRENT_TIMESTAMP);


-- Insertando datos para tabla vendedor
INSERT INTO salesman(id_salesman, document_number, name_saleman, last_name, create_at)
VALUES('101','7894232540', 'Jose', 'Casas', CURRENT_TIMESTAMP);


-- Insertando datos de tabla producto

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10001', '1001', 'Shampoo', 'Anti caspa', 12000, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10001', '1002', 'Jabon', 'Para ropa', 3000, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10002', '1003', 'Cafe', 'Descafeinado', 12000, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10003', '1004', 'Cereal', 'Cereal integral', 8000, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10004', '1005', 'Pasta', 'Pasta larga', 2500, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10004', '1006', 'Crema de dientes', 'Crema con fluor', 2500, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10005', '1007', 'Chocolate', 'Chocolate bajo en grasa', 6500, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10005', '1008', 'Leche', 'Deslactosada', 4000, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10002', '1009', 'Arroz', 'Arroz blanco', 3500, CURRENT_TIMESTAMP);

INSERT INTO product(provider_id, id_product, name_product, description, price, create_at)
VALUES('10005', '1010', 'Arepa', 'Arepa de chocolo', 1500, CURRENT_TIMESTAMP);


-- Insertando datos de tabla cliente
INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-4647891032','CC', '4647891032', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-1478965231', 'TI', '1478965231', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-8954012364', 'CC', '8954012364', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-5647891032', 'TI', '5647891032', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-5647891032','CC', '10235489624', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-11234489625','CC', '11234489625', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-10234469627','TI', '10234469627', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-10234541037','CC', '10234541037', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-98744541037','TI', '98744541037', CURRENT_TIMESTAMP);

INSERT INTO customer(id_customer ,type_document, document_number, create_at)
VALUES('C-10234620148','CC', '10234620148', CURRENT_TIMESTAMP);


-- Insertando datos de tabla venta
INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('1', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('2', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('3', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('4', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('5', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('4', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('3', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('6', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('7', '101', CURRENT_TIMESTAMP);

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('8', '101', CURRENT_TIMESTAMP);


-- Insertando datos de tabla venta y product
INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120001', '1', '1001', 2);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120002','2', '1002', 5);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120003','3', '1003', 8);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120004','4', '1004', 4);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120005', '5', '1005', 10);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120005', '5', '1003', 9);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120005', '5', '1004', 5);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120006', '6', '1007', 7);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120007', '7', '1003', 1);

INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold)
VALUES('120008', '8', '1009', 6);


-- 3. Realizar dos borrados l�gicos y dos borrados f�sicos de ventas realizadas.

-- Borrado logico
UPDATE sale
SET delete_at = CURRENT_TIMESTAMP
WHERE id_sale = 1;

UPDATE sale
SET delete_at = CURRENT_TIMESTAMP
WHERE id_sale = 3;

-- Borrado fisico
DELETE FROM sale 
WHERE id_sale = 2;

DELETE FROM sale 
WHERE customer_id = 4;


-- 4. Modificar tres productos en su nombre y proveedor que los provee.

UPDATE product
SET name_product = 'Shampo Savital'
WHERE id_product = 1;

UPDATE product
SET provider_id = 3
WHERE id_product = 1;

UPDATE product
SET name = 'Jabon Azul'
WHERE id_product = 2;

UPDATE product
SET provider_id = 3
WHERE id_product = 2;

UPDATE product
SET name = 'Kelloggs'
WHERE id_product = 4;

UPDATE product
SET provider_id = 5
WHERE id_product = 4;
INSERT INTO sale_has_product(id_sale_product, sale_id, product_id, quantity_sold) VALUES(1000 ,'1', '1', 2)
