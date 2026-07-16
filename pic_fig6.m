function pic_fig6()


Lambda_beta = linspace(0.2, 1, 100);
Lambda_mu   = linspace(0.05, 0.35, 100);
K_Q = linspace(3e6, 9e6, 100);


M = zeros(1,100);
%%
close all;
figure('Position', [100,100,400,300])
A = load('data/par-ratio/L_beta.mat'); A = A.A;
hold on; box on; grid on;
for i = 1:3
    for j = 1:100
        M(j) = sum(A{j}(i*40+3,51:end))/sum(A{j}(i*40+3,:));
    end
    plot(Lambda_beta, M, 'LineWidth', 1.2);
end

legend('day 20', 'day 40', 'day 60', 'Location', 'northwest', 'box', 'off', 'FontSize', 14); 

ylim([0.2, 0.7]); xlim([0.2, 1]);
xlabel('$\lambda_\beta$','Interpreter','latex','FontSize',14);
ylabel('$$I_{\rm EMT}$$','Interpreter','latex','FontSize',16);
% set(gca,'FontName','Airal','FontSize',12);
% print('Figure/fig6/beta','-dpng','-r600');



%%
figure('Position', [500,100,400,300])
A = load('data/par-ratio/L_mu.mat'); A = A.A;
hold on; box on; grid on;
for i = 1:3
    for j = 1:100
        M(j) = sum(A{j}(i*40+3,51:end))/sum(A{j}(i*40+3,:));
    end
    plot(Lambda_mu, M, 'LineWidth', 1.2);

end
legend('day 20', 'day 40', 'day 60', 'Location', 'northeast', 'box', 'off', 'FontSize', 14); 
ylim([0.2, 0.7]); xlim([0.05, 0.35]);

xlabel('$\lambda_\mu$','Interpreter','latex','FontSize',14);
ylabel('$I_{\rm EMT}$','Interpreter','latex','FontSize',16);

% set(gca,'FontName','Airal','FontSize',12);
% print('Figure/fig6/mu','-dpng','-r600');


%%
figure('Position', [900,100,400,300])
A = load('data/par-ratio/K_Q.mat'); A = A.A;
hold on; box on; grid on;
for i = 1:3
    for j = 1:100
        M(j) = sum(A{j}(i*40+3,51:end))/sum(A{j}(i*40+3,:));
    end
    plot(K_Q, M, 'LineWidth', 1.2);

end
legend('day 20', 'day 40', 'day 60', 'Location', 'northeast', 'box', 'off', 'FontSize', 14); 
ylim([0.2, 0.7]); xlim([3e6,9e6]);

xlabel('$K_{\hat{Q}}$','Interpreter','latex','FontSize',14);
ylabel('$I_{\rm EMT}$','Interpreter','latex','FontSize',16);
%set(gca,'FontName','Airal','FontSize',12);
% print('Figure/fig6/KQ','-dpng','-r600');
























end

