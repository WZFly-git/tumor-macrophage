function pic_fig11()



Mouse  = load('virtual mouse/mouse.dat');

Data = load('notreat/all_data.mat');
Tumor{1} = Data.Mouse;

Data = load('treat/all_data.mat');
Tumor{2} = Data.Mouse;



Num = zeros(100,2);
I = zeros(100,2);
for i = 1:100
    for j = 1:2 
        A = Tumor{j}{i}(123,:);
        Num(i,j) = sum(A);
        I(i,j) = sum(A(51:end))/sum(A);
    end
end


close all
name = {'$\bar{\beta}$', '$\bar{\mu}$', '$\nu$', '$\sigma$'};
range = [0.15, 0.65; 0.08, 0.48; 45, 75; 3.5, 4.6];
colors = [214, 42, 50; 225, 138, 139]/255;


for i = 1:4
    figure('Position', [0,100,400,300]);

    hold on; box on; grid on;
    group = ones(100,1);
    group(Num(:,1) > Num(:,2)) = 2;


    h = boxplot(Mouse(:,i), group, 'Color','k');
    set(h, 'LineWidth', 2);

    h = findobj(h, 'Tag', 'Box');
    for j = 1:2
        patch(get(h(j), 'XData'), get(h(j), 'YData'), colors(j, :), 'FaceAlpha', 0.6);

        idx = find(group == j);
        x = j + randn(length(idx), 1) * 0.05;
        scatter(x, Mouse(idx, i), 8, colors(j, :), 'filled');
    end

    set(gca,'XTickLabel',{'More','Less'}, 'FontSize', 12);
    ylabel(name{i}, 'Interpreter', 'latex','FontSize', 20);
    ylim(range(i,:));
    xlim([0.5, 2.5]);
    % print(['_Figure/fig11/box_', num2str(i)],'-dpng','-r600');
end




end



