CREATE DATABASE apple_shop;
CREATE TABLE type
(
    id                INTEGER PRIMARY KEY,
    type_of_materials VARCHAR(40)
);
CREATE TABLE color
(
    id   INTEGER PRIMARY KEY,
    name VARCHAR(20)
);
CREATE TABLE spare_parts
(
    id                       INTEGER PRIMARY KEY,
    name_and_model_of_detail VARCHAR(50)
);
CREATE TABLE iphone
(
    id        INTEGER PRIMARY KEY,
    model     VARCHAR(50),
    iphone_id INT REFERENCES type (id),
    color     INT REFERENCES color (id),
    year      INTEGER,
    price     INTEGER,
    more_info VARCHAR(300)
);
CREATE TABLE ipad
(
    id        INTEGER PRIMARY KEY,
    model     VARCHAR(50),
    iphone_id INT REFERENCES type (id),
    color     INT REFERENCES color (id),
    year      INTEGER,
    price     INTEGER,
    more_info VARCHAR(300)
);
CREATE TABLE mac
(
    id        INTEGER PRIMARY KEY,
    model     VARCHAR(50),
    iphone_id INT REFERENCES type (id),
    color     INT REFERENCES color (id),
    year      INTEGER,
    price     INTEGER,
    more_info VARCHAR(300)
);
CREATE TABLE accessories_for_mac
(
    id        INTEGER PRIMARY KEY,
    formac_id Int REFERENCES type (id),
    model     VARCHAR(30),
    color     INT REFERENCES color (id),
    more_info VARCHAR(300)
);
CREATE TABLE accessories_for_iphone_ipad
(
    id           INTEGER PRIMARY KEY,
    foriphone_id INT REFERENCES type (id),
    model        VARCHAR(30),
    color        INT REFERENCES color (id),
    more_info    VARCHAR(300)
);
CREATE TABLE repairing
(
    id         INTEGER primary key,
    model_name VARCHAR(60),
    more_info  VARCHAR(300)
);
CREATE TABLE staff
(
    id         INTEGER PRIMARY KEY,
    position   VARCHAR(20),
    grievances VARCHAR(300)
);
INSERT INTO type(id, type_of_materials)
values (1, 'Polycarbonate'),
       (2, 'Aluminum'),
       (3, 'Steel'),
       (4, 'Glass'),
       (5, 'Kevlar'),
       (6, 'Gold');
INSERT INTO color(id, name)
values (1, 'Alpine Green'),
       (2, 'Silver'),
       (3, 'Gold'),
       (4, 'Graphite'),
       (5, 'Sierra Blue');
INSERT INTO ipad(id, model, iphone_id, color, year, price, more_info)
values (1, 'ipad 3', 1, 1, 2022, 499, 'bluetooth-6, kamera 12 megapixel, memory 128gb, cpu 6gb, 5000mah'),
       (2, 'ipad 3', 2, 2, 2022, 459, 'bluetooth-6, kamera 12 megapixel, memory 128gb, cpu 6gb, 5000mah'),
       (3, 'ipad 3', 3, 3, 2022, 489, 'bluetooth-6, kamera 12 megapixel, memory 128gb, cpu 6gb, 5000mah'),
       (4, 'ipad 3', 4, 4, 2022, 459, 'bluetooth-6, kamera 12 megapixel, memory 128gb, cpu 6gb, 5000mah'),
       (5, 'ipad 3', 5, 5, 2022, 489, 'bluetooth-6, kamera 12 megapixel, memory 128gb, cpu 6gb, 5000mah');

INSERT INTO iphone(id, model, iphone_id, color, year, price, more_info)
values (1, 'iphone 13 promax', 1, 1, 2022, 1299, 'bluetooth-6, camera 64 megapixel,4800 mah, memory 500gb, cpu 6gb'),
       (2, 'iphone 13 promax', 2, 2, 2022, 1259, 'bluetooth-6, camera 64 megapixel,4800 mah, memory 500gb, cpu 6gb'),
       (3, 'iphone 13 promax', 3, 3, 2022, 1289, 'bluetooth-6, camera 64 megapixel,4800 mah, memory 500gb, cpu 6gb'),
       (4, 'iphone 13 promax', 4, 4, 2022, 1259, 'bluetooth-6, camera 64 megapixel,4800 mah, memory 500gb, cpu 6gb'),
       (5, 'iphone 13 promax', 5, 5, 2022, 1289, 'bluetooth-6, camera 64 megapixel,4800 mah, memory 500gb, cpu 6gb');
