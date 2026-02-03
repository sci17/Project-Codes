Create database rental_system;
use rental_system;

create table customers
(
cus_id int not null primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
address varchar(50) not null,
phone_number varchar(50) not null,
license_number varchar (50) not null,
license_expiry_date date not null
);

alter table customers
alter phone_number set default 'None';

alter table customers
add unique(license_number);

create table vehicle
(
VIN int not null primary key,
model_name varchar(50) not null,
model_year year not null,
color varchar(50) not null,
license_plate_number varchar(20) not null,
engine_type varchar (30) not null,
transmission_type varchar (30) not null,
mileage int not null,
rental_status enum('reserved', 'completed', 'cancelled') not null,
daily_rental_rate double not null, 
location varchar (50) not null
);

create table rental
(
rent_id int not null,
primary key (rent_id),
VIN int not null,
foreign key (VIN) references vehicle (VIN),
cus_id int not null,
foreign key (cus_id) references customers (cus_id),
start_date date not null,
end_date date not null,
pickup_location varchar (50) not null,
drop_off_location varchar (50) not null,
additional_services varchar (50) not null
);

alter table rental
add constraint check (cus_id > 0);





