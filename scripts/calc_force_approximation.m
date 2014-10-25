for i=1:length(ave_force)-1
    ave_force_dot(i) = (ave_force(i+1) - ave_force(i)) / (ave_pressure(i+1) - ave_pressure(i));
    ave_pressure_min(i) = (ave_pressure(i+1) + ave_pressure(i)) / 2;
end

for i=1:length(ave_force_dot)-1
    if ave_force_dot(i) > 0.4
        rising_edge_x = ave_pressure(i);
        rising_edge_y = ave_force(i);
        break
    end
end

for i=i+1:length(ave_force_dot)-1
    if ave_force_dot(i) < 0.3
        falling_edge_x = ave_pressure(i);
        falling_edge_y = ave_force(i);
        break
    end
end

slope = (falling_edge_y - rising_edge_y) / (falling_edge_x - rising_edge_x);
offset = rising_edge_y;