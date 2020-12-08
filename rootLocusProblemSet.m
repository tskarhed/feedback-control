a = 1;
b = 3;
s = tf('s');

Gc = (s+a)*(s+b)/s;
G = 1/(s^2+1);

L = Gc*G;
rlocus(L);