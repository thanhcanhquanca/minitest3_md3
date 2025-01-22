select  * from ct_donhang;
select * from ct_phieunhap;
select * from ct_phieuxuat;
select * from dondathang;
select * from nhacungcap;
select * from phieunhap;
select * from phieuxuat;
select * from tonkho;
select * from vattu;
use quanlyvattu;

-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

-- Câu 1: Tạo view vw_CTPNHAP
CREATE VIEW vw_CTPNHAP AS
SELECT 
    pn.so_phieu_nhap,
    ctn.vat_tu_id,
    ctn.so_luong_nhap,
    ctn.don_gia_nhap,
    ctn.so_luong_nhap * ctn.don_gia_nhap AS thanh_tien_nhap
FROM CT_PhieuNhap ctn
JOIN PhieuNhap pn ON ctn.phieu_nhap_id = pn.id;
 

select * from vw_CTPNHAP;
drop view vw_ctpnhap;
  
-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_ctpnhap_vt as select pn.so_phieu_nhap, vt.ma_vat_tu , vt.ten_vat_tu, ctn.so_luong_nhap , ctn.don_gia_nhap, so_luong_nhap * ctn.don_gia_nhap as thanh_tien_nhap 
from ct_phieunhap ctn 
join phieunhap pn on ctn.phieu_nhap_id = pn.id 
join vattu vt on vt.id = ctn.vat_tu_id;

select * from vw_ctpnhap_vt;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
create view vw_ctpnhap_vt_pn as select pn.so_phieu_nhap,pn.ngay_nhap,dh.ma_don,vt.ma_vat_tu,vt.ten_vat_tu,ctn.so_luong_nhap,ctn.don_gia_nhap,ctn.so_luong_nhap * ctn.don_gia_nhap as thanh_tien_nhap
from ct_phieunhap ctn
join phieunhap pn on ctn.phieu_nhap_id = pn.id
join vatTu vt on ctn.vat_tu_id = vt.id
join dondathang dh on pn.don_hang_id = dh.id;

select * from vw_ctpnhap_vt_pn;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
 
create view vw_ctpnhap_vt_pn_dh as
select
    pn.so_phieu_nhap,
    pn.ngay_nhap,
    dh.ma_don,
    ncc.ma_nha_cung_cap,
    vt.ma_vat_tu,
    vt.ten_vat_tu,
    ctn.so_luong_nhap,
    ctn.don_gia_nhap,
    ctn.so_luong_nhap * ctn.don_gia_nhap as thanh_tien_nhap
from CT_PhieuNhap ctn
join PhieuNhap pn on ctn.phieu_nhap_id = pn.id
join VatTu vt on ctn.vat_tu_id = vt.id
join DonDatHang dh on pn.don_hang_id = dh.id
join NhaCungCap ncc on dh.nha_cung_cap_id = ncc.id;

select * from vw_ctpnhap_vt_pn_dh;


-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
create view vw_CTPNHAP_loc as
select
    pn.so_phieu_nhap,
    ctn.vat_tu_id,
    ctn.so_luong_nhap,
    ctn.don_gia_nhap,
    ctn.so_luong_nhap * ctn.don_gia_nhap as thanh_tien_nhap
from CT_PhieuNhap ctn
join PhieuNhap pn on ctn.phieu_nhap_id = pn.id
where ctn.so_luong_nhap > 5;

select * from vw_CTPNHAP_loc;


-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
create view vw_CTPNHAP_VT_loc as
select
    pn.so_phieu_nhap,
    vt.ma_vat_tu,
    vt.ten_vat_tu,
    ctn.so_luong_nhap,
    ctn.don_gia_nhap,
    ctn.so_luong_nhap * ctn.don_gia_nhap as thanh_tien_nhap
from CT_PhieuNhap ctn
join PhieuNhap pn on ctn.phieu_nhap_id = pn.id
join VatTu vt on ctn.vat_tu_id = vt.id
where vt.don_vi_tinh = 'Bộ';

select * from vw_CTPNHAP_VT_loc;


-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
SELECT 
    px.id AS so_phieu_xuat,
    ctpx.vat_tu_id,
    ctpx.so_luong_xuat,
    ctpx.don_gia_xuat,
    ctpx.so_luong_xuat * ctpx.don_gia_xuat AS thanh_tien_xuat
FROM CT_PhieuXuat ctpx
JOIN PhieuXuat px ON ctpx.phieu_xuat_id = px.id;

