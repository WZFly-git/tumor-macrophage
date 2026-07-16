function Q0 = initial(string)

global N
x = linspace(0,1,N);


if strcmp(string, 'fitting')
    i = 1;
elseif strcmp(string, 'PRCC')
    i = 2;
end



switch i
    case 1
        Q0 = betapdf(x, 2, 10) * 1e4;
    case 2
        Q0 = betapdf(x, 2, 10) * 1e4;
end








