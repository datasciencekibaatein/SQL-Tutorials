create table demo_table(
	user_id int primary key, -- -2b ti 2b
    -- numeric
    age tinyint, -- -128 to 127
    experience smallint, -- -32768 to 32767,
    salary decimal(10,2), -- 
    rating float, -- 
    
    -- string type
    full_name varchar(30),
    bio text,
    geneder enum('Male','Female','Others'),
    skills set("Python","SQL","DSA"),
    
    -- date & time
    birth_date Date,
    login_time time,
    registeredAt datetime,
    last_update timestamp,
    passing_year year,
    
    -- boolean
    is_active boolean,
    
    -- binary data
    profile_picture BLOB,
    
    -- json
    extra_detail JSON
);