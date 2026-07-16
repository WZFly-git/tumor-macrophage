function [dQdt, object] = fun(Q, Q_tau, t)

global md N

M = Distribution_mac(Q);
M_tau = Distribution_mac(Q_tau);
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