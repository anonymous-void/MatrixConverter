function [ Mt ] = Venturini_matrix( Uim, Uom, omega_i, omega_o, t )
alpha1 = 1/2 * (1 + tan(omega_i) .* cot(omega_o));
alpha2 = 1 - alpha1;
q = Uom / Uim;
omega_m = omega_o - omega_i;
CS = @(omega_m, t, x)cos(omega_m .* t + x);
CA = @(omega_m, omega_i, t, x)cos( -(omega_m + 2 * omega_i) .* t + x);

m1 = [1+2*q*CS(omega_m, t, 0), 1+2*q*CS(omega_m, t, -2*pi/3), 1+2*q*CS(omega_m, t, -4*pi/3);...
      1+2*q*CS(omega_m, t, -4*pi/3), 1+2*q*CS(omega_m, t, 0), 1+2*q*CS(omega_m, t, -2*pi/3);...
      1+2*q*CS(omega_m, t, -2*pi/3), 1+2*q*CS(omega_m, t, -4*pi/3), 1+2*q*CS(omega_m, t, 0)];
m2 = [1+2*q*CA(omega_m, omega_i, t, 0), 1+2*q*CA(omega_m, omega_i, t, -2*pi/3), 1+2*q*CA(omega_m, omega_i, t, -4*pi/3);...
      1+2*q*CA(omega_m, omega_i, t, -2*pi/3), 1+2*q*CA(omega_m, omega_i, t, -4*pi/3), 1+2*q*CA(omega_m, omega_i, t, 0);...
      1+2*q*CA(omega_m, omega_i, t, -4*pi/3), 1+2*q*CA(omega_m, omega_i, t, 0), 1+2*q*CA(omega_m, omega_i, t, -2*pi/3)];
  
Mt = 1/3 * alpha1 * m1 + 1/3 * alpha2 * m2;
end