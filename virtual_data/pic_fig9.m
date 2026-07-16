function pic_fig9()

Data = load('notreat/all_data.mat');
Tumor{1} = Data.Mouse;

Data = load('treat/all_data.mat');
Tumor{2} = Data.Mouse;


T = -1:0.5:70;

close all;
figure('Position', [100, 100, 800, 300])

color_map = {"#ffd8d9", "#e2f9de"};
color_line = {"#fd0100", "#28df00"};

for k=1:2
    
    subplot(1,2,k);
    hold on; box on; grid on;
    
    notreat = zeros(143,100);
    for i = 1:100
        notreat(:,i) = sum(Tumor{k}{i},2);
    end
    
    [m, M] = get(notreat);
    
    T_l = [T, flip(T)];
    shape = [m; flip(M)];
    f = fill(T_l, shape, hex2rgb(color_map{k}));
    f.EdgeColor = 'none';
    f.FaceAlpha = 0.6;


    plot(T, m, ':^',...
        'MarkerIndices',1:30:length(T),...
        'Color', color_line{k},...
        'LineWidth',1.2,...
        'MarkerSize',7,...       % 标记大小
        'MarkerEdgeColor', 'w',... % 标记边框色
        'MarkerFaceColor', color_line{k});% 标记填充色
    plot(T, M, ':^',...
        'MarkerIndices',1:20:length(T),...
        'Color', color_line{k},...
        'LineWidth',1.2,...
        'MarkerSize',7,...       % 标记大小
        'MarkerEdgeColor', 'w',... % 标记边框色
        'MarkerFaceColor', color_line{k});% 标记填充色

    plot(T, sum(notreat,2)/100, '-^',...
        'MarkerIndices',1:20:length(T),...
        'Color', color_line{k},...
        'LineWidth',1.2,...
        'MarkerSize',10,...       % 标记大小
        'MarkerEdgeColor', 'w',... % 标记边框色
        'MarkerFaceColor', color_line{k});% 标记填充色
    ylim([0 6e7]);
    xlabel('Time (days)');
    ylabel('Total Tumor cells');
    set(gca, 'YScale', 'log');   % Y轴变对数
    ylim([1e5, 5e8]);
    xlim([0, 70])
end
print('_Figure/fig9/number','-dpng','-r600');
end








function [up, down] = get(number)

up = zeros(143,1);
down = zeros(143,1);

for j = 1:143
    up(j) = max(number(j,:));
    down(j) = min(number(j,:));
end







end

