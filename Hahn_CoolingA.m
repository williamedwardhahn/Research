%%%%%%%%%%%%%%%%%%%%%%%%%%/
% Annealing Schedules
%%%%%%%%%%%%%%%%%%%%%%%%%%/   
function returncool = Hahn_CoolingA()   
   
 
t0=0.5;

tN=0.001;

N=100;

j=1:N;

clf;



%%%%%%%%%%%%%%%%%%%%%%%%%%/   


	%t(j)=t0-j*(t0-tN)/N
	
	%subplot(3,3,1)
	
	%plot(t)
	
%%%%%%%%%%%%%%%%%%%%%%%%%/   


	
	t(j)=t0*(tN/t0).^(j/N);
	
	subplot(3,3,1)
	
	plot(t)
	title('t(j)=t0*(tN/t0)^(j/N)')

%%%%%%%%%%%%%%%%%%%%%%%%%%/   
	
	A=((t0-tN)*(N+1))/N;
	
	B=t0-A;

	t(j)=2*(A./(j+1)+B);
	
	subplot(3,3,2)
	
	plot(t)
    title('A=((t0-tN)*(N+1))/N;B=t0-A;t(j)=2*(A/(j+1)+B)')


%%%%%%%%%%%%%%%%%%%%%%%%%%/   

	A=log(t0-tN)./log(N);

	t(j)=-(t0-j.^A);
	
	subplot(3,3,3)
	
	plot(t)
	title('A=log(t0-tN)/log(N);t(j)=-(t0-j.^A)')
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   


	t(j)=(t0-tN)./(1+exp(.3*(j-N/2)))+tN;
	
	subplot(3,3,4)
	
	plot(t)
    title('t(j)=(t0-tN)/(1+exp(.3*(j-N/2)))+tN;')

%%%%%%%%%%%%%%%%%%%%%%%%%%/   


	t(j)=(1/2)*(t0-tN)*(1+cos(j*pi/N))+tN;
	
	subplot(3,3,5)
	
	plot(t)
    title('t(j)=(1/2)*(t0-tN)*(1+cos(j*pi/N))+tN')
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   


	t(j)=(1/2)*(t0-tN)*(1-tanh(10*j/N-5))+tN;
	
	subplot(3,3,6)
	
	plot(t)
    title('t(j)=(1/2)*(t0-tN)*(1-tanh(10*j/N-5))+tN')
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   
	
	
	
	t(j)=(t0-tN)./(cosh(10*j/N))+tN;
	
	subplot(3,3,7)
	
	plot(t)
    title('t(j)=(t0-tN)/(cosh(10*j/N))+tN')
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   

	A=(1/N)*log(t0/tN);

	t(j)=t0*exp(-A*j);
	
	subplot(3,3,8)
	
	plot(t)
    title('A=(1/N)*log(t0/tN);t(j)=t0*exp(-A*j)')
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   

	A=(1/N^2)*log(t0/tN);

	t(j)=t0*exp(-A*j.^2);
	
	subplot(3,3,9)
	
	plot(t)
    title('A=(1/N^2)*log(t0/tN);t(j)=t0*exp(-A*j^2)')
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%/   
	
	
	
	
	returncool=0;
	
	
	
end
	
	
	
	
	
	






	
	
	
	
	


