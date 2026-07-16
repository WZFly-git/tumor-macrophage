function pic_fig8()




PAR = load('data of plot/par.dat');
R_PAR = load('data of plot/par_range.dat');
F_PAR = load('data of plot/par_density.dat');
skew_list = load('data of plot/skew.dat');
kurt_list = load('data of plot/kurt.dat');


%%
close all; color_area =[31,152,236]./255;


for i=1:9
    figure('Position', [200,300,400,300])
    hold on; grid on; box on;
    x = PAR(i,:);  fx = F_PAR(i,:); range_x = R_PAR(i,:);
    f = fill([x,flip(x)], [fx,zeros(1,100)], color_area);
    f.EdgeColor = "none";
    f.FaceAlpha = 1;
    xlim(range_x);
    ylim([0, 4/3*max(fx)]);
    text(0.45, 0.95, ['Skew = ',sprintf('%.4f',skew_list(i))],'Units','normalized', 'FontSize', 18);
    text(0.45, 0.85, ['Kurt   = ',sprintf('%.4f',kurt_list(i))],'Units','normalized', 'FontSize', 18);
    fn = ['_Figure/fig8/', num2str(i), '-', num2str(i)];
    % print(fn,'-dpng','-r600');
    close
end



A = load('virtual mouse/para_10000.dat');
index = find(A(:,13) > 0.3 & A(:,13) < 0.9 & A(:,10) > 1e7 & A(:,10) < 10e7); 



for i=1:8
    for j=i+1:9
        figure('Position', [600,100,400,300])
        grid on; box on;
        x = PAR(i,:);  fx = A(index,i); range_x = R_PAR(i,:);
        y = PAR(j,:);  fy = A(index,j); range_y = R_PAR(j,:);
        [X, Y] = meshgrid(x, y);
        dens = ksdensity([fx, fy], [X(:), Y(:)]);
        Z = reshape(dens, size(X));
        pcolor(X,Y,Z);
        colormap(jet);
        shading interp;               
        set(gca, 'YDir', 'normal');
        set(gca,'XTick',[], 'YTick',[],'XColor','none','YColor','none');
        % xlim(range_x); ylim(range_y);
        fn = ['_Figure/fig8/', num2str(i), '-', num2str(j)];
        % print(fn,'-dpng','-r600');
        close
    end
end









end