% Circle EE Positions

function [X,Y] = CircleXY(Center, radius, n)

Circle_Angles = linspace(1,360,n);

% Computing all end-effector positions for circle points
X = radius * cosd(Circle_Angles) + Center(1,1);
Y = radius * sind(Circle_Angles) + Center(1,2);