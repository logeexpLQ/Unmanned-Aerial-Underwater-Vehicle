clear; clc;close all;

Ts=0.005; %����ʱ��
t = 0:Ts:2;
steps = size(t);

w = 0.05*randn(steps(2),2); %Ԥ������
v = 0.5*randn(size(t)); %�۲�����
Q = cov(w); %ϵͳ����Э����
R = cov(v); %�۲�����Э����
Kv = zeros(steps);
Kx = zeros(steps);

opt = 0;
if opt == 0
    target = sin(10*t);
else
    target = ones(size(t));
end

mz = target + v;
z = mz;

x = [0; 0];%��ʼ״̬
P = [0,0;0,0]; %״̬�ĳ�ʼЭ�������

F = [1, Ts; 0, 1]; %״̬ת������
H = [1, 0];  %�۲����


for k=2:1:steps(2) 
   %Time update
    x_=F*x;               %״̬Ԥ�ⷽ��
    P_=F*P*F'+ Q;            %Э����Ԥ�ⷽ��
    
    %Measurement update
    K = P*H'/(H*P*H'+R);         %����������ļ���
    x = F*x_+K*(z(k)-H*F*x_);     %����ֵ�ļ���
    P = (eye(2)-K*H)*P_;          %Э������·���
    
    Kx(k) = K(1);
    Kv(k) = K(2);
    z(k) = H*x;           %Filtered value   �˲��Ժ��ֵ
end
figure(1);
plot(t,mz,'r:.',t,z,'b',t,target,'k--');
title('�ź�Ƶ��Ϊ0.1Hz');
xlabel('ʱ��(s)');
ylabel('�Ƕ�(rad)')
legend('����ֵ','�˲����ֵ','Ŀ��ֵ');
grid on

figure(2)
plot(t,Kx,'r.-',t,Kv,'b');
title('����������K');
xlabel('ʱ��(s)');
ylabel('K')
legend('�Ƕȿ���������','���ٶȿ���������');
grid on

figure(3)
plot(t,mz-target,'r:.',t,z-target,'b');
title('������');
xlabel('ʱ��(s)');
ylabel('���');
legend('ԭʼ���','�˲������');
grid on


