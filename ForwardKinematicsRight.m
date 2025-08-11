% Forward Kinematics Function for 5 Bar Planar Parallel Robot

%Returns positions of ONLY EE
function [J5] = ForwardKinematicsRight(Servo ,L)

    %Servo Angles of Joints J1 and J2
    Ang_J1 = Servo(1,1);
    Ang_J2 = Servo(1,2);
    
    % Servo positions (J1 and J2) X,Y
    J1 = [-L(1)/2, 0];
    J2 = [L(1)/2, 0];
    
    % Compute passive joints J3 and J4
    J3 = [J1(1,1) + L(2) * cosd(Ang_J1),    J1(1,2) + L(2) * sind(Ang_J1)];
    J4 = [J2(1,1) + L(2) * cosd(Ang_J2),    J2(1,2) + L(2) * sind(Ang_J2)];
    
    % Compute distance between passive joints (J3 and J4) = H
    % Angle of H (equation 1 in PDF)
    H = norm(J3 - J4);
    Theta_H = atand(norm(J4(1,2) - J3(1,2))/ norm(J4(1,1) - J3(1,1)));
    
    % Using Cosine rule to find Angle from H to EE (equation 3 in PDF)
    Theta_C = acosd(H / (2 * L(3)));
    
    % Angle of Joint J3:
    Ang_J3 = Theta_H + Theta_C;
    
    % Compute EE position: (Negative of the X component)
    J5 = [-(J3(1,1) + L(3) * cosd(Ang_J3)), J3(1,2) + L(3) * sind(Ang_J3)];