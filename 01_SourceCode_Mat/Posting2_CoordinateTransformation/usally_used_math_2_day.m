clear, clc, close all;
figure_path = "./fig/usally_used_math_2_day";
mkdir(figure_path);

%% first step : define frames
frame1.angle = 0;
frame1.org_x = 0;
frame1.org_y = 0;

frame2.angle = 30;
frame2.org_x = 3;
frame2.org_y = 5;


figure; hold on; grid on; box on;
drawFrame(frame1,'r');
drawFrame(frame2,'b');
axis([-5, 15, -5, 15]);
axis equal;
xlabel("X"); ylabel("Y");
title("Figure[1] : Two frames");
saveas(gcf, "./fig/usally_used_math_2_day/fig1.jpg")

%% second step : transformation


figure; hold on; grid on; box on;
frameTR = frame1;
end_flag = false;
while(1)
    if frameTR.angle < frame2.angle
        frameTR.angle = frameTR.angle + 1;
    elseif frameTR.org_x < frame2.org_x
        frameTR.org_x = frameTR.org_x + 0.1;
    elseif frameTR.org_y < frame2.org_y
        frameTR.org_y = frameTR.org_y + 0.1;
    else
        end_flag = true;
    end
    
    cla
    drawFrame(frame1,'r');
    drawFrame(frame2,'b');
    drawFrame(frameTR,'g');
    axis([-5, 15, -5, 15]);
    axis equal;
    xlabel("X"); ylabel("Y");
    title("Figure[2] : Transformation");
    drawnow
    
    frame = getframe(gcf);
    img = frame2im(frame);
    [imind, cm] = rgb2ind(img, 256);
    
    try
        imwrite(imind, cm, "./fig/usally_used_math_2_day/fig2.gif", ...
            'gif',' WrtieMode', 'append');
    catch
        imwrite(imind, cm, "./fig/usally_used_math_2_day/fig2.gif", ...
            'gif','LoopCount', inf);
    end
    
    
    if end_flag
        break;
    end
end
saveas(gcf, "./fig/usally_used_math_2_day/fig2.jpg")




%% functions





function h = drawFrame(frame, c)

X_axis = [0, 10;
    0, 0];
Y_axis = [0, 0;
    0, 10];

All_axis = [X_axis, Y_axis];
R = [cosd(frame.angle) sind(frame.angle);
    -sind(frame.angle) cosd(frame.angle)];

trAll_axis = R*All_axis + [frame.org_x, frame.org_y]';
trX_axis = trAll_axis(:,1:2);
trY_axis = trAll_axis(:,3:4);

plot(trX_axis(1,:), trX_axis(2,:),'color',c);
plot(trY_axis(1,:), trY_axis(2,:),'color',c);
text(trX_axis(1,2), trX_axis(2,2)-0.5,'x','color',c);
text(trY_axis(1,2)+0.5, trY_axis(2,2),'y','color',c);
s = sprintf("ground angle : %.2f\n ground position [%.2f, %.2f]\n",frame.angle, frame.org_x, frame.org_y);
text(trAll_axis(1,1), trAll_axis(2,1)-2, s, 'color',c);

end

