function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

temp_X = [X, y]
pos_idx = temp_X(:,3)==1;
neg_idx = temp_X(:,3)==0;
pos_example = temp_X(pos_idx,1:2);
neg_example = temp_X(neg_idx,1:2);
plot(pos_example, 'k+', neg_example, 'ko');





% =========================================================================



hold off;

end
