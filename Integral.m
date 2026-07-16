function I = Integral(Value, a, b)
% To integral the row 

% default on [0, 1]
if nargin == 1
    a = 0;  b = 1;
end


[m,~] = size(Value);

I = zeros(m,1);
for i = 1:m
    I(i) = integral(Value(i,:), a, b);
end

end


function I = integral(value, a, b)
    % Composite Simpson
    n = length(value);
    I = 0;

    for j = 2:2:n-1
        I = I + 4 * value(j);
    end

    for j = 3:2:n-2
        I = I + 2 * value(j);
    end

    I = I + value(1) + value(n);

    h = 2 *(b-a) / (n-1); 
    I = I * h / 6;
    
end