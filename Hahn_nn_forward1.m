function sse=Hahn_nn_forward(pattern,category,w,top)

    w1=reshape(w(1:top(1)*(top(2)-1)),top(1),top(2)-1);
    w2=reshape(w(top(1)*(top(2)-1)+1:end),top(2),top(3));
    
    
    bias=ones(size(pattern,1),1);
        
    act1 = [af(pattern * w1) bias];      
    act2 = af(act1 * w2); 

    error = category - act2;
    sse = sum(error.^2);
    
    
    plot(act2,'bx')
    hold on
    plot(category,'rx')
    hold off
    
    






end














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



