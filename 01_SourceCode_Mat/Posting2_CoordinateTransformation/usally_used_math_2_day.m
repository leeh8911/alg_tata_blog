clear, clc, close all;
figure_path = "./fig/usally_used_math_2_day";
mkdir(figure_path);

axis_param = [-5, 20, -5, 20];

%% first step : define frames
frame1.angle = 30;
frame1.org_x = -3;
frame1.org_y = 5;

frame2.angle = 0;
frame2.org_x = 0;
frame2.org_y = 0;


figure; hold on; grid on; box on;
[~, trX_axis, trY_axis] = drawFrame(frame1,'r');
text(trY_axis(1,2), trY_axis(2,2) + 2, 'Frame1','color','r');
[~, trX_axis, trY_axis] = drawFrame(frame2,'b');
text(trY_axis(1,2), trY_axis(2,2) + 2, 'Frame2','color','b');
axis(axis_param);
axis equal;
xlabel("X"); ylabel("Y");
title("Figure[1] : Two frames");
saveas(gcf, "./fig/usally_used_math_2_day/fig1.jpg")

%% second step : transformation
filename = "./fig/usally_used_math_2_day/fig2.gif";

figure; hold on; grid on; box on;
frameTR = frame1;
end_flag = false;
start_flag = true;
trj_y = [];
while(1)
    if ~start_flag
        if abs(frameTR.angle - frame2.angle) > 1e-3
            frameTR.angle = frameTR.angle + (frame2.angle - frame1.angle)/5;
        elseif abs(frameTR.org_x - frame2.org_x) > 1e-3
            frameTR.org_x = frameTR.org_x + (frame2.org_x - frame1.org_x)/5;
        elseif abs(frameTR.org_y - frame2.org_y) > 1e-3
            frameTR.org_y = frameTR.org_y + (frame2.org_y - frame1.org_y)/5;
        else
            end_flag = true;
        end
    end
    
    cla
    [~, trX_axis, trY_axis] = drawFrame(frame1,'r');
    text(trY_axis(1,2), trY_axis(2,2) + 2, 'Frame1','color','r');
    [~, trX_axis, trY_axis] = drawFrame(frame2,'b');
    text(trY_axis(1,2), trY_axis(2,2) + 2, 'Frame2','color','b');
    [~, trX_axis, trY_axis] = drawFrame(frameTR,'g');
    text(trY_axis(1,2), trY_axis(2,2) + 2, 'Frame TR','color','g');
    
    trj_y = [trj_y, trY_axis(:,2)];
    plot(trj_y(1,:),trj_y(2,:),':g');
    axis(axis_param);
    axis equal;
    xlabel("X"); ylabel("Y");
    title("Figure[2] : Transformation");
    drawnow
    
    frame = getframe(gcf);
    img = frame2im(frame);
    [A, map] = rgb2ind(img, 256);
    if(start_flag)
        imwrite(A,map,filename,'gif','LoopCount',Inf, 'DisposalMethod','restoreBG');
        start_flag = false;
    else
        imwrite(A,map,filename,'gif','WriteMode','append', 'DisposalMethod','restoreBG');
    end
    
    
    if end_flag
        break;
    end
end
saveas(gcf, "./fig/usally_used_math_2_day/fig2.jpg")




%% functions





function [h, trX_axis, trY_axis] = drawFrame(frame, c)

X_axis = [0, 10;
    0, 0];
Y_axis = [0, 0;
    0, 10];

All_axis = [X_axis, Y_axis];
R = [cosd(frame.angle) -sind(frame.angle);
    sind(frame.angle) cosd(frame.angle)];

trAll_axis = R*All_axis + [frame.org_x, frame.org_y]';
trX_axis = trAll_axis(:,1:2);
trY_axis = trAll_axis(:,3:4);


plot(trX_axis(1,:), trX_axis(2,:),'color',c);
plot(trY_axis(1,:), trY_axis(2,:),'color',c);
text(trX_axis(1,2), trX_axis(2,2)-0.5,'x','color',c);
text(trY_axis(1,2)+0.5, trY_axis(2,2),'y','color',c);
% % s = sprintf("ground angle : %.2f\n ground position [%.2f, %.2f]\n",frame.angle, frame.org_x, frame.org_y);
% % text(trAll_axis(1,1), trAll_axis(2,1)-2, s, 'color',c);

h = gca;

end

