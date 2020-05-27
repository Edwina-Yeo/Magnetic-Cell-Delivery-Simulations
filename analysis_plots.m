%% Matlab analysis of Aggregate Model
% 08/10/19 
% author: Edwina Yeo contact: yeo@maths.ox.ac.uk
% Comsol data is imported through matlab script. Each different section generates plots for associated
% paper.

%Requires: parampaper.m

F=16 %Font size
F2=16 % tick label size
l=0.15


%% Preliminary Plots: Plot 1
for i=1
%Magnetic Field Plots magnetic force'
M1=0.4*2/mu0

n=30
scale=n*Vp*msat*mu0*M2*Rmag^2

um=@(x,y) -scale*x./((y+Rmag).^2+x.^2).^2 % Magnetic force in x dir
vm=@(x,y) -scale*(y+Rmag)./((y+Rmag).^2+x.^2).^2 % Magnetic force in y dir

close all
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);  
hold(axes1,'on');
x = linspace(-5,5,500000);
plot(x,1e12*um(x,0),'k'); hold on % multiply force by 1e12 to plot in pN
plot(x,1e12*vm(x,0),'k-.'); hold on
k=legend({' $x$ component',' $y$ component'},'Interpreter','latex')
kk=ylabel('Magnetic Force (pN)','Interpreter','latex')
kkk=xlabel('$x$ (m)','Interpreter','latex')
xlim([-0.03,0.03]) % take the area 3cm on each side of the centre
 k.FontSize=F
%  legend boxoff   
kk.FontSize=F
kkk.FontSize=F;
xticks.Fontsize=F
axes1.TickLabelInterpreter = 'latex';
ax = gca;
% left = outerpos(1) + ti(1)+0.1;
% bottom = outerpos(2) + ti(2)-0.02;
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) -ti(2) - ti(4)-0.3;
% % set(gcf,'Position',[150 220 600 600])
% ax.Position = [left bottom ax_width ax_height];
% axis(axes1,'tight');
fig = gcf;


fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];
% Set the remaining axes properties

set(axes1,'FontSize',F2);


set(axes1,'TickLabelInterpreter','latex');
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
print('magnet','-depsc')
savefig('magnet.fig')
end

%% Preliminary Plot 2: Viscosity Fitting
close all
for i=1
figure1 = figure;

mu=@(H) muwater * (1 + (eta45- 1) .* ((1 - H).^ c45- 1) / ((1 - 0.45) ^ c45 - 1))

% Create axes
    axes1 = axes('Parent',figure1);
hold(axes1,'on');
H = linspace(0,0.5,100);
plot(H,mu(H),'k'); hold on % multiply force by 1e12 to plot in pN
% k=legend({'Magnetic force in x','Magnetic force in y'},'Interpreter','latex')
kk=ylabel('Effective Viscosity (Pa s)','Interpreter','latex')
kkk=xlabel('Haematocrit $H$ ','Interpreter','latex')
% xlim([-0.03,0.03]) % take the area 3cm on each side of the centre
%  k.FontSize=F
%  legend boxoff   
kk.FontSize=F
kkk.FontSize=F
xticks.Fontsize=F
axes1.TickLabelInterpreter = 'latex';
ax=gca
outerpos = ax.OuterPosition;
ti = ax.TightInset; 

% axis(axes1,'tight');
% Set the remaining axes properties
set(axes1,'TickLabelInterpreter','latex');
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];
set(axes1,'FontSize',F2);
axes1.TickLabelInterpreter = 'latex';

ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

print('viscos','-depsc')
savefig('viscos.fig')
end


%% Parameter Plot: Beta
for i=1
beta=importdata('beta/betah.txt')
%
close all
%*rmag
figure1 = figure;

axes1 = axes('Parent',figure1);
set(gca,'linestyleorder',{'-',':','-.','--'}, 'colororder',[0,0,0],'nextplot','add')

% mphplot(model,'pg7','rangenum',1)
N=length(beta)/4
j=4:-1:1
for i=1:4
  
