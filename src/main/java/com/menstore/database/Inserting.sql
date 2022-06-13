
delete  OrderDetail
delete Orders
delete  Voucher
delete  Users
delete  Product
delete  Category 
Go
	
INSERT INTO Category
VALUES 
('AT',N'Áo Thun'),
('SM',N'Sơ mi'),
('GI',N'Giày'),
('QT',N'Quần Tây'),
('QJ','Quần Jean');
Go


--Product
INSERT INTO Product
VALUES 
-- T-shirt
('AT001_S',N'Áo thun AT001','On',0,199000,280,'S','AT','https://cf.shopee.vn/file/d35ca69fcefcdb1d66562d5222ad82d5'),
('AT001_M',N'Áo thun AT001','On',0,199000,80,'M','AT','https://cf.shopee.vn/file/d35ca69fcefcdb1d66562d5222ad82d5'),
('AT001_L',N'Áo thun AT001','On',0,199000,180,'L','AT','https://cf.shopee.vn/file/d35ca69fcefcdb1d66562d5222ad82d5'),

('AT002_S',N'Áo thun AT002','On',10,186000,30,'S','AT','https://static.dosi-in.com/images/detailed/375/dosiin-ssstutter-ao-phong-ngan-tay-nam-ssstutter-uri-tee-375325375325.jpg'),
('AT002_M',N'Áo thun AT002','On',10,186000,310,'M','AT','https://static.dosi-in.com/images/detailed/375/dosiin-ssstutter-ao-phong-ngan-tay-nam-ssstutter-uri-tee-375325375325.jpg'),
('AT002_L',N'Áo thun AT002','Off',10,186000,0,'L','AT','https://static.dosi-in.com/images/detailed/375/dosiin-ssstutter-ao-phong-ngan-tay-nam-ssstutter-uri-tee-375325375325.jpg'),

('AT003_S',N'Áo thun AT003','Off',5,250000,0,'S','AT','https://product.hstatic.net/200000350749/product/97ed89aa3b84cfda9695_358d7f26782f4cd5a60e7f56a72e3355_master.jpg'),
('AT003_M',N'Áo thun AT003','On',5,250000,140,'M','AT','https://product.hstatic.net/200000350749/product/97ed89aa3b84cfda9695_358d7f26782f4cd5a60e7f56a72e3355_master.jpg'),
('AT003_L',N'Áo thun AT003','On',5,250000,80,'L','AT','https://product.hstatic.net/200000350749/product/97ed89aa3b84cfda9695_358d7f26782f4cd5a60e7f56a72e3355_master.jpg'),

('AT004_S',N'Áo thun AT004','On',25,299000,65,'S','AT','https://img.muji.net/img/item/4550182629163_1260.jpg'),
('AT004_M',N'Áo thun AT004','On',25,299000,152,'M','AT','https://img.muji.net/img/item/4550182629163_1260.jpg'),
('AT004_L',N'Áo thun AT004','On',25,299000,5,'L','AT','https://img.muji.net/img/item/4550182629163_1260.jpg'),

('AT005_S',N'Áo thun AT005','On',0,350000,12,'S','AT','https://vcdn.tikicdn.com/ts/product/04/da/04/707667445f440cb592a035352f253b10.jpg'),
('AT005_M',N'Áo thun AT005','Off',0,350000,0,'M','AT','https://vcdn.tikicdn.com/ts/product/04/da/04/707667445f440cb592a035352f253b10.jpg'),
('AT005_L',N'Áo thun AT005','On',0,350000,28,'L','AT','https://vcdn.tikicdn.com/ts/product/04/da/04/707667445f440cb592a035352f253b10.jpg'),


('AT006_S',N'Áo thun AT006','On',15,220000,130,'S','AT','http://bizweb.dktcdn.net/thumb/grande/100/212/791/products/den-tron-e0107bd2-7e93-4407-97e6-a431963f8d04.jpg?v=1623418670430'),
('AT006_M',N'Áo thun AT006','On',15,220000,332,'M','AT','http://bizweb.dktcdn.net/thumb/grande/100/212/791/products/den-tron-e0107bd2-7e93-4407-97e6-a431963f8d04.jpg?v=1623418670430'),
('AT006_L',N'Áo thun AT006','On',15,220000,30,'L','AT','http://bizweb.dktcdn.net/thumb/grande/100/212/791/products/den-tron-e0107bd2-7e93-4407-97e6-a431963f8d04.jpg?v=1623418670430'),

