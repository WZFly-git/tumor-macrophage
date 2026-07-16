function main()
% to get fig1 and fig3 required data


tic;
control();
parameter();

global md par

Q0 = initial('fitting');
T = -md.tau:md.h:md.end_Time;





[Q, Object] = solve(Q0, T);
savedata(Q, Object, 'output');
toc;


pic('output');

end



function savedata(Q, Object, fp)


writematrix(Q, [fp, '/tumor.dat']);

Macro = zeros(size(Q));
for i = 1:size(Q,1)
    Macro(i,:) = Distribution_mac(Q(i,:));
end

writematrix(Macro, [fp, '/macro.dat']);

save([fp, '/object.mat'], 'Object');

end






