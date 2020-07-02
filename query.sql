// Modul 1

1.	Sqlplus system
2.	create tablespace Athallariq_06851
2  datafile 'D:\PRAKTIKUM BASDAT\Athallariq_06851.dbf'
  	3  size 100M;
3.	create user Athallariqr_06851
2  IDENTIFIED BY Athal
3  DEFAULT TABLESPACE       Athallariq_06851
4  QUOTA 100M ON Athallariq_06851;
4.	SQL> create table Pendaftaran
  2  (
  3  id_user INTEGER not null,
  4  nama VARCHAR(100),
  5  email VARCHAR(100),
  6  password VARCHAR(50),
  7  alamat VARCHAR(100),
  8  no_telfon VARCHAR(100)
  9  );

5.	SQL> create table User_ (catatan: saya kasih tanda _ karena tdk bisa create kalau User saja)
  2  (
  3  jabatan_user VARCHAR(100),
  4  tgl_pendaftaran DATE,
  5  status VARCHAR(100)
  6  );

6.	SQL> create table Katalog
  2  (
  3  id_katalog INTEGER not null,
  4  jenis_seragam VARCHAR(100),
  5  bahan VARCHAR(100),
  6  ukuran_lengan VARCHAR(100),
  7  model_jilbab VARCHAR(100),
  8  harga_satuan INTEGER
  9  );

7.	SQL> create table Pemesanan
2  (
  	3  id_pemesanan INTEGER not null
4  tanggal_pemesanan VARCHAR(100)
  	5  );
7.	SQL> create table Pembayaran
2  (
  	3  id_pembayaran INTEGER not null,
	4. jenis_seragam VARCHAR(100),
	5. jenis_pembayaran VARCHAR(100),
	6. total_harga INTEGER
	7. );
8.	SQL> create table Struk
2  (
  	3  id_struk INTEGER not null,
	4. jumlah_podruk INTEGER,
	5. tgl_pengiriman DATE
	6. );
	
9.	SQL> create table Pengiriman
2  (
  	3  id_pengiriman INTEGER not null
4  alamat VARCHAR(100)
  	5  estimasi DATE
	6  );


1.	SQL> alter table User_
2  RENAME COLUMN status to status_06851;

2.	SQL> alter table Pendaftaran
2  add constraint Pendaftaran_unique UNIQUE (email);

3.	SQL> alter table Struk
2	 modify(jumlah_produk NUMBER(10));

4.	SQL> create sequence id_pemesanan
2  minvalue 1
  	3  maxvalue 9999
	4. start with 1
	5. increment by 1
	6. cache 20;
5.	SQL> alter table Pembayaran
  	2  add constraint FK_id_pemesanan    FOREIGN KEY (Id_pemesanan)
3	 REFERENCES Pemesanan(id_pemesanan);

// Modul 2

1.	A. insert into katalog (Id_katalog, jenis_seragam,bahan,ukuran_lengan,model_jilbab,harga_satuan) values (1,’A’,’A’, ‘1 cm’, ‘A’,1000);

insert into katalog (Id_katalog, jenis_seragam,bahan,ukuran_lengan,model_jilbab,harga_satuan) values (2,’B’,’B’, ‘2 cm’, ‘B’,2000); 

b.	insert all 
insert into katalog (Id_katalog, jenis_seragam,bahan,ukuran_lengan,model_jilbab,harga_satuan) values (3,’C’,’C’, ‘3 cm’, ‘B’,3000);

insert into katalog (Id_katalog, jenis_seragam,bahan,ukuran_lengan,model_jilbab,harga_satuan) values (4,’D’,’D’, ‘4 cm’, ‘D’,4000);

insert into katalog (Id_katalog, jenis_seragam,bahan,ukuran_lengan,model_jilbab,harga_satuan) values (5,’E’,’E’, ‘5 cm’, ‘E’,5000); 

select 1 from dual;

c.	SQL> insert into katalog values (id_pemesanan.nextval, ’E’,’E’, ‘5 cm’, ‘E’,5000);


 2.a. update katalog set jenis_seragam='A1';
  b. update katalog set jenis_seragam='B1' where id_katalog=3;
  c. update pendaftaran set alamat='Jl.Keju' where alamat like '%Jeruk';
  d. from pendaftaran where alamat='Jl.Keju' and email='athallariqr12@gmail.com' or password='Athal123';


  
 


3. delete from pendaftaran where alamat='Jl.Keju' and email='athallariqr12@gmail.com' or password='Athal123';
     delete from pendaftaran where alamat='Jl.Singkong' and email='rigi12@gmail.com' or password='Rigi123';

     delete from pendaftaran where alamat='Jl.Apel' and email='mus12@gmail.com' or password='Mus123';

4. 
  A. savepoint sblm_hapus;
  B. commit;
  C. rollback;


5. A. SQL> select bahan from katalog group by bahan;   
   B. select bahan from katalog order by bahan ASC;


Modul 3

