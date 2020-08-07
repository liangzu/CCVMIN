time_taken = 0;
err = 0;
n = 3;
m = 100;
sigma = 0.01;

repeat = 1;
for i=1:repeat
    
    % generate data
    A = randn(m, n);

    x = randn(n,1);
    y = A*x+sigma*randn(m,1);
    [y, yidx]= sort(y);
    A = A(yidx,:);

    pidx = randperm(m);

    % run the algorithm
    tic;
    [x_hatv4, ~, ~] = SLR_cvx_max_v4(A(pidx,:), y);
    time_taken = time_taken + toc;
    
    err = err + norm(x_hatv4-x)/norm(x);
end
[time_taken/repeat err/repeat]


[~, sidx] = sort(A(pidx,:)*x_hatv4);
%norm(y-sort(A(pidx,:)*x_hatv4))
%[sidx  pidx' yidx]

%sum(sidx(pidx')-(1:m)'==0)

% y_idx = (min_s-(1:m)')/m+1;
% 
% x_hat = A\y(y_idx,:);
% 
% [norm(A*x_hat- y,'fro') norm(x_hat-x)/norm(x)]