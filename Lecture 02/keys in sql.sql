-- primary key and foreign key

create table Authors(
	author_id int primary key,
    author_name varchar(20)
);

insert into Authors values(2,"Carl Mainson");
insert into Authors values(3,"Premchand");
insert into Authors values(4,"David Goggins");
select * from Authors;

create table books(
	book_id int primary key,
    title varchar(30),
    author_id int,
    -- linking the Author table
    foreign key(author_id) references Authors(author_id)
);

insert into books values(1,"5AM club",1),(2,"Gaban",3);
insert into books values(4,"Can't hurt me",4);
    


select * from books;