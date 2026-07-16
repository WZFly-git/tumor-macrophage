function parameter()

global par

%% beta
par.beta = 0.35;

par.a_1 = 5.8;
par.a_2 = 2.2;
par.a_3 = 3.75;
par.n_beta = 6;
par.theta_Q = 5e6;
par.lambda_beta = 0.57;
par.n_1 = 5;
par.theta_beta = 0.63;


%% kappa
par.kappa = 0.05;

par.K_kappa = 0.5;
par.n = 3;


%% mu
par.mu = 0.4;
par.lambda_mu = 0.21;
par.theta_mu = 0.62;
par.n_2 = 3;

%% inherit

par.nu = 60;
par.varphi_0 = 0.1;
par.varphi_1 = 0.6;
par.varepsilon_1 = 0.25;
par.varepsilon_2 = 0.3;
par.sigma = 4;
par.m = 8;

%% mac
par.nu_u = 10;
par.phi_0 = 0.15;
par.phi_1 = 0.8;
par.K_Q = 6e6;




end