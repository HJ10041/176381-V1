% JEP_plots
% makes data plots for "Fiscal Histories" Journal of economic perspectives
% john.cochrane@stanford.edu
% all data series are downloaded from fred, 7/25/2022. Data file names are
% fred mnemonics. All data files are fixed by hand to load into matlab:
% changed - to , in date format and commented out header. 

clear all
close all

lw=1.5; % plot linewidth
fnt = 16; % plot font

x = load('A091RC1Q027SBEA.csv');
yr_int=x(:,1);
mo_int=x(:,2);
dy_int=x(:,3);
int=x(:,4);

x = load('AD02RC1Q027SBEA.csv');
yr_s=x(:,1);
mo_s=x(:,2);
dy_s=x(:,3);
s=x(:,4);

x = load('fedfunds.csv');
yr_ff=x(:,1);
mo_ff=x(:,2);
dy_ff=x(:,3);
ff=x(:,4);

x = load('unrate.csv');
yr_u=x(:,1);
mo_u=x(:,2);
dy_u=x(:,3);
u=x(:,4);

x = load('GDPDEF.csv');
yr_yp=x(:,1);
mo_yp=x(:,2);
dy_yp=x(:,3);
yp=x(:,4);

x = load('CPILFESL.csv');
yr_core=x(:,1);
mo_core=x(:,2);
dy_core=x(:,3);
core=x(:,4);

x = load('GDPC1.csv'); % real GDP
yr_yr=x(:,1);
mo_yr=x(:,2);
dy_yr=x(:,3);
yr=x(:,4);

% plot primary surplus

sp = s + int(find((yr_int==yr_s(1)) & (mo_int==mo_s(1))):end);
sp = sp./yp(find((yr_yp==yr_s(1)) & (mo_yp==mo_s(1))):end)*100; % make real
sp = filter(ones(4,1)/4,1,sp); % 4 quater MA

% express as deviation from trend real GDP 
yr60 = yr(find((yr_yr==yr_s(1)) & (mo_yr==mo_s(1))):end);
ab = [ones(size(yr60,1),1) (1:size(yr60,1))']\log(yr60) ;
trendy = [ones(size(yr60,1),1) (1:size(yr60,1))']*ab; 

disp('trend gdp in 1980, 2000, and percent increase')
disp(exp(trendy(find((yr_s==1980) & (mo_s==1)))));
disp(exp(trendy(find((yr_s==2000) & (mo_s==1)))));
disp(exp(trendy((find((yr_s==2000) & (mo_s==1))))/...
    exp(trendy(find((yr_s==1980) & (mo_s==1))))-1)*100);

if 0; %look at trend;
    figure;
    hold on
    plot(datenum(yr_s,mo_s,dy_s),trendy);
    plot(datenum(yr_s,mo_s,dy_s),log(yr60));
    datetick('x')
end


% quarterly unemployment as average in the quarter;
uq = filter(ones(3,1)/3,1,u); 
uq = uq(3:3:end);
yr_uq = yr_u(3:3:end);
mo_uq = mo_u(3:3:end);
dy_uq = dy_u(3:3:end); 

if 0; % check that trend looks ok
    figure;
    hold on
    plot(datenum(yr_s,mo_s,dy_s),log(yr60));
    plot(datenum(yr_s,mo_s,dy_s),trendy);
    datetick('x','keeplimits')
end; 

fig=figure; 
set(fig,'Position',[ 441   377   560   0.6*420]);
set(fig,'defaultAxesColorOrder',[[0 0 0];[0 0 0]]);
hold on
yyaxis right;
i1=find((yr_uq==yr_s(1)) & (mo_uq==3));
plot(datenum(yr_uq(i1:end),mo_uq(i1:end),dy_uq(i1:end)),-uq(i1:end),...
    'linewidth',1.2,'color',0.5*[1 1 1]);
axis([datenum(1960,1,1) datenum(2023,1,1) -15 0])
text(datenum(1985,1,1),-9,'-Unemployment','color',0.5*[1 1 1],'fontsize',fnt);
ylabel('Percent')
datetick('x','keeplimits')
yyaxis left;
plot(datenum(yr_s,mo_s,dy_s),100*sp./exp(trendy),'-b','linewidth',lw);
plot(datenum(yr_s,mo_s,dy_s),0*datenum(yr_s,mo_s,dy_s),'-k');
axis([datenum(1960,1,1) datenum(2023,1,1) -15 5.5]);
text(datenum(1997,1,1),4,'Primary surplus/trend GDP','color','b','fontsize',fnt,...
    'horizontalAlignment','r');
ylabel('Percent of trend GDP')
datetick('x','keeplimits')

print -depsc2 surplus_and_unemployment.eps
print -dpng surplus_and_unemployment.png


% plot inflation and federal funds rate 

fig=figure;
set(fig,'Position',[ 441   377   560   0.6*420]);

hold on
yr_ffq=yr_ff(3:3:end);
mo_ffq=mo_ff(3:3:end);
dy_ffq=dy_ff(3:3:end);
ffq=ff(3:3:end);
yr_coreq=yr_core(3:3:end);
mo_coreq=mo_core(3:3:end);
dy_coreq=dy_core(3:3:end);
coreq=core(3:3:end);


plot(datenum(yr_ffq,mo_ffq,dy_ffq),ffq,'-b','linewidth',lw)
plot(datenum(yr_coreq,mo_coreq,dy_coreq),coreq,'-r','linewidth',lw);
axis([datenum(1960,1,1) datenum(2023,1,1) 0 20]);
datetick('x','keeplimits');
text(datenum(1983,1,1),15,'Federal Funds','color','b','fontsize',fnt);
text(datenum(1968,1,1),2,'Core Inflation','color','r','fontsize',fnt);
ylabel('Percent')

print -depsc2 ff_core.eps; 
print -dpng ff_core.png; 

