T = 37;
K1 = 7.48;

p1 = 0.06;
p2 = 0.07;
p3 = 0.065;

s = tf('s');

%% Task 3, desired function for requirements

%% Task 4
That = p1*p2*p3/((s+p1)*(s+p2)*(s+p3));
subplot(2,1,1);
step(That);
