function M = Distribution_mac(Q)

global par N
Q_total = sum(Q);

u = linspace(0, 1, N);


frac = Q_total / (Q_total + par.K_Q);
phi = par.phi_0 + par.phi_1 * frac;

A = par.nu_u * phi;
B = par.nu_u * (1 - phi);


A(A<=1) = 1.001;
B(B<=1) = 1.001;

M = betapdf(u, A, B);


end