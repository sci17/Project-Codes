select * from customer;
insert into customer
values (11, 'Kenth Joseph','Narra','08302830','kenth@gmail.com', '9201830','2026-10-25');
insert into customer
values (12, 'Nayah Suson','Sofronio Espanola','2398012','nayah@gmail.com', '13203901','2030-03-13');

select * from vehicle;
insert into vehicle
values ('1s45f2kl8d53h80v3',2, '2018-12-12 12:34:12', '2018', 'gold', '999-LLL', 'V8 engine', 'automatic', 157, 'Roxas', 5600, 'cancelled', 'Ford');

select * from vehicle_damage_reports;
insert into vehicle_damage_reports
values (3, 1, 'engine failure','1s45f2kl8d53h80v3');


