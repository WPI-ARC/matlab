function [ ff, p_pres, f_pres ] = calc_feedforward( stretch_ave, p_thresholds, p_slopes, p_offsets, force, f_slope, f_offset)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if stretch_ave < p_thresholds(2)
        p_pres = p_slopes(1) * stretch_ave + p_offsets(1);
    elseif stretch_ave < p_thresholds(3)
        p_pres = p_slopes(2) * stretch_ave + p_offsets(2);
    elseif stretch_ave < p_thresholds(4)
        p_pres = p_slopes(3) * stretch_ave + p_offsets(3);
    elseif stretch_ave < p_thresholds(5)
        p_pres = p_slopes(4) * stretch_ave + p_offsets(4);
    else
        p_pres = p_slopes(5) * stretch_ave + p_offsets(5);
    end
    
    f_pres = (f_slope * force) + f_offset;
    
    ff = p_pres + f_pres;
end

