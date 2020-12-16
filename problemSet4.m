%%Task 1 https://se.mathworks.com/help/control/ref/margin.html
s = tf('s');
L = 20*(s+1)/(s*(s+5)*(s^2+2*s+10))
[Gm, Pm, Wcg, Wcp] = margin(L);
%Gain margin is incorrect here
GmdB = 20*log10(Gm)
Pm
Wcg
Wcp

%% Task 2
s=tf('s');
T = 1/((s*(0.5*s+1)*(s+1))+1)
w = logspace(-1, 1, 2000);
bode(T,w)
% Peak gain = 5.28dB
% Peak frequency = 0.816 rad/s
bandwidth(T)

%% Task 3
s=tf('s');
L=(s+4)/((s+1)*(s+2))
nyquist(L)

%% Task 4
s=tf('s');
L2=50*(s+3)/(s^3-s^2+11*s-51)
nyquist(L2)

%% Task5

for K = 1:50
    T=tf([K K*50], [1 30 200+K 50*K]);
    array(K)=bandwidth(T);
end
plot(array)
xlabel('Gain K');
ylabel('Bandwidth (Hz)');

%% Task 6
s= tf('s');
L = (s+0.6)/(s^2*(s^2+9*s+12));

for K = 1:20
   [Gm , Pm] = margin(K*L);
   values(K) = Pm;
end

plot(1:20, values)

closedLoop = (8*L)/(1+(8*L));
% Reaches max value at K=8
bw = bandwidth(closedLoop) %1.3149 rad/s
bwHz = bw/(2*pi) %0.2093 Hz
step(closedLoop);
grid on