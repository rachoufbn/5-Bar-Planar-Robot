% Define Input Joint Angles
Servo = [90, 90];

% Define lengths of the links: L1, L2, L3 as per figure 1 in PDF.
L = [20, 17, 30]; % Lengths for chocolate solution
%L = [6, 5, 10]; % Lengths for circle and square live demo

[J1, J2, J3, J4, J5] = ForwardKinematics(Servo, L);
Joints =[J1;J2;J3;J4;J5];

% Workspace
workspace=zeros(100,2);
workspace_Angles_J2 = linspace(0,180,100);
workspace_Angles_J1 = linspace(180,0,100);
index = 1;

for i=1:length(workspace_Angles_J2)
    for j=1:length(workspace_Angles_J1)
        A2 = workspace_Angles_J2(i);
        A1 = workspace_Angles_J1(j);
        A = [A1,A2];
        [J1_w, J2_w, J3_w, J4_w, J5_w] = ForwardKinematics(A, L);
        workspace(index, :) = J5_w;
        index = index + 1;
    end
end

PlotLinks(Joints, workspace);

Shape = 2; % 1 for circle, 2 for square
 
Center = [0,12];
radius = 2;
n = 100; % number of points
 
if Shape == 1
    [X,Y] = CircleXY(Center, radius, n);
    plot(X, Y, '.','Color','b');

    Servo1_Angles = [1,n];
    Servo2_Angles = [1,n];

    % InverseKinematics to store computed Servo 1 and 2 angles resp.
    for i = 1:n
        EndEffector = [X(1,i),Y(1,i)];
        [A1, A2] = InverseKinematics(EndEffector,L);
        Servo1_Angles(1,i)=A1;
        Servo2_Angles(1,i)=A2;
    end
elseif Shape == 2
    SquareEE = SquareXY(Center, radius, n);

    Servo1_Angles = [1,(n+1)];
    Servo2_Angles = [1,(n+1)];

    %Plotting Square on Workspace
    for i = 1 : n+1
        plot(SquareEE(i,1),SquareEE(i,2),'.','Color','b');
    end
    % InverseKinematics to store computed Servo 1 and 2 angles resp.
    for i = 1 : n+1
        EndEffector = [SquareEE(i,1),SquareEE(i,2)];
        [A1, A2] = InverseKinematics(EndEffector,L);
        Servo1_Angles(1,i)=A1;
        Servo2_Angles(1,i)=A2;
    end
end
 
% Passing Servo Angles to Servo
a = arduino('COM5','Mega2560');
s1 = servo(a,'D3','MaxPulseDuration',2.5e-3,'MinPulseDuration',0.5e-3);
s2 = servo(a,'D5','MaxPulseDuration',2.5e-3,'MinPulseDuration',0.5e-3);

%Converting Between Angle and PWM duty cycle
MappedAngles1=[];
MappedAngles1=arrayfun(@AngleMapping,Servo1_Angles);
MappedAngles2=[];
MappedAngles2=arrayfun(@AngleMapping,Servo2_Angles);

% Controlling the Servo Motors
for i=1:size(MappedAngles1,2)
    writePosition(s1,MappedAngles1(1,i));
    writePosition(s2,MappedAngles2(1,i));
    pause(0.05);
end
