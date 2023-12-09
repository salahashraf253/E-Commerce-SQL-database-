CREATE TABLE buyer(
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL ,
    email varchar(255) UNIQUE,
    password varchar(25) NOT NULL,
    address varchar(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE seller (
    id bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) UNIQUE,
    password varchar(25) NOT NULL,
    address varchar(255) NOT NULL,
    store_name varchar(255) NOT NULL,

    PRIMARY KEY (id)
);
CREATE TABLE language(
	id bigint NOT NULL AUTO_INCREMENT,
	code varchar(2) NOT NULL UNIQUE ,
	PRIMARY key(id)
);

CREATE TABLE category(
    id bigint NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (id)
);

CREATE TABLE category_translation(
    id bigint NOT NULL AUTO_INCREMENT,
    language_id  bigint NOT NULL,
    name varchar(255) NOT NULL,
    category_id bigint NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE product (
    id bigint NOT NULL AUTO_INCREMENT,
    category_id bigint NOT NULL,
    price double NOT NULL,
    quantity int NOT NULL,
    seller_id bigint NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (seller_id) REFERENCES seller(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE product_translation(
    id bigint NOT NULL AUTO_INCREMENT,
    product_id bigint NOT NULL,
    language_id bigint NOT NULL,
    name varchar(255),
    description varchar(255),

    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
	FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE cart(
    id bigint NOT NULL AUTO_INCREMENT,
    buyer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    product_price double NOT NULL,
    product_quantity int NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (buyer_id) REFERENCES buyer(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE orders(
    id bigint NOT NULL AUTO_INCREMENT,
    buyer_id bigint NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (buyer_id) REFERENCES buyer(id)
);

CREATE TABLE order_products(
    id bigint NOT NULL AUTO_INCREMENT,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_price double NOT NULL,
    product_quantity int NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);


CREATE TABLE review (
    id bigint NOT NULL AUTO_INCREMENT,
    buyer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    rating int NOT NULL,
    comment varchar(255),
    
    PRIMARY KEY (id),
    FOREIGN KEY (buyer_id) REFERENCES buyer(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);