%% parametric design

clear all;   % Clear all variables
clc;         % Clear the command window
close all;   % Close all open figures and GUIs

Lgnd = 80e-3;
Wgnd = 60e-3;
h    = 1.57e-3;
La   = 40e-3;
Wa   = 30e-3;
Foff = [5.5e-3 0];

p1 = patchMicrostrip;
p1.Length = La;
p1.Width = Wa;
p1.Height = h;
p1.GroundPlaneLength = Lgnd;
p1.GroundPlaneWidth = Wgnd;
p1.FeedOffset = Foff;

p1.Substrate = dielectric('Name','material1','EpsilonR',2.33);

%% PCB stack

pb1 = pcbStack(p1);
pb1.FeedDiameter = sqrt(2)*1e-3;
pb1.FeedViaModel = 'square';

%% Show PCB 

figure
show(pb1)   

figure
mesh(pb1,'MaxEdgeLength',.01,'MinEdgeLength',.003)

figure
pattern(pb1, 2.37e9)

%% plot S11

f1 = 7.5e9;
f2 = 11e9;
Nf = 10;

freq = linspace(f1, f2, Nf);

figure;
s = sparameters(pb1, freq, 50);
rfplot(s);

