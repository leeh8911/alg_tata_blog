%% step0. clear all!!
clear; clc; close all;
f = figure;
ax = gca;
hold on; grid on; box on;
axis([-10 10 -10 10]);
%% step1. initialize point2d 

pntA = Point2D(3,4);    % there is initial values
pntB = Point2D();       % there is no initial value(pntB = [0, 0])

%% step2. draw point2d 

cla;
pntA.Draw(ax, 'r','x');
pntB.Draw(ax, 'g','o');
saveas(gcf, "./fig/fig1 - draw pnt2d.jpg")


%% step3. initialize line2d

line = Line2D(pntA, pntB);

%% step4. draw line2d

cla;
line.Draw(ax, 'g','o');
saveas(gcf, "./fig/fig2 - draw line2d.jpg")

