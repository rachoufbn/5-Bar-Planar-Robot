function PlotLinks(Joints, workspace)

    figure;
    grid on;
    xlabel=('X');
    ylabel=('Y');
    axis equal;
    hold on;

    oY = 2;
    labelOffset = 2;

    % Plotting Workspace
    plot(workspace(:,1),workspace(:,2),'LineStyle','None','Marker','.','Color','g');
    

    % Plot Robot (links and joint coordinates)
    % Links
    plot([Joints(1,1) Joints(2,1)], [Joints(1,2) Joints(2,2)]-oY, 'b-o');
    plot([Joints(1,1) Joints(3,1)], [Joints(1,2) Joints(3,2)]-oY, 'b-o');
    plot([Joints(2,1) Joints(4,1)], [Joints(2,2) Joints(4,2)]-oY, 'b-o');
    plot([Joints(3,1) Joints(5,1)], [Joints(3,2) Joints(5,2)]-oY, 'b-o');
    plot([Joints(4,1) Joints(5,1)], [Joints(4,2) Joints(5,2)]-oY, 'b-o');
     
    % Joint Labels
    text(Joints(1,1), Joints(1,2) - labelOffset, 'J1', 'VerticalAlignment','bottom','HorizontalAlignment','center');
    text(Joints(2,1), Joints(2,2) - labelOffset, 'J2', 'VerticalAlignment','bottom','HorizontalAlignment','center');
    text(Joints(3,1) - labelOffset, Joints(3,2) + labelOffset, 'J3', 'VerticalAlignment','bottom','HorizontalAlignment','center');
    text(Joints(4,1) + labelOffset, Joints(4,2) + labelOffset, 'J4', 'VerticalAlignment','bottom','HorizontalAlignment','center');
    text(Joints(5,1) - labelOffset, Joints(5,2) + labelOffset, 'J5', 'VerticalAlignment','bottom','HorizontalAlignment','center');
     
    % Coordinates
    text(Joints(3,1), Joints(3,2), sprintf('(%.1f, %.1f)', Joints(3,1), Joints(3,2)), 'VerticalAlignment','bottom','HorizontalAlignment','right');
    text(Joints(4,1), Joints(4,2), sprintf('(%.1f, %.1f)', Joints(4,1), Joints(4,2)), 'VerticalAlignment','bottom','HorizontalAlignment','right');
    text(Joints(5,1), Joints(5,2), sprintf('(%.1f, %.1f)', Joints(5,1), Joints(5,2)), 'VerticalAlignment','bottom','HorizontalAlignment','right');
     
    % Plotting Environment
    rectangle('Position',[-15,-10,30,20],'EdgeColor','r','LineWidth',0.5,'LineStyle','--'); % Area for mounting robot
    rectangle('Position',[-4,12,8,8], 'EdgeColor','r','LineWidth',0.5,'LineStyle','-'); % Chocolate pickup region
    rectangle('Position',[-15,12,30,8], 'EdgeColor','b','LineWidth',0.25,'LineStyle','--'); % Conveyor

    rectangle('Position',[-10,22,20,20], 'EdgeColor','r','LineWidth',0.5,'LineStyle','-'); % Chocolate tray