plot(beta(N*(j(i)-1)+1:j(i)*N,1)*d*100,100*(beta(N*(j(i)-1)+1:j(i)*N,2))/2,'linewidth',1); hold on
end
k=legend({'$B_{max}=0.4T$',' $B_{max}=0.3T$', '$B_{max}=0.2T$', '$B_{max}=0.1T$'},'Interpreter','latex')

ylabel('Percentage Channel Blockage (\%)','Interpreter','latex');
xlabel('$x$ (cm)','Interpreter','latex');
xlim([-0.8,0.8])
ylim([0,35])

axes1.TickLabelInterpreter = 'latex';
set(axes1,'FontSize',14,'TickLabelInterpreter','latex');
set(legend,'Interpreter','latex','FontSize',16,'Location', 'northeast');
ax = gca;

outerpos = ax.OuterPosition
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height];

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];

print(fig,'beta','-depsc')

savefig('beta.fig')
end
%% Gamma plots
for i=1
gamma=importdata('gamma/gamma.txt')
% gamma0=importdata('gamma/Basegamma0.txt')

close all
%*rmag
figure1 = figure;

axes1 = axes('Parent',figure1);
set(gca,'linestyleorder',{'-',':','-.','--'}, 'colororder',[0,0,0],'nextplot','add')

% mphplot(model,'pg7','rangenum',1)
N=length(gamma)/4
for i=1:4
  
% plot(gamma0(:,1)*d*100,gamma0(:,2)/2,'linewidth',1); hold on
plot(gamma(N*(i-1)+1:i*N,1)*d*100,gamma(N*(i-1)+1:i*N,2)*100/2,'linewidth',1); hold on

end
k=legend({'$\gamma=0$','$\gamma=0.1\gamma^*$',' $\gamma=0.4\gamma^*$', '$\gamma=0.8\gamma^*$'},'Interpreter','latex')

ylabel('Channel Blockage Percentage (\%)','Interpreter','latex');
xlabel('$x$ (cm)','Interpreter','latex');
xlim([-1,0.5])
ylim([0,40])

axes1.TickLabelInterpreter = 'latex';
set(axes1,'FontSize',14,'TickLabelInterpreter','latex');
set(legend,'Interpreter','latex','FontSize',16);
ax = gca;

outerpos = ax.OuterPosition
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height];

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];

print(fig,'gamma','-depsc')

savefig('gamma.fig')
end
%% Kappa PLot

for i=1
kappa=importdata('kappa/kappa.txt')

close all
%*rmag
figure1 = figure;

axes1 = axes('Parent',figure1);
set(gca,'linestyleorder',{'--',':','-.','-'}, 'colororder',[0,0,0],'nextplot','add')

% mphplot(model,'pg7','rangenum',1)
N=length(kappa)/3
for i=1:3
  
plot(kappa(N*(i-1)+1:i*N,1)*d*100,kappa(N*(i-1)+1:i*N,2)*100/2,'linewidth',1); hold on
end
k=legend({'$\kappa_1=0.001\kappa_1^*$',' $\kappa_1=0.01\kappa_1^*$', '$\kappa_1=0.1\kappa_1^*$'},'Interpreter','latex')

ylabel('Channel Blockage Percentage (\%)','Interpreter','latex');
xlabel('$x$ (cm)','Interpreter','latex');
xlim([-1,0.8])
ylim([0,35])

axes1.TickLabelInterpreter = 'latex';
set(axes1,'FontSize',14,'TickLabelInterpreter','latex');
set(legend,'Interpreter','latex','FontSize',16);
ax = gca;

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];
outerpos = ax.OuterPosition
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height];


print(fig,'kappa','-depsc')

savefig('kappa.fig')

end
%%  Velocity stages plot
  for i=1
vel=importdata('vel/vel.txt')
    
[t1,s1]=max(vel(:,2))

[t2,s2]=min(vel(:,2))
close all
%*rmag
figure1 = figure;

axes1 = axes('Parent',figure1);

