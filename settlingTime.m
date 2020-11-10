sys = tf([361], [1 16 361]);
stepinfo(sys)
[wn,zeta]=damp(sys);
wn
zeta