function [ fracNum ] = get_frac_num( Vco )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

fracNum = round((2^24)*((Vco*1e-6 + 2500)/25 - 100));

end

