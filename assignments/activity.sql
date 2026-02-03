select * from customers;
desc customers;

insert into customers
values (1, 'Keun', 'Suson', 'Tiniguiban', 'C10-24-9903456', '2030-03-19');

-- set default
insert into customers (cus_id, firstname, lastname,address, license_number, license_expiry_date)
values (2, 'Felip', 'Dumpit', 'Sicsican', 'F10-43-902637', '2027-11-28');

-- unique constraint
insert into customers (cus_id, firstname, lastname,address, license_number, license_expiry_date)
values (3, 'Justine', 'De Dios', 'San Manuel', 'F10-43-902637', '2034-01-12'); -- have a duplication/error

insert into customers (cus_id, firstname, lastname,address, license_number, license_expiry_date)
values (3, 'Jah', 'Torres', 'Bacungan', 'F10-33-214932', '2029-07-14'); -- no duplication

select * from vehicle;
desc vehicle;

insert into vehicle 
values(9013, 'Ford Focus', '2022', 'Brown', 'CCC-222', '3-Cylinder','Manual', 287, 'cancelled', 3000, 'PPC');

select * from rental;
desc rental;

insert into rental
values(2,1234,1, '2024-03-29', '2024-03-31', 'SM ', 'San Manuel','');

-- constraint check
insert into rental
values(3,1234,0, '2024-02-13', '2024-02-15', 'Robinson ', 'Robinson','Radio');

-- union
select cus_id,lastname
from customers
UNION
select VIN, model_name
from vehicle;