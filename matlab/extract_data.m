function [ raw_data ] = extract_data( path, data_type )
%EXTRACT_DATA Summary of this function goes here
%   Detailed explanation goes here

file_id = fopen(path);
raw_data = fread(file_id, Inf, data_type);
fclose(file_id);

end

