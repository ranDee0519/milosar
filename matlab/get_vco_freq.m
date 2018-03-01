function [ vco_freq ] = get_vco_freq( frac_num, divider, n_counter, F_pd )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

vco_freq = F_pd*(n_counter + (frac_num)/(2^24 - 1))/divider;

end

