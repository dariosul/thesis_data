% this problem is a nonconvex problem and is in principal a difficult
% problem to solve. the following two-dimensional example illustrates the
% nonconvexity of the problem
A = [6 0 5 1 3; 4 -10 -3 -4 -3];
xs = [-2;3];
RN = [8.0051; 13.0112; 9.1138; 7.7924; 8.0210];
% RN = [2.9 1.7 1.76 1.77 2.71];
% A = [-0.89 -0.62 -0.87 1.21 -1.86 ; 1 -0.04 0.63 -0.42 1];
r = zeros(5,1);
for i = 1:5
    r(i) = norm(xs - A(:,i));
end
xrange = [-15:.1:15];
yrange = [-15:.1:15];

[X,Y] = meshgrid(xrange, yrange);
Z = zeros(size(X));
i = 0;
for x = xrange
    i = i+1;
    j = 0;
    for y = yrange
        j = j+1;
        Z(i,j) = 0;
        for m = 1:5
            Z(i,j) = Z(i,j) + (norm([X(i,j);Y(i,j)] - A(:,m)) - RN(m))^2;
        end
    end
end
figure
contour(X,Y,Z,150)
xlabel('x');
ylabel('y');
hold on
global_min = min(min(Z));
plot(xs(1), xs(2), 'k*')
hold off
