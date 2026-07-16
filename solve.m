function [Q, Object] = solve(Q0, T)

global md N
M = length(T);
Q = zeros(M, N);
Object = cell(M, 1);
index = find(T == 0);


for i = 1:index
    Q(i,:) = Q0;
end

%% Euler 
for i = index + 1 : M
    [dQdt, object] = fun(Q(i-1,:), Q(i-index,:), T(i-1));
    Q(i,:) = Q(i-1,:) + md.h * dQdt;
    Object{i} = object;
end


end