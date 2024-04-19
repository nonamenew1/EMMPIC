%Debye Length
clear all;clc;close all;
Kb=1.38e-23;
eps=8.85e-12;
q=1.6e-19;
me=9.11e-31'
Te=0.5*me*(1.e4)^2;
lamda=sqrt(eps*Kb*Te/(1.e12*q^2))