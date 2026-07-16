function pic_fig5()


N=101;
x = linspace(0,1,N);     t = [0,15,30,45,60];
color = ["#FF6B6B", "#FFD93D", "#6BCB77", "#4D96FF", "#6B2FD9"];

Q_no_mac = load('data/fix_mac/no_mac.dat');  
Q_I = load('data/fix_mac/mac_I.dat');     M_I = betapdf(x, 2, 10);
Q_mix = load('data/fix_mac/mac_mix.dat'); M_mix = betapdf(x, 6, 6);
Q_II = load('data/fix_mac/mac_II.dat');   M_II = betapdf(x, 10, 2);


%% 
close all;


%% 
figure('Position', [0,0,600,450]);
hold on; grid on; box on;

for i = 1:5
    X = [x, fliplr(x)];
    Y = t(i) * ones(size(X));
    Z = [Q_I(30*i-27,:), zeros(size(x))];
    fill3(X, Y, Z, [0.2 0.2 0.8], 'FaceColor', color{i}, 'EdgeColor', color{i}, 'FaceAlpha', 0.9);
end

xlim([0, 1]);        ylim([-10,70]);       zlim([0,0.1]);
ylabel('Time (days)');  zlabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 
xlabel('EM level');
view(45,30);
% print('Figure/fig5/mac_I','-dpng','-r600');



figure('Position', [400,500,600,450]);
hold on; grid on; box on;

for i = 1:5
    X = [x, fliplr(x)];
    Y = t(i) * ones(size(X));
    Z = [Q_mix(30*i-27,:), zeros(size(x))];
    fill3(X, Y, Z, [0.2 0.2 0.8], 'FaceColor', color{i}, 'EdgeColor', color{i}, 'FaceAlpha', 0.9);
end

xlim([0, 1]);        ylim([-10,70]);       zlim([0,0.1]);
ylabel('Time (days)');  zlabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 
xlabel('EM level');
view(45,30);
% print('Figure/fig5/mac_mix','-dpng','-r600');




figure('Position', [800,0,600,450]);
hold on; grid on; box on;

for i = 1:5
    X = [x, fliplr(x)];
    Y = t(i) * ones(size(X));
    Z = [Q_II(30*i-27,:), zeros(size(x))];
    fill3(X, Y, Z, [0.2 0.2 0.8], 'FaceColor', color{i}, 'EdgeColor', color{i}, 'FaceAlpha', 0.9);
end

xlim([0, 1]);        ylim([-10,70]);       zlim([0,0.1]);
ylabel('Time (days)');  zlabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 
xlabel('EM level');
view(45,30);
% print('Figure/fig5/mac_II','-dpng','-r600');



%% macro
figure('Position', [800,0,600,450]);
hold on; grid on; box on;
X_patch = [x, fliplr(x)];
Y_patch = [M_I, zeros(size(M_I))];
C_patch = [x, fliplr(x)]; 
patch('XData', X_patch, ...
      'YData', Y_patch, ...
      'CData', C_patch, ...
      'EdgeColor', 'none', ...
      'FaceColor', 'interp');
cmap_white2blue = interp1([0;1], [1 0 0; 1 1 1], linspace(0,1,256));
colormap(cmap_white2blue);
clim([0, 1]);
xlim([0, 1]);        ylim([0,5]);
xlabel('Polarization level');
ylabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 

% print('Figure/fig5/m1','-dpng','-r600');


figure('Position', [800,0,600,450]);
hold on; grid on; box on;
X_patch = [x, fliplr(x)];
Y_patch = [M_II, zeros(size(M_II))];
C_patch = [x, fliplr(x)]; 
patch('XData', X_patch, ...
      'YData', Y_patch, ...
      'CData', C_patch, ...
      'EdgeColor', 'none', ...
      'FaceColor', 'interp'); 
cmap_white2blue = interp1([0;1], [1 1 1; 0 0 1], linspace(0,1,256));
colormap(cmap_white2blue);
clim([0, 1]);
xlim([0, 1]);        ylim([0,5]);
xlabel('Polarization level');
ylabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 
% print('Figure/fig5/m2','-dpng','-r600');


figure('Position', [800,0,600,450]);
hold on; grid on; box on;
X_patch = [x, fliplr(x)];
Y_patch = [M_mix, zeros(size(M_mix))];
C_patch = [x, fliplr(x)]; 
patch('XData', X_patch, ...
      'YData', Y_patch, ...
      'CData', C_patch, ...
      'EdgeColor', 'none', ...
      'FaceColor', 'interp'); 

cmap_red2blue_smooth = interp1( ...
    linspace(0, 1, 4), ...
    [1.0 0.0 0.0;
     1.0 0.5 0.5;  
     0.5 0.5 1.0;  
     0.0 0.0 1.0], ...
    linspace(0, 1, 256));

colormap(gca, cmap_red2blue_smooth);
clim([0.1, 0.9]);
xlim([0, 1]);        ylim([0,5]);
xlabel('Polarization level');
ylabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 
% print('Figure/fig5/mm','-dpng','-r600');








end