plot(vel(:,1),vel(:,2),'k*-','linewidth',1.5); hold on
% annotation(figure1,'textarrow',[0.821052631578947 0.819298245614036],...
%     [0.497619047619048 0.37857142857143],'String','arrival at final height');
xline(1);
xline(6);
xline(4);
xline(3);
annotation(figure1,'textbox',...
    [0.081012419549477 0.893052968429097 0.131770833333333 0.037713139418255],...
    'String','Cell Arrival (a)',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.308955986859748 0.892181305822229 0.126281342182891 0.037713139418255],...
    'String','Cell pulse ends and shear erosion dominates (c)',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.603380598015553 0.892931174475809 0.170312500000001 0.037713139418255],...
    'String','Extravasation leads to arrival at final height (d)',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.224627497318316 0.857319577780965 0.0510416666666666 0.0868605817452359],...
    'String','Rapid aggregate growth (b)',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% xlim([0,20])

ylabel('Aggregate growth velocity $v_n/u^*$','Interpreter','latex');
xlabel('Normalised delivery time $t/t^*$','Interpreter','latex');
% xlim([0,
% ylim([0,0.35])

axes1.TickLabelInterpreter = 'latex';
set(axes1,'FontSize',14,'TickLabelInterpreter','latex');
% set(legend,'Interpreter','latex','FontSize',16);
ax = gca;

outerpos = ax.OuterPosition
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height];

fig = gcf;
% fig.PaperUnits = 'inches';
% fig.PaperPosition = [0 0 5 5];

% print(fig,'kappa','-depsc')
% 
% savefig('kappa.fig')


  end
%%  H plot flux

for i=1
%close all
close all
figure1 = figure;
% hflux=importdata('HFlux/Hflux.txt')
% hflux02=importdata('HFlux/Hflux02.txt')
% Create axes
axes1 = axes('Parent',figure1,'ColorOrder',[0 0 0]);
hold(axes1,'on');

F=16
rawdata=[105	0.15	0.7239374481576539
105	0.175	0.6931326118227233
105	0.2	0.6435863195286172
105	0.225	0.574821411942496
105	0.25	0.4957715057473172
105	0.275	0.4117234855536862
105	0.3	0.3157756981766492
105	0.325	0.2166360735181042
105	0.35	0.1190895114693743
105	0.375	0.03148122273681575
105	0.4	0.011798824744584602
210	0.15	0.7196035539716259
210	0.175	0.72047929822623
210	0.2	0.7244507597179894
210	0.225	0.7123351613917861
210	0.25	0.6877040455661474
210	0.275	0.6471220497299239
210	0.3	0.5780156032086925
210	0.325	0.49168395340686755
210	0.35	0.3962065163317182
210	0.375	0.2970431862917433
210	0.4	0.19692550065419567]

Hdata=rawdata(:,2);
data=rawdata(:,3)

set(gca,'linestyleorder',{'-',':','-.','--'}, 'colororder',[0,0,0],'nextplot','add')
% for n=1:4 
% plot(Hplot(1+(n-1)*358:n*358,1),Hplot(1+(n-1)*358:n*358,2),'linewidth',1); hold on
% bar(hflux(:,2))

plot(Hdata2(:,2),Hdata2(:,5)*100/2,'*-'); hold on
plot(Hdata1(:,2),Hdata1(:,5)*100/2,'*--')

% plot(Hdatap(1:8),datapressure(1:8)*100/2,'r*-')
% plot(Hdatap(9:end),datapressure(9:end)*100/2,'r*--')
% 
% plot(hflux(:,1),hflux(:,2)/2,'*-')% end

% plot(hflux02(:,1),hflux02(:,2)/2,'*--')% end

k=legend({'$B_{max}=0.4T$',' $B_{max}=0.2T$', '$B_{max}=0.4T$ Pressure','$B_{max}=0.2T$ Pressure'},'Interpreter','latex')

kk=xlabel('Haematocrit $H$','Interpreter','latex')
kkk=ylabel('Maximum Channel Blockage \% ','Interpreter','latex')
 k.FontSize=F
 legend boxoff   
kk.FontSize=F
kkk.FontSize=F
xticks.Fontsize=F
% box(axes1,'on');
% ylim([-0.001,0.25])
% xlim([-5,5])
% Set the remaining axes properties
set(axes1,'FontSize',16);
axes1.TickLabelInterpreter = 'latex';
ax = gca;
outerpos = ax.OuterPosition
% outerpos =[0,0,1,2]
ti = ax.TightInset
left = outerpos(1) + ti(1)+0.01;
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height]
ax.Position = [left bottom ax_width ax_height]
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];

