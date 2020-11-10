
[X, Y] = meshgrid(-2:0.1:2,-2:0.1:2);
z = X.*exp(X.*Y);
zApprox = 2 + X + 4*Y;

figure;

surf(X,Y,z);
hold on
surf(X,Y, zApprox, 'FaceColor', 'r');
colormap winter;
