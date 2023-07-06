select
timelines.username,
json_extract(timelines.timeline_json, '$[0]'),
json_extract(timelines.timeline_json, '$[1]'),
json_extract(timelines.timeline_json, '$[2]'),
json_extract(timelines.timeline_json, '$[3]'),
json_extract(timelines.timeline_json, '$[4]'),
json_extract(timelines.timeline_json, '$[5]'),
json_extract(timelines.timeline_json, '$[6]'),
json_extract(timelines.timeline_json, '$[7]'),
json_extract(timelines.timeline_json, '$[8]'),
json_extract(timelines.timeline_json, '$[9]')
from timelines
where timelines.username in (select username from users limit 1);
