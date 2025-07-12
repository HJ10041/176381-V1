% inflation_persist_program
% produces the response of inflation and output to monetary and fisal
% shocks for "Fiscal Histories" in Journal of Economic Perspectives
% John Cochrane, john.cochrane@stanford.edu
% Note: A modification of the program used for "inflation past present and
% future"; the latter has more variations.

clear all 
close all

lw=1.5; % plot linewidth
fnt = 16; % plot font

sig = 0.5; % NK model parameters
kap = 0.5;
bet = 1; 
thpi = 0.0; 
thx = 0.0; 
rho = 0.98; 
omeg = 0.9;
eta = 0.999; 

T = 100; 
show_results=1;

tim = (0:T)';
pit = 0*tim;
    

% simple price stickiness

if 0; % check; this gives the same answer 
    l1 = ((1+bet+sig*kap) + ((1+bet+sig*kap)^2-4*bet)^0.5)/2;
    pit2a = [0;(1/l1).^(tim(2:end)-1)]*(1-rho/l1);
    
    pt2a = cumsum(pit2a);
end;

% calculate and plot response to fiscal shock with fixed interest rate
% I retained individual plots. Below is the two panel plot used in JEP

shock = [1 0]'; 
thpi1 = 0; 
[xt, pit, vt, qt, it, rnt, pt] = solveit(sig,kap, bet, thpi1, thx,eta, rho, omeg,T,shock);

figure; 
hold on;
plot(tim,0*tim,'-b','linewidth',2);
plot(tim, pit,'-rv', 'linewidth',2); 
plot(tim, xt,'--ks','linewidth',2);

xlabel('Time');
ylabel('Percent');
axis([0 7 -0.05 0.45]);
text(2,0.3,'Inflation \pi','color','r','fontsize',18);
text(2.7, 0.12,'Output x','color','k','fontsize',18,'horizontalalignment','r')
text(1,0.02,'Interest rate i','color','b','fontsize',18);

    print -depsc2 sticky_inflation.eps;
    print -dpng sticky_inflation.png;

xtf = xt; % save for later
pitf = pit; 
itf = it; 

% calculate and plot response to monetary shock
shock = [0 1]';
thpi = 0; 
thx = 0; 
[xt, pit, vt, qt, it, rnt, pt] = solveit(sig,kap, bet, thpi, thx, eta, rho, omeg,T,shock);


figure;
hold on;
plot(tim,it,'-b','linewidth',2);
plot(tim, pit, '-rv','linewidth',2); 
plot(tim, xt,'--ks','linewidth',2);
plot(tim,0*tim,'-k');
xlabel('Time');
ylabel('Percent');
axis([0 10 -3 1.1])
text(2.7,-0.5,'Inflation \pi','color','r','fontsize',18,'horizontalalignment','r');
text(2.7, -1.5,'Output x','color','k','fontsize',18);
text(4,0.9,'Interest rate i','color','b','fontsize',18);

    print -depsc2 mpshock_inflation.eps;
    print -dpng mpshock_inflation.png;


disp('total inflation'); 
disp(pt(end));

% make simple plot, two panels, just inflation for JEP

figure; 
subplot(2,1,1); 
hold on;
plot(tim,0*tim,'-bo','linewidth',lw);
plot(tim, pitf,'-rv', 'linewidth',lw);
%plot(tim, xtf,'--k', 'linewidth',lw);
xlabel('Time');
ylabel('Percent');
axis([0 7 -0.05 0.45]);
text(2,0.3,'Inflation \pi','color','r','fontsize',fnt);
text(1,0.05,'Interest rate i','color','b','fontsize',fnt);

subplot(2,1,2);
hold on;
plot(tim,it,'-bo','linewidth',lw);
plot(tim, pit, '-rv','linewidth',lw);
%plot(tim, xt,'--k', 'linewidth',lw);
plot(tim,0*tim,'-k');
xlabel('Time');
ylabel('Percent');
axis([0 7 -3 1.1])
%text(2.2,-1.5,'Inflation \pi','color','r','fontsize',fnt);without output
text(2,-1.5,'Inflation \pi','color','r','fontsize',fnt, 'horizontalalignment','r');%without output
%text(3,-1.5,'Output x','color','k','fontsize',fnt);

text(2.5,0.70,'Interest rate i','color','b','fontsize',fnt);

print -depsc2 JEP_simulation.eps;
print -dpng JEP_simulation.png;


% calculate and plot response to fiscal shock with Taylor rule 
% this shows how Taylor rules smooth inflation forward, reducing the impact
% inflation as claimed in the text

