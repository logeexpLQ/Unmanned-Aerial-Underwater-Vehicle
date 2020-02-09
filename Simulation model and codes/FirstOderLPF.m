clear; clc; close all;

Ts = 0.01;    %����ʱ��
fs = 1/Ts;
t = 0:Ts:10;
fc = 10;    %��ֹƵ��
opt = 1;
if opt == 1
    target = ones(size(t));
else
    target = sin(t);
end
uo = zeros(size(t));
steps = size(t); 
alpha = 2*pi*fc*Ts/(1+2*pi*fc*Ts); %�˲�ϵ��
v1 = 0.2*randn(size(t));%������
v2 = 0.5*(0.5*sin(1e6*t)+1*sin(1e5*t)+0.7*sin(1e4*t)+0.5*sin(1e3*t)+0.3*sin(1e2*t))/5; %��Ƶ��ɫ����
v3 = 0.5*(0.5*sin(10*t)+sin(t)+0.7*sin(0.1*t)+sin(0.01*t)+0.9*sin(0.001*t))/5; %��Ƶ��ɫ����
ui =target +  v3;
uo(1) = ui(1);
for k=2:steps(2)
    uo(k) = alpha*ui(k)+(1-alpha)*uo(k-1);
end
figure(1)
plot(t,ui,'r-.',t,uo,'b',t,target,'k--');
title('һ�׵�ͨ�˲�/fc=10Hz')
legend('ԭʼ����','�˲�������','Ŀ��ֵ')
xlabel('ʱ��');
ylabel('����')
grid on

figure(2)
plot(t,ui-target,'r:.',t,uo-target,'b-');
title('������');
xlabel('ʱ��(s)');
ylabel('���');
legend('ԭʼ���','�˲������')
grid on


