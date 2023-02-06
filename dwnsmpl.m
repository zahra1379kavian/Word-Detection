function x_downsampled = dwnsmpl(x,factor)
x_downsampled = [];
for i = 1:factor:length(x)
    x_downsampled = [x_downsampled x(i)];
end
end