print(fig,'Hplot','-depsc')

savefig('Hplot.fig')



end

%% H plot pressure 
for i=1
%close all
close all
figure1 = figure;
% hflux=importdata('HFlux/Hflux.txt')
% hflux02=importdata('HFlux/Hflux02.txt')
% Create axes
axes1 = axes('Parent',figure1,'ColorOrder',[0 0 0]);
hold(axes1,'on');

Hdatapressure=[105	0.15	0.5	0	0.7326966177840377
105	0.175	0.5	0	0.7062582688829707
105	0.2	0.5	0	0.6657807174442663
105	0.225	0.5	0	0.6071866521706472
105	0.25	0.5	0	0.5303879559705849
105	0.275	0.5	0	0.44006488474265626
105	0.3	0.5	0	0.34656150270675834
105	0.325	0.5	0	0.23883057053881163
105	0.35	0.5	0	0.12827168096875363
105	0.375	0.5	0	0.02897180464447302
105	0.4	0.5	0	0.0012332730545197013
210	0.15	0.5	0	0.7026551694030865
210	0.175	0.5	0	0.6925319778226684
210	0.2	0.5	0	0.6874374566306451
210	0.225	0.5	0	0.6826292452177167
210	0.25	0.5	0	0.66853740893479
210	0.275	0.5	0	0.6385020765861713
210	0.3	0.5	0	0.5937231744988025
210	0.325	0.5	0	0.5277750406830747
210	0.35	0.5	0	0.4335594973941579
210	0.375	0.5	0	0.32445498842007725
210	0.4	0.5	0	0.21195187307503394]

F=16
datapressure=Hdatapressure(:,5)
Hdatap=Hdatapressure(:,2)
set(gca,'linestyleorder',{'-',':','-.','--'}, 'colororder',[0,0,0],'nextplot','add')
% for n=1:4 
% plot(Hplot(1+(n-1)*358:n*358,1),Hplot(1+(n-1)*358:n*358,2),'linewidth',1); hold on
% bar(hflux(:,2))
plot(Hdatap(1:8),datapressure(1:8)*100/2,'*-')
plot(Hdatap(9:end),datapressure(9:end)*100/2,'*--')

% 
% plot(hflux(:,1),hflux(:,2)/2,'*-')% end

% plot(hflux02(:,1),hflux02(:,2)/2,'*--')% end

k=legend({'$B_{max}=0.4T$',' $B_{max}=0.2T$', '$H=0.3$', '$H=0.4$'},'Interpreter','latex')

kk=xlabel('Haematocrit $H$','Interpreter','latex')
kkk=ylabel('Maximum Channel Blockage \% ','Interpreter','latex')
 k.FontSize=F
 legend boxoff   
kk.FontSize=F
kkk.FontSize=F
xticks.Fontsize=F
% box(axes1,'on');
% ylim([-0.001,0.25])plot(Hdata(1:8),data(1:8)*100/2,'*-')
plot(Hdata(9:end),data(9:end)*100/2,'*--')
% xlim([-5,5])
% Set the remaining axes properties
set(axes1,'FontSize',16);
axes1.TickLabelInterpreter = 'latex';
ax = gca;
outerpos = ax.OuterPosition
% outerpos =[0,0,1,2]
ti = ax.TightInset
left = outerpos(1) + ti(1)+0.01;
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3)-0.01;
ax_height = outerpos(4) -ti(2) - ti(4)-0.01;

ax.Position = [left bottom ax_width ax_height]
ax.Position = [left bottom ax_width ax_height]
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 5 5];

print(fig,'Hplotpressure','-depsc')

savefig('Hplotpressure.fig')



end


