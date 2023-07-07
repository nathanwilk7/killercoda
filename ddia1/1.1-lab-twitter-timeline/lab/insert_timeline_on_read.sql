begin transaction;

drop table if exists start_time;
create temp table start_time as
SELECT CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER) t;

insert into tweets (poster_id, content, post_time)
values (
  10, 
  cast(abs(random()) as text) || ' moar content',
  abs(random() % 1680750000)
);

select
 '*** END TIME',
 round(((julianday('now') - 2440587.5)*86400000.0 - start_time.t)/1000.0, 3)
from start_time;

commit;
