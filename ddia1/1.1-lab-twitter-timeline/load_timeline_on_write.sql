select
timelines.username,
timelines.timeline_json -> 0,
timeline_json -> 1, 
timeline_json -> 2, 
timeline_json -> 3, 
timeline_json -> 4, 
timeline_json -> 5, 
timeline_json -> 6, 
timeline_json -> 7, 
timeline_json -> 8, 
timeline_json -> 9
from timelines
where timelines.username in (select username from users limit 1);