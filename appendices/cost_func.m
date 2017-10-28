%% Plot relationship between distance from object, lambda, and total cost
close all; clear; clc;

alpha = 0.5;
ir = 1.5;
r = alpha + ir;

c = 0:0.05:ir-0.05;
y = 2.5;
lambda = 0:0.1:10;
[c, lambda] = meshgrid(c, lambda);
d = acos((c+alpha)/r)*2*r;

path_length_cost_Y = 504*exp(-1.0 * lambda .* d );
obstacle_cost_X = 252*exp(-1.0 * y * c);
Z =  1*obstacle_cost_X + 1*path_length_cost_Y;
s = surf(c, lambda, Z);
[zVals xVals] = min(Z');
xVals = xVals * 0.05 - 0.05;
hold on;
plot3(xVals, 0:0.1:10, zVals, 'r', 'LineWidth', 3);

xlabel('c');

ylabel('\lambda');% ylim([0.1, inf]);
zlabel('cost');
set(gca,'YScale','log')
colorbar;
view(54,17);


% s.EdgeColor = 'none';

%% Plot relationship between distance from object, lambda, and total cost
close all; clear; clc;

alpha = 0.5;
ir = 1.5;
r = alpha + ir;

c = 0:0.05:ir-0.05;
y = 2.5;
lambda = 0:0.1:10;
%%[c, lambda] = meshgrid(c, lambda);
d = acos((c+alpha)/r)*2*r;
plot(c,d);
xlabel('c');
ylabel('d');% ylim([0.1, inf]);
return