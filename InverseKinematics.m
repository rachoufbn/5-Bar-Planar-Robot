% Inverse Kinematics Function for 5 Bar Planar Parallel Robot

% Returns positions of each of the 5 joints
function [Ang1, Ang2] = InverseKinematics(EE ,L)

    % Servo Positions: J1 and J2
    Servos = [-L(1,1)/2,    0;
               L(1,1)/2,    0];

    % EE positions
    XE = EE(1,1);
    YE = EE(1,2);

    % Hypotenuse from EE to Servos (R1 - LEFT servo, R2 - RIGHT servo)
    R1 = norm([XE,YE] - Servos(1,:));
    R2 = norm([XE,YE] - Servos(2,:));

    % Computing Servo 1 Angle (LEFT SERVO): Ang1
    % Alpha1 and Beta1 as per diagram    
    Alpha1 = atand(YE/norm(XE - Servos(1,1)));
    Beta1 = acosd((R1^2 + L(1,2)^2 - L(1,3)^2)/(2 * R1 * L(1,2)));
    
    Ang1 = Alpha1 + Beta1;

    % Computing Servo 2 Angle (RIGHT SERVO): Ang2
    % Alpha2 and Beta2 as per diagram
    Alpha2 = atand(YE/norm(XE - Servos(2,1)));
    Beta2 = acosd((R2^2 + L(1,2)^2 - L(1,3)^2)/(2 * R2 * L(1,2)));

    Ang2 = 180 - Alpha2 - Beta2;
    
    Ang1 = round(Ang1,1);
    Ang2 = round(Ang2,1);