function cal_fig3()

parname = {'beta', 'theta_Q', 'lambda_beta', 'theta_beta', 'kappa', 'mu',...
    'lambda_mu', 'theta_mu', 'nu', 'sigma', 'nu_u',...
   'K_Q'};

namestyle = {'$\bar{\beta}$', '$\theta_{\hat{Q}}$', '$\lambda_\beta$', '$\theta_\beta$',...
    '$\bar{\kappa}$', '$\bar{\mu}$','$\lambda_\mu$', '$\theta_\mu$', '$\nu$',...
     '$\sigma$', '$\nu_u$','$K_{\hat{Q}}$'};

m = length(parname);
n = 100;


PRCC(parname, m, n);


end




function PRCC(parname, m, n)

%% basic preparation
control();
parameter();
global md
Q0 = initial('PRCC');
T = -md.tau:md.h:md.end_Time;


%% parameter sampling and calculate
sample_mat = lhsdesign(n, m);
def_par_matrix(sample_mat, parname, m);
calculation(n, parname, m, Q0, T);




%% to rank matrix
para_mat = load("data/PRCC/para_mat.dat");
target_p = load('data/PRCC/target_p.dat');
target_r = load('data/PRCC/target_r.dat');



for colume = 1:m
    para_mat(:, colume) = tiedrank(para_mat(:, colume));
end
outcome_p = tiedrank(target_p);
outcome_r = tiedrank(target_r);


%% get PRCC value 
p_value = zeros(1,m);
for k = 1:m
    col = setdiff(1:m, k);
    p_value(k) = partialcorr(outcome_p, para_mat(:,k), para_mat(:,col));
end
writematrix(p_value, 'data/PRCC/p_p.dat');



for k = 1:m
    col = setdiff(1:m, k);
    p_value(k) = partialcorr(outcome_r, para_mat(:,k), para_mat(:,col));
end
writematrix(p_value, 'data/PRCC/p_r.dat');



end



function def_par_matrix(sample_mat, parname, m)

global par 
para_mat = zeros(size(sample_mat));

for i = 1:m
    name = parname{i};
    para_mat(:, i) = par.(name) * (0.95 + 0.1 * sample_mat(:, i)); % 5% oscillate 
end

writematrix(para_mat, 'data/PRCC/para_mat.dat');

end




function calculation(n, parname, m, Q0, T)

para_mat = load( 'data/PRCC/para_mat.dat');

global par 

target_p = zeros(n,1); % to save proliferation
target_r = zeros(n,1); % to save ratio


ALL = cell(n,1);


for s = 1:n

    for i = 1:m
        name = parname{i};
        par.(name) = para_mat(s, i);
    end

    [Mat, ~]= solve(Q0, T);

    ALL{s} = Mat;
    

    target_r(s) = sum(Mat(123, 51:101)) / sum(Mat(123, 1:end)); 
    % day 60: value of I_EMT


    Q_total = sum(Mat, 2);
    A = polyfit(T, log(Q_total), 1);
    target_p(s) = A(1);
    % average proliferation ratio

    disp(s);
end


save('data/PRCC/ALL.mat', 'ALL');
writematrix(target_p, 'data/PRCC/target_p.dat');
writematrix(target_r, 'data/PRCC/target_r.dat');

end