function cal_fig5()

no_mac();
mac_fix();


end





function no_mac()

control();
parameter();

global md par N

Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;

par.lambda_beta = 0;
par.lambda_mu = 0;
par.varepsilon_1 = 0;
par.varepsilon_2 = 0;

[Q, ~] = solve(Q0, T);
Q = to_dist(Q);
writematrix(Q, 'data/fix_mac/no_mac.dat');

end



function mac_fix()

control();
parameter();

global md 

Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;

u=0:0.01:1;
M_I = betapdf(u, 2, 10);
[Q, ~] = solve1(Q0, T, M_I); Q = to_dist(Q);
writematrix(Q, 'data/fix_mac/mac_I.dat');

M_II = betapdf(u, 10, 2);
[Q, ~] = solve1(Q0, T, M_II);Q = to_dist(Q);
writematrix(Q, 'data/fix_mac/mac_II.dat');

M_mix = betapdf(u, 6, 6);
[Q, ~] = solve1(Q0, T, M_mix);Q = to_dist(Q);
writematrix(Q, 'data/fix_mac/mac_mix.dat');


end








%% fix 
function [Q, Object] = solve1(Q0, T, M_I)

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
    [dQdt, object] = fun1(Q(i-1,:), Q(i-index,:), T(i-1), M_I);
    Q(i,:) = Q(i-1,:) + md.h * dQdt;
    Object{i} = object;
end


end


function [dQdt, object] = fun1(Q, Q_tau, t, M_I)

global md N

M = M_I;
M_tau = M_I;
[beta, kappa, mu, beta_tau] = Dynamic(Q, Q_tau, M, M_tau);

[P, varphi] = Inherit(M_tau);

Value = zeros(N, N);

value = beta_tau .* Q_tau;
value = value * exp(-mu* md.tau);

for i = 1:N
    Value(i, :) = P(i, :) .* value;
end

int = Integral(Value);
int = int';

dQdt = -(beta + kappa) .* Q + 2 * int;



object = cell(5, 1);

object{1} = beta;
object{2} = mu;
object{3} = varphi;
object{4} = (beta + kappa) .* Q;
object{5} = int * 2;

end


function Q_pic = to_dist(Q)
[m,~] = size(Q);

for i = 1:m
    Q_pic(i,:) = Q(i,:)/sum(Q(i,:));
end

end