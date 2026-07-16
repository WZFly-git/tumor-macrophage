function pic_fig3()

% The data for the drawing is sourced from 'main.m'


close all

global md N
control();

x = linspace(0,1,N);
T = -md.tau:md.h:md.end_Time;


Q = load('output/tumor.dat');
m = length(T);
Q_total = sum(Q, 2);


for i = 1:m
    Q_pic(i,:) = Q(i,:)/sum(Q(i,:));
    Z = trapz(x, Q_pic(i,:));
    Mean(i) = trapz(x, x .* Q_pic(i,:)) / Z;
end
Q_pic = Q_pic';




%% subfig in Fig3   --  1
figure('Position', [0,0,1400,600]);
hold on; grid on; box on;

plot(T, Q_total, 'Color', [0.98,0.106,0.294], 'linewidth', 2);

ylabel('Total Tumor cells');
xlabel('Time (days)');
set(gca,'FontName','Airal','FontSize',16, 'YColor', 'k');
xlim([0, 70]);

% print('Figure/fig3/sub1','-dpng','-r600');




%% subfig in Fig3   --  2
figure('Position', [100,250,600,450]);
hold on; grid on; box on;

[p_X,p_Y] = meshgrid(T,x);
pcolor(p_X, p_Y, Q_pic);
shading interp;

ylabel('EM level');
xlabel('Time (days)');
set(gca,'FontName','Airal','FontSize',16, 'YColor', 'k');
xlim([0, 70]);
% print('Figure/fig3/sub2','-dpng','-r600');



%% subfig in Fig3   --  3
figure('Position', [100,250,600,450]);
hold on; grid on; box on;

plot(T, Mean, 'Color', [0.98,0.106,0.294], 'linewidth', 2);

ylabel('Mean of Distribution');
xlabel('Time (days)');

set(gca,'FontName','Airal','FontSize',16, 'YColor', 'k');
xlim([0, 70]);
ylim([0, 1]);
% print('Figure/fig3/sub3','-dpng','-r600');







%% subsubfig in Fig3.1


for i = 1:8
    figure('Position', [100,50,400,300]);
    hold on; grid on; box on;
    plot(x, Q_pic(:, i*20-17), 'Color', 'k', 'linewidth', 2);
    xlabel('EM level');
    ylim([0, 0.08])
    if i == 1
        title('Initial Distribution');
    end
    set(gca,'FontName','Airal','FontSize',12, 'YColor', 'k');
    % print(['Figure/fig3/sub1_',num2str(i)],'-dpng','-r600');
end



end

