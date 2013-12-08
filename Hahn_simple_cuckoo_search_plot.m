function [best,fmin]=Hahn_cuckoo_searchA()
%William Hahn
tic
clf
n=10; %Number of Agents
prob=0.5; %Probability of Discovery
error=.51%1.0e-5; %Error/fitness
nd=2; %Number of Dimensions
bound = 2; %Size of Original Search Space

resolution=20;

[X,Y] = meshgrid(-bound:bound/resolution:bound, -bound:bound/resolution:bound);

Z=f(X,Y);
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
    
    stepsize=rand*(agent(randperm(n),:)-agent(randperm(n),:)); %Crossover operator
    
    newagent=agent+stepsize.*P;
    
    
    a=f(agent(:,1),agent(:,2));
    b=f(newagent(:,1),newagent(:,2));
    c= b < a;
    
    [fmin,d]=min(a);
    best=agent(d,:);
    agent(c,:)=newagent(c,:);
    
   
    clf
    surf(X,Y,Z)
    view(0,90)
    hold on
    scatter3(agent(:,1),agent(:,2),a,500,'wp','filled')
    axis([-bound bound -bound bound])
    pause(0.1)
   
    
end


toc




function z=f(x1,x2)

% z=(sin(x1).*exp((1-cos(x2)).^2) + cos(x2).*exp((1-sin(x1)).^2) + (x1-x2).^2).*double(abs(x1)<16).*double(abs(x2)<16);


% z=(1.5 - x1 + x1.*x2).^2 + (2.25 - x1 + x1.*x2.^2).^2 + (2.625 - x1 + x1.*x2.^3).^2;


z=20*(1 - exp(-0.2*sqrt(0.5*(x1.^2 + x2.^2))))- exp(0.5*(cos(2*pi*x1) + cos(2*pi*x2))) + exp(1);


% z=-2*exp(-.01*(x1-5).^2 - .01*(x2-5).^2);    
 
 

 

