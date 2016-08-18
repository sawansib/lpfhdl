function [x_out, y_out,r_out,g_out,b_out ] = hdllpf13(x_in, y_in, r_in, g_in, b_in)
persistent OrigImg 
persistent x1 x2 y1 y2

if isempty(OrigImg)
    OrigImg = zeros(3,1);
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
end

D = [1/9 1/9 1/9;
    1/9 1/9 1/9;
    1/9 1/9 1/9];

RGB = [r_in; g_in; b_in];

OrigImg_1 = D*RGB;
r_out=OrigImg_1(1);
g_out=OrigImg_1(2);
b_out=OrigImg_1(3);
x_out = x2;
x2 = x1;
x1 = x_in;
y_out = y2;
y2 = y1;
y1 = y_in;
end