INSERT INTO mac(id, model, iphone_id, color, year, price, more_info)
values (1, 'Macbook pro 14 inch', 1, 1, 2022, 2299,
        'bluetooth-6, kamera 12megapixel, memory 2048gb ssd, cori 7, processor M1 max'),
       (2, 'Macbook pro 14 inch', 2, 2, 2022, 2259,
        'bluetooth-6, kamera 12megapixel, memory 2048gb ssd, cori 7, processor M1 max'),
       (3, 'Macbook pro 14 inch', 3, 3, 2022, 2289,
        'bluetooth-6, kamera 12megapixel, memory 2048gb ssd, cori 7, processor M1 max'),
       (4, 'Macbook pro 14 inch', 4, 4, 2022, 2259,
        'bluetooth-6, kamera 12megapixel, memory 2048gb ssd, cori 7, processor M1 max'),
       (5, 'Macbook pro 14 inch', 5, 5, 2022, 2289,
        'bluetooth-6, kamera 12megapixel, memory 2048gb ssd, cori 7, processor M1 max');
INSERT INTO accessories_for_iphone_ipad(id, foriphone_id, model, color, more_info)
values (1, 1, 'Airpod 3', 1, 'bluetooth-6, 24 hour'),
       (2, 2, 'Airpod 3', 4, 'bluetooth-6, 24 hour'),
       (3, 3, 'Airpod 3', 5, 'bluetooth-6, 24 hour');
INSERT INTO accessories_for_mac(id, formac_id, model, color, more_info)
values (1, 4, 'Hard disk', 2, 'ssd 2048 gb'),
       (2, 1, 'Hard disk', 3, 'ssd 2048 gb'),
       (3, 5, 'Hard disk', 5, 'ssd 2048 gb');

INSERT INTO repairing(id, model_name, more_info)
values (2, 'video card radeon 4gb', ' 4 year warranty');
INSERT INTO staff(id, position, grievances)
values (1, 'administrator', 'no commentary, good job!');
INSERT INTO spare_parts(id, name_and_model_of_detail)
values (1, 'camera 64 mega pixel');

SELECT iphone.id         as id,
       iphone.model      as model,
       type_of_materials as iphone_id,
       iphone.color      as color,
       iphone.year       as year,
       iphone.price      as price,
       iphone.more_info  as more_info
from iphone
         INNER JOIN type t on iphone.iphone_id = t.id;

SELECT ipad.id           as id,
       ipad.model        as model,
       type_of_materials as iphone_id,
       ipad.color        as color,
       ipad.year         as year,
       ipad.price        as price,
       ipad.more_info    as more_info
from ipad
         INNER JOIN type t on ipad.iphone_id = t.id;
SELECT mac.id        as id,
       mac.model     as model,
       mac.iphone_id as mac_id,
       name          as color,
       mac.year      as year,
       mac.price     as price,
       mac.more_info as more_info
from mac
         INNER JOIN color c on mac.color = c.id;

SELECT accessories_for_mac.id        as id,
       type_of_materials             as formac_id,
       accessories_for_mac.model     as model,
       accessories_for_mac.color     as color,
       accessories_for_mac.more_info as more_info
from accessories_for_mac
         INNER JOIN type t on accessories_for_mac.formac_id = t.id;

SELECT accessories_for_iphone_ipad.id           as id,
       accessories_for_iphone_ipad.foriphone_id as formac_id,
       accessories_for_iphone_ipad.model        as model,
       name                                     as color,
       accessories_for_iphone_ipad.more_info    as more_info
from accessories_for_iphone_ipad
         INNER JOIN color c on accessories_for_iphone_ipad.foriphone_id = c.id;

SELECT *
FROM repairing;
SELECT *
FROM spare_parts;
SELECT  *
FROM staff;

