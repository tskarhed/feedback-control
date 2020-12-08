T = 37;
K1 = 7.48;

Kp1 = 11/7.48
Tprime = T/(K1*Kp1+1);
Kprime = (Kp1*K1)/(Kp1*K1+1);

poles = [ 0.11 0.12 0.13 ];
%Kp1=1.4706
%Kp2=3.1822
%Kd2=1.0764
%Ki2=0.2136
syms p1 p2 p3 Kp2 Kd2 Ki2

%Phat = (s+p1)*(s+p2)*(s+p3);

% Symbolab gives us the following coefficients:
%s^2
pHatCoeffs = [ 1 p3+p2+p1 p2*p3+p1*p3+p1*p2 p1*p2*p3]
pHatCalced = double(subs(pHatCoeffs, [p1 p2 p3], poles))

%kD2
eqn = pHatCoeffs(2)== (T+Tprime+Kprime*Kd2)/(T*Tprime);
Kd2 = double(subs(solve(eqn, Kd2), [p1 p2 p3], poles))

%Kp2
eqn = pHatCoeffs(3) == (2+Kprime*Kp2)/(T*Tprime);
Kp2 = double(subs(solve(eqn, Kp2), [p1 p2 p3], poles))


eqn = pHatCoeffs(4) == (Kprime*Ki2)/(T*Tprime);

Ki2 = double(subs(solve(eqn, Ki2), [p1 p2 p3], poles ))


s = tf('s');

% Consider Ki2 here? What's up with that?
Phat = 1/(s^3+pHatCalced(2)*s^2+pHatCalced(3)*s+pHatCalced(4));
DCPhat = poles(1)*poles(2)*poles(3); %Same as dcgain
subplot(2,1,1)
step(Phat*DCPhat);
title('Normalized $\frac{1}{\hat{P}}$ ($\hat{T}$) step response', 'Interpreter', 'latex');


%DC gain normalization
T1 = (Kp1Val*K1)/(T*s+1+Kp1Val*K1);
subplot(2,1,2);
step(T1);
title('Inner loop step response');


