%% parametric design

clear all;   % Clear all variables
clc;         % Clear the command window
close all;   % Close all open figures and GUIs

Lgnd = 2.328e-3 ;
Wgnd = 2.02e-3 ;
La   = 1.1483e-3 ;
Wa   = 1.429e-3 ;
Wf   = 0.4749e-3 ;
Wi   = 0.075e-3 ;
Li   = 0.377e-3 ;
H    = 0.149e-3;
Foff   = [-Lgnd/2, 0];

W2   = Wf + 2*Wi;   %Functionnal format of insert width

pat = patchMicrostripInsetfed("GroundPlaneLength",Lgnd, "GroundPlaneWidth", Wgnd, ...
                                "Length", La, "Width", Wa, "NotchLength",Li, "NotchWidth",W2, ...
                                "Height", H, "StripLineWidth", Wf, "FeedOffset", Foff);

% correctifs

pat.TiltAxis = [1 0 0];

show(pat)

%% Sandwitch time

d = dielectric;
d.Name = 'RT5880';
d.EpsilonR = 2.2;
d.LossTangent = 0.0009;
pat.Substrate = d;
show(pat)

%% Show PCB 

figure
show(pat)   


%% plot S11

f1 = 82e9;
f2 = 84e9;
Nf = 10;

freq = linspace(f1, f2, Nf);

figure;
s = sparameters(pat, freq, 50);
tet = rfplot(s);


%% tét csv 

formatator_3000('out.csv', 1, tet, freq);


 