insert all
  2  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (1, 10, to_date('01/01/2020','dd/mm/yyyy'))
  3  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (2, 20, to_date('02/02/2020','dd/mm/yyyy'))
  4  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (3, 30, to_date('03/03/2020','dd/mm/yyyy'))
  5  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (4, 40, to_date('04/04/2020','dd/mm/yyyy'))
  6  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (5, 50, to_date('05/05/2020','dd/mm/yyyy'))
  7  select 1 from dual;

insert all
  2  into pendaftaran (id_user, nama, password, alamat, email) values (1, 'A', 'A', 'Jl.Jeruk', 'A@gmail.com')
  3  into pendaftaran (id_user, nama, password, alamat, email) values (2, 'B', 'B', 'Jl.Mangga', 'B@gmail.com')
  4  into pendaftaran (id_user, nama, password, alamat, email) values (3, 'C', 'C', 'Jl.Apel', 'C@gmail.com')
  5  into pendaftaran (id_user, nama, password, alamat, email) values (4, 'D', 'D', 'Jl.Hati', 'D@gmail.com')
  6  into pendaftaran (id_user, nama, password, alamat, email) values (5, 'E', 'E', 'Jl.Ginjal', 'E@gmail.com')
  7  select 1 from dual;

insert all
  2  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('01/01/2020','dd/mm/yyyy'), 'Aktif', 1)
  3  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('02/02/2020','dd/mm/yyyy'), 'Aktif', 2)
  4  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('03/03/2020','dd/mm/yyyy'), 'Non-Aktif', 3)
  5  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('04/04/2020','dd/mm/yyyy'), 'Aktif', 4)
  6  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('05/05/2020','dd/mm/yyyy'), 'Aktif', 5)
  7  select 1 from dual;

insert all
  2  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (1, to_date('01/01/2020','dd/mm/yyyy'), 1)
  3  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (2, to_date('02/02/2020','dd/mm/yyyy'), 2)
  4  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (3, to_date('03/03/2020','dd/mm/yyyy'), 3)
  5  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (4, to_date('04/04/2020','dd/mm/yyyy'), 4)
  6  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (5, to_date('05/05/2020','dd/mm/yyyy'), 5)
  7  select 1 from dual;


insert all
  2  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('01/01/2020','dd/mm/yyyy'), 'Aktif', 1)
  3  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('02/02/2020','dd/mm/yyyy'), 'Aktif', 2)
  4  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('03/03/2020','dd/mm/yyyy'), 'Non-Aktif', 3)
  5  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('04/04/2020','dd/mm/yyyy'), 'Aktif', 4)
  6  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('05/05/2020','dd/mm/yyyy'), 'Aktif', 5)
  7  select 1 from dual;

insert all
  2  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (1, to_date('01/01/2020','dd/mm/yyyy'), 1)
  3  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (2, to_date('02/02/2020','dd/mm/yyyy'), 2)
  4  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (3, to_date('03/03/2020','dd/mm/yyyy'), 3)
  5  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (4, to_date('04/04/2020','dd/mm/yyyy'), 4)
  6  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (5, to_date('05/05/2020','dd/mm/yyyy'), 5)
  7  select 1 from dual;

2.a. select min(jumlah_produk), max(jumlah_produk) from struk;

  b. select jumlah_produk, count(jumlah_produk) as Struk
  2  from struk where jumlah_produk = 10 OR jumlah_produk = 20 group by jumlah_produk;

  c. SELECT jumlah_produk, SUM(jumlah_produk) as Struk FROM Struk
  2  where jumlah_produk = 10 group by jumlah_produk;

  d. select SUM(jumlah_produk) as Struk FROM Struk
 avg(jumlah_produk) as jumlah_produk from Struk;

 
 b. select jumlah_produk, count(jumlah_produk) as Struk
  2  from struk where jumlah_produk = 10 OR jumlah_produk = 20 group by jumlah_produk;


 
c. SELECT jumlah_produk, SUM(jumlah_produk) as Struk FROM Struk
  2  where jumlah_produk = 10 group by jumlah_produk;

  d. select SUM(jumlah_produk) as Struk FROM Struk
 avg(jumlah_produk) as jumlah_produk from Struk;

 


3. a. select * from struk
  2  where jumlah_produk=(select min(jumlah_produk) from struk) or jumlah_produk=(select max(jumlah_produk) from struk);

  b. SQL> select jumlah_produk,(select count(jumlah_produk)
  2  from Struk where jumlah_produk < 50 AND id_struk < 5)
  3  as banyak from struk;


  c. SELECT jumlah_produk, SUM(jumlah_produk) as Struk, AVG(jumlah_produk) as Struk FROM Struk
  2  where jumlah_produk=10 group by jumlah_produk;

  d. SELECT jumlah_produk, SUM(jumlah_produk) as Struk, AVG(jumlah_produk) as Struk FROM Struk
  2  where jumlah_produk=10 group by jumlah_produk;

  e. SELECT jumlah_produk, SUM(jumlah_produk) as Struk, AVG(jumlah_produk) as Struk FROM Struk
  2  where jumlah_produk=10 group by jumlah_produk;

f. select * from struk
  2  where jumlah_produk > (select avg(jumlah_produk) from struk
  3  where id_struk < (select max(id_struk) from struk));


