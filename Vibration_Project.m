M = 2.71e-2 ; C=2.62e-2 ; K=338 ; theta=-2.61e-3 ; Cp=3.04e-7 ; R=1e7 ; cf=1.5426; %for 50mm gap
Ct=C/M ; Kt=K/M ; thetat=theta/M ; 
muval = [98.36, 31.65, 21.48, 14.49];
lambdaval = [354757.09, 121934.17, 16931.55, -5274.80];
for j=1:4
Freq = linspace(0,35,350);
Volt = zeros(max(size(Freq)),1);
Accn = [0.5,1.5,2.2];
    A = Accn(1);
for i = 1:max(size(Freq))
    w=2*pi*Freq(i);
initialstate=[0 0 0];
timeinterval=linspace(0,200,200);
mut = muval(j)/M;
lambdat = lambdaval(j)/M;
%odeoptions=odeset('RelTol',1.0e-7,'Abstol',1.0e-8);
func = @(t,q)[q(3);.............
              -(q(2)./R + theta.*q(3))./Cp;.........
              cf*A*cos(w*t)+thetat.*q(2)+lambdat.*(q(1)).^3+mut.*q(1)-Kt.*q(1)-Ct.*q(3)];
[time,statematrix] = ode45(func,timeinterval,initialstate); %,odeoptions
x=statematrix(:,1);
v=statematrix(:,2);
Volt(i) = max(v);
end
% figure(1)
% plot(time,x)
% xlabel('time')
% ylabel('Tip Displacement')
% figure(2)
% plot(time,v)
% xlabel('time')
% ylabel('voltage')
Volt;
Freq;
% plot(Freq,Volt);
% xticks(0:5:35);







Volt2 = zeros(max(size(Freq)),1);
%Volt2 = zeros(max(size(Freq)),1);
    A = Accn(2);
for i = 1:max(size(Freq))
    w=2*pi*Freq(i);
initialstate=[0 0 0];
timeinterval=linspace(0,200,200);
%odeoptions=odeset('RelTol',1.0e-7,'Abstol',1.0e-8);
func = @(t,q)[q(3);.............
              -(q(2)./R + theta.*q(3))./Cp;.........
              cf*A*cos(w*t)+thetat.*q(2)+lambdat.*(q(1)).^3+mut.*q(1)-Kt.*q(1)-Ct.*q(3)];
[time,statematrix] = ode45(func,timeinterval,initialstate); %,odeoptions
x=statematrix(:,1);
v=statematrix(:,2);
Volt2(i) = max(v);
end
% figure(1)
% plot(time,x)
% xlabel('time')
% ylabel('Tip Displacement')
% figure(2)
% plot(time,v)
% xlabel('time')
% ylabel('voltage')
Volt2;
Freq;
% figure(2)
% plot(Freq,Volt2);
% xticks(0:5:35);







Volt3 = zeros(max(size(Freq)),1);
    A = Accn(3);
for i = 1:max(size(Freq))
    w=2*pi*Freq(i);
initialstate=[0 0 0];
timeinterval=linspace(0,200,200);
%odeoptions=odeset('RelTol',1.0e-7,'Abstol',1.0e-8);
func = @(t,q)[q(3);.............
              -(q(2)./R + theta.*q(3))./Cp;.........
              cf*A*cos(w*t)+thetat.*q(2)+lambdat.*(q(1)).^3+mut.*q(1)-Kt.*q(1)-Ct.*q(3)];
[time,statematrix] = ode45(func,timeinterval,initialstate); %,odeoptions
x=statematrix(:,1);
v=statematrix(:,2);
Volt3(i) = max(v);
end
% figure(1)
% plot(time,x)
% xlabel('time')
% ylabel('Tip Displacement')
% figure(2)
% plot(time,v)
% xlabel('time')
% ylabel('voltage')
Volt3;
Freq;
% figure(3)
% plot(Freq,Volt3);
% xticks(0:5:35);
figure(j)
hold on
plot(Freq,Volt,'b-');
plot(Freq,Volt2,'r-');
plot(Freq,Volt3,'g-');
xlabel('Excitation frequency(Hz)');
ylabel('Voltage(V)');
legend('a=0.5 m/s^2','a=1.5 m/s^2','a=2.2 m/s^2');
text(23,100,'Matlab Solution','color','black','fontsize',16);
end
