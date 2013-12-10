function [best,fmin]=Hahn_cuckoo_searchA()
%William Hahn
tic
clf
n=5; %agents
prob=0.5; 
error=-1000%1.0e-5; %error
nd=2; %dimension
bound = 10; %bound
beta=1; %levy
sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta)

ffun=7;

resolution=20;

[X,Y] = meshgrid(-bound:bound/resolution:bound, -bound:bound/resolution:bound);

Z=f(ffun,X,Y);
surf(X,Y,Z)
view(0,90)

Lb=-bound*ones(1,nd);
Ub=bound*ones(1,nd);

for i=1:n,
    agent(i,:)=Lb+(Ub-Lb).*rand(size(Lb));
end

fitness=10^10*ones(n,1);
fmin=10^10;
bestagent=agent(1,:);

while (fmin>error),
    
   
    P=rand(size(agent))>prob;
    
    stepsize=rand*(agent(randperm(n),:)-agent(randperm(n),:));
    
    newagent=agent+stepsize.*P;
    
    
    a=f(ffun,agent(:,1),agent(:,2));
    b=f(ffun,newagent(:,1),newagent(:,2));
    c= b < a;
    
    [fmin,d]=min(a);
    best=agent(d,:);
    agent(c,:)=newagent(c,:);
    
   
    u=randn(n,nd)*sigma;
    
    v=randn(n,nd);
    
    step=u./abs(v).^(1/beta);
    
    stepsize=0.01*step.*bsxfun(@minus,agent,best); %bsxfun @minus subtracts a vector from every row of a matrix
    
    agent=agent+stepsize.*randn(n,nd);
    
    
    clf
    surf(X,Y,Z)
    view(0,90)
    hold on
    scatter3(agent(:,1),agent(:,2),a,500,'wp','filled')
    axis([-bound bound -bound bound])
    pause(0.1)
   
    
end


toc

end


function z = f(c,x1,x2)


switch c
    case 0
    z=-2*exp(-.01*(x1-5).^2 - .01*(x2-5).^2);    
    case 1
    z=20*(1 - exp(-0.2*sqrt(0.5*(x1.^2 + x2.^2))))- exp(0.5*(cos(2*pi*x1) + cos(2*pi*x2))) + exp(1);
    case 2
    z=(1.5 - x1 + x1.*x2).^2 + (2.25 - x1 + x1.*x2.^2).^2 + (2.625 - x1 + x1.*x2.^3).^2;
    case 3
    z=sin(x1).*exp((1-cos(x2)).^2) + cos(x2).*exp((1-sin(x1)).^2) + (x1-x2).^2;
    case 4
    z=(x1 + 2*x2 - 7).^2 + (2*x1 + x2 - 5).^2;
    case 5
    z=100*(x2 - 0.01*x1.^2 + 1) + 0.01*(x1 + 10).^2;
    case 6
    z=100*x2.^2 + 0.01*abs(x1 + 10);
    case 7
    z=100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1 + 10);    
    case 8
    z=-((cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi))).^2)/30;
    case 9
    z=x1.^2 - 12*x1 + 11 + 10*cos(pi*x1/2) + 8*sin(5*pi*x1/2) - 1/sqrt(5)*exp(-((x2 - 0.5).^2)/2);    
    case 10
    z=(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);    
    case 11
    z=-0.0001*(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(0.1);    
    case 12
    z=-(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);    
    case 13
    z=0.0001*(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(0.1);    
    case 14
    z=(100*(x2 - x1.^3).^2 + (1 - x1).^2);    
    case 15
    z=-cos(x1).*cos(x2).*exp(-((x1-pi).^2 + (x2-pi).^2));
    case 16
    z=-(x2+47).*sin(sqrt(abs(x2+x1/2+47)))-x1.*sin(sqrt(abs(x1-(x2+47))));    
    case 17
    z=(1  + (x1 + x2 + 1).^2.*(19 - 14*x1 +  3*x1.^2 - 14*x2 +  6*x1.*x2 +  3*x2.^2)).*(30 + (2*x1 - 3*x2).^2.*(18 - 32*x1 + 12*x1.^2 + 48*x2 - 36*x1.*x2 + 27*x2.^2));    
    case 18
    z=(x1.^2 + x2.^2)/200 - cos(x1).*cos(x2/sqrt(2)) + 1;    
    case 19
    z=100*((-10*atan2(x2, x1)/2/pi).^2 + (sqrt(x1.^2 + x2.^2) - 1).^2);
    case 20
    z=-abs(sin(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)));    
    case 21
    z=100*(x2 - x1.^2).^2 + (1 - x1).^2;
    case 22
    z=sin(3*pi*x1).^2 + (x1-1).^2.*(1 + sin(3*pi*x2).^2) + (x2-1).^2.*(1 + sin(2*pi*x2).^2);
    case 23
    z=0.26*(x1.^2 + x2.^2) - 0.48*x1.*x2;
    case 24
    z= sin(x1 + x2) + (x1-x2).^2 - 1.5*x1 + 2.5*x2 + 1;
    case 25
    z = 0.5  + (sin(x1.^2 + x2.^2).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;
    case 26
    z=0.5  + (sin(x1.^2 - x2.^2).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;
    case 27 
    z=0.5  + (sin(cos(abs(x1.^2 - x2.^2))).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;
    case 28 
    z= 0.5  + (cos(sin(abs(x1.^2 - x2.^2))).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;
    case 29 
    z=-exp(-(abs(cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)))).^(-1));
    case 30 
    z= x1.^2 + x2.^2 - 10*cos(2*pi*x1) - 10*cos(2*pi*x2) + 20;
    case 31 
    z=(100*(x2 - x1.^2).^2 + (1 - x1).^2);
    case 32 
    z=-x1.*sin(sqrt(abs(x1))) -x2.*sin(sqrt(abs(x2)));
    case 33 
    z=(4 - 2.1*x1.^2 + x1.^4/3).*x1.^2 + x1.*x2 + (4*x2.^2 - 4).*x2.^2;
    case 34 
    z=-4*abs(sin(x1).*cos(x2).*exp(abs(cos((x1.^2 + x2.^2)/200))));
    case 35 
    z=2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
    case 36 
    z=(x1.^2 + x2.^2 - 2*x1).^2 + x1/4;
    otherwise
    disp('error');
end

end

