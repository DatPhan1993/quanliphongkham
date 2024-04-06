USE quanliphongkham;

-- Tạo bảng accounts
CREATE TABLE accounts (
    username VARCHAR(255) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    permission VARCHAR(9) NOT NULL
);

ALTER TABLE accounts ADD FULLTEXT(username);

-- Thêm dữ liệu mẫu vào bảng accounts
INSERT INTO accounts (username, pass, permission) VALUES
    ('admin', 'admin123', 'admin'),
    ('anh', 'anh123', 'nhanvien');

-- Tạo bảng nhanvien
CREATE TABLE nhanvien (
  idNV INT AUTO_INCREMENT,
  hotenNV VARCHAR(50),
  ngaysinhNV VARCHAR(50),
  sdtNV VARCHAR(50),
  PRIMARY KEY (idNV)
);

ALTER TABLE nhanvien ADD FULLTEXT(hotenNV);
ALTER TABLE nhanvien ADD FULLTEXT(sdtNV);
-- Tạo bảng khachhang
CREATE TABLE khachhang (
  idKH INT AUTO_INCREMENT ,
  hotenKH VARCHAR(50),
  sdtKH VARCHAR(15),
  diemKM INT,
  PRIMARY KEY (idKH)
);
ALTER TABLE khachhang ADD FULLTEXT(hotenKH);
-- Tạo bảng dichvu
CREATE TABLE dichvu (
  idDV INT AUTO_INCREMENT,
  tenDV VARCHAR(50),
  giaDV INT,
  ghiChu VARCHAR(50),
  PRIMARY KEY (idDV)
);

ALTER TABLE dichvu ADD FULLTEXT ten_dichvu(tenDV);
-- Tạo bảng 'hoadon' để lưu thông tin hóa đơn
CREATE TABLE hoadon (
  idHD INT AUTO_INCREMENT PRIMARY KEY,
  idKH INT,
  ngayMua DATE,
  tongTien INT
);

-- Tạo bảng 'chi_tiet_hoa_don' để lưu thông tin chi tiết hóa đơn
CREATE TABLE chitiethoadon (
  idCTHD INT AUTO_INCREMENT PRIMARY KEY,
  idHD INT,
  idDV INT,
  soLuong INT,
  FOREIGN KEY (idHD) REFERENCES hoadon(idHD),
  FOREIGN KEY (idDV) REFERENCES dichvu(idDV)
);

-- Tạo bảng 'thuoc' để lưu thông tin thuốc
CREATE TABLE thuoc (
  idThuoc INT AUTO_INCREMENT PRIMARY KEY,
  tenThuoc VARCHAR(50),
  giaThuoc INT,
  soLuong INT,
  ghiChu VARCHAR(200)
);

ALTER TABLE thuoc ADD FULLTEXT(tenThuoc);

-- Tạo bảng lichtaikham
CREATE TABLE lichtaikham (
  maKH INT,
  hotenKH VARCHAR(50),
  sdtKH VARCHAR(15),
  ngayTaiKham DATE,
  ketLuanCuabacsi VARCHAR(200)
);

-- Tạo bảng 'chitietthuoc' để lưu thông tin chi tiết thuốc trong hóa đơn
CREATE TABLE chitietthuoc (
  idCTT INT AUTO_INCREMENT PRIMARY KEY,
  idHD INT,
  idThuoc INT,
  soLuong INT,
  FOREIGN KEY (idHD) REFERENCES hoadon(idHD),
  FOREIGN KEY (idThuoc) REFERENCES thuoc(idThuoc)
);