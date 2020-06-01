close all
% Create figure



c1=importdata('Heatmaps/.txt');

x1=c1(:,1);
y1=c1(:,2);
z1=c1(:,3);

 k=boundary(x1,y1,1)
 plot(x1(k),y1(k),'r.'); hold on

 C=[k(1:end-1),k(2:end)]
 DT=delaunayTriangulation([x1,y1],C);
 IO = isInterior(DT);
figure1 = figure('PaperUnits','centimeters',...
    'Colormap',[0 0 0.515625;0 0 0.564062476158142;0 0 0.612500011920929;0 0 0.660937488079071;0 0 0.709375023841858;0 0 0.7578125;0 0 0.806249976158142;0 0 0.854687511920929;0 0 0.903124988079071;0 0 0.951562523841858;0 0 1;0 0.030303031206131 1;0 0.060606062412262 1;0 0.0909090936183929 1;0 0.121212124824524 1;0 0.151515156030655 1;0 0.181818187236786 1;0 0.212121218442917 1;0 0.242424249649048 1;0 0.272727280855179 1;0 0.30303031206131 1;0 0.333333343267441 1;0 0.363636374473572 1;0 0.393939405679703 1;0 0.424242436885834 1;0 0.454545468091965 1;0 0.484848499298096 1;0 0.515151500701904 1;0 0.545454561710358 1;0 0.575757563114166 1;0 0.60606062412262 1;0 0.636363625526428 1;0 0.666666686534882 1;0 0.69696968793869 1;0 0.727272748947144 1;0 0.757575750350952 1;0 0.787878811359406 1;0 0.818181812763214 1;0 0.848484873771667 1;0 0.878787875175476 1;0 0.909090936183929 1;0 0.939393937587738 1;0 0.969696998596191 1;0 1 1;0.0151515156030655 1 0.984848499298096;0.030303031206131 1 0.969696998596191;0.0454545468091965 1 0.954545438289642;0.060606062412262 1 0.939393937587738;0.0757575780153275 1 0.924242436885834;0.0909090936183929 1 0.909090936183929;0.106060609221458 1 0.89393937587738;0.121212124824524 1 0.878787875175476;0.136363640427589 1 0.863636374473572;0.151515156030655 1 0.848484873771667;0.16666667163372 1 0.833333313465118;0.181818187236786 1 0.818181812763214;0.196969702839851 1 0.80303031206131;0.212121218442917 1 0.787878811359406;0.227272734045982 1 0.772727251052856;0.242424249649048 1 0.757575750350952;0.257575750350952 1 0.742424249649048;0.272727280855179 1 0.727272748947144;0.287878781557083 1 0.712121188640594;0.30303031206131 1 0.69696968793869;0.318181812763214 1 0.681818187236786;0.333333343267441 1 0.666666686534882;0.348484843969345 1 0.651515126228333;0.363636374473572 1 0.636363625526428;0.378787875175476 1 0.621212124824524;0.393939405679703 1 0.60606062412262;0.409090906381607 1 0.590909063816071;0.424242436885834 1 0.575757563114166;0.439393937587738 1 0.560606062412262;0.454545468091965 1 0.545454561710358;0.469696968793869 1 0.530303001403809;0.484848499298096 1 0.515151500701904;0.5 1 0.5;0.515151500701904 1 0.484848499298096;0.530303001403809 1 0.469696968793869;0.545454561710358 1 0.454545468091965;0.560606062412262 1 0.439393937587738;0.575757563114166 1 0.424242436885834;0.590909063816071 1 0.409090906381607;0.60606062412262 1 0.393939405679703;0.621212124824524 1 0.378787875175476;0.636363625526428 1 0.363636374473572;0.651515126228333 1 0.348484843969345;0.666666686534882 1 0.333333343267441;0.681818187236786 1 0.318181812763214;0.69696968793869 1 0.30303031206131;0.712121188640594 1 0.287878781557083;0.727272748947144 1 0.272727280855179;0.742424249649048 1 0.257575750350952;0.757575750350952 1 0.242424249649048;0.772727251052856 1 0.227272734045982;0.787878811359406 1 0.212121218442917;0.80303031206131 1 0.196969702839851;0.818181812763214 1 0.181818187236786;0.833333313465118 1 0.16666667163372;0.848484873771667 1 0.151515156030655;0.863636374473572 1 0.136363640427589;0.878787875175476 1 0.121212124824524;0.89393937587738 1 0.106060609221458;0.909090936183929 1 0.0909090936183929;0.924242436885834 1 0.0757575780153275;0.939393937587738 1 0.060606062412262;0.954545438289642 1 0.0454545468091965;0.969696998596191 1 0.030303031206131;0.984848499298096 1 0.0151515156030655;1 1 0;1 0.98734176158905 0;1 0.974683523178101 0;1 0.962025344371796 0;1 0.949367105960846 0;1 0.936708867549896 0;1 0.924050629138947 0;1 0.911392390727997 0;1 0.898734152317047 0;1 0.886075973510742 0;1 0.873417735099792 0;1 0.860759496688843 0;1 0.848101258277893 0;1 0.835443019866943 0;1 0.822784781455994 0;1 0.810126602649689 0;1 0.797468364238739 0;1 0.784810125827789 0;1 0.77215188741684 0;1 0.75949364900589 0;1 0.746835470199585 0;1 0.734177231788635 0;1 0.721518993377686 0;1 0.708860754966736 0;1 0.696202516555786 0;1 0.683544278144836 0;1 0.670886099338531 0;1 0.658227860927582 0;1 0.645569622516632 0;1 0.632911384105682 0;1 0.620253145694733 0;1 0.607594907283783 0;1 0.594936728477478 0;1 0.582278490066528 0;1 0.569620251655579 0;1 0.556962013244629 0;1 0.544303774833679 0;1 0.531645596027374 0;1 0.518987357616425 0;1 0.506329119205475 0;1 0.493670880794525 0;1 0.481012672185898 0;1 0.468354433774948 0;1 0.455696195363998 0;1 0.443037986755371 0;1 0.430379748344421 0;1 0.417721509933472 0;1 0.405063301324844 0;1 0.392405062913895 0;1 0.379746824502945 0;1 0.367088615894318 0;1 0.354430377483368 0;1 0.341772139072418 0;1 0.329113930463791 0;1 0.316455692052841 0;1 0.303797453641891 0;1 0.291139245033264 0;1 0.278481006622314 0;1 0.265822798013687 0;1 0.253164559602737 0;1 0.240506336092949 0;1 0.227848097681999 0;1 0.215189874172211 0;1 0.202531650662422 0;1 0.189873412251472 0;1 0.177215188741684 0;1 0.164556965231895 0;1 0.151898726820946 0;1 0.139240503311157 0;1 0.126582279801369 0;1 0.113924048841 0;1 0.101265825331211 0;1 0.088607594370842 0;1 0.0759493634104729 0;1 0.0632911399006844 0;1 0.0506329126656055 0;1 0.0379746817052364 0;1 0.0253164563328028 0;1 0.0126582281664014 0;1 0 0;0.992537319660187 0 0;0.985074639320374 0 0;0.97761195898056 0 0;0.970149278640747 0 0;0.962686538696289 0 0;0.955223858356476 0 0;0.947761178016663 0 0;0.940298497676849 0 0;0.932835817337036 0 0;0.925373136997223 0 0;0.91791045665741 0 0;0.910447776317596 0 0;0.902985095977783 0 0;0.89552241563797 0 0;0.888059675693512 0 0;0.880596995353699 0 0;0.873134315013885 0 0;0.865671634674072 0 0;0.858208954334259 0 0;0.850746273994446 0 0;0.843283593654633 0 0;0.835820913314819 0 0;0.828358232975006 0 0;0.820895493030548 0 0;0.813432812690735 0 0;0.805970132350922 0 0;0.798507452011108 0 0;0.791044771671295 0 0;0.783582091331482 0 0;0.776119410991669 0 0;0.768656730651855 0 0;0.761194050312042 0 0;0.753731369972229 0 0;0.746268630027771 0 0;0.738805949687958 0 0;0.731343269348145 0 0;0.723880589008331 0 0;0.716417908668518 0 0;0.708955228328705 0 0;0.701492547988892 0 0;0.694029867649078 0 0;0.686567187309265 0 0;0.679104506969452 0 0;0.671641767024994 0 0;0.664179086685181 0 0;0.656716406345367 0 0;0.649253726005554 0 0;0.641791045665741 0 0;0.634328365325928 0 0;0.626865684986115 0 0;0.619403004646301 0 0;0.611940324306488 0 0;0.60447758436203 0 0;0.597014904022217 0 0;0.589552223682404 0 0;0.58208954334259 0 0;0.574626863002777 0 0;0.567164182662964 0 0;0.559701502323151 0 0;0.552238821983337 0 0;0.544776141643524 0 0;0.537313461303711 0 0;0.529850721359253 0 0;0.52238804101944 0 0;0.514925360679626 0 0;0.507462680339813 0 0;0.5 0 0]);

