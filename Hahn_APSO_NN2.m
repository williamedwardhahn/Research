%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
% William Hahn 
% APSO DRIVEN NEURAL NETWORK
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [global_best_fitness,global_best_parameters] = PSO_NN()

%--------------------------------------%
%--------------------------------------%

clear all;
clc;
%clf;

global number_parameters
global pattern
global category
global num_pattern
global length_pattern
global length_category
global num_hidden
global num_out




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
% Test Data Sets
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% pattern=[0,0;0,1;1,0;1,1]; %binary
% category=[0,1,1,0]';

%pattern=[0,0;0,1;1,0;1,1]; %polar
%category=[-1,1,1,-1]';


%pattern=[1,0,0;0,1,0;0,0,1;1,1,1;0,0,0;1,1,0;0,1,1;1,0,1];
%category=[1,1,1,0,0,0,0,0]';

%pattern=[1,0,0;0,1,0;0,0,1;1,1,1;0,0,0;1,1,0;0,1,1;1,0,1];
%category=[1,1,1,-1,-1,-1,-1,-1]';

% 
% pattern=[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;1,1,1,1;0,0,0,0;1,1,0,0;0,0,1,1;1,1,0,1;1,0,1,1;1,0,0,1;0,1,1,0;1,0,1,0;0,1,0,1;0,1,1,1;1,1,1,0]
% category=[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0]'


x=[0:.1:2]

% y=10.*x+0.5;
% y=x.^2;
   y=abs(sin(x));
%y=sin(2.*x)+x;
%  y=x.^2+20.*rand(size(x));
%   y=exp(-(x-10).^2)+0.*rand(size(x));

%  y=exp(-(x-4).^2);
%  y=10.*exp(-(x-4).^2)+sin(2.*x)+x;


x=x/norm(x);
y=y/norm(y);


pattern = x; 
category = y;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_pattern=size(pattern,1);
length_pattern=size(pattern,2);
length_category=size(category,2);
num_hidden=length_pattern+1;
num_out=length_category;
number_parameters=(length_pattern+1)*num_hidden+(num_hidden+1)*num_out;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N  = 2^8;  % Steps
n  = 2^4;    % Agents
ss = .01;
d  = number_parameters;

beta=0.5;

xn=rand(d,n)*(2*ss)-ss;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t0=1;

tN=0.00001;

j=1:N;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%*(1)*%

alpha=t0*(tN/t0).^(j/N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

delta=randn(N,n,d);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:N
        
    zn=fitnesswrapper(xn);
        
    [zn_m,z_i]=min(zn);
    
    x0=xn(:,z_i);
    
    for j = 1 : d
        
        xn(j,:) = xn(j,:).*(1-beta)+ x0(j).*beta + alpha(i).*delta(i,:,j);
        
    end
    
end


x0
zn_m


fitnessprint(x0);


function return_fitness = fitnesswrapper(agent_parameters)

c=size(agent_parameters,2); 

return_fitness=zeros(1,c);

for index = 1 : c
    
    return_fitness(index)=fitnessprint(agent_parameters(:,index));
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function return_fitness = fitness (agent_parameters)


global pattern
global category
global num_pattern
global length_pattern


[hidden_weights,output_weights]=convert_vec_mat(agent_parameters');

err=[];


for num_pattern_index = 1 : num_pattern

    
	neural_input=[];

    
	for pattern_element_index = 1 : length_pattern
	
		neural_input=[neural_input,pattern(num_pattern_index,pattern_element_index)];
		
	end %pattern_element_index
	
	
	neural_output(num_pattern_index,:)=neural_network(neural_input,hidden_weights,output_weights);
    
			
end %num_pattern_index


%return_fitness=sum(abs(category-neural_output).^2);
%return_fitness=sum(abs(category-neural_output));
%return_fitness=(1./num_pattern).*sum((category-neural_output).^2);

return_fitness=sqrt((1./num_pattern).*sum((category-neural_output).^2)) + 0.01*sum(agent_parameters.^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function return_fitness = fitnessprint(agent_parameters)


global pattern
global category
global num_pattern
global length_pattern


[hidden_weights,output_weights]=convert_vec_mat(agent_parameters');

err=[];


for num_pattern_index = 1 : num_pattern

    
	neural_input=[];

    
	for pattern_element_index = 1 : length_pattern
	
		neural_input=[neural_input,pattern(num_pattern_index,pattern_element_index)];
		
	end %pattern_element_index
	
	
	neural_output(num_pattern_index,:)=neural_network(neural_input,hidden_weights,output_weights);
    
			
end %num_pattern_index



clf
subplot(211)
plot(category,'ob','MarkerSize',25);
hold on;
plot(neural_output,'pr','MarkerSize',25,'MarkerFaceColor','r');
drawnow()




%return_fitness=sum(abs(category-neural_output).^2);
%return_fitness=sum(abs(category-neural_output));
%return_fitness=(1./num_pattern).*sum((category-neural_output).^2);

return_fitness=sqrt((1./num_pattern).*sum((category-neural_output).^2));





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [hidden_weights,output_weights] = convert_vec_mat(agent_parameters)

global hidden_weights;
global output_weights;
global length_pattern;
global length_category;
global num_hidden;



hidden_weights=reshape(agent_parameters(1:(length_pattern+1)*num_hidden),length_pattern+1,num_hidden);
output_weights=reshape(agent_parameters(((length_pattern+1)*num_hidden)+1:length(agent_parameters)),num_hidden+1,length_category);










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function network_output = neural_network (neural_input,hidden_weights,output_weights)

neural_input=[1,neural_input]; 

network_output=af([1,af(neural_input*hidden_weights)]*output_weights);


%network_output=([1,af(neural_input*hidden_weights)]*output_weights);












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function action = af (weighted_sum)


action = 1./(1+exp(-weighted_sum));  		% Logistic / Sigmoid Function


%action = tanh(weighted_sum);   			% Hyperbolic Tangent


% action = (weighted_sum > 0) + 0.0;          % Heaviside Function










