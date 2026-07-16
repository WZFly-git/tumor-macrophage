function pic_fig4()


x = 0:0.01:1;
t = [0, 15, 30, 45, 60];
color = ["#FF6B6B", "#FFD93D", "#6BCB77", "#4D96FF", "#6B2FD9"];

close all;

for index = 1:3

    NU = load(['data/par-dist/nu',num2str(index),'.dat']);
    Sigma = load(['data/par-dist/sigma',num2str(index),'.dat']);
    
    for i = 1:5
        NU(i,:) = NU(i,:) / sum(NU(i,:));
        Sigma(i,:) = Sigma(i,:) / sum(Sigma(i,:));
    end
    
    figure('Position',[index*500-450,500,600,500]);

    hold on; box on; grid on;
    for i = 1:5
        X = [x, fliplr(x)];
        Y = t(i) * ones(size(X));
        Z = [NU(i,:), zeros(size(x))];
        fill3(X, Y, Z, [0.2 0.2 0.8], 'FaceColor', color{i}, 'EdgeColor', color{i});
    end
    xlim([0, 1]); ylim([-10,70]); zlim([0,0.08]);
    
    xlabel('EM level');
    ylabel('Time (days)');
    zlabel('Distribution');
    set(gca,'FontName','Airal','FontSize',15); 
    view(45,30);
    c = sprintf("$\\nu = %d$", index*20+20);
    text(0, 58, 0.06, c,'FontSize',20,'Interpreter','latex');
    % print(['Figure/fig4/NU',num2str(index)],'-dpng','-r600');


    figure('Position',[index*500-450,50,600,500]);

    hold on; box on; grid on;
    for i = 1:5
        X = [x, fliplr(x)];
        Y = t(i) * ones(size(X));
        Z = [Sigma(i,:), zeros(size(x))];
        fill3(X, Y, Z, [0.2 0.2 0.8], 'FaceColor', color{i}, 'EdgeColor', color{i});
    end
    xlim([0, 1]); ylim([-10,70]); zlim([0,0.12]);

    xlabel('EM level');
    ylabel('Time (days)');
    zlabel('Distribution');
    set(gca,'FontName','Airal','FontSize',15); 

    view(45,30);
    c = sprintf("$\\sigma = %d$", index*2);
    text(0, 58, 0.1, c,'FontSize',20,'Interpreter','latex');

    % print(['Figure/fig4/Sigma',num2str(index)],'-dpng','-r600');





end