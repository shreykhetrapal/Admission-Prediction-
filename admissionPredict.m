function p = admissionPredict (theta,X)

m = size(X,1);

p = zeros(m,1);

p = admissionSigmoid(X*theta)>=0.5;


end
