function virtual_treat()

% Anti-CSF-1R treatment 
% the data are stored in 'virtual_data/notreat/all_data.mat'
% to plot fig 9-11

control();
parameter();

global md par
Q0 = initial('fitting');

T = -md.tau:md.h:md.end_Time;


MAT_mouse = load('virtual_data/virtual mouse/mouse.dat');


% Durg role
par.lambda_mu = 0.6; 
par.K_Q = 4e6;       
par.varepsilon_1 = 0.1;
par.varepsilon_2 = 0.25;






Mouse = cell(100,1);
for i = 1:100
    par.beta = MAT_mouse(i,1);
    par.mu = MAT_mouse(i,2);
    par.nu = MAT_mouse(i,3);
    par.sigma = MAT_mouse(i,4);
    [Q, ~] = solve(Q0, T);
    Mouse{i} = Q;
    disp(i);
end

save('virtual_data/treat/all_data.mat', 'Mouse');



end