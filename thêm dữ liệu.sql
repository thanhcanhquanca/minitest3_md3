-- Thêm dữ liệu vào bảng Vật tư
INSERT INTO VatTu (ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien)
VALUES 
('VT001', 'Vật tư 1', 'Cái', 1000),
('VT002', 'Vật tư 2', 'Bộ', 1500),
('VT003', 'Vật tư 3', 'Cái', 1200),
('VT004', 'Vật tư 4', 'Bộ', 2000),
('VT005', 'Vật tư 5', 'Cái', 800);

 
INSERT INTO TonKho (vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat)
VALUES 
(1, 50, 200, 100),
(2, 30, 150, 50),
(3, 60, 250, 120),
(4, 20, 180, 90),
(5, 100, 300, 200),
(1, 70, 180, 110),
(2, 40, 170, 60),
(3, 50, 220, 130),
(4, 30, 190, 100),
(5, 110, 320, 210);

 
INSERT INTO NhaCungCap (ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai)
VALUES 
('NCC001', 'Nhà cung cấp 1', 'Địa chỉ 1', '0123456789'),
('NCC002', 'Nhà cung cấp 2', 'Địa chỉ 2', '0987654321'),
('NCC003', 'Nhà cung cấp 3', 'Địa chỉ 3', '0912345678');

 
INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id)
VALUES 
('DDH001', '2025-01-01', 1),
('DDH002', '2025-01-02', 2),
('DDH003', '2025-01-03', 3);

 
INSERT INTO PhieuNhap (so_phieu_nhap, ngay_nhap, don_hang_id)
VALUES 
('PN001', '2025-01-05', 1),
('PN002', '2025-01-06', 2),
('PN003', '2025-01-07', 3);

 
INSERT INTO PhieuXuat (ngay_xuat, ten_khach_hang)
VALUES 
('2025-01-10', 'Khách hàng 1'),
('2025-01-11', 'Khách hàng 2'),
('2025-01-12', 'Khách hàng 3');

 
INSERT INTO CT_DonHang (don_hang_id, vat_tu_id, so_luong_dat)
VALUES 
(1, 1, 100),
(1, 2, 50),
(2, 3, 150),
(2, 4, 70),
(3, 5, 200),
(3, 1, 90);

 
INSERT INTO CT_PhieuNhap (phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu)
VALUES 
(1, 1, 100, 1000, 'Nhập lần 1'),
(1, 2, 50, 1500, 'Nhập lần 1'),
(2, 3, 150, 1200, 'Nhập lần 2'),
(2, 4, 70, 2000, 'Nhập lần 2'),
(3, 5, 200, 800, 'Nhập lần 3'),
(3, 1, 90, 1000, 'Nhập lần 3');

 
INSERT INTO CT_PhieuXuat (phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu)
VALUES 
(1, 1, 50, 1100, 'Xuất lần 1'),
(1, 2, 20, 1600, 'Xuất lần 1'),
(2, 3, 100, 1300, 'Xuất lần 2'),
(2, 4, 40, 2100, 'Xuất lần 2'),
(3, 5, 150, 850, 'Xuất lần 3'),
(3, 1, 70, 1050, 'Xuất lần 3');
