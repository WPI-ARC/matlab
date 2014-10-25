indexes = zeros(6,1);
slopes  = zeros(5,1);
offsets = zeros(5,1);
offsets2 = zeros(5,1);

rev_slopes = zeros(5,1);
rev_offsets = zeros(5,1);
est_pressure = zeros(2,1);

indexes(1) = 1;
indexes(6) = length(ave_pressure);

indexes(2) = indexes(6) / 5;
indexes(3) = 2 * indexes(2);
indexes(4) = indexes(3) + indexes(2);
indexes(5) = indexes(4) + indexes(2);

for i=1:5
    offsets(i) = ave_stretch_ave(indexes(i));
    slopes(i)  = (ave_stretch_ave(indexes(i+1)) - ave_stretch_ave(indexes(i))) / (ave_pressure(indexes(i+1)) - ave_pressure(indexes(i)));
    offsets2(i) = ave_pressure(indexes(i));
end

for i=1:5
    rev_slopes(i) = 1 / slopes(i);
    rev_offsets(i) = offsets2(i) - (offsets(i) / slopes(i));
end