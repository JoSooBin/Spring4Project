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

