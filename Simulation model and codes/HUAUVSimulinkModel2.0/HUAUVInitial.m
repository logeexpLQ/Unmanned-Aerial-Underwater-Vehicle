%==========================================
%ģ�ͳ�ʼ����һЩ�������趨
%             ^ y
%           /
%         /
%         ----------> x
%        |
%        |
%        V  z
%===========================================
clear; clc; close all;

m = 1.8;        %����
g = 9.8;        %�������ٶ�
L = 0.19;       %�۳�
V = 1e-3;       %���
Sx = 0.07*0.15;         %x�������
Sy = 0.07*0.28;         %y�������
Sz = 0.15*0.28;         %z�������
Jr = 8.61e-4;       %�����������ת������
Jz = 1.318e-2;      %ƫ������
Jy = 1.318e-2;      %��������
Jx = 2.365e-2;      %�������
buoPos.x = 0;       %��������
buoPos.y = 0;
buoPos.z = -0.02;


rho.air = 1.29;   %�����ܶ�
rho.water = 1000; %ˮ�ܶ�
coeff.air.T = 2.067e-6;        %����������ϵ��
coeff.water.T =  2.067e-3;       %ˮ������������ϵ��
coeff.air.Q = 2.012e-8;        %������Ť��ϵ��
coeff.water.Q = 2.012e-5;       %������ˮ��Ť��ϵ
coeff.water.D = 0.9;       %���������ϵ����һ����0.8-1.0
coeff.res.p = 0.8;
coeff.res.q = 1;
coeff.res.r = 0.8;

%===λ�ÿ���PID����[x,y,z]===%    
pid.posKp  = [1, 1, 1];
pid.posKi  = [0, 0, 0];
pid.posKd  = [0, 0, 0];
pid.posKpw = [1, 1, 1];
pid.posKiw = [0, 0, 0];
pid.posKdw = [0, 0, 0];
%===�Ƕȿ���PID����===%
pid.aglKp  = [1, 1, 1];
pid.aglKi  = [0, 0, 0];
pid.aglKd  = [0, 0, 0];
pid.aglKpw = [1, 1, 1];
pid.aglKiw = [0, 0, 0];
pid.aglKdw = [0, 0, 0];
%======================%

global posState aglState
posState = [0 0 0]';
aglState = [0 0 0]';

save HUAUVPARAMETERS.mat m g L Sx  Sy Sz Jr Jx Jy Jz coeff pid buoPos;