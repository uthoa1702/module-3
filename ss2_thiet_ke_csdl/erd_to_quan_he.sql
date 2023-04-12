CREATE DATABASE don_dat_hang;
use don_dat_hang;
CREATE TABLE sdt (
    ma_sdt INT PRIMARY KEY AUTO_INCREMENT,
    sdt_nha_cung_cap varchar(12)
);

CREATE TABLE nha_cung_cap (
ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
ten_nha_cung_cap VARCHAR(45),
dia_chi VARCHAR(45),
ma_sdt INT, FOREIGN KEY (ma_sdt) REFERENCES sdt(ma_sdt)
);


CREATE TABLE phieu_xuat(
so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATE
);


CREATE TABLE vat_tu(
ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
ten_vat_tu VARCHAR(45)
);


CREATE TABLE chi_tiet_phieu_xuat (
don_gia_xuat DOUBLE,
so_luong_xuat INT,
so_phieu_xuat INT, FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
ma_vat_tu INT, FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);


CREATE TABLE phieu_nhap(
so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
ngay_nhap DATE
);


CREATE TABLE chi_tiet_phieu_nhap(
don_gia_nhap DOUBLE,
so_luong_nhap INT,
ma_vat_tu INT, FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
so_phieu_nhap INT, FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap)
);


CREATE TABLE don_dat_hang(
so_don_dat_hang INT PRIMARY KEY AUTO_INCREMENT,
ngay_dat_hang DATE,
ma_nha_cung_cap INT, FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap)
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_don_dat_hang INT,
    FOREIGN KEY (so_don_dat_hang)
        REFERENCES don_dat_hang (so_don_dat_hang)
);




