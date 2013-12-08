function [x,y]=Hahn_stable1(alpha,beta,gama,delta)


mult = 4;
n = 8; 
xmax = 15;

xmax = xmax*(2^mult);

n = n + mult;
M = 2^n;
R = pi/xmax;
dt = 1/(R*M);

xx = (-2^(n-1)+.5:(2^(n-1)-.5))/(2^n*dt);

piover2 = (pi/2);


yy = exp( -(gama.*abs(xx)).^alpha.*( 1+i*beta.*sign(xx).*tan(alpha*piover2).*( (gama.*abs(xx)).^(1-alpha)-1 ) ) + i*delta*xx );
  

yy1 = [yy((2^(n-1)+1):2^n), yy(1:2^(n-1))];
z = real( fft(yy1) )/(2*pi)*R;

x = (2*pi)*((0:1:(M-1))/(M*R)-1/(2*R));
y = [z((2^(n-1)+1):2^n), z(1:2^(n-1))];   

T = find((x<=xmax/(2^mult)) & (x>=-xmax/(2^mult)));
x = x(T); 
x = x(:);
y = y(T); 
y = y(:);
