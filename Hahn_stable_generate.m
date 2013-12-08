function F = Hahn_stable_generate(alpha,beta,gamma,delta,size)

    alpha=alpha+10^(-10);

    A = pi/2 * (2*rand(size) - 1); 
    B = - log( rand(size) );       
    C = beta * tan(pi*alpha/2);
    D = atan( C );
    E = (1 + C * C).^(1/(2*alpha));
    F = E * sin( alpha*A + D ) ./ ( cos(A) ).^(1/alpha) .*( cos( (1-alpha) * A - D ) ./ B ).^((1-alpha)/alpha);

    F = gamma * F + delta;


end
