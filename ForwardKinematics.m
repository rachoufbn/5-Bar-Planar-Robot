% Forward Kinematics Function for 5 Bar Planar Parallel Robot

%Returns positions of each of the 5 joints
function [J1, J2, J3, J4, J5] = ForwardKinematics(Servo ,L)

    %Servo Angles (S.A) of Joints J1 and J2
    Ang_J1 = Servo(1,1);
    Ang_J2 = Servo(1,2);
    
    % Servo positions (J1 and J2) [X,Y]
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
    
    % Angle of Joint J3 relative to x-axis:
    Ang_J3 = Theta_H + Theta_C;
    
    % Compute EE position:
    J5 = [J3(1,1) + L(3) * cosd(Ang_J3),    J3(1,2) + L(3) * sind(Ang_J3)];
    
    % Compare link lengths from J3 to EE and J4 to EE
    dist1 = norm(J3(1,:) - J5(1,:));
    dist2 = norm(J4(1,:) - J5(1,:));
    tolerance = 1e-6; % Define a tolerance level

    %Checking Link J3 to EE and J4 to EE are same length
    if abs(dist1-dist2) > tolerance
        disp('J3 to EE and J4 to EE are not the same.')
        % Flip angles to run ForwardKinematicsRight for corrected EE
        Left = 180 - Ang_J2; % New S.A left = 180 - S.A right
        Right = 180 - Ang_J1; % New S.A right = 180 - S.A left

        J5 = ForwardKinematicsRight([Left,Right],L);

    else
        disp('J3 to EE and J4 to EE are the same.')
    end