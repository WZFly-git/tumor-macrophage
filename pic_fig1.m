function pic_fig1()

% The data for the drawing is sourced from 'main.m'


close all

global md N
control();

x = linspace(0,1,N);
T = -md.tau:md.h:md.end_Time;


Q = load('output/tumor.dat');

m = length(T);

for i = 1:m
    Q_pic(i,:) = Q(i,:)/sum(Q(i,:));
end


A = load('input/week3-4.dat');B = load('input/week7-8.dat');
week = 1;
A = A(week,:) ./ sum(A(week,:));    A = A / 6;
B = B(week,:) ./ sum(B(week,:));    B = B / 6;



%% Week 3
figure('Position', [100,100,500,400]);
hold on; grid on; box on;


b = bar(1/12:1/6:11/12, A, 'barWidth', 0.2, 'EdgeColor', 'none');
b.CData = hex2rgb(["#4c8dcb", "#61b22f", "#fcea00", "#c75d9f", "#e52712", "#971814" ]);
b.FaceColor = 'flat';
b.FaceAlpha = 0.8;

plot(x, Q_pic(45,:), 'Color', "#5e5f5f", 'linewidth', 2); % day 21
xlim([0 1]);     ylim([0 0.1]);     xlabel('x');

title('Week 3');
xlabel('EM level');
ylabel('Distribution');
set(gca, 'FontName', 'Arial', 'FontSize', 15);  % 整轴设为 Arial



key = [9,25,42,58,75,92];
R = sqrt(sum((Q_pic(45,key)-A).^2));
content = sprintf('RMSE = %.3f', R);
text(0.6, 0.08, content, 'FontName', 'Arial', 'FontSize', 16);


% print('Figure/fig1/Week 3','-dpng','-r600');


%% Week 7

figure('Position', [600,100,500,400]);
hold on; grid on; box on;
b = bar(1/12:1/6:11/12, B, 'barWidth', 0.2, 'EdgeColor', 'none');
b.CData = hex2rgb(["#4c8dcb", "#61b22f", "#fcea00", "#c75d9f", "#e52712", "#971814" ]);
b.FaceColor = 'flat';
b.FaceAlpha = 0.8;
plot(x, Q_pic(113,:), 'Color', "#5e5f5f", 'linewidth', 2); % day 55
xlim([0 1]);     ylim([0 0.1]);     xlabel('x');

title('Week 7');
xlabel('EM level');
ylabel('Distribution');
set(gca,'FontName','Airal','FontSize',15); 

key = [9,25,42,58,75,92];
R = sqrt(sum((Q_pic(113,key)-B).^2));
content = sprintf('RMSE = %.3f', R);
text(0.6, 0.08, content, 'FontName', 'Arial', 'FontSize', 16);

% print('Figure/fig1/Week 7','-dpng','-r600');


end