function pic_fig10()


Data = load('notreat/all_data.mat');
Tumor{1} = Data.Mouse;
Data = load('treat/all_data.mat');
Tumor{2} = Data.Mouse;

close all;

Title = {'Day 0', 'Day 10', 'Day 30', 'Day 60'};
x = 0:0.01:1;
mouse = 1:100;
[X,Y] = meshgrid(mouse, x);

colors = {"#fd0100", "#28df00"};


for p = 1:2


    figure('Position', [0,100,1200,240]);

    H = cell(1, 4);
    t = [3, 23, 63, 123];

    for i = 1:4
        H{i} = zeros(101,100);
        for j = 1:100
            H{i}(:,j) = Tumor{p}{j}(t(i),:);
            H{i}(:,j) = H{i}(:,j) ./ sum(H{i}(:,j));
        end
    end



    for j = 1:100
        A = Tumor{p}{j}(t(i),:);
        frac = trapz(x, A);
        Mean(j) = trapz(x, x .* A) / frac;
    end



    for i = 1:4
        subplot(1, 4, i);
        Z = H{i};
        [~, index] = sort(Mean);
        Z = Z(:, index);
        pcolor(X, Y, Z);

        shading interp;
        hold on;
        xlabel("Mouse sequence");
        if i == 1
            ylabel("EM level");
        end
        if p == 1
            title(Title{i});
        end    
    end

    % print(['_Figure/fig10/EMT_', num2str(p)],'-dpng','-r600');
end




figure('Position', [0,100,1200,240]);

for i = 1:4
    subplot(1, 4, i);
    hold on; box on; grid on;

    
    H = cell(1, 4);
    t = [3, 23, 63, 143];
    
    for p=1:2
        for j = 1:100
            A = Tumor{p}{j}(t(i),:);
            frac = trapz(x, A);
            Mean(j) = trapz(x, x .* A) / frac;
        end
    [Mean, ~] = sort(Mean);
    scatter(mouse, Mean, 8, 'filled','MarkerFaceColor', colors{p});
    ylim([0, 1]);
    xlabel("Mouse sequence");
    if i == 1
        ylabel("Mean of Distribution");
        legend('No treatment', 'Treatment');
        legend('box', 'off', 'FontSize', 12)
    end
   
    

end
% print('_Figure/fig10/Mean_EMT','-dpng','-r600');














end
