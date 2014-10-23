ave_counts = zeros(2,1);
ave_pressure = zeros(2,1);
ave_force = zeros(2,1);
ave_stretch1 = zeros(2,1);
ave_stretch2 = zeros(2,1);
ave_stretch3 = zeros(2,1);
ave_stretch_sum = zeros(2,1);
ave_x1 = zeros(2,1);
ave_x2 = zeros(2,1);
ave_x3 = zeros(2,1);
ave_x4 = zeros(2,1);
ave_y1 = zeros(2,1);
ave_y2 = zeros(2,1);
ave_y3 = zeros(2,1);
ave_y4 = zeros(2,1);

angle1 = zeros(2,1);
angle2 = zeros(2,1);
angle3 = zeros(2,1);
distance1 = zeros(2,1);
distance2 = zeros(2,1);
distance3 = zeros(2,1);

for i=1:length(raw_pressure)
    ave_counts((raw_pressure(i) * 10) - start) = 0;
    ave_pressure((raw_pressure(i) * 10) - start) = raw_pressure(i);
    ave_force((raw_pressure(i) * 10) - start) = 0;
    ave_stretch1((raw_pressure(i) * 10) - start) = 0;
    ave_stretch2((raw_pressure(i) * 10) - start) = 0;
    ave_stretch3((raw_pressure(i) * 10) - start) = 0;
    ave_x1((raw_pressure(i) * 10) - start) = 0;
    ave_x2((raw_pressure(i) * 10) - start) = 0;
    ave_x3((raw_pressure(i) * 10) - start) = 0;
    ave_x4((raw_pressure(i) * 10) - start) = 0;
    ave_y1((raw_pressure(i) * 10) - start) = 0;
    ave_y2((raw_pressure(i) * 10) - start) = 0;
    ave_y3((raw_pressure(i) * 10) - start) = 0;
    ave_y4((raw_pressure(i) * 10) - start) = 0;
end

for i=1:length(raw_pressure)
    ave_counts((raw_pressure(i) * 10) - start) = ave_counts((raw_pressure(i) * 10) - start) + 1;
    ave_force((raw_pressure(i) * 10) - start) = ave_force((raw_pressure(i) * 10) - start) + raw_force(i);
    ave_stretch1((raw_pressure(i) * 10) - start) = ave_stretch1((raw_pressure(i) * 10) - start) + raw_stretch1(i);
    ave_stretch2((raw_pressure(i) * 10) - start) = ave_stretch2((raw_pressure(i) * 10) - start) + raw_stretch2(i);
    ave_stretch3((raw_pressure(i) * 10) - start) = ave_stretch3((raw_pressure(i) * 10) - start) + raw_stretch3(i);
    ave_x1((raw_pressure(i) * 10) - start) = ave_x1((raw_pressure(i) * 10) - start) + raw_x1(i);
    ave_x2((raw_pressure(i) * 10) - start) = ave_x2((raw_pressure(i) * 10) - start) + raw_x2(i);
    ave_x3((raw_pressure(i) * 10) - start) = ave_x3((raw_pressure(i) * 10) - start) + raw_x3(i);
    ave_x4((raw_pressure(i) * 10) - start) = ave_x4((raw_pressure(i) * 10) - start) + raw_x4(i);
    ave_y1((raw_pressure(i) * 10) - start) = ave_y1((raw_pressure(i) * 10) - start) + raw_y1(i);
    ave_y2((raw_pressure(i) * 10) - start) = ave_y2((raw_pressure(i) * 10) - start) + raw_y2(i);
    ave_y3((raw_pressure(i) * 10) - start) = ave_y3((raw_pressure(i) * 10) - start) + raw_y3(i);
    ave_y4((raw_pressure(i) * 10) - start) = ave_y4((raw_pressure(i) * 10) - start) + raw_y4(i);
end

for i=1:length(ave_pressure)
    ave_force(i) = ave_force(i) / ave_counts(i);
    ave_stretch1(i) = ave_stretch1(i) / ave_counts(i);
    ave_stretch2(i) = ave_stretch2(i) / ave_counts(i);
    ave_stretch3(i) = ave_stretch3(i) / ave_counts(i);
    ave_x1(i) = ave_x1(i) / ave_counts(i);
    ave_x2(i) = ave_x2(i) / ave_counts(i);
    ave_x3(i) = ave_x3(i) / ave_counts(i);
    ave_x4(i) = ave_x4(i) / ave_counts(i);
    ave_y1(i) = 450 - (ave_y1(i) / ave_counts(i));
    ave_y2(i) = 450 - (ave_y2(i) / ave_counts(i));
    ave_y3(i) = 450 - (ave_y3(i) / ave_counts(i));
    ave_y4(i) = 450 - (ave_y4(i) / ave_counts(i));
    
    angle1(i) = (pi/2) - atan2((ave_y2(i) - ave_y1(i)), (ave_x2(i) - ave_x1(i)));
    angle2(i) = (pi/2) - atan2((ave_y3(i) - ave_y2(i)), (ave_x3(i) - ave_x2(i))) - angle1(i);
    angle3(i) = (pi/2) - atan2((ave_y4(i) - ave_y3(i)), (ave_x4(i) - ave_x3(i))) - (angle1(i) + angle2(i));
    
    distance1(i) = sqrt((ave_x2(i) - ave_x1(i))^2 + (ave_y2(i) - ave_y1(i))^2);
    distance2(i) = sqrt((ave_x3(i) - ave_x2(i))^2 + (ave_y3(i) - ave_y2(i))^2);
    distance3(i) = sqrt((ave_x4(i) - ave_x3(i))^2 + (ave_y4(i) - ave_y3(i))^2);
    
    ave_stretch_sum(i) = ave_stretch1(i) + ave_stretch2(i) + ave_stretch3(i);
end