('AT007_S',N'Áo thun AT007','On',5,298000,65,'S','AT','https://cf.shopee.vn/file/a20af26926705b30d9be0c1f0e92374a_tn'),
('AT007_M',N'Áo thun AT007','On',5,298000,195,'M','AT','https://cf.shopee.vn/file/a20af26926705b30d9be0c1f0e92374a_tn'),
('AT007_L',N'Áo thun AT007','On',5,298000,5,'L','AT','https://cf.shopee.vn/file/a20af26926705b30d9be0c1f0e92374a_tn'),
-- end t-shirt

--Shirt
('SM001_S',N'Sơ Mi SM001','On',20,255000,33,'S','SM','https://cdn2.yame.vn/pimg/so-mi-nam-no-style-td-km18-0018246/ba594ee4-52ea-0900-ef35-001590614731.jpg?w=800'),
('SM001_M',N'Sơ Mi SM001','On',20,255000,27,'M','SM','https://cdn2.yame.vn/pimg/so-mi-nam-no-style-td-km18-0018246/ba594ee4-52ea-0900-ef35-001590614731.jpg?w=800'),
('SM001_L',N'Sơ Mi SM001','On',20,255000,35,'L','SM','https://cdn2.yame.vn/pimg/so-mi-nam-no-style-td-km18-0018246/ba594ee4-52ea-0900-ef35-001590614731.jpg?w=800'),

('SM002_S',N'Sơ Mi SM002','On',0,255000,2,'S','SM','https://cdn2.yame.vn/pimg/so-mi-co-lanh-tu-rong-cotton-on-gian-solid-m25-0020231/dc78101f-fbaf-5200-7b4c-0017f7cea211.jpg?w=800'),
('SM002_M',N'Sơ Mi SM002','On',0,255000,230,'M','SM','https://cdn2.yame.vn/pimg/so-mi-co-lanh-tu-rong-cotton-on-gian-solid-m25-0020231/dc78101f-fbaf-5200-7b4c-0017f7cea211.jpg?w=800'),
('SM002_L',N'Sơ Mi SM002','On',0,255000,13,'L','SM','https://cdn2.yame.vn/pimg/so-mi-co-lanh-tu-rong-cotton-on-gian-solid-m25-0020231/dc78101f-fbaf-5200-7b4c-0017f7cea211.jpg?w=800'),

('SM003_S',N'Sơ mi SM003','On',10,325000,1,'S','SM','https://cdn2.yame.vn/pimg/so-mi-nam-y2010-jean-td-a02-0019385/aa96f3ef-36a0-0701-8e91-0016746d0c60.jpg?w=800'),
('SM003_M',N'Sơ mi SM003','On',10,325000,120,'M','SM','https://cdn2.yame.vn/pimg/so-mi-nam-y2010-jean-td-a02-0019385/aa96f3ef-36a0-0701-8e91-0016746d0c60.jpg?w=800'),
('SM003_L',N'Sơ mi SM003','On',10,325000,68,'L','SM','https://cdn2.yame.vn/pimg/so-mi-nam-y2010-jean-td-a02-0019385/aa96f3ef-36a0-0701-8e91-0016746d0c60.jpg?w=800'),

('SM004_S',N'Sơ mi SM004','On',0,285000,20,'S','SM','https://cdn2.yame.vn/pimg/so-mi-td-tc-on-gian-solid-m13-0020171/ee312901-a06e-a000-f297-0017a488e8d4.jpg?w=800'),
('SM004_M',N'Sơ mi SM004','Off',0,285000,0,'M','SM','https://cdn2.yame.vn/pimg/so-mi-td-tc-on-gian-solid-m13-0020171/ee312901-a06e-a000-f297-0017a488e8d4.jpg?w=800'),
('SM004_L',N'Sơ mi SM004','Off',0,285000,0,'L','SM','https://cdn2.yame.vn/pimg/so-mi-td-tc-on-gian-solid-m13-0020171/ee312901-a06e-a000-f297-0017a488e8d4.jpg?w=800'),

