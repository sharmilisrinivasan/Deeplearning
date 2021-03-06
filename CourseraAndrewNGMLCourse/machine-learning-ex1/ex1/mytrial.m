clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = [0.001,0.01,0.03,0.1,0.3,1];
num_iters = 600;

% Plot the convergence graph
figure;
colors = ['k','r','b','g','m','c'];

% Init Theta and Run Gradient Descent 
for trial_alpha=1:columns(alpha)
	theta = zeros(3, 1);
	[theta, J_history] = gradientDescentMulti(X, y, theta, alpha(trial_alpha), num_iters);
	plot(1:numel(J_history), J_history, colors(trial_alpha), 'LineWidth', 2);
	if (trial_alpha == 1)
		xlabel('Number of iterations');
		ylabel('Cost J');
		hold on;
	endif
endfor

hold off;
