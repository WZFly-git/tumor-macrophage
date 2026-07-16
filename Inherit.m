function [P, varphi] = Inherit(M)
% P_ij = p(x|y) = p(x = i|y = j)
global N par
x = linspace(0, 1, N);
P = zeros(N, N);

M_half = M( 49:end );
int = Integral(M_half, 0.5, 1);

varphi_u = par.varphi_1 .* (1 + par.varepsilon_1* int);
sigma = par.sigma * (1 + par.varepsilon_2* int);

inherit = (x .* sigma) .^ par.m ./ (1 + (x .* sigma) .^ par.m);


varphi = par.varphi_0 +  varphi_u .* inherit ;

a = par.nu .* varphi;
b = par.nu .* (1-varphi);

a(a<=1) = 1.001;
b(b<=1) = 1.001;


X = repmat(x, N, 1);
A = repmat(a, N, 1);
B = repmat(b, N, 1);

P = betapdf(X',A,B);

end