('SM005_S',N'Sơ mi SM005','On',0,240000,130,'S','SM','https://cdn2.yame.vn/pimg/so-mi-tay-dai-on-gian-y-nguyen-ban-ver7-0020363/b9aab8f4-e7eb-6301-f7ff-0018a6ed28d2.jpg?w=800'),
('SM005_M',N'Sơ mi SM005','On',0,240000,30,'M','SM','https://cdn2.yame.vn/pimg/so-mi-tay-dai-on-gian-y-nguyen-ban-ver7-0020363/b9aab8f4-e7eb-6301-f7ff-0018a6ed28d2.jpg?w=800'),
('SM005_L',N'Sơ mi SM005','On',0,240000,20,'L','SM','https://cdn2.yame.vn/pimg/so-mi-tay-dai-on-gian-y-nguyen-ban-ver7-0020363/b9aab8f4-e7eb-6301-f7ff-0018a6ed28d2.jpg?w=800'),

('SM006_S',N'Sơ mi SM006','On',5,285000,220,'S','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m17-0020176/43bad3bb-17f5-7300-f315-00179fa04a77.jpg?w=800'),
('SM006_M',N'Sơ mi SM006','On',5,285000,120,'M','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m17-0020176/43bad3bb-17f5-7300-f315-00179fa04a77.jpg?w=800'),
('SM006_L',N'Sơ mi SM006','On',5,285000,60,'L','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m17-0020176/43bad3bb-17f5-7300-f315-00179fa04a77.jpg?w=800'),

('SM007_S',N'Sơ mi SM007','On',10,250000,80,'S','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m23-0020219/3ba372a0-b88d-7900-f0f4-0017f7dcaddb.jpg?w=800'),
('SM007_M',N'Sơ mi SM007','Off',10,250000,0,'M','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m23-0020219/3ba372a0-b88d-7900-f0f4-0017f7dcaddb.jpg?w=800'),
('SM007_L',N'Sơ mi SM007','On',10,250000,120,'L','SM','https://cdn2.yame.vn/pimg/so-mi-td-r-on-gian-solid-m23-0020219/3ba372a0-b88d-7900-f0f4-0017f7dcaddb.jpg?w=800'),

--Shoes
('GI001_39',N'Giày nam GI001','On',30,2990000,40,'39','GI','https://product.hstatic.net/1000328498/product/751_767_5cc8a1e852bb49448081646e095b0d8d_2b7c3313111e48d8990dbc91a88f17d5_large.jpg'),
('GI001_40',N'Giày nam GI001','On',30,2990000,35,'40','GI','https://product.hstatic.net/1000328498/product/751_767_5cc8a1e852bb49448081646e095b0d8d_2b7c3313111e48d8990dbc91a88f17d5_large.jpg'),
('GI001_41',N'Giày nam GI001','On',30,2990000,42,'41','GI','https://product.hstatic.net/1000328498/product/751_767_5cc8a1e852bb49448081646e095b0d8d_2b7c3313111e48d8990dbc91a88f17d5_large.jpg'),
('GI001_42',N'Giày nam GI001','On',30,2990000,50,'42','GI','https://product.hstatic.net/1000328498/product/751_767_5cc8a1e852bb49448081646e095b0d8d_2b7c3313111e48d8990dbc91a88f17d5_large.jpg'),
('GI001_43',N'Giày nam GI001','On',30,2990000,25,'43','GI','https://product.hstatic.net/1000328498/product/751_767_5cc8a1e852bb49448081646e095b0d8d_2b7c3313111e48d8990dbc91a88f17d5_large.jpg'),

('GI002_39',N'Giày nam GI002','On',70,4990000,65,'39','GI','https://product.hstatic.net/1000328498/product/347_blk20_f3e57bd3283a4869a63673b746bfea75_large.jpg'),
('GI002_40',N'Giày nam GI002','Off',70,4990000,0,'40','GI','https://product.hstatic.net/1000328498/product/347_blk20_f3e57bd3283a4869a63673b746bfea75_large.jpg'),
('GI002_41',N'Giày nam GI002','On',70,4990000,28,'41','GI','https://product.hstatic.net/1000328498/product/347_blk20_f3e57bd3283a4869a63673b746bfea75_large.jpg'),
('GI002_42',N'Giày nam GI002','Off',70,4990000,0,'42','GI','https://product.hstatic.net/1000328498/product/347_blk20_f3e57bd3283a4869a63673b746bfea75_large.jpg'),
('GI002_43',N'Giày nam GI002','On',70,4990000,45,'43','GI','https://product.hstatic.net/1000328498/product/347_blk20_f3e57bd3283a4869a63673b746bfea75_large.jpg'),

