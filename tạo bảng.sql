CREATE DATABASE QuanLyVatTu;
USE QuanLyVatTu;
drop database quanLyVatTu;


-- Bảng Vật tư
create table VatTu (
    id int primary key auto_increment,
    ma_vat_tu VARCHAR(50),
    ten_vat_tu VARCHAR(255),
    don_vi_tinh VARCHAR(50),
    gia_tien int
);

-- Bảng Tồn kho
CREATE TABLE TonKho (
    id int primary key auto_increment,
    vat_tu_id INT,
    so_luong_dau INT,
    tong_so_luong_nhap INT,
    tong_so_luong_xuat INT,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Bảng Nhà cung cấp
CREATE TABLE NhaCungCap (
    id int primary key auto_increment,
    ma_nha_cung_cap VARCHAR(50),
    ten_nha_cung_cap VARCHAR(255),
    dia_chi VARCHAR(255),
    so_dien_thoai VARCHAR(50)
);

-- Bảng Đơn đặt hàng
CREATE TABLE DonDatHang (
    id INT PRIMARY KEY auto_increment,
    ma_don VARCHAR(50),
    ngay_dat_hang DATE,
    nha_cung_cap_id INT,
    FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);

-- Bảng Phiếu nhập
CREATE TABLE PhieuNhap (
    id INT PRIMARY KEY auto_increment,
    so_phieu_nhap VARCHAR(50),
    ngay_nhap DATE,
    don_hang_id INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id)
);

-- Bảng Phiếu xuất
CREATE TABLE PhieuXuat (
    id INT PRIMARY KEY auto_increment,
    ngay_xuat DATE,
    ten_khach_hang VARCHAR(255)
);

-- Bảng CT Đơn hàng
CREATE TABLE CT_DonHang (
    id INT PRIMARY KEY auto_increment,
    don_hang_id INT,
    vat_tu_id INT,
    so_luong_dat INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Bảng CT Phiếu nhập
CREATE TABLE CT_PhieuNhap (
    id INT PRIMARY KEY auto_increment,
    phieu_nhap_id INT,
    vat_tu_id INT,
    so_luong_nhap INT,
    don_gia_nhap int,
    ghi_chu TEXT,
    FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Bảng CT Phiếu xuất
CREATE TABLE CT_PhieuXuat (
    id INT PRIMARY KEY auto_increment,
    phieu_xuat_id INT,
    vat_tu_id INT,
    so_luong_xuat INT,
    don_gia_xuat int,
    ghi_chu TEXT,
    FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

