function cal_fig8()

%% !!! Don't often run this function 
%% !!! Don't often run this function 
%% !!! Don't often run this function 
%% Default setting: Save rows upon logout

rng(0);
A = load('virtual mouse/para_10000.dat');

%     10    11;     12;       13;
% number;   KL;   RMSE;    I_EMT;

index = find(A(:,13) > 0.3 & A(:,13) < 0.9 & A(:,10) > 1e7 & A(:,10) < 10e7); 



n_grid = 100;
% Range = [0.5, 2];

beta         =  A(index,1);     R1 = [0.1,0.6];   
theta_Q      =  A(index,2);     R2 = [1e6, 1e7];
theta_beta   =  A(index,3);     R3 = [0.3,0.9];
kappa        =  A(index,4);     R4 = [0.01,0.1];
mu           =  A(index,5);     R5 = [0.1,0.7];
theta_mu     =  A(index,6);     R6 = [0.3,0.9];
K_Q          =  A(index,7);     R7 = [1e6,1e7];
nu           =  A(index,8);     R8 = [50,70];
sigma        =  A(index,9);     R9 = [3.5, 4.5];



% calculate Skewness(偏度) and Kurtosis(峰度)
skew_list = zeros(9,1);
kurt_list = zeros(9,1);

for i = 1:9
    skew_list(i) = skewness(A(index,i));
    kurt_list(i) = kurtosis(A(index,i));
end

writematrix(skew_list, 'data of plot/skew.dat');
writematrix(kurt_list, 'data of plot/kurt.dat');



beta_grid           =   linspace(R1(1), R1(2), n_grid);  
f_beta              =   ksdensity(beta, beta_grid, 'Support', [0.05, 0.8]);

theta_Q_grid        =   linspace(R2(1), R2(2), n_grid);  
f_theta_Q           =   ksdensity(theta_Q, theta_Q_grid, 'Support', [1e4, 15e6]);

theta_beta_grid     =   linspace(R3(1), R3(2), n_grid);  
f_theta_beta        =   ksdensity(theta_beta, theta_beta_grid, 'Support', [0.1, 1.6]);

kappa_grid          =   linspace(R4(1), R4(2), n_grid);  
f_kappa             =   ksdensity(kappa, kappa_grid, 'Support', [0.001, 0.15]);

mu_grid             =   linspace(R5(1), R5(2), n_grid);  
f_mu                =   ksdensity(mu, mu_grid, 'Support', [0.05, 1]);

theta_mu_grid       =   linspace(R6(1), R6(2), n_grid);  
f_theta_mu          =   ksdensity(theta_mu, theta_mu_grid, 'Support', [0.1, 1.5]);

K_Q_grid            =   linspace(R7(1), R7(2), n_grid);  
f_K_Q               =   ksdensity(K_Q, K_Q_grid, 'Support', [0.5e6, 15e6]);

nu_grid             =   linspace(R8(1), R8(2), n_grid);  
f_nu                =   ksdensity(nu, nu_grid, 'Support', [20, 150]);

sigma_grid          =   linspace(R9(1), R9(2), n_grid);  
f_sigma             =   ksdensity(sigma, sigma_grid, 'Support', [2,6]);


f_beta             = f_beta         / trapz(beta_grid, f_beta);
f_theta_Q          = f_theta_Q      / trapz(theta_Q_grid, f_theta_Q);
f_theta_beta       = f_theta_beta   / trapz(theta_beta_grid, f_theta_beta);
f_kappa            = f_kappa        / trapz(kappa_grid, f_kappa);
f_mu               = f_mu           / trapz(mu_grid, f_mu);
f_theta_mu         = f_theta_mu     / trapz(theta_mu_grid, f_theta_mu);
f_K_Q              = f_K_Q          / trapz(K_Q_grid, f_K_Q );
f_nu               = f_nu           / trapz(nu_grid, f_nu);
f_sigma            = f_sigma        / trapz(sigma_grid, f_sigma);




PAR = [beta_grid; theta_Q_grid; theta_beta_grid;...
    kappa_grid; mu_grid; theta_mu_grid;...
     K_Q_grid; nu_grid; sigma_grid; ];

RANGE_PAR = [R1; R2; R3; R4; R5; R6; R7; R8; R9];

F_PAR = [f_beta; f_theta_Q; f_theta_beta; f_kappa;...
         f_mu; f_theta_mu; f_K_Q;  f_nu; f_sigma];


% writematrix(PAR, 'data of plot/par.dat');
% writematrix(RANGE_PAR, 'data of plot/par_range.dat');
% writematrix(F_PAR, 'data of plot/par_density.dat');


n_sample = 100;
idx = [1, 5, 8, 9];
MAT = get_mouse(A(index,idx), n_sample);


% writematrix(MAT, 'virtual mouse/mouse.dat');


end




function MAT = get_mouse(A, n_sample)


[m, n] = size(A);
MAT = zeros(n_sample, n);


R = [0.05, 0.8; 0.05, 1; 20, 150; 2, 6];



for i = 1:4
    f = ksdensity(A(:,i), A(:,i), 'Support', R(i,:));
    W = f / sum(f);
    index = randsample(1:m, n_sample, true, W);
    MAT(:, i) = A(index, i);
end




end