% Create axes
axes1 = axes('Position',...
    [0.15524116675352 0.779873892297205 0.730122888546019 0.119025221540559]);
hold(axes1,'on');

% Create patch
s=trisurf(DT(IO, :),x1*d*100,y1*d*100,z1)
 s.EdgeColor='none'
% quiver3(X1,Y1,Z1,U1,V1,W1,'Color',[1 1 1],'AutoScaleFactor',0.3);
ylabel('$y$ (cm)','FontSize',14,'Interpreter','latex');
xlim(axes1,[-1.5 0.5]);
 ylim(axes1,[-0.0825 0.0825]);
% Set the remaining axes properties
set(axes1,'CLim',[0 5.7],'TickLabelInterpreter','latex','XTickLabel','',...
    'YTick',[-0.08 0 0.08]);
% Create axes
axes2 = axes('Position',...
    [0.15524116675352 0.555032622455935 0.730122888546019 0.118707761223099]);
hold(axes2,'on');

% Create patch
s=trisurf(DT(IO, :),x1*d*100,y1*d*100,z1)
 s.EdgeColor='none'
 xlim([-1.5,0.5])
ylim([-0.082,0.082])
% Create quiver3
% quiver3(X2,Y2,Z2,U2,V2,W2,'Color',[1 1 1],'AutoScaleFactor',0.3);