g. select * from struk
  2  where jumlah_produk > (select avg(jumlah_produk) from struk
  3  where id_struk < (select max(id_struk) from struk));


Modul 4

insert all
  2  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (1, 10, to_date('01/01/2020','dd/mm/yyyy'))
  3  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (2, 20, to_date('02/02/2020','dd/mm/yyyy'))
  4  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (3, 30, to_date('03/03/2020','dd/mm/yyyy'))
  5  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (4, 40, to_date('04/04/2020','dd/mm/yyyy'))
  6  into struk (id_struk, jumlah_produk, tgl_pengiriman) values (5, 50, to_date('05/05/2020','dd/mm/yyyy'))
  7  select 1 from dual;

insert all
  2  into pendaftaran (id_user, nama, password, alamat, email) values (1, 'A', 'A', 'Jl.Jeruk', 'A@gmail.com')
  3  into pendaftaran (id_user, nama, password, alamat, email) values (2, 'B', 'B', 'Jl.Mangga', 'B@gmail.com')
  4  into pendaftaran (id_user, nama, password, alamat, email) values (3, 'C', 'C', 'Jl.Apel', 'C@gmail.com')
  5  into pendaftaran (id_user, nama, password, alamat, email) values (4, 'D', 'D', 'Jl.Hati', 'D@gmail.com')
  6  into pendaftaran (id_user, nama, password, alamat, email) values (5, 'E', 'E', 'Jl.Ginjal', 'E@gmail.com')
  7  select 1 from dual;

insert all
  2  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('01/01/2020','dd/mm/yyyy'), 'Aktif', 1)
  3  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('02/02/2020','dd/mm/yyyy'), 'Aktif', 2)
  4  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('03/03/2020','dd/mm/yyyy'), 'Non-Aktif', 3)
  5  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('04/04/2020','dd/mm/yyyy'), 'Aktif', 4)
  6  into user_ (jabatan_user, tgl_pendaftaran, status_06851, id_user) values ('Member', to_date('05/05/2020','dd/mm/yyyy'), 'Aktif', 5)
  7  select 1 from dual;

insert all
  2  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (1, to_date('01/01/2020','dd/mm/yyyy'), 1)
  3  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (2, to_date('02/02/2020','dd/mm/yyyy'), 2)
  4  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (3, to_date('03/03/2020','dd/mm/yyyy'), 3)
  5  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (4, to_date('04/04/2020','dd/mm/yyyy'), 4)
  6  into pemesanan (id_pemesanan, tanggal_pemesanan, id_katalog) values (5, to_date('05/05/2020','dd/mm/yyyy'), 5)
  7  select 1 from dual;

select a.tanggal_pemesanan,b.harga_satuan
  2  from pemesanan a join katalog b
  3  on a.id_katalog = b.id_katalog
  4  where rownum <= 10;

select a.tanggal_pemesanan, b.harga_satuan, c.nama
  2  from pemesanan a left join katalog b
  3  on a.id_katalog = b.id_katalog
  4  left join pendaftaran c
  5  on a.id_katalog = c.id_user
  6  where id_user <= (select avg(id_user) from pendaftaran);

select a.tanggal_pemesanan, b.harga_satuan, c.nama
  2  from pemesanan a right join katalog b
  3  on a.id_katalog = b.id_katalog
  4  right join pendaftaran c
  5  on a.id_katalog = c.id_user
  6  where id_user <= (select count(id_user) from pendaftaran where id_user < (select max(id_user) from pendaftaran) and id_user > (select min(id_user) from pendaftaran));


create view list_katalog as select * from katalog;
View created.

insert into list_katalog values (22,'A2','F', '6 cm', 'F', 6000);

create view list_join as
  2  select a. select a.tanggal_pemesanan,a.id_pemesanan,b.harga_satuan,b.bahan
  3  from pemesanan a join katalog b
  4  on a.id_katalog = b.id_katalog
  5  where rownum <=10;

create view list_detail2 as
  2  select a.id_pemesanan, b.harga_satuan, c.nama
  3  from pemesanan a left join katalog b
  4  on a.id_katalog = b.id_katalog
  5  left join pendaftaran c
  6  on a.id_katalog = c.id_user
  7  where id_user <= (select avg(id_user) from pendaftaran);


create view list_transaksi2nd as 
select a.tanggal_pemesanan, b.harga_satuan, c.nama
  2  from pemesanan a right join katalog b
  3  on a.id_katalog = b.id_katalog
  4  right join pendaftaran c
  5  on a.id_katalog = c.id_user
  6  where id_user <= (select count(id_user) from pendaftaran where id_user < (select max(id_user) from pendaftaran) and id_user > (select min(id_user) from pendaftaran));

SQL> select column_name, updatable, insertable, deletable FROM USER_UPDATABLE_COLUMNS WHERE table_name = 'LIST_JOIN1';

SQL> select column_name, updatable, insertable, deletable FROM USER_UPDATABLE_COLUMNS WHERE table_name = 'LIST_DETAIL2';

SQL> select column_name, updatable, insertable, deletable FROM USER_UPDATABLE_COLUMNS WHERE table_name = 'LIST_DETAIL3';

  
 



 


  
 



  
 

 
 