%% 2D plot comparion: constant extravasation: HEAT
close all
for i=1
const=importdata('kappa/constantextravasation.txt');
k1=find(const(:,1)==-20.0);
Ls=abs(k1(1:end-1)-k1(2:end));
ts=0:139;
TS=[]
for i=1:length(ts)
TS=[TS;ts(i)*ones(Ls(i),1)];
end
figure1 = figure;
axes1 = axes('Parent',figure1);
[xq,tq]=meshgrid(const(1:Ls(i),1),ts);
hq=griddata(const(1:length(TS),1),TS,const(1:length(TS),2),xq,tq,'cubic');
s=surf(xq*d*100,tq,hq*50);
s.EdgeColor='none'
colormap(jet)
ylabel('$t/t^*$','Interpreter','latex','FontSize',16)
xlabel( '$x$ (cm)','Interpreter','latex','FontSize',16)
zlabel( 'Blockage Percentage \%','Interpreter','latex','FontSize',16)
set(axes1, 'FontSize',14,'TickLabelInterpreter','latex')
la=colorbar(axes1,'TickLabelInterpreter','latex','FontSize',16);
ylabel(la, 'Blockage Percentage \%','Interpreter','latex','FontSize',16)
view(2)
xlim([-1,0.5])
ylim([1,135])
set(figure1, 'Outerposition', [150,150,800,800])
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1)+0.01;caxis([0 33])

% zlim([-0.01,33])
% caxis([0, 25])
bottom = outerpos(2) + ti(2)+0.02;
ax_width = outerpos(3) - ti(1) - ti(3)-0.05;
ax_height = outerpos(4) -ti(2) - ti(4)-0.03;
ax.Position = [left bottom ax_width ax_height]

print(figure1,'ckappaheat','-depsc')

savefig('ckappaheat.fig')
end
%% 2D plot comparion: exponential extravasation: HEAT 

% close all
for i=1
const=importdata('kappa/exponentialextravasation.txt');
k1=find(const(:,1)==-20.0);
Ls=abs(k1(1:end-1)-k1(2:end));
ts=0:139;
TS=[]
for i=1:length(ts)
TS=[TS;ts(i)*ones(Ls(i),1)];
end
figure1 = figure;
axes1 = axes('Parent',figure1);
[xq,tq]=meshgrid(const(1:Ls(i),1),ts);
hq=griddata(const(1:length(TS),1),TS,const(1:length(TS),2),xq,tq,'cubic');
s=surf(xq*d*100,tq,hq*50);
s.EdgeColor='none'
colormap(jet)
view(2)

ylabel('$t/t^*$','Interpreter','latex','FontSize',16)
xlabel( '$x$ (cm)','Interpreter','latex','FontSize',16)
zlabel( 'Blockage Percentage \%','Interpreter','latex','FontSize',16)
set(axes1, 'FontSize',14,'TickLabelInterpreter','latex')
la=colorbar(axes1,'TickLabelInterpreter','latex','FontSize',16);
ylabel(la, 'Blockage Percentage \%','Interpreter','latex','FontSize',16)
set(figure1, 'Outerposition', [150,150,800,800])
xlim([-1,0.5])
ylim([1,135])
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1)+0.01;caxis([0 33])

% zlim([-0.01,33])
% caxis([0, 25])
bottom = outerpos(2) + ti(2)+0.02;
ax_width = outerpos(3) - ti(1) - ti(3)-0.05;
ax_height = outerpos(4) -ti(2) - ti(4)-0.03;
ax.Position = [left bottom ax_width ax_height]
print(figure1,'ekappaheat','-depsc')

savefig('ekappaheat.fig')
end
%% % Appendix plot 1: mesh convergence study
% plots the number of mesh elements against the infinity norm of
% the difference of the solution to the finest case

% gamma=0,kappa=0
for i=1

figure1 = figure;
% error=importdata('Numerical Verification/Errors.txt');
error=[0.084907	0.26273	0.0061604	0.0025475	0.0064854
0.040072	0.15270	0.0032078	0.0010686			0.0023242
0.020930	0.13533	0.0011166	9.7132E-4	0.0026713	
0.017764	0.10415	0.0023029	5.8678E-4		0.0015041
3.7508	80.000	1.2119	0.13241	0.80148]

