CREATE DATABASE UberEats;

CREATE TABLE user(
    user_id INT(6) NOT NULL AUTO_INCREMENT,
    user_email VARCHAR(127) NOT NULL,
    pw VARCHAR(20) NOT NULL,
    first_name VARCHAR(127) NOT NULL,
    last_name VARCHAR(127) NOT NULL,
    mobile CHAR(10),
    nat_code CHAR(2),
    PRIMARY KEY(user_id),
    FOREIGN KEY(nat_code) REFERENCES country(country_id)
);

CREATE user_address(
    u_a_id INT(3) NOT NULL AUTO_INCREMENT,
    user_id INT(6) NOT NULL,
    add_detail VARCHAR(127),
    zipcode CHAR(5)
    PRIMARY(u_a_id),
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(zipcode) REFERENCES city(city_id)
)


CREATE TABLE order(
    order_id INT(6) NOT NULL AUTO_INCREMENT,
    user_id INT(6),
    u_a_id INT(3),
    restaurant_id INT(6),
    delivery_id INT(6),
    PRIMARY KEY(order_id),
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(u_a_id) REFERENCES user_address(u_a_id),
    FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id),
    FOREIGN KEY(delivery_id) REFERENCES delivery(delivery_id)
); 

CREATE TABLE restaurant(
    restaurant_id INT(6) NOT NULL AUTO_INCREMENT,
    user_email VARCHAR(127) NOT NULL,
    zipcode CHAR(5),
    justification BLOB DEFAULT empty_blob(),
    PRIMARY KEY(restaurant_id),
    FOREIGN KEY(zipcode) REFERENCES city(city_id)
);

CREATE TABLE delivery(
    delivery_id INT(6) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(127),
    last_name VARCHAR(127),
    mobile VARCHAR(10),
    PRIMARY KEY(delivery_id)
);

CREATE TABLE city(
    city_id CHAR(5) NOT NULL,
    city_name VARCHAR(127) NOT NULL,
    country INT(2),
    PRIMARY KEY(city_id)
    FOREIGN KEY(country) REFERENCES country(country_id)
);

CREATE TABLE country(
    country_id INT(2) NOT NULL,
    country_name VARCHAR(127)
    PRIMARY KEY(country_id)
);
