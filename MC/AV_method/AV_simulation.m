Uim = 200;  % Input Voltage
Uom = 50;   %Output Voltage
omega_i = 2 * pi * 50;  % Input frequency
omega_o = 2 * pi * 25;  % Output frequency
t = 0:0.001:10;

Uo = [0, 0, 0]';
Uia = @(Uim, omega_i, t)Uim.*cos(omega_i .* t);
Uib = @(Uim, omega_i, t)Uim.*cos(omega_i .* t + 2*pi/3);
Uic = @(Uim, omega_i, t)Uim.*cos(omega_i .* t + 4*pi/3);
Ui = @(Uim, omega_i, t)[Uia(Uim, omega_i, t), Uib(Uim, omega_i, t), Uic(Uim, omega_i, t)]';
for tt=0:0.001:10
    Mt = Venturini_matrix(Uim, Uom, omega_i, omega_o, tt);
    Uo = [Uo, Mt * Ui(Uim, omega_i, tt)];
end
Uo = Uo(:, 2:end)';