Mesherrors=error(1:4,:)

varmax=error(5,:)
numelem=[1300,2548,4202,6844]
percenterror=Mesherrors./varmax*100

plot(numelem,percenterror,'-*')
legend('c','p','u','v','h')

ylabel('Maximum relative error (\% of solution)' ,'Interpreter','latex','FontSize',16)
xlabel( 'Number of elements of mesh $n$','Interpreter','latex','FontSize',16)
print(figure1,'Linferror','-depsc')

savefig('Linferror.fig')
end
%% % Appendix plot 2: mesh convergence study2
% plots the number of mesh elements against the infinity norm of
% the difference of the solution to the finest case
% Gamma=0.5
% kappa=0.1
for i=1

figure1 = figure;
error=[0.10541	 0.23796 0.0045115	0.0024618	  0.0035465  
    0.076889	0.17335 0.0020484	0.0010798		 0.0013852   
    0.077707	0.13234 0.0012040	6.7440E-4	   0.0010015 
    0.079437	0.11090	0.0011830	4.7611E-4	0.0011454	
    4.8772	80.000 1.0755	0.043192	 0.24242]
Mesherrors=error(1:4,:)

varmax=error(5,:)
% 
numelem=[1300,2548,4202,6844]
percenterror=Mesherrors./varmax*100

plot(numelem,percenterror,'-*')
legend('c','p','u','v','h')

ylabel('Maximum relative error (\% of solution)' ,'Interpreter','latex','FontSize',16)
xlabel( 'Number of elements of mesh $n$','Interpreter','latex','FontSize',16)
print(figure1,'Linferror','-depsc')

savefig('Linferror.fig')
end
%% % Appendix plot 2: mesh convergence study2
% plots the number of mesh elements against the infinity norm of
% the difference of the solution to the finest case
% Gamma=0.5
% kappa=0.1
for i=1

figure1 = figure;
error=[0.10173	0.20301	0.0037787	0.0016059 0.0027900
    0.050894	0.13846	0.0017274	0.0010916 0.0013383	
    0.028142	0.12736	0.0011773	7.1367E-4 0.0010721	
    0.022284	0.063745	0.0010686	4.3034E-4 5.1707E-4	
    4.0027	80.000	1.0851	0.046100 0.26033]
    	
 Mesherrors=error(1:4,:)

varmax=error(5,:)
% 
numelem=[1300,2548,4202,6844]
percenterror=Mesherrors./varmax*100

plot(numelem,percenterror,'-*')
legend('c','p','u','v','h')

ylabel('Maximum relative error (\% of solution)' ,'Interpreter','latex','FontSize',16)
xlabel( 'Number of elements of mesh $n$','Interpreter','latex','FontSize',16)
print(figure1,'Linferror','-depsc')

savefig('Linferror.fig')
end

%% % Appendix plot 2: mesh convergence study2
% plots the number of mesh elements against the infinity norm of
% the difference of the solution to the finest case
% Gamma=0.5
% kappa=0.1
for i=1

figure1 = figure;
error=[0.10853	0.19101	0.0062659	0.0023621	0.0057760
    0.047530	0.14696	0.0032663	0.0010333	0.0029046
    0.024631	0.11265	0.0014533	7.0223E-4		0.0015484
    0.022867	0.10047	4.2971E-4	6.8013E-4 9.2059E-4
    4.0095	80.000	1.1815	0.11289 0.74319]
    	
			
 Mesherrors=error(1:4,:)

varmax=error(5,:)
% 
numelem=[1300,2548,4202,6844]
percenterror=Mesherrors./varmax*100

plot(numelem,percenterror,'-*')
legend('c','p','u','v','h')

ylabel('Maximum relative error (\% of solution)' ,'Interpreter','latex','FontSize',16)
xlabel( 'Number of elements of mesh $n$','Interpreter','latex','FontSize',16)
print(figure1,'Linferror','-depsc')

savefig('Linferror.fig')
end