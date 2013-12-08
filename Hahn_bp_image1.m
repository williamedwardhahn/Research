function Hahn_bp_image1

clear all
clc

dr1=dir('*straight*open*_2.pgm');
dr2=dir('*straight*sunglasses*_2.pgm');
% dr1=dir('*left*_2.pgm');
% dr2=dir('*right*_2.pgm');

% dr1=dir('*left.pgm');
% dr2=dir('*right.pgm');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1={dr1.name}; % get only filenames to cell

c1=[];

for i=1:length(f1) % for each image
    
a1=f1{i};

b1=imread(a1);

b1=b1(1:end)';

c1=[c1 b1];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f2={dr2.name}; % get only filenames to cell

c2=[];

for i=1:length(f2) % for each image
    
a2=f2{i};

b2=imread(a2);

b2=b2(1:end)';

c2=[c2 b2];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pattern=[im2double(c1) im2double(c2)]';

category=[ones(1,size(c1,2)) 0.*ones(1,size(c2,2))]';


% r=randperm(size(pattern,1))
% 
% pattern=pattern(r,:);
% category=category(r);
% pause

% 
% for i =1:size(pattern,1)
% 
% imagesc(reshape(pattern(i,:),60,64))
% 
% category(i)
% 
% pause
% 
% end



bias=ones(size(pattern,1),1);
pattern = [pattern bias];

n1 = size(pattern,2)  
n2 = 3;   %n2-1 
n3 = size(category,2);  


w1 = 0.001*(1-2*rand(n1,n2-1));
w2 = 0.001*(1-2*rand(n2,n3)); 

dw1 = zeros(size(w1));            
dw2 = zeros(size(w2)); 

L = 0.001;        % Learning     
M = 0.8;          % Momentum

loop = 0;                              
sse=10;

while sse > 0.1   
    
    
    act1 = [af(pattern * w1) bias];      
    act2 = af(act1 * w2); 

    
    error = category - act2;
    sse = sum(error.^2)
    
    
%     plot(act2,'bx')
%     hold on
%     plot(category,'rx')
%     hold off



    figure(1)
    subplot(131)
    imagesc(reshape(w1(1:n1-1,1),60,64))
    subplot(132)
    imagesc(reshape(w1(1:n1-1,2),60,64))
 
    subplot(133)

    plot(act2,'bx')
    hold on
    plot(category,'rx')
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



