



function Hahn_bp_image1

clear all
clc



load alvinn_data.mat


for i=1:size(CVPatterns,2)
 
subplot(121) 
imagesc(reshape(CVPatterns(:,i),30,32))   
subplot(122)
plot(CVDesired(:,i),'bx')
% plot(CVPositions(:,i),'bx')

    
end

pattern=CVPatterns';
category=CVDesired';


bias=ones(size(pattern,1),1);
pattern = [pattern bias];

n1 = size(pattern,2)  
n2 = 6;   %n2-1 
n3 = size(category,2);  


w1 = 0.03*(1-2*rand(n1,n2-1));
w2 = 0.01*(1-2*rand(n2,n3)); 

dw1 = zeros(size(w1));            
dw2 = zeros(size(w2)); 

L = 0.1;        % Learning     
M = 0.9;          % Momentum

loop = 0;                              
sse=10;

while sse > 0.1   
    
    
    act1 = [af(pattern * w1) bias];      
    act2 = af(act1 * w2); 

    
    error = category - act2;
    sse = sum(sum(error.^2))
    
    
%     plot(act2,'bx')
%     hold on
%     plot(category,'rx')
%     hold off


    figure(1)
    subplot(151)
    imagesc(reshape(w1(1:n1-1,1),30,32))
    subplot(152)
    imagesc(reshape(w1(1:n1-1,2),30,32))
    subplot(153)
    imagesc(reshape(w1(1:n1-1,3),30,32))
    subplot(154)
    imagesc(reshape(w1(1:n1-1,4),30,32))
    subplot(155)
    imagesc(reshape(w1(1:n1-1,5),30,32))
    
    figure(2)
    plot(act2,'bx')
    hold on
    plot(category,'rx')
    hold off
%     imagesc(reshape(w1(1:n1-1,2),60,64))
    
    drawnow()
%     pause

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



