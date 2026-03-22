-- CREATE DATABASE 
CREATE DATABASE PIZZAHUT;

ALTER TABLE orders ADD CONSTRAINT PRIMARY KEY(order_id);
ALTER TABLE order_details ADD CONSTRAINT fk_ORDERS FOREIGN KEY(order_id) REFERENCES pizzas(order_id);

ALTER TABLE pizzas MODIFY pizza_id VARCHAR(50);
ALTER TABLE order_details MODIFY pizza_id VARCHAR(50);
ALTER TABLE pizzas ADD CONSTRAINT PRIMARY KEY (pizza_id);
ALTER TABLE order_details ADD CONSTRAINT fk_pizza FOREIGN KEY(pizza_id) REFERENCES pizzas(pizza_id);

ALTER TABLE pizza_types MODIFY pizza_type_id VARCHAR(50);
ALTER TABLE pizzas MODIFY pizza_type_id VARCHAR(50);
ALTER TABLE pizza_types ADD CONSTRAINT PRIMARY KEY(pizza_type_id);
DESC PIZZAs;
ALTER TABLE pizzas ADD CONSTRAINT fk_pizza_types FOREIGN KEY (pizza_type_id) REFERENCES pizza_types (pizza_type_id);