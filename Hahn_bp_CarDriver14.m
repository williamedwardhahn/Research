%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% William Hahn & Elan Barenholtz
% Blackout 
% Back Propagation
% Neural Network
% Supervised Learning - Car and Driver Dataset
% August 26th, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Hahn_bp_CarDriver14
clear all
close all
clc

rng(123) % set seed for random number generator

format long


load Hahn_CarDriver1.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Visualize Raw Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:size(pattern,1)
%     
%     subplot(121)
%     imagesc(reshape(pattern(i,:),101,1175))
%     colormap(gray)
%     subplot(122)
%     imagesc(category(i,:))
%     pause
%     
% end



r=randperm(size(pattern,1)); %Shuffle Patterns

c=400; %Use the First 400 Patterns
pattern=pattern(r(1:c),:);
category=category(r(1:c),:);


bias=ones(size(pattern,1),1); %Add Bias (Default Resting State Potential)
pattern = [pattern bias];

n1 = size(pattern,2);   %Set the Number of Input Nodes Equal to Number of Pixels in the Input image
n2 = 11;   %n2-1        %Number of Hidden Nodes (Free Parameter)
n3 = size(category,2);  %Set the Number of Output Nodes Equal to the Number of Distinct Categories {left,forward,right}  


w1 = 0.005*(1-2*rand(n1,n2-1)); %Randomly Initialize Hidden Weights
w2 = 0.005*(1-2*rand(n2,n3));   %Randomly Initialize Output Weights

dw1 = zeros(size(w1));          %Set Initial Hidden Weight Changes to Zero
dw2 = zeros(size(w2));          %Set Initial Output Changes to Zero

L = 0.01;             % Learning    %Avoid Overshooting Minima 
M = 0.5;              % Momentum    %Smooths out the learning landscape


loop = 0;             %Count loops

sse=size(pattern,1);  % Set Error Large so that Loop Starts
sseplot=[size(pattern,1) size(pattern,1) size(pattern,1)]; %Convergence Plot 









while sse > 0.1
    
    
    if  mod(loop,2) %Backout on odd loops
        
        bo=0;        
        
        
        
    else            %Regular BP on even loops
        
        bo=1;
        
    end
    
    
        
    
    
    
    
    
    
    
    
    act1 = [af(bo*(pattern) * w1) bias];  %Hahn Blinking/Blackout  % Comment This Line and Uncomment the Next to Revert to Traditional BP
%     act1 = [af(pattern * w1) bias];     %Traditional BP
    

    










    act2 = af(act1 * w2);
    
    
    error = category - act2;  %Calculate Error
    
    
    
    sse = sum(sum(error.^2)); % Error Reports - Not used by Algorithm 
    sseplot=[sseplot sse];
    
    
    
    delta_w2 = error .* act2 .* (1-act2); %Backpropagate Errors 
    delta_w1 = delta_w2*w2' .* act1 .* (1-act1);
    
    
    delta_w1(:,size(delta_w1,2)) = []; %Remove Bias
    
    
    
    dw1 = L * pattern' * delta_w1 + M * dw1; %Calculate Hidden Weight Changes 
    dw2 = L * act1' * delta_w2 + M * dw2;    %Calculate Output Weight Changes 
    
    
    
    w1 = w1 + dw1; %Adjust Hidden Weights 
    w2 = w2 + dw2; %Adjust Output Weights
    
    
    
    
    loop = loop + 1; % Increment Loop
    
    if loop > 500
        
        return       % Quit after 500 loops
        
    end
    
    
    
    
    
    
    
    
    
    

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Visualize Input Weights as Receptive Fields
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure(1)
    
    for i =1:10
        subplot(10,1,i)
        imagesc(reshape(w1(1:n1-1,i),101,1175))
    end
    
    
    
    
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Visualize Network Performance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     figure(2) 
%     
%     subplot(141)
%     imagesc(category)
%     
%     subplot(142)
%     imagesc(act2)
%     
%     subplot(143)
%     imagesc(abs(category-act2))
%     
%     subplot(144)
%     plot(sseplot)
%     
%     drawnow()
    
    
    
    
    
    
    
end %end while loop






end %end function













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function action = af (weighted_sum)


action = 1./(1+exp(-weighted_sum));  		% Logistic / Sigmoid Function


end


