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
    placed_at       TIMESTAMP   NOT NULL DEFAULT NOW(),
    taco_ids        TEXT[]
);

CREATE TABLE IF NOT EXISTS Taco
(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(50) NOT NULL,
    ingredient_ids TEXT[],
    created_at     TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Ingredient
(
    id   VARCHAR(4)  NOT NULL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    type VARCHAR(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS "users"
(
    id           SERIAL PRIMARY KEY,
    username     VARCHAR(50),
    password     VARCHAR(100),
    fullname     VARCHAR(50),
    street       VARCHAR(50),
    city         VARCHAR(50),
    state        VARCHAR(2),
    zip          VARCHAR(10),
    phone_number VARCHAR(20)
);