if 0
    shock = [1 0]';
    thpi = 0.9;
    [xt pit vt qt it rnt pt] = solveit(sig,kap, bet, thpi, thx,eta, rho, omeg,T,shock);
    
    figure;
    hold on;
    plot(tim,it,'-b','linewidth',2);
    plot(tim, pit, '-rv','linewidth',2);
    plot(tim, pt, '--k','linewidth',2);
    plot(tim,0*tim,'-k');
    xlabel('Time');
    ylabel('Percent');
    axis([0 7 -0.1 1.1])
    text(2,0.3,'Inflation \pi','color','r','fontsize',18);
    text(3.5,0.75,'Price level p','color','k','fontsize',18);
    text(5,1,['p(\infty) = ' num2str(pt(end),'%4.2f')],'color','k','fontsize',18);
    text(1,0.15,'Interest rate i','color','b','fontsize',18);
    print -depsc2 policy_inflation.eps;
    print -dpng policy_inflation.png;
        
    disp('total inflation');
    disp(pt(end));
end;


%******

function [xt, pit, vt, qt, it, rnt, pt] = solveit(sig,kap, bet, thpi, thx, eta, rho, omeg,T,shock);

show_results = 1; 

N = 4;
A = [...
  1 sig 0    0    0 ; 
  0 bet 0    0    0 ; 
  0 1   rho -omeg 0 ; 
  0 0   0    omeg 0 ;
  0 0   0     0   1]; 


% x pi q ui us

B = [ ...
    1+sig*thx sig*thpi 0 0 sig ; 
    -kap     1       0 0   0 ; 
    0        0       1 -1  0; 
    thx       thpi     0 1 1 ;
    0         0        0 0 eta]; 



C = [...
    0 0;
    0 0;
    1 0;
    0 0;
    0 1];

D = [...
    1  sig 0 ;
    0  bet 0 ;
    0  0   0 ;
    0  0   omeg ;
    0  0    0 ];
 
% Solve by eigenvalues See Fiscal Theory of the Price Level appendix for
% equations

A1 = inv(A); 
F = A1*B; 
[Q L] = eig(F); 
Q1 = inv(Q); 
if show_results;
    disp('Eigenvalues');
    disp(abs(diag(L)'));
end
% produce Ef, Eb, that select forward and backward
% eigvenvalues. If L>=1 in position 1, 3, 
% produce
% 1 0 0 0 
% 0 0 1 0 ...
% for example

nf = find(abs(diag(L))>=1); % nf is the index of eigenvalues greater than one
if show_results
    disp('number of eigenvalues >=1');
    disp(size(nf,1))
end
if (size(nf,1) < size(D,2)); 
    disp('not enough eigenvalues greater than 1');
end;
Ef = zeros(size(nf,1),size(A,2));
Efstar = zeros(size(A,2),size(A,2));
for indx = 1:size(nf,1);
    Ef(indx,nf(indx))=1; 
    Efstar(nf(indx),nf(indx)) = 1; 
end;

nb = find(abs(diag(L))<1);
Eb = zeros(size(nb,1),size(A,2));
for indx = 1:size(nb,1);
    Eb(indx,nb(indx))=1;
end;

ze = Eb*Q1*A1*(C-D*inv(Ef*Q1*A1*D)*Ef*Q1*A1*C);
% how epsilon shocks map to z.
% in principle the forward z are zero. In practice they are 1E-16 and then
% grow. So I go through the trouble of simulating forward only the nonzero
% z and eigenvalues less than one.

Nb = size(Eb,1); % number of stable z's
Lb = (Eb*L*Eb'); % diagonal with only stable Ls

% impulse response
H = T+1;

%shock = [ 1 0]' for fiscal [ 0 1 ]' for monetary; 

zbt = zeros(H,Nb);
zbt(2,:) = (ze*shock)';
for t = 3:H;
    zbt(t,:) = Lb*zbt(t-1,:)';
end;

% now create the full z with zeros
zt = zeros(H,N);
zt(:,nb) = zbt;

% create original variables
yt = zt*Q';

xt = yt(:,1);
pit = yt(:,2);
vt = yt(:,3);
qt = yt(:,4);
ut = yt(:,5);

rnt = zeros(H,1);
rnt = omeg*qt-[0;qt(1:H-1)];

it = thpi*pit + thx*xt + ut;

%yield is nonlinear so use the right size
qlevelt = qt - log(1-omeg);
yldt = exp(-qlevelt)+omeg-1; 

pt = cumsum(pit);
disp('omeg')
disp(omeg)
end