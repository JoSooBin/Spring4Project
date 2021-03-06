-- member
create table Member(
    mno int primary key auto_increment,
    name varchar(20) not null ,
    jumin varchar(14) not null ,
    userid varchar(16) not null ,
    passwd varchar(16) not null ,
    zipcode varchar(7) not null ,
    addr1 varchar(50) not null ,
    addr2 varchar(50) not null ,
    email varchar(50) not null ,
    phone varchar(13) not null ,
    redate timestamp default current_timestamp
);

-- CRUD
insert into Member(name, jumin, userid, passwd, zipcode,addr1, addr2, email, phone)
value (?,?,?,?,?,?,?,?,?);

-- Board
create table Board(
    bno int primary key auto_increment,
    title varchar(100) not null ,
    userid varchar(16) not null ,
    regdate timestamp default current_timestamp,
    views int default 0,
    thumbs int default 0,
    contents text not null
);

-- CRUD
insert into Board(title, userid, contents) value ('제목이 곧 내용','jsb','무엇을 쓸까요');

select bno,title,userid,regdate,thumbs,views from Board
order by bno desc;

select * from Board where bno = 1;

update Board
set title = '~', contents = '~', regdate = current_timestamp()
where bno = 1;

delete from Board where bno = 1;

-- reply
create table Reply (
    rno int primary key auto_increment,
    cno int not null ,
    bno int not null ,
    reply text not null ,
    userid varchar(16) not null ,
    regdate timestamp default current_timestamp
);

alter table Reply add constraint fk_mr foreign key (userid) references Member(userid);
-- 비식별키를 이용한 외래키

alter table Reply add constraint fk_br foreign key (bno) references Board(bno);
-- 식별키를 이용한 외리캐

-- insert
insert into Reply (cno, bno, userid, reply) values(1, 222, 'user1', '오늘은 날씨가..');
insert into Reply (cno, bno, userid, reply) values(2, 222, 'user2', '점심메뉴는... ');
insert into Reply (cno, bno, userid, reply) values(3, 222, 'user3', '월요병이 도졌나....');
insert into Reply (cno, bno, userid, reply) values(1, 222, 'user10', '비올꺼 같아요');
insert into Reply (cno, bno, userid, reply) values(5, 222, 'user25', '블라블라...');
insert into Reply (cno, bno, userid, reply) values(1, 222, 'user9', '블라블라블라블라...');
insert into Reply (cno, bno, userid, reply) values(7, 222, 'user23', '블라블라블라블라블라블라...');

-- select
select * from Reply where bno = 222 order by cno;

-- 데이터 생성시 반영될 auto_increment값 조회
select auto_increment from information_schema.TABLES where TABLE_NAME = 'Reply';

-- pds v1
create table Pds (
                     pno int primary key auto_increment,
                     title varchar(100) not null ,
                     userid varchar(16) not null ,
                     regdate timestamp default current_timestamp,
                     views int default 0,
                     thumbs int default 0,
                     contents text not null,
                     fname1 varchar(50),
                     fname2 varchar(50),
                     fname3 varchar(50),
                     fsize1 varchar(5),
                     fsize2 varchar(5),
                     fsize3 varchar(5),
                     ftype1 varchar(5),
                     ftype2 varchar(5),
                     ftype3 varchar(5),
                     fdown1 int default 0,
                     fdown2 int default 0,
                     fdown3 int default 0
);
-- CRUD
insert into Pds(title, userid, contents, fname1, fname2, fname3, fsize1, fsize2, fsize3, ftype1, ftype2, ftype3)
values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);

select pno,title,userid,regdate,thumbs,views from Pds order by pno desc ;

select * from Pds where pno=?;

-- pds v2
create table Pds (
                     pno int primary key auto_increment,
                     title varchar(100) not null ,
                     userid varchar(16) not null ,
                     regdate timestamp default current_timestamp,
                     views int default 0,
                     thumbs int default 0,
                     contents text not null,
                     fname1 varchar(50),
                     fname2 varchar(50),
                     fname3 varchar(50),
                     fsize1 varchar(5),
                     fsize2 varchar(5),
                     fsize3 varchar(5),
                     ftype1 varchar(5),
                     ftype2 varchar(5),
                     ftype3 varchar(5),
                     fdown1 int default 0,
                     fdown2 int default 0,
                     fdown3 int default 0,
                     uuid varchar(20)
);

select fname1, uuid from Pds where pno=2;

-- gallery
create table Gallery (
                     gno int primary key auto_increment,
                     title varchar(100) not null ,
                     userid varchar(16) not null ,
                     regdate timestamp default current_timestamp,
                     views int default 0,
                     thumbs int default 0,
                     contents text not null,
                     fnames varchar(1000),
                     fsizes varchar(1000),
                     uuid varchar(20)
);

-- CRUD
insert into Gallery( title, userid, contents, fnames, fsizes, uuid)
values ();

select gno, title, userid, regdate, views, thumbs from Gallery
order by gno desc ;

select * from Gallery where gno = ?;