% Create ylabel
ylabel('$y$ (cm)','FontSize',14,'Interpreter','latex');
set(axes2,'CLim',[0 5.7],'TickLabelInterpreter','latex','XTickLabel','',...
    'YTick',[-0.08 0 0.08]);
% Create colorbar
colorbar(axes2,'Position',...
    [0.902380952380953 0.1 0.0190476190476185 0.803174603174603],...
    'TickLabelInterpreter','latex',...
    'FontSize',12);

% Create axes
axes3 = axes('Position',...
    [0.15524116675352 0.330032622455935 0.730122888546019 0.118707761223099]);
hold(axes3,'on');

% Create patch
s=trisurf(DT(IO, :),x1*d*100,y1*d*100,z1)
 s.EdgeColor='none'
% Create quiver3
% quiver3(X3,Y3,Z3,U3,V3,W3,'Color',[1 1 1],'AutoScaleFactor',0.3);
xlim(axes3,[-1.5 0.5]);
 ylim(axes3,[-0.0825 0.0825]);
% Create ylabel
ylabel('$y$ (cm)','FontSize',14,'Interpreter','latex');
set(axes3,'CLim',[0 5.7],'TickLabelInterpreter','latex','XTickLabel','',...
    'YTick',[-0.08 0 0.08]);
% Create axes
axes4 = axes('Position',...
    [0.15524116675352 0.104873892297205 0.730122888546019 0.119025221540559]);
hold(axes4,'on');

% Create patch
s=trisurf(DT(IO, :),x1*d*100,y1*d*100,z1)
 s.EdgeColor='none'
 % quiver3(X4,Y4,Z4,U4,V4,W4,'Color',[1 1 1],'AutoScaleFactor',0.3);
xlim(axes4,[-1.5 0.5]);
 ylim(axes4,[-0.0825 0.0825]);
ylabel('$y$ (cm)','FontSize',14,'Interpreter','latex');
xlabel('$x$ (cm)','FontSize',14,'Interpreter','latex');

set(axes4,'CLim',[0 5.7],'TickLabelInterpreter','latex','XTick',...
    [-1.5 -1 -0.5 0 0.5],'XTickLabel',{'-1.5','-1','-0.5','0','0.5'},'YTick',...
    [-0.08 0 0.08]);
% Create textbox
annotation(figure1,'textbox',...
    [0.601000000000002 0.0380952380952381 0.266857142857141 0.0111111111111111],...
    'String','Magnet Location',...
    'Interpreter','latex',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create doublearrow
annotation(figure1,'doublearrow',[0.578571428571429 0.825],...
    [0.0476190476190476 0.046031746031746]);

% Create textbox
annotation(figure1,'textbox',...
    [0.00695238095238316 0.506349206349206 0.266857142857141 0.0111111111111111],...
    'String',{'c) $t/t^*=54$',''},...
    'Interpreter','latex',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.0129047619047641 0.274603174603175 0.266857142857141 0.0111111111111111],...
    'String',{'d) $t/t^*=115$',''},...
    'Interpreter','latex',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.0140952380952403 0.736507936507937 0.266857142857141 0.0111111111111111],...
    'String',{'b) $t/t^*=28$',''},...
    'Interpreter','latex',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.0176666666666689 0.958730158730159 0.266857142857141 0.0111111111111111],...
    'String','a) $t/t^*=23$',...
    'Interpreter','latex',...
    'FitBoxToText','off',...
    'EdgeColor','none');
