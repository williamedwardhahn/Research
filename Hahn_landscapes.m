function L = Hahn_landscapes()


size_search_space=1;

resolution=20;

[X,Y] = meshgrid(-size_search_space:size_search_space/resolution:size_search_space, -size_search_space:size_search_space/resolution:size_search_space);


for i = 1
    
z=fitness(i,X,Y);

figure(1)
% subplot(6,6,i)
axis([-size_search_space, size_search_space, -size_search_space, size_search_space]);
surf(X,Y,z,'EdgeColor','none')
set(gcf,'color','w');

% view(0,90)



end






function z = fitness(c,x1,x2)


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
        disp('derp');
end












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Gaussian Well %Global minimum: f(x)=-2, x(i)=5, i=1:2

%z=-2*exp(-.01*(x1-5).^2 - .01*(x2-5).^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ackley funcion

%z=20*(1 - exp(-0.2*sqrt(0.5*(x1.^2 + x2.^2))))- exp(0.5*(cos(2*pi*x1) + cos(2*pi*x2))) + exp(1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Beale funcion

%z=(1.5 - x1 + x1.*x2).^2 + (2.25 - x1 + x1.*x2.^2).^2 + (2.625 - x1 + x1.*x2.^3).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bird function

%z=sin(x1).*exp((1-cos(x2)).^2) + cos(x2).*exp((1-sin(x1)).^2) + (x1-x2).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Booth function

%z=(x1 + 2*x2 - 7).^2 + (2*x1 + x2 - 5).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bukin function #2

%z=100*(x2 - 0.01*x1.^2 + 1) + 0.01*(x1 + 10).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bukin function #4


%z=100*x2.^2 + 0.01*abs(x1 + 10);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Bukin function #6

%z=100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1 + 10);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Carrom table function

%z=-((cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi))).^2)/30;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chichinad%ze function


%z=x1.^2 - 12*x1 + 11 + 10*cos(pi*x1/2) + 8*sin(5*pi*x1/2) - 1/sqrt(5)*exp(-((x2 - 0.5).^2)/2);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cross function

%z=(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cross-in-tray function

%z=-0.0001*(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cross-leg table function

%z=-(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Crowned cross function

%z=0.0001*(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(0.1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extended cube function


%z=sum(  100*(x2 - x1.^3).^2 + (1 - x1).^2, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Easom function


%z=-cos(x1).*cos(x2).*exp(-((x1-pi).^2 + (x2-pi).^2));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generalized egg holder function


%z=-(x2+47).*sin(sqrt(abs(x2+x1/2+47)))-x1.*sin(sqrt(abs(x1-(x2+47))));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Goldstein-Price function


%z=(1  + (x1 + x2 + 1).^2.*(19 - 14*x1 +  3*x1.^2 - 14*x2 +  6*x1.*x2 +  3*x2.^2)).*(30 + (2*x1 - 3*x2).^2.*(18 - 32*x1 + 12*x1.^2 + 48*x2 - 36*x1.*x2 + 27*x2.^2));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Griewank funcion


%z=(x1.^2 + x2.^2)/200 - cos(x1).*cos(x2/sqrt(2)) + 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Helical valley function


%z=100*((-10*atan2(x2, x1)/2/pi).^2 + (sqrt(x1.^2 + x2.^2) - 1).^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Holder table function


%z=-abs(sin(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Leon funcion


%z=100*(x2 - x1.^2).^2 + (1 - x1).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Levi function, #13


%z=sin(3*pi*x1).^2 + (x1-1).^2.*(1 + sin(3*pi*x2).^2) + (x2-1).^2.*(1 + sin(2*pi*x2).^2);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Matyas function


%z=0.26*(x1.^2 + x2.^2) - 0.48*x1.*x2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% McCormick function


%z= sin(x1 + x2) + (x1-x2).^2 - 1.5*x1 + 2.5*x2 + 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Modified Schaffer function, #1


%compute pythagorean sum only once
%x12x22 = x1.^2 + x2.^2;

% output function value
%z = 0.5  + (sin(x12x22).^2 - 0.5) ./ (1+0.001*x12x22).^2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Modified Schaffer function, #2


%z=0.5  + (sin(x1.^2 - x2.^2).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Modified Schaffer function, #3


%z=0.5  + (sin(cos(abs(x1.^2 - x2.^2))).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Modified Schaffer function, #4


%z= 0.5  + (cos(sin(abs(x1.^2 - x2.^2))).^2 - 0.5) ./ (1+0.001*(x1.^2 + x2.^2)).^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pen holder function


%z=-exp(-(abs(cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)))).^(-1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Rastrigin function


%z= x1.^2 + x2.^2 - 10*cos(2*pi*x1) - 10*cos(2*pi*x2) + 20;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Extended Rosenbruck's Banana-function


%z=sum(100*(x2 - x1.^2).^2 + (1 - x1).^2, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Schweffel function

%z=-x1.*sin(sqrt(abs(x1))) -x2.*sin(sqrt(abs(x2)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Six hump camel back function

%z=(4 - 2.1*x1.^2 + x1.^4/3).*x1.^2 + x1.*x2 + (4*x2.^2 - 4).*x2.^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Testtube holder function


%z=-4*abs(sin(x1).*cos(x2).*exp(abs(cos((x1.^2 + x2.^2)/200))));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Three hump camel back function



%z=2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %zettle function

%z=(x1.^2 + x2.^2 - 2*x1).^2 + x1/4;





















%z=(-x(:,1).*sin(sqrt(abs(x(:,1))))-x(:,2).*sin(sqrt(abs(x(:,2))))).*(abs(x(:,1))<500).*(abs(x(:,2))<500);





%z=sum(x'.^2);




%z=20+x(1,:).^2-10.*cos(2.*pi.*x(1,:))+x(2,:).^2-10.*cos(2.*pi.*x(2,:));

%z=-2*exp(-.01*(x(1)-5).^2 - .01*(x(2)-5).^2); 

%z=20*(1 - exp(-0.2*sqrt(0.5*(x(1).^2 + x(2).^2))))- exp(0.5*(cos(2*pi*x(1)) + cos(2*pi*x(2)))) + exp(1);










