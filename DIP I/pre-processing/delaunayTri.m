n = 20;  % number of data points

x = rand(n);
y = rand(n);
z = rand(n);

tri = delaunay(x,y);
figure, triplot(tri,x,y);


tri = delaunay(x,y,z);

figure, trisurf(tri,x,y,z);

[x, y] = meshgrid(1:n,1:n);
tri = delaunay(x,y);
z = peaks(n);
figure, trisurf(tri,x,y,z);

