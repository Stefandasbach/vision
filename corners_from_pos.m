function [tr, br, bl, tl] = corners_from_pos(x,y,theta)
%CORNERS_FROM_POS 
% thetassume theta = 0 means that block is horizontal, 
% theta grow as we go ccw

    global block_w block_h;
    %%Signs on the offsets for y are "flipped" because y axis points
    %%down on images
    %This is wrong:
    tr  =  [x + (block_w/2) * cos(theta) - (block_h/2)*sin(theta) , y -  (block_h/2) * cos(theta)  - (block_w/2) * sin(theta)];
    tl  =  [x - (block_w/2) * cos(theta) - ( block_h/2) * sin(theta) , y - (block_h/2) * cos(theta)  + ( block_w/2) * sin(theta)];
    br  =   [x + (block_w/2) * cos(theta) + ( block_h/2) * sin(theta) , y + (block_h/2) * cos(theta)  - ( block_w/2) * sin(theta)];
    bl  =  [x - (block_w/2) * cos(theta) + ( block_h/2) * sin(theta) , y + (block_h/2) * cos(theta)  + ( block_w/2) * sin(theta)];
    
end

