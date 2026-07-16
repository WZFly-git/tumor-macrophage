function pic_fig2()

namestyle = {'$\bar{\beta}$', '$\theta_{\hat{Q}}$', '$\lambda_\beta$', '$\theta_\beta$',...
    '$\bar{\kappa}$', '$\bar{\mu}$','$\lambda_\mu$', '$\theta_\mu$', '$\nu$',...
     '$\sigma$', '$\nu_u$','$K_{\hat{Q}}$'};

%% double bar figure
p_p = load('data/PRCC/p_p.dat');
p_r = load('data/PRCC/p_r.dat');

[~,index] = sort(p_p,'descend');

s = [1,2,4,7,8,9,10,11,3,5,6,12];
index = index(s);

p_p = p_p(index);
p_r = p_r(index);


p = [p_p; p_r]';
close all
b = bar(p);

b(1).FaceColor = '#F70000';
b(1).EdgeColor = 'none';
clim([min(p(1,:)),max(p(1,:))]);

b(2).FaceColor ='#0000FB';
b(2).EdgeColor = 'none';
b(2).FaceAlpha = 1;
b(2).EdgeAlpha = 1;



grid on;
xticks(1:16);
xticklabels(namestyle(index));
ylim([-1,1]);
set(gca,'TickLabelInterpreter','latex', 'FontSize', 15);
set(gcf,'unit','centimeters','position',[7 8 32 10]);
title('Local sensitivity analysis of key parameters');
% print('Figure/fig2/PRCC','-dpng','-r600');

end



