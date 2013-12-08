function Hahn_bp_xor

clear all
clc

% pattern = [0 0; 0 1; 1 0; 1 1]  
% category = [ 0; 1; 1; 0]     

%pattern=[1,0,0;0,1,0;0,0,1;1,1,1;0,0,0;1,1,0;0,1,1;1,0,1];
%category=[1,1,1,0,0,0,0,0]';
 
pattern=[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;1,1,1,1;0,0,0,0;1,1,0,0;0,0,1,1;1,1,0,1;1,0,1,1;1,0,0,1;0,1,1,0;1,0,1,0;0,1,0,1;0,1,1,1;1,1,1,0];
category=[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0]';





bias=ones(size(pattern,1),1);
pattern = [pattern bias];

n1 = size(pattern,2);     
n2 = 3;    
n3 = size(category,2);   

w1 = 0.5*(1-2*rand(n1,n2-1));
w2 = 0.5*(1-2*rand(n2,n3)); 

dw1 = zeros(size(w1));            
dw2 = zeros(size(w2)); 

L = 1;        % Learning     
M = 0.8;      % Momentum

loop = 0;                              
sse=1;

while sse > 0.001   
    
    
    act1 = [af(pattern * w1) bias];      
    act2 = af(act1 * w2); 

    
    error = category - act2;
    sse = sum(error.^2)
    
    plot(act2,'bo','MarkerSize',20)
    hold on
    plot(category,'rx','MarkerSize',20)
    hold off
% 
%     subplot(121)
%     imagesc(w1)
%     subplot(122)
%     imagesc(w2)
%     colormap(gray)
    
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




% neural_network([0 0 0 0],w1,w2)
% neural_network([1 0 0 0],w1,w2)
% neural_network([0 1 0 0],w1,w2)
% neural_network([0 0 1 0],w1,w2)
% neural_network([0 0 0 1],w1,w2)
% neural_network([1 1 1 1],w1,w2)


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



