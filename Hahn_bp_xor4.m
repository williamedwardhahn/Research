function [pattern,category,w1,w2,top]=Hahn_bp_xor4()

clear all
clc

% pattern = [0 0; 0 1; 1 0; 1 1]  
% category = [ 0; 1; 1; 0]     

% pattern=[1,0,0;0,1,0;0,0,1;1,1,1;0,0,0;1,1,0;0,1,1;1,0,1];
% category=[1,1,1,0,0,0,0,0]';
 
pattern=[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;1,1,1,1;0,0,0,0;1,1,0,0;0,0,1,1;1,1,0,1;1,0,1,1;1,0,0,1;0,1,1,0;1,0,1,0;0,1,0,1;0,1,1,1;1,1,1,0];
category=[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0]';


eta = 1;        % Learning     
alpha = 0.8;    % Momentum

bias=ones(size(pattern,1),1);


pattern = [pattern bias];

n1 = size(pattern,2);     

n2 = 4;    

n3 = size(category,2);   


w1 = 0.5*(1-2*rand(n1,n2-1));
w2 = 0.5*(1-2*rand(n2,n3)); 

dw1 = zeros(size(w1));            
dw2 = zeros(size(w2)); 


loop = 0;                              
sse=1;

while sse > 0.01   
    
    
    act1 = [af(pattern * w1) bias];    
        
    act2 = af(act1 * w2); 

    
    error = category - act2;
    
    sse = sum(error.^2);
    
    
    delta_w2 = error .* act2 .* (1-act2);

    delta_w1 = delta_w2*w2' .* act1 .* (1-act1);
    
    delta_w1(:,size(delta_w1,2)) = [];

    
    dw1 = eta * pattern' * delta_w1 + alpha * dw1;
    
    dw2 = eta * act1' * delta_w2 + alpha * dw2;
    
    
    w1 = w1 + dw1; 
    
    w2 = w2 + dw2;           
    
    
    loop = loop + 1;
    
    
        
end




% neural_network([0 0 0 0],w1,w2)
% neural_network([1 0 0 0],w1,w2)
% neural_network([0 1 0 0],w1,w2)
% neural_network([0 0 1 0],w1,w2)
% neural_network([0 0 0 1],w1,w2)
% neural_network([1 1 1 1],w1,w2)




%  Hahn_nn_forward(pattern,category,w1,w2)

top=[n1,n2,n3];




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



