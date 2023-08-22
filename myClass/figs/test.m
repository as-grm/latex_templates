% Test Octave script

close all; % close all plots
clear all; % clear workspace buffer
clc;       % clear command window

x = -10:0.1:10;          % Create an evenly-spaced for 0.1 vector from -10..10
x = linspace(-10,10,100) % similar with number of division points
y = sin(x);              % y is also a vector
plot(x, y);
title("Simple 2-D Plot");
xlabel("x");
ylabel("sin (x)");
