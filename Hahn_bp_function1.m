function Hahn_bp_function1

clear all
clc

x=[0:.2:12]

% y=10.*x+0.5;
% y=x.^2;
%   y=abs(sin(x));
%y=sin(2.*x)+x;
%  y=x.^2+20.*rand(size(x));
%   y=exp(-(x-10).^2)+0.*rand(size(x));

%  y=exp(-(x-4).^2);
 y=10.*exp(-(x-4).^2)+sin(2.*x)+x;


x=x/norm(x);
y=y/norm(y);


pattern = x; 
category = y;


bias=ones(size(pattern,1),1);
pattern = [pattern bias];

n1 = size(pattern,2)    
n2 = 2;    
n3 = size(category,2)


w1 = 0.05*(1-2*rand(n1,n2-1));
w2 = 0.05*(1-2*rand(n2,n3)); 

dw1 = zeros(size(w1));            
dw2 = zeros(size(w2)); 

L = 1;      % Learning     
M = 0;      % Momentum

loop = 0;                              
sse=1;

while sse > 0.0001   
    
    
    act1 = [af(pattern * w1) bias];      
    act2 = af(act1 * w2); 

    
    error = category - act2;
    sse = sum(error.^2)
    plot(act2,'pr','MarkerSize',25,'MarkerFaceColor','r')
    hold on
    plot(category,'ob','MarkerSize',25)
    hold off
    drawnow()
    
    delta_w2 = error .* act2 .* (1-act2);
    delta_w1 = delta_w2*w2' .* act1 .* (1-act1);
    delta_w1(:,size(delta_w1,2)) = [];

    
    dw1 = L * pattern' * delta_w1 + M * dw1;
    dw2 = L * act1' * delta_w2 + M * dw2;
    
    
    w1 = w1 + dw1; 
    w2 = w2 + dw2;           
    
    
    loop = loop + 1;
    
        
end







end







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function network_output = neural_network(neural_input,hidden_weights,output_weights)

network_output=af([af(([neural_input,1])*hidden_weights),1]*output_weights);

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function action = af (weighted_sum)


action = 1./(1+exp(-weighted_sum));  		% Logistic / Sigmoid Function


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



