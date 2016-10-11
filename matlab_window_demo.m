function [retval] = matlab_window_demo(data, values)

if nargin == 1
  values = [];
end

codec = data.event_codec();
all_events = data.events;

for i = 1:length(codec)
  if (strcmp(codec(i).tagname, 'rand_var'))
    event_code = codec(i).code;
    break
  end
end

indices = find([all_events(:).event_code] == event_code);
events = all_events(indices);
values = [values cast([events(:).data], 'double')];

fprintf(1, 'Drawing histogram (%d values)\n', length(values));
hist(values);

retval = values;
