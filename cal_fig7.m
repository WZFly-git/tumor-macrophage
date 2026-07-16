function cal_fig7()


%% calculate fig 7
Lambda_beta = linspace(0.2, 1, 30);
Lambda_mu   = linspace(0.05, 0.35, 30);
K_Q = linspace(3e6, 9e6, 30);


calculation(Lambda_beta, Lambda_mu, K_Q)


end








%%
function calculation(Lambda_beta, Lambda_mu, K_Q)
control();
parameter();

global md  par
Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;


A = cell(30,30);
for i =1:30
    for j=1:30
        par.lambda_beta = Lambda_beta(i);
        par.lambda_mu= Lambda_mu(j);
        [Q, ~] = solve(Q0, T);
        A{i,j} = Q;

        if(mod(i,10)==0 && mod(j,10)==0)
            disp([i,j]);
        end
    end
end

D = cell(1,3);
for i=1:3
    D{i} = zeros(30,30);
    for j = 1:30
        for k=1:30
            D{i}(j,k) = sum(A{j,k}(i*40+3,51:end))/sum(A{j,k}(i*40+3,:));
        end
    end
end

save('data/double_par/beta_mu.mat', 'A');
save('data/double_par/beta_mu_D.mat', 'D');




parameter();


for i =1:30
    for j=1:30
        par.lambda_mu= Lambda_mu(i);
        par.K_Q = K_Q(j);
        [Q, ~] = solve(Q0, T);
        A{i,j} = Q;

        if(mod(i,10)==0 && mod(j,10)==0)
            disp([i,j]);
        end
    end
end

for i=1:3
    D{i} = zeros(30,30);
    for j = 1:30
        for k=1:30
            D{i}(j,k) = sum(A{j,k}(i*40+3,51:end))/sum(A{j,k}(i*40+3,:));
        end
    end
end

save('data/double_par/mu_KQ.mat', 'A');
save('data/double_par/mu_KQ_D.mat', 'D');



parameter();

for i =1:30
    for j=1:30
        par.K_Q = K_Q(i);
        par.lambda_beta = Lambda_beta(j);
        [Q, ~] = solve(Q0, T);
        A{i,j} = Q;

        if(mod(i,10)==0 && mod(j,10)==0)
            disp([i,j]);
        end
    end
end

for i=1:3
    D{i} = zeros(30,30);
    for j = 1:30
        for k=1:30
            D{i}(j,k) = sum(A{j,k}(i*40+3,51:end))/sum(A{j,k}(i*40+3,:));
        end
    end
end


save('data/double_par/KQ_beta.mat', 'A');
save('data/double_par/KQ_beta_D.mat', 'D');

end

