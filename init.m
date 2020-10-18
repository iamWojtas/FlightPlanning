liveUpdate = 1;

u = 1;
v = 1;
w = 1;

simTim = 10;

theta = 1;
fi = 1;
ss = 100;

x = 0;
y = 0;
z = -ss;

global A B view psiP psi psiPrev zP
A = cos(theta) * u + sin(theta) * sin(fi) * v + sin(theta) * cos(fi) * w;
B = cos(fi) * v - sin(fi) * w;

psiP = 0;
view = true;
zP = 0;

psi = 0;
psiPrev = 0;