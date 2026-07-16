function cal_fig4()


calculation();


end



function calculation()
control();
parameter();

global md  par

Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;



NU = [40,60,80];
for i =1:3
    par.nu = NU(i);
    [Q, ~] = solve(Q0, T);
    MAT = [Q(3,:); Q(33,:); Q(63,:); Q(93,:); Q(123,:)];
    writematrix(MAT, ['data/par-dist/nu', num2str(i),'.dat']);
end

parameter();

sigma = [2, 4, 6];
for i =1:3
    par.sigma = sigma(i);
    [Q, ~] = solve(Q0, T);
    MAT = [Q(3,:); Q(33,:); Q(63,:); Q(93,:); Q(123,:)];
    writematrix(MAT, ['data/par-dist/sigma', num2str(i),'.dat']);
end


end

