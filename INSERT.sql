create database ecommerce;

-- 1. You are required to create tables for supplier,customer,category,product,
-- supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.
CREATE TABLE supplier (
    SUPP_ID int PRIMARY KEY,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
);

CREATE TABLE customer (
    CUS_ID int PRIMARY KEY,
    CUS_NAME varchar(20) NOT NULL,
    CUS_PHONE varchar(10) NOT NULL,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER char
);

CREATE TABLE category (
    CAT_ID int PRIMARY KEY,
    CAT_NAME varchar(20) NOT NULL
);

CREATE TABLE product (
    PRO_ID int PRIMARY KEY,
    PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
    PRO_DESC varchar(60),
    CAT_ID int,
    FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

CREATE TABLE supplier_pricing (
    PRICING_ID int PRIMARY KEY,
    PRO_ID int,
    SUPP_ID int,
    FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID),
    SUPP_PRICE int DEFAULT 0
);

CREATE TABLE orders (
    ORD_ID int PRIMARY KEY,
    ORD_AMOUNT int NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID),
    PRICING_ID INT,
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID)
);

CREATE TABLE rating (
    RAT_ID int PRIMARY KEY,
    ORD_ID int,
    FOREIGN KEY (ORD_ID) REFERENCES orders (ORD_ID),
    RAT_RATSTARS int NOT NULL
);

-- 2. Insert the following data in the table created above
INSERT INTO
    supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
    (1, 'Rajesh Retails', 'Delhi', '1234567890'),
    (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
    (3, 'Knome products', 'Banglore', '9785462315'),
    (4, 'Bansal Retails', 'Kochi', '8975463285'),
    (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO
    customer (
        CUS_ID,
        CUS_NAME,
        CUS_PHONE,
        CUS_CITY,
        CUS_GENDER
    )
VALUES
    (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
    (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

INSERT INTO
    category (CAT_ID, CAT_NAME)
VALUES
    (1, 'BOOKS'),
    (2, 'GAMES'),
    (3, 'GROCERIES'),
    (4, 'ELECTRONICS'),
    (5, 'CLOTHES');

INSERT INTO
    product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
    (
        1,
        'GTA V',
        'Windows 7 and above with i5 processor and 8GB RAM',
        2
    ),
    (
        2,
        'TSHIRT',
        'SIZE-L with Black, Blue and White variations',
        5
    ),
    (
        3,
        'ROG LAPTOP',
        'Windows 10 with 15inch screen, i7 processor, 1TB SSD',
        4
    ),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (
        5,
        'HARRY POTTER',
        'Best Collection of all time by J.K Rowling',
        1
    ),
    (6, 'MILK', '1L Toned MIlk', 3),
    (
        7,
        'Boat Earphones',
        '1.5Meter long Dolby Atmos',
        4
    ),
    (
        8,
        'Jeans',
        'Stretchable Denim Jeans with various sizes and color',
        5
    ),
    (
        9,
        'Project IGI',
        'compatible with windows 7 and above',
        2
    ),
    (
        10,
        'Hoodie',
        'Black GUCCI for 13 yrs and above',
        5
    ),
    (
        11,
        'Rich Dad Poor Dad',
        'Written by RObert Kiyosaki',
        1
    ),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);

INSERT INTO
    supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
values
    (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000);

insert INTO
    orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
values
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);

INSERT INTO
    rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES
    (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);

-- 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select
    COUNT(C.CUS_GENDER),
    SUM(O.ORD_AMOUNT),
    C.CUS_GENDER
from
    customer as C
    INNER JOIN orders as O ON C.CUS_ID = O.CUS_ID
    and O.ORD_AMOUNT >= 3000
GROUP BY
    C.CUS_GENDER;

-- 4. Display all the orders along with product name ordered by a customer having Customer_Id=2
select
    *
from
    (
        select
            product.PRO_NAME,
            product.PRO_ID,
            supplier_pricing.PRICING_ID
        from
            supplier_pricing
            INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
    ) AS ord_pro
    INNER JOIN orders as o ON o.PRICING_ID = ord_pro.PRICING_ID
    AND o.CUS_ID = "2";

-- 5. Display the Supplier details who can supply more than one product.
select
    S.SUPP_NAME,
    S.SUPP_ID,
    COUNT(S.SUPP_ID),
    SP.PRO_ID
from
    supplier as S
    INNER JOIN supplier_pricing as SP ON S.SUPP_ID = SP.SUPP_ID
GROUP BY
    S.SUPP_ID
having
    COUNT(S.SUPP_ID) > 1;

-- 6. Find the least expensive product from each category and print the 
-- table with category id, name, product name and price of the product
select
    C.CAT_NAME,
    sup_pro.minSP,
    sup_pro.PRO_ID,
    sup_pro.PRO_NAME,
    sup_pro.CAT_ID
from
    (
        select
            MIN(SP.SUPP_PRICE) as minSP,
            P.PRO_ID,
            P.PRO_NAME,
            P.CAT_ID
        from
            supplier_pricing as SP
            INNER JOIN product as P on SP.PRO_ID = P.PRO_ID
        GROUP BY
            P.CAT_ID
    ) as sup_pro
    INNER JOIN category as C on C.CAT_ID = sup_pro.CAT_ID;

-- 7. Display the Id and Name of the Product ordered after “2021-10-05”.
select
    Supp_pro.PRO_ID,
    supp_pro.PRO_NAME,
    O.ORD_DATE,
    O.ORD_ID
from
    (
        select
            product.PRO_NAME,
            product.PRO_ID,
            supplier_pricing.PRICING_ID
        from
            supplier_pricing
            INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
    ) as supp_pro
    INNER JOIN orders as O on O.PRICING_ID = sup_pro.PRICING_ID
    and o.ORD_DATE >= "2021-10-05";

-- 8. Display customer name and gender whose names start or end with character 'A'.
select
    C.CUS_NAME,
    C.CUS_GENDER
from
    customer as C
where
    C.CUS_NAME like '%A%';

-- 9. Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 
-- If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
select
    SOP.SUPP_ID,
    R.RAT_RATSTARS,
    case
        when R.RAT_RATSTARS = 5 then 'Excellent Service'
        when R.RAT_RATSTARS >= 4 then 'Good Service'
        when R.RAT_RATSTARS >= 2 then 'Average Service'
        else 'Poor Service'
    end as Type_of_Service
from
    (
        select
            supp_pro.SUPP_ID,
            O.ORD_ID
        from
            (
                select
                    supplier_pricing.PRICING_ID,
                    supplier_pricing.SUPP_ID
                from
                    supplier_pricing
                    INNER JOIN product on supplier_pricing.PRO_ID = product.PRO_ID
            ) as supp_pro
            INNER JOIN orders as O ON O.PRICING_ID = supp_pro.PRICING_ID
    ) as SOP
    INNER JOIN rating as R on R.ORD_ID = SOP.ORD_ID;