select * from vw_CTPXUAT;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT AS
SELECT 
    px.id AS so_phieu_xuat,
    vt.ma_vat_tu,
    vt.ten_vat_tu,
    ctpx.so_luong_xuat,
    ctpx.don_gia_xuat
FROM CT_PhieuXuat ctpx
JOIN PhieuXuat px ON ctpx.phieu_xuat_id = px.id
JOIN VatTu vt ON ctpx.vat_tu_id = vt.id;

select * from vw_CTPXUAT_VT;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT 
    px.id AS so_phieu_xuat,
    px.ten_khach_hang,
    vt.ma_vat_tu,
    vt.ten_vat_tu,
    ctpx.so_luong_xuat,
    ctpx.don_gia_xuat
FROM CT_PhieuXuat ctpx
JOIN PhieuXuat px ON ctpx.phieu_xuat_id = px.id
JOIN VatTu vt ON ctpx.vat_tu_id = vt.id


-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.

delimiter //
create procedure sp_tongSoLuongCuoiVatTu (
in ma_vat_tu varchar(50),
out tong_so_luong_cuoi int)
begin
select sum(so_luong_dau + tong_so_luong_nhap - tong_so_luong_xuat) into tong_so_luong_cuoi
 from tonkho tk 
 join vattu vt on tk.vat_tu_id = vt.id 
 where vt.ma_vat_tu = ma_vat_tu;
end //

delimiter ;

set @tongSoLuong = 0;
CALL sp_tongSoLuongCuoiVatTu("vt002", @tongSoLuong);
SELECT @tongSoLuong AS tong_so_luong_cuoi;
drop procedure  sp_tongSoLuongCuoiVatTu;
 
-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.

delimiter //
create procedure sp_tongtienxuatvattu (
    in ma_vat_tu varchar(50), 
    out tong_tien_xuat double
)
begin
    select 
        sum(px.so_luong_xuat * px.don_gia_xuat)
    into tong_tien_xuat
    from ct_phieuxuat px 
    join vattu vt on px.vat_tu_id = vt.id
    where vt.ma_vat_tu = ma_vat_tu;
end //
delimiter ;

set @tongtienxuat = 0;
call sp_tongtienxuatvattu("Vật tư 3", @tongtienxuat);
select @tongtienxuat as tong_tien_xuat;


drop procedure if exists sp_tongTienXuatVatTu;

call sp_tongTienXuatVatTu("Vật tư 3");

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.

delimiter //
create procedure sp_tongsoluongdattheodonhang (
    in so_don_hang varchar(50), 
    out tong_so_luong_dat int)
begin
    select 
        sum(ctdh.so_luong_dat)
    into tong_so_luong_dat
    from ct_donhang ctdh 
    join dondathang ddh on ctdh.don_hang_id = ddh.id
    where ddh.ma_don = so_don_hang;
end //
delimiter ;

set @tongsoluongdat = 0;
call sp_tongsoluongdattheodonhang("DDH001", @tongsoluongdat);
select @tongsoluongdat as tong_so_luong_dat;


-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.

delimiter //
create procedure sp_themDonDatHang(
    in ma_don varchar(50), 
    in ngay_dat_hang date, 
    in nha_cung_cap_id int
)
begin
    insert into dondathang(ma_don, ngay_dat_hang, nha_cung_cap_id) 
    values (ma_don, ngay_dat_hang, nha_cung_cap_id);
end //
delimiter ;

drop procedure sp_themDonDatHang;
call sp_themDonDatHang("D0001","2025-02-02","1");
select * from dondathang;

-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.

delimiter //
create procedure sp_themChiTietDonDatHang(in don_hang_id int , in vat_tu_id int , in so_luong_dat int)
begin 
insert into ct_donhang(don_hang_id, vat_tu_id, so_luong_dat) 
values (don_hang_id , vat_tu_id , so_luong_dat);
end //
delimiter ;
call sp_themChiTietDonDatHang(1,1,80);
select * from ct_donhang;

-- Câu 6. Tại SP dùng để xoá 1 nhà cung cấp theo id. Trong đó:
-- Tất cả những khoá ngoại đến nhà cung cấp chuyển thành null
-- Xoá nhà cung cấp.

delimiter //

create procedure sp_xoaNhaCungCap(
    in nha_cung_capID int
)
begin
    update dondathang 
    set nha_cung_cap_id = null
    where nha_cung_cap_id = nha_cung_capID;
    delete from nhacungcap 
    where id = nha_cung_capID;
end //
delimiter ;

select * from nhacungcap;
call sp_xoaNhaCungCap(1);
select * from dondathang where nha_cung_cap_id is null;
select * from nhacungcap where id = 1;










