

alpha=.5:0.5:2;

beta=0;
gama=1;
delta=0;


[x,y]=Hahn_stable1(2,beta,gama,delta);

x=zeros(length(alpha),length(x));
y=zeros(length(alpha),length(y));


for index=1:length(alpha)


[x(index,:),y(index,:)]=Hahn_stable1(alpha(index),beta,gama,delta);


end




% surf(y)
% shading interp
% colormap(jet)


set(gcf,'color','w');
waterfall(y)


for i = 1:360
    
view(180-i,30)
pause()

end



