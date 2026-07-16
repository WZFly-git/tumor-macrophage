function pic_fig7()

Lambda_beta = linspace(0.2, 1, 30);
Lambda_mu   = linspace(0.05, 0.35, 30);
K_Q = linspace(3e6, 9e6, 30);


close all;
data = load('data/double_par/beta_mu_D.mat');  
D = data.D;
for i=1:3
    [X,Y] = meshgrid(Lambda_beta, Lambda_mu);
    figure('Position',[100,100,600,450])
    hold on; box on; 
    pcolor(X, Y, D{i}');
    contour(X, Y, D{i}', 6, 'LineWidth', 2, 'Color', 'k', 'LineStyle', ':');  
    shading interp
    hold on
    xlabel('$\lambda_\beta$','Interpreter','latex','FontSize',12);
    ylabel('$\lambda_\mu$','Interpreter','latex','FontSize',12);
    colormap(jet);
    % colorbar;
    set(gca,'FontSize', 18,'FontName', 'Arial');
    fm = ['Figure/fig7/beta_mu_day', num2str(i*20)];
    % print(fm,'-dpng','-r600');
end


data = load('data/double_par/mu_KQ_D.mat');  
D = data.D;
for i=1:3
    [X,Y] = meshgrid(Lambda_mu, K_Q);
    figure('Position',[100,100,600,450])
    pcolor(X, Y, D{i}');
    hold on; box on; 
    contour(X, Y, D{i}', 6, 'LineWidth', 2, 'Color', 'k', 'LineStyle', ':');  
    shading interp
    hold on
    xlabel('$\lambda_\mu$','Interpreter','latex','FontSize',12);
    ylabel('$K_{\hat{Q}}$','Interpreter','latex','FontSize',12);
    colormap(jet);
    % colorbar;
    set(gca,'FontSize', 18,'FontName', 'Arial');
    fm = ['Figure/fig7/mu_KQ_day', num2str(i*20)];
    % print(fm,'-dpng','-r600');
end


data = load('data/double_par/KQ_beta_D.mat');  
D = data.D;
for i=1:3
    [X,Y] = meshgrid(K_Q, Lambda_beta);
    figure('Position',[100,100,600,450])
    hold on; box on; 
    pcolor(X, Y, D{i}');
    contour(X, Y, D{i}', 6, 'LineWidth', 2, 'Color', 'k', 'LineStyle', ':');  
    shading interp
    xlabel('$K_{\hat{Q}}$','Interpreter','latex','FontSize',12);
    ylabel('$\lambda_\beta$','Interpreter','latex','FontSize',12);
    colormap(jet);
    % colorbar;
    set(gca,'FontSize', 18,'FontName', 'Arial');
    fm = ['Figure/fig7/KQ_beta_day', num2str(i*20)];
    % print(fm,'-dpng','-r600');
end

end













