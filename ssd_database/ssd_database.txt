create database ssd;
USE ssd;
CREATE TABLE ssd_products(
    id VARCHAR(8) PRIMARY KEY ,
    `name` VARCHAR(50) NOT NULL ,
    brand VARCHAR(50) NOT NULL ,
    `memory` VARCHAR(50) NOT NULL ,
    price DOUBLE NOT NULL,
    `status` BIT DEFAULT 0
);
INSERT INTO ssd_products VALUES
                             ('SSD-0001','SSD GIGABYTE NVMe','GIGABYTE','256GB',790000,1),
                             ('SSD-0002','SSD GIGABYTE NVMe','GIGABYTE','512GB',1190000,1),
                             ('SSD-0003','SSD Samsung 980 M.2 PCIe NVMe','Samsung','500GB',1500000,1),
                             ('SSD-0004','SSD Samsung 870 EVO','Samsung','500GB',1600000,0),
                             ('SSD-0005','SSD Kingston A400','Kingston','480GB',1890000,1),
                             ('SSD-0006','SSD Kingston KC3000','Kingston','512GB',3000000,1),
                             ('SSD-0007','Gigabyte SSD AORUS RGB M.2 NVMe','GIGABYTE','512GB',1900000,1),
                             ('SSD-0008','SSD Samsung 870 QVO','Samsung','8TB',20500000,1)
;
SELECT * FROM ssd_products;
