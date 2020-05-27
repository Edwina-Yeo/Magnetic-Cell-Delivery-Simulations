%% Parameters for Simulations 
% Updated 19/03 
clear all
%% In vitro Values
d=(1.65e-3)/2 %sze of in vitro channel
n=30 %estimate of number of NPs per cell
mu0=4*pi *10^(-7)
msat=1.25e5 
Vp=(1e-6)^3*4/3*pi %radius 1000nm
kb=1.38e-28 % Botlzmans costnat
T=295 %(Room temp)
muwater=8.9e-4 %(Batchelor)
r=1e-5 %Cell radius (diameter =20micron)
umax=0.0078 % 1ml/min in channel radius^
dmu=1650 %diamter of pipe in microns

%Pries viscosity fitting for in vitro channel
c45=(0.8 + exp(-0.075 * dmu)) * (-1 + 1 / (1 + 1*10^11 * dmu ^ 12)) + 1 / (1 + 1*10^11 * dmu^ 12)
eta45=220 * exp(-1.3 * dmu) + 3.2 - 2.44 * exp(-0.06 * dmu ^ 0.645)
muwater=8.9E-4
mu=@(H) muwater * (1 + (eta45- 1) .* ((1 - H).^ c45- 1) / ((1 - 0.45) ^ c45 - 1))



% Calculations
U=umax
pin=U*muwater/d
t=d/U
taustar=4*muwater*d/U
chi=0.1*U
Cin=1e6*4/3*pi*r^3/5e-6
alpha=0.1/Cin
cstar=1.1*Cin
Rmag=    0.0035
beta=@(Bmax)  n*Vp*msat*(Bmax*2)*Rmag^2/(6*pi*r*mu(0)*U*d^3)
Bmax=[0.1,0.2,0.3,0.4] 

beta(Bmax)

k=0.5
R=Rmag/d
Pesh=k*r^2/d^2
Ms=Bmax*2/mu0