('GI003_39',N'Giày nam GI003','Off',30,5990000,0,'39','GI','https://product.hstatic.net/1000328498/product/pcmfwle_331__3__4408da0a81eb4b0187238fdace8fbcc9_large.jpg'),
('GI003_40',N'Giày nam GI003','Off',30,5990000,0,'40','GI','https://product.hstatic.net/1000328498/product/pcmfwle_331__3__4408da0a81eb4b0187238fdace8fbcc9_large.jpg'),
('GI003_41',N'Giày nam GI003','On',30,5990000,85,'41','GI','https://product.hstatic.net/1000328498/product/pcmfwle_331__3__4408da0a81eb4b0187238fdace8fbcc9_large.jpg'),
('GI003_42',N'Giày nam GI003','On',30,5990000,123,'42','GI','https://product.hstatic.net/1000328498/product/pcmfwle_331__3__4408da0a81eb4b0187238fdace8fbcc9_large.jpg'),
('GI003_43',N'Giày nam GI003','On',30,5990000,37,'43','GI','https://product.hstatic.net/1000328498/product/pcmfwle_331__3__4408da0a81eb4b0187238fdace8fbcc9_large.jpg'),

('GI004_39',N'Giày nam GI004','On',0,2500000,120,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8787a0066e664f2abff6ad0500e56a40_9366/Giay_Stan_Smith_trang_GY5695_01_standard.jpg'),
('GI004_40',N'Giày nam GI004','On',0,2500000,174,'40','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8787a0066e664f2abff6ad0500e56a40_9366/Giay_Stan_Smith_trang_GY5695_01_standard.jpg'),
('GI004_41',N'Giày nam GI004','On',0,2500000,221,'41','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8787a0066e664f2abff6ad0500e56a40_9366/Giay_Stan_Smith_trang_GY5695_01_standard.jpg'),
('GI004_42',N'Giày nam GI004','On',0,2500000,84,'42','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8787a0066e664f2abff6ad0500e56a40_9366/Giay_Stan_Smith_trang_GY5695_01_standard.jpg'),
('GI004_43',N'Giày nam GI004','On',0,2500000,55,'43','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8787a0066e664f2abff6ad0500e56a40_9366/Giay_Stan_Smith_trang_GY5695_01_standard.jpg'),

('GI005_39',N'Giày nam GI005','On',0,4800000,35,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f09239b4c0c4d9cba74add401178b96_9366/Giay_Forum_Premiere_trang_GY5800_01_standard.jpg'),
('GI005_40',N'Giày nam GI005','On',0,4800000,11,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f09239b4c0c4d9cba74add401178b96_9366/Giay_Forum_Premiere_trang_GY5800_01_standard.jpg'),
('GI005_41',N'Giày nam GI005','Off',0,4800000,0,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f09239b4c0c4d9cba74add401178b96_9366/Giay_Forum_Premiere_trang_GY5800_01_standard.jpg'),
('GI005_42',N'Giày nam GI005','On',0,4800000,84,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f09239b4c0c4d9cba74add401178b96_9366/Giay_Forum_Premiere_trang_GY5800_01_standard.jpg'),
('GI005_43',N'Giày nam GI005','Off',0,4800000,0,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f09239b4c0c4d9cba74add401178b96_9366/Giay_Forum_Premiere_trang_GY5800_01_standard.jpg'),

('GI006_39',N'Giày nam GI006','On',0,2500000,68,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg'),
('GI006_40',N'Giày nam GI006','On',0,2500000,28,'40','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg'),
('GI006_41',N'Giày nam GI006','On',0,2500000,38,'41','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg'),
('GI006_42',N'Giày nam GI006','On',0,2500000,48,'42','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg'),
('GI006_43',N'Giày nam GI006','On',0,2500000,58,'43','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg'),

('GI007_39',N'Giày nam GI007','On',0,2300000,55,'39','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Giay_Response_Super_2.0_trang_GX8264_01_standard.jpg'),
('GI007_40',N'Giày nam GI007','On',0,2300000,65,'40','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Giay_Response_Super_2.0_trang_GX8264_01_standard.jpg'),
('GI007_41',N'Giày nam GI007','On',0,2300000,77,'41','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Giay_Response_Super_2.0_trang_GX8264_01_standard.jpg'),
('GI007_42',N'Giày nam GI007','On',0,2300000,84,'42','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Giay_Response_Super_2.0_trang_GX8264_01_standard.jpg'),
('GI007_43',N'Giày nam GI007','On',0,2300000,20,'43','GI','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Giay_Response_Super_2.0_trang_GX8264_01_standard.jpg'),

--Pants
('QT001_S',N'Quần tây QT001','On',10,520000,120,'S','QT','https://assetsprx.matchesfashion.com/img/product/1300/1427441_6.jpg'),
('QT001_M',N'Quần tây QT001','On',10,520000,253,'M','QT','https://assetsprx.matchesfashion.com/img/product/1300/1427441_6.jpg'),
('QT001_L',N'Quần tây QT001','On',10,520000,28,'L','QT','https://assetsprx.matchesfashion.com/img/product/1300/1427441_6.jpg'),

('QT002_S',N'Quần tây QT002','On',0,399000,95,'S','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR0XN-wYpcayXEjG8R0epnB4tfrORC0ybFu49dK851HnPqIEya7'),
('QT002_M',N'Quần tây QT002','On',0,399000,104,'M','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR0XN-wYpcayXEjG8R0epnB4tfrORC0ybFu49dK851HnPqIEya7'),
('QT002_L',N'Quần tây QT002','On',0,399000,65,'L','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR0XN-wYpcayXEjG8R0epnB4tfrORC0ybFu49dK851HnPqIEya7'),
	
('QT003_S',N'Quần tây QT003','On',0,499000,345,'S','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQPaFZZgvBXx6l-__cBUyaYNVYiLLGseg-s9VRYCEr2DyiQv5Ju'),
('QT003_M',N'Quần tây QT003','On',0,499000,261,'M','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQPaFZZgvBXx6l-__cBUyaYNVYiLLGseg-s9VRYCEr2DyiQv5Ju'),
('QT003_L',N'Quần tây QT003','On',0,499000,175,'L','QT','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQPaFZZgvBXx6l-__cBUyaYNVYiLLGseg-s9VRYCEr2DyiQv5Ju'),

('QT004_S',N'Quần tầy QT004','On',0,560000,153,'S','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRv3m2wB-pDeu_IyQOO_bvah58RnOSNwLNw6_7RusPzZZ35u1SL'),
('QT004_M',N'Quần tầy QT004','On',0,560000,203,'M','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRv3m2wB-pDeu_IyQOO_bvah58RnOSNwLNw6_7RusPzZZ35u1SL'),
('QT004_L',N'Quần tầy QT004','On',0,560000,86,'L','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRv3m2wB-pDeu_IyQOO_bvah58RnOSNwLNw6_7RusPzZZ35u1SL'),

('QT005_S',N'Quần Jogger QT005','On',0,389000,220,'S','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTNQNZOUp0lh7BssVlFQhebpxWWhOs5L706dNqM4eSomD2_lcDq'),
('QT005_M',N'Quần Jogger QT005','On',0,389000,124,'M','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTNQNZOUp0lh7BssVlFQhebpxWWhOs5L706dNqM4eSomD2_lcDq'),
('QT005_L',N'Quần Jogger QT005','On',0,389000,82,'L','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTNQNZOUp0lh7BssVlFQhebpxWWhOs5L706dNqM4eSomD2_lcDq'),

('QT006_S',N'Quần Tây QT006','On',10,420000,143,'S','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSCTpZP7PCKQe0YCS8eKRFYkAhuII8oCE2WPiWWcWngK7rbKaTw'),
('QT006_M',N'Quần Tây QT006','On',10,420000,93,'M','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSCTpZP7PCKQe0YCS8eKRFYkAhuII8oCE2WPiWWcWngK7rbKaTw'),
('QT006_L',N'Quần Tây QT006','On',10,420000,53,'L','QT','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSCTpZP7PCKQe0YCS8eKRFYkAhuII8oCE2WPiWWcWngK7rbKaTw'),

--Jeans
('QJ001_S',N'Quần Jeans QJ001','On',0,899000,58,'S','QJ','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtS25gpfv3r-OHnGFzf5RxNS3LwKQ-fLhXvqFJ-eJJScRg7Szz'),
('QJ001_M',N'Quần Jeans QJ001','On',0,899000,83,'M','QJ','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtS25gpfv3r-OHnGFzf5RxNS3LwKQ-fLhXvqFJ-eJJScRg7Szz'),
('QJ001_L',N'Quần Jeans QJ001','On',0,899000,91,'L','QJ','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtS25gpfv3r-OHnGFzf5RxNS3LwKQ-fLhXvqFJ-eJJScRg7Szz'),

('QJ002_S',N'Quần Jeans QJ002','On',0,699000,170,'S','QJ','https://i.pinimg.com/474x/39/06/61/390661b014c03e49569d58f594dc0cf6--ripped-jeans-men-torn-jeans.jpg'),
('QJ002_M',N'Quần Jeans QJ002','On',0,699000,214,'M','QJ','https://i.pinimg.com/474x/39/06/61/390661b014c03e49569d58f594dc0cf6--ripped-jeans-men-torn-jeans.jpg'),
('QJ002_L',N'Quần Jeans QJ002','On',0,699000,87,'L','QJ','https://i.pinimg.com/474x/39/06/61/390661b014c03e49569d58f594dc0cf6--ripped-jeans-men-torn-jeans.jpg'),

('QJ003_S',N'Quần Jeans QJ003','On',15,1200000,80,'S','QJ','https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/2290020/2018/2/7/11518001291442-HIGHLANDER-Men-Black-Slim-Fit-Mid-Rise-Clean-Look-Stretchable-Jeans-8231518001291181-1.jpg'),
('QJ003_M',N'Quần Jeans QJ003','On',15,1200000,125,'M','QJ','https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/2290020/2018/2/7/11518001291442-HIGHLANDER-Men-Black-Slim-Fit-Mid-Rise-Clean-Look-Stretchable-Jeans-8231518001291181-1.jpg'),
('QJ003_L',N'Quần Jeans QJ003','On',15,1200000,95,'L','QJ','https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/2290020/2018/2/7/11518001291442-HIGHLANDER-Men-Black-Slim-Fit-Mid-Rise-Clean-Look-Stretchable-Jeans-8231518001291181-1.jpg'),

('QJ004_S',N'Quần Jeans QJ004','Off',0,899000,0,'S','QJ','https://i.pinimg.com/736x/f6/f4/51/f6f451affad86a4644d37cb298ea90cc.jpg'),
('QJ004_M',N'Quần Jeans QJ004','On',0,899000,120,'M','QJ','https://i.pinimg.com/736x/f6/f4/51/f6f451affad86a4644d37cb298ea90cc.jpg'),
('QJ004_L',N'Quần Jeans QJ004','On',0,899000,70,'L','QJ','https://i.pinimg.com/736x/f6/f4/51/f6f451affad86a4644d37cb298ea90cc.jpg'),

('QJ005_S',N'Quần Jeans QJ005','On',20,1400000,50,'S','QJ','https://5.imimg.com/data5/WN/SF/MY-23322128/jn6-500x500.jpg'),
('QJ005_M',N'Quần Jeans QJ005','On',20,1400000,120,'M','QJ','https://5.imimg.com/data5/WN/SF/MY-23322128/jn6-500x500.jpg'),
('QJ005_L',N'Quần Jeans QJ005','Off',20,1400000,0,'L','QJ','https://5.imimg.com/data5/WN/SF/MY-23322128/jn6-500x500.jpg')
go

INSERT INTO Voucher
VALUES('TetHoliday', 10,'2022-2-10',200000,500000,N'Giảm giá nhân dịp năm mới')
GO

INSERT INTO Users
VALUES ('US0001','Quang','Quang','123','User',0,'123 Nguyen Hue',0154712134),
('US0002','Giang','Giang','123','admin',0,'123 Nguyen Hue',0154712134)
go

INSERT INTO Orders
VALUES ('HD0001',500000,'2022-1-15',1000000,'','Done','US0001','TetHoliday')
go

INSERT INTO OrderDetail
VALUES 
('HD0001','AT003_M',199000,2),
('HD0001','GI002_40',299000,1)
Go