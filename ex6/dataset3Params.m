function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0;
sigma = 0;

% ====================== YOUR CODE HERE ======================

cVec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
predictions = zeros(size(yval,1),3);
meanpredictions = zeros(size(cVec,1)*size(cVec,1),1);
sigmaVec = cVec;
k=0;
for i = 1:size(cVec,1)
	for j = 1:size(cVec,1)
		C = cVec(i)
		sigma = cVec(j)
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, 		x2, sigma));
		k = k+1;
		predictions = svmPredict(model, Xval);
		meanpredictions(k,1) = mean(double(predictions ~=  			yval));
		meanpredictions(k,2) = C;
		meanpredictions(k,3) = sigma;
	end
end
[maxpred ind] = min(meanpredictions(:,1));
C = meanpredictions(ind,2);
sigma = meanpredictions(ind,3);	

% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


%the result of the training above and choosing the best 
%C and sigma is C=1 and sigma=0.1




% =========================================================================

end
