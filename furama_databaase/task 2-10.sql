USE furama;
SELECT *
FROM hop_dong;

SELECT *
FROM khach_hang;



-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT *
from nhan_vien
WHERE (length(ho_va_ten) < 16) AND ho_va_ten like 'H%' or ho_va_ten like 'T%' or ho_va_ten like 'K%';



-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT 
    *
FROM
    khach_hang
WHERE
    (ROUND(DATEDIFF(curdate(), ngay_sinh) / 365) BETWEEN 18 AND 50)
        AND dia_chi LIKE '%Đà Nẵng%'
        OR dia_chi LIKE '%Quảng Trị%';


-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.*, count(kh.ma_khach_hang)
from khach_hang AS kh
INNER JOIN hop_dong AS hd ON hd.ma_khach_hang = kh.ma_khach_hang
INNER JOIN loai_khach AS lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE lk.ten_loai_khach like 'Diamond'
GROUP BY hd.ma_khach_hang;



-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu,
-- ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá,
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).


SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
(ifnull(dv.chi_phi_thue + ifnull( (sum(hdct.so_luong * dvdk.gia)),0),0)) AS tong_tien
from khach_hang AS kh
INNER JOIN loai_khach AS lk ON lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN hop_dong AS hd ON hd.ma_khach_hang = kh.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet AS hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem AS dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
LEFT JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY kh.ma_khach_hang, hd.ma_hop_dong
ORDER BY kh.ma_khach_hang, tong_tien DESC;


-- Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)

select hd.ma_dich_vu
from hop_dong AS hd
inner join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
WHERE (year(hd.ngay_lam_hop_dong) = 2021) AND (quarter(hd.ngay_lam_hop_dong) = 1) 
;
 

SELECT dv.ma_dich_vu , dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu AS dv
INNER JOIN loai_dich_vu AS ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE ldv.ma_loai_dich_vu NOT IN (select hd.ma_dich_vu
from hop_dong AS hd
inner join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
WHERE (year(hd.ngay_lam_hop_dong) = 2021) AND (quarter(hd.ngay_lam_hop_dong) = 1));


-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng
-- đặt phòng trong năm 2021.

SELECT ma_dich_vu
from hop_dong 
WHERE (year(ngay_lam_hop_dong) = 2020);

SELECT ma_dich_vu
from hop_dong 
WHERE (year(ngay_lam_hop_dong) = 2021);


SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu AS dv 
INNER JOIN loai_dich_vu AS ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
INNER JOIN hop_dong AS hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE dv.ma_dich_vu IN (SELECT ma_dich_vu
from hop_dong 
WHERE (year(ngay_lam_hop_dong) = 2020))
AND dv.ma_dich_vu NOT IN (SELECT ma_dich_vu
from hop_dong 
WHERE (year(ngay_lam_hop_dong) = 2021))
GROUP BY dv.ma_dich_vu
;

-- Thực hiện thống kê doanh thu theo tháng,
-- nghĩa là tương ứng với mỗi tháng trong năm 2021
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(ngay_lam_hop_dong), count(ma_hop_dong)
from hop_dong
where year(ngay_lam_hop_dong) = 2021
GROUP BY month(ngay_lam_hop_dong)
ORDER BY month(ngay_lam_hop_dong);

-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm
-- ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) AS so_luong_dich_vu_di_kem
from hop_dong AS hd
LEFT JOIN hop_dong_chi_tiet AS hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
GROUP BY hd.ma_hop_dong;



