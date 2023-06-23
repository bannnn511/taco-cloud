CREATE TABLE IF NOT EXISTS Taco_Order
(
    id              SERIAL PRIMARY KEY,
    delivery_name   VARCHAR(50) NOT NULL,
    delivery_street VARCHAR(50) NOT NULL,
    delivery_city   VARCHAR(50) NOT NULL,
    delivery_state  VARCHAR(2)  NOT NULL,
    delivery_zip    VARCHAR(10) NOT NULL,
    cc_number       VARCHAR(16) NOT NULL,
    cc_expiration   VARCHAR(5)  NOT NULL,
    cc_cvv          VARCHAR(3)  NOT NULL,
    placed_at       TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Taco
(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(50) NOT NULL,
    taco_order     BIGINT      NOT NULL REFERENCES Taco_Order (id),
    taco_order_key BIGINT      NOT NULL,
    created_at     TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Ingredient
(
    id   VARCHAR(4)  NOT NULL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    type VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS Taco_Ingredient
(
    ingredient VARCHAR(4) NOT NULL REFERENCES Ingredient (id),
    taco_key   BIGINT     NOT NULL,
    taco       BIGINT     NOT NULL REFERENCES Taco (id)
);

CREATE TABLE IF NOT EXISTS "user"
(
    id           SERIAL PRIMARY KEY,
    username     VARCHAR(50),
    password     VARCHAR(100),
    fullname     VARCHAR(50),
    street       VARCHAR(50),
    city         VARCHAR(50),
    state        VARCHAR(2),
    zip          VARCHAR(10),
    phone_number VARCHAR(10)
);


DELETE
from Taco_Ingredient;
DELETE
from Taco;
DELETE
from Taco_Order;
DELETE
from Ingredient;
insert into Ingredient (id, name, type)
values ('FLTO', 'Flour Tortilla', 'WRAP');
insert into Ingredient (id, name, type)
values ('COTO', 'Corn Tortilla', 'WRAP');
insert into Ingredient (id, name, type)
values ('GRBF', 'Ground Beef', 'PROTEIN');
insert into Ingredient (id, name, type)
values ('CARN', 'Carnitas', 'PROTEIN');
insert into Ingredient (id, name, type)
values ('TMTO', 'Diced Tomatoes', 'VEGGIES');
insert into Ingredient (id, name, type)
values ('LETC', 'Lettuce', 'VEGGIES');
insert into Ingredient (id, name, type)
values ('CHED', 'Cheddar', 'CHEESE');
insert into Ingredient (id, name, type)
values ('JACK', 'Monterrey Jack', 'CHEESE');
insert into Ingredient (id, name, type)
values ('SLSA', 'Salsa', 'SAUCE');
insert into Ingredient (id, name, type)
values ('SRCR', 'Sour Cream', 'SAUCE');