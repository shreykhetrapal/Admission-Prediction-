clear;
close all;
clc

data = csvread('Admission_Predict.csv');

X = data(:,[2,3,4,5,6,7,8]);
y = data(:,9);

% No plotting of data required


%============= Computing the Cost and Gradient ==============

% Setting up the data matrix appropriately

[m,n] = size(X);

% Adding intercept term ( that is column of 1's)
                         
X = [ones(m,1) X];
                         
% Inititalising the Theta Parameters
                         
initial_theta = zeros(n+1,1);
                         
[cost , grad] = admissionCostFunction(initial_theta,X,y);
                         
                         cost;
                         
                         grad;
                         
% Optimising using built in function fminunc
                         
                         options = optimset('GradObj', 'on', 'MaxIter', 4000);
                         
                         [theta, cost] = ...
                         fminunc(@(t)(admissionCostFunction(t, X, y)), initial_theta, options);
                         
                         theta;
                         
                        % Entering the marks and other data that we want to calculate
                         
                         prob = admissionSigmoid([1 340 118 4 4.5 4.5 9.65 1]*theta);
                         
                         printf('Admission Probability %.1f%% \n', round(prob*100));
                         
                        
                         
                         p = admissionPredict(theta,X);
                         
                         p2 = admissionSigmoid(y)>0.5;
                         
                         printf('Accuracy of Model : %.1f%% \n',round(mean(double(p==p2))*100));
                         
                        
                         
                         % ==== %.1f is for 1 decimal place printing only
                         
                         % ==== %.1f%% is for % sign after the printing
                         
                         
                         
                         

                         

                         
