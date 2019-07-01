fx = 0.1;
fy = 0.1;
[x,y] = meshgrid(-10:0.1:20);
z = cos(2*pi*(fx * x + fy * y));
figure, mesh(x,y,z);
z = sinc(x)*sinc(y);
figure, subplot(1,2,1), mesh(x,y,z);
