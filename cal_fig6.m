function cal_fig6()

Lambda_beta = linspace(0.2, 1, 100);
Lambda_mu   = linspace(0.05, 0.35, 100);
K_Q = linspace(3e6, 9e6, 100);

calculation(Lambda_beta, Lambda_mu, K_Q);



end










%%
function calculation(Lambda_beta, Lambda_mu, K_Q)
control();
parameter();

global md  par

Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;



A = cell(1,100);


for i =1:100
    par.lambda_beta = Lambda_beta(i);
    [Q, ~] = solve(Q0, T);
    A{i} = Q;

    if(mod(i,10)==0)
        disp(i);
    end
end
save('data/par-ratio/L_beta.mat', 'A');



parameter();

for i =1:100
    par.lambda_mu= Lambda_mu(i);
    [Q, ~] = solve(Q0, T);
    A{i} = Q; 
    if(mod(i,10)==0)
        disp(i);
    end
end
save('data/par-ratio/L_mu.mat', 'A');


parameter();
for i =1:100
    par.K_Q = K_Q(i);
    [Q, ~] = solve(Q0, T);
    A{i} = Q;
    if(mod(i,10)==0)
        disp(i);
    end
end
save('data/par-ratio/K_Q.mat', 'A');







end

