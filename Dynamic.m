function [beta, kappa, mu, beta_tau] = Dynamic(Q, Q_tau, M, M_tau)

% beta and kappa is vector
% mu is value  because it has nothing to do with heterogeneity.


global par N
x = linspace(0, 1, N);
u = linspace(0, 1, N);
%% beta
frac_beta = (par.a_1.*x + (par.a_2.*x).^par.n_beta) ./ (1 + (par.a_3.*x).^par.n_beta);

frac_Q = par.theta_Q / (par.theta_Q + sum(Q));

frac_u1 = u.^par.n_1 ./ (u.^par.n_1 + par.theta_beta^par.n_1);
value = M .* frac_u1;
int = Integral(value);
beta = par.beta .* (1 + frac_beta) .* frac_Q .* (1 + par.lambda_beta * int);


%% kappa
frac_kappa = x.^par.n ./ (x.^par.n + par.K_kappa^par.n);
kappa = par.kappa .* frac_kappa;


%% mu
frac_u2 = par.theta_mu.^par.n_2 ./ (u.^par.n_2 + par.theta_mu^par.n_2);
value = M .* frac_u2;

int = Integral(value);
mu = par.mu* (1 + par.lambda_mu* int);  % just one value

%% beta_tau
frac_Q_tau = par.theta_Q ./ (par.theta_Q + sum(Q_tau));
value_tau = M_tau .* frac_u1;
int_tau = Integral(value_tau);
beta_tau = par.beta .* (1 + frac_beta) .* frac_Q_tau .* (1 + par.lambda_beta * int_tau);

end