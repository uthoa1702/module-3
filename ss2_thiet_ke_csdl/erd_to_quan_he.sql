CREATE DATABASE don_dat_hang;
use don_dat_hang;

CREATE TABLE nha_cung_cap (
ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
ten_nha_cung_cap VARCHAR(45) NOT NULL,
dia_chi VARCHAR(45) NOT NULL
);

CREATE TABLE sdt (
    sdt VARCHAR(50) PRIMARY KEY,
    ma_nha_cung_cap int,
    FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap) ON DELETE SET NULL
);



CREATE TABLE phieu_xuat(
so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATE NOT NULL
);


CREATE TABLE vat_tu(
ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
ten_vat_tu VARCHAR(45) NOT NULL
);


CREATE TABLE chi_tiet_phieu_xuat (
don_gia_xuat DOUBLE NOT NULL,
so_luong_xuat INT NOT NULL,
so_phieu_xuat INT, FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat)ON DELETE SET NULL,
ma_vat_tu INT, FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)ON DELETE SET NULL,
PRIMARY KEY(so_phieu_xuat, ma_vat_tu)
);


CREATE TABLE phieu_nhap(
so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
ngay_nhap DATE NOT NULL
);


CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap DOUBLE NOT NULL,
    so_luong_nhap INT NOT NULL,
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_phieu_nhap INT,
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)ON DELETE SET NULL,
        
        PRIMARY KEY(ma_vat_tu, so_phieu_nhap)
);


CREATE TABLE don_dat_hang(
so_don_dat_hang INT PRIMARY KEY AUTO_INCREMENT,
ngay_dat_hang DATE NOT NULL,
ma_nha_cung_cap INT, FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap)ON DELETE SET NULL
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_don_dat_hang INT,
    FOREIGN KEY (so_don_dat_hang)
        REFERENCES don_dat_hang (so_don_dat_hang),
    PRIMARY KEY (ma_vat_tu , so_don_dat_hang)
);


