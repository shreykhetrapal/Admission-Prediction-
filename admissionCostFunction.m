function [J, grad] = costFunction(theta, X,y)


% Initialising some useful values

m = length(y);

J = 0;

grad = zeros(size(theta));


J = (1 / m) * sum( -y'*log(admissionSigmoid(X*theta)) - (1-y)'*log( 1 - admissionSigmoid(X*theta)) );

grad = (1 / m) * sum( X .* repmat((admissionSigmoid(X*theta) - y), 1, size(X,2)) );


end
