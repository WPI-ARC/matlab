est_pressure = zeros(2,1);
est_pos_pressure = zeros(2,1);
est_for_pressure = zeros(2,1);

for i=1:length(ave_force)
    [est_pressure(i), est_pos_pressure(i), est_for_pressure(i)] = calc_feedforward(ave_stretch_ave(i), pos_thresholds, pos_slopes, pos_offsets, ave_force(i), force_slope, force_offset);
end