function [global_best_fitness,global_best_parameters] = PSO_GIF()

%--------------------------------------%
%--------------------------------------%
clear all;
clc;
clf;



figure('visible','off');
filename = 'pso_out221.gif';

number_parameters=2;

number_agents = 2^4;

number_iterations = 2^8;

size_search_space=100;



resolution=20;



theta=[0.4, 1.0, 0.13, 1.8]; %Boot Values

training_inertia_min=theta(1);

training_inertia_max=theta(2);

local_influence=theta(3);

global_influence=theta(4);



upper_search_limit=size_search_space;

lower_search_limit=-size_search_space;

%--------------------------------------%

fitnessplot=zeros(1,number_iterations);

parameterplot=zeros(number_parameters,number_iterations);

n=1:number_iterations;

%--------------------------------------%

[X,Y] = meshgrid(-size_search_space:size_search_space/resolution:size_search_space, -size_search_space:size_search_space/resolution:size_search_space);

Z=fitness(X,Y);

%--------------------------------------%

lower_search_limit


agent_parameters=lower_search_limit+(upper_search_limit-lower_search_limit)*rand(number_parameters,number_agents);

delta_agent_parameters=0.*agent_parameters;

%--------------------------------------%

agent_fitness(1:number_agents)=fitness(agent_parameters(1,:),agent_parameters(2,:));

local_best_fitness=agent_fitness;

local_best_parameters=agent_parameters;

[global_best_fitness,global_best_agent]=min(local_best_fitness);

global_best_parameters=agent_parameters(:,global_best_agent);

%--------------------------------------%


for iteration_index = 1 : number_iterations


    agent_fitness(1:number_agents)=fitness(agent_parameters(1,:),agent_parameters(2,:));


    for agent_index = 1 : number_agents


        if agent_fitness(agent_index) < local_best_fitness(agent_index)


            local_best_fitness(agent_index)=agent_fitness(agent_index);

            local_best_parameters(agent_index)=agent_parameters(agent_index);


        end % end if

        if agent_fitness(agent_index) < global_best_fitness

            global_best_fitness=agent_fitness(agent_index)  %<--------

            global_best_agent=agent_index;

            global_best_parameters=agent_parameters(:,global_best_agent);

        end % end if

    end % for agent_index = 1 : number_agents



    %--------------------------------------%

    variation=rand(number_parameters,number_agents,2);

    training_inertia=training_inertia_max-((training_inertia_max-training_inertia_min)/(number_iterations))*(iteration_index);

    %--------------------------------------%

    for agent_index = 1 : number_agents


        for parameter_index = 1 : number_parameters


            delta_agent_parameters(parameter_index,agent_index)=training_inertia*delta_agent_parameters(parameter_index,agent_index)+global_influence*variation(parameter_index,agent_index,1)*(global_best_parameters(parameter_index)-agent_parameters(parameter_index,agent_index))+local_influence*variation(parameter_index,agent_index,2)*(local_best_parameters(parameter_index,agent_index)-agent_parameters(parameter_index,agent_index));

            agent_parameters(parameter_index,agent_index)=agent_parameters(parameter_index,agent_index)+delta_agent_parameters(parameter_index,agent_index);


        end % for parameter_index = 1 : number_parameters


    end % for agent_index = 1 : number_agents

    %--------------------------------------%

    fitnessplot(iteration_index)=global_best_fitness;

    parameterplot(:,iteration_index)=global_best_parameters(:);


    %--------------------------------------%

	
		%pause
		clf
		axis([-size_search_space, size_search_space, -size_search_space, size_search_space]);
		surf(X,Y,Z,'EdgeColor','none')
		hold on;
		grid off;
		axis([-size_search_space, size_search_space, -size_search_space, size_search_space]);
		scatter3(agent_parameters(1,:),agent_parameters(2,:),fitness(agent_parameters(1,:),agent_parameters(2,:)),300,'wp','filled');
		%scatter3(agent_parameters(1,:),agent_parameters(2,:),fitness(agent_parameters(1,:),agent_parameters(2,:)),300,'wp','filled');
		view(0,90)
		%view(-22,78);
		%view(72,66);
		set(gca,'Fontsize',16);
		title('Swarm Optimization');
		xlabel('Parameter 1');
		ylabel('Parameter 2');
		zlabel('Fitness');
		
		
		frame = getframe(1);
		im = frame2im(frame);
		[imind,cm] = rgb2ind(im,256);
		
		
		if iteration_index == 1;
			imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0);
		else
			imwrite(imind,cm,filename,'gif','WriteMode','append');
		end


    %--------------------------------------%

end % end main loop

%--------------------------------------%

 %figure
 
% plot(n,fitnessplot)
% title('Convergence of Fitness')
% xlabel('Iteration');
% ylabel('Fitness');
% 
% figure
% 
% plot(n,parameterplot(1,:))
% title('Convergence of Parameter 1')
% xlabel('Iteration');
% ylabel('Parameter 1');
% 
% 
% figure
% 
% plot(n,parameterplot(1,:))
% title('Convergence of Parameter 2');
% xlabel('Iteration');
% ylabel('Parameter 2');








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------%
%--------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Z = fitness(X,Y)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Gaussian Well %Global minimum: f(x)=-2, x(i)=5, i=1:2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Z=-2*exp(-.01*(X-5).^2 - .01*(Y-5).^2) + 2;


% Z=-2*exp(-.01*(X-50).^2 - .01*(Y-50).^2) -2*exp(-.01*(X).^2 - .01*(Y).^2) -4*exp(-.01*(X+50).^2 - .01*(Y+50).^2) + 4 ;
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A=-2*exp(-.01*(X-5).^2 - .01*(Y-5).^2);
% B=-1.3*exp(-.01*(X+18).^2 - .01*(Y+18).^2);
% C=-.9*exp(-.01*(X+20).^2 - .01*(Y-10).^2);
% D=-exp(-.01*(X-20).^2 - .01*(Y+18).^2);
% 
% Z=A+B+C+D;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%De Jong's sphere %Global minimum: f(x)=0, x(i)=0, i=1:n
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Z=sum(x(i)^2) %i=1:n, -5.12<=x(i)<=5.12.

%Z=X.^2+Y.^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  
  
 
 
 
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Schwefel's function %Global minimum: f(x)=-n*418.9829; x(i)=420.9687, i=1:n
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  %Z=sum(-x(i)*sin(sqrt(abs(x(i))))), i=1:n; -500<=x(i)<=500.
  
%   Z=-X.*sin(sqrt(abs(X)))-Y.*sin(sqrt(abs(Y)));

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%Rastrigin's function %Global minimum: f(x)=0; x(i)=0, i=1:n.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Z=10án+sum(x(i)^2-10ácos(2ápiáx(i))), i=1:n; -5.12<=x(i)<=5.12.
  

Z=20+X.^2-10.*cos(2.*pi.*X)+Y.^2-10.*cos(2.*pi.*Y);

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  
  
  




