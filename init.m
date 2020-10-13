psiP = 1;
zP = 0.1;

u = 1;
v = 1;
w = 1;

theta = 1;
fi = 1;

global A B
A = cos(theta) * u + sin(theta) * sin(fi) * v + sin(theta) * cos(fi) * w;

B = cos(fi) * v - sin(fi) * w;