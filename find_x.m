function [x, y] = find_x(greenness_array, block_x, block_y, block_theta, radius)
%x and y are the estimated position of the x. The two possible places 
%   the x could be are tested, and the more likely one is returned.

global block_w block_h height width;

xcx1 = round(block_x + (block_w/2)*cos(block_theta));
xcy1 = round(block_y + (block_h/2)*sin(block_theta));

threshold = 0.3;
score1 = 0;

for x_i = (xcx1 - radius):(xcx1+radius)
    for y_i = (xcy1 - radius):(xcy1+radius)
        if(x_i > 0 && x_i <= width && y_i > 0  && ...
                y_i <= height && ...
                norm([x_i - xcx1, y_i - xcy1]) < radius)
            if(greenness_array(x_i,y_i) > threshold)
                score1= score1 + 1;
            else
                score1 = score1 - 1;
            end
        end
    end
end

xcx2 = round(block_x - (block_w/2)*cos(block_theta));
xcy2 = round(block_y - (block_h/2)*sin(block_theta));

threshold = 0.3;
score2 = 0;

for x_i = (xcx2 - radius):(xcx2+radius)
    for y_i = (xcy2 - radius):(xcy2+radius)
        if(x_i > 0 && x_i <= width && y_i > 0  && ...
                y_i <= height && ...
                norm([x_i -xcx2, y_i - xcy2]) < radius)
            if(greenness_array(x_i,y_i) > threshold)
                score2 = score2 + 1;
            else
                score2 = score2 - 1;
            end
        end
    end
end

if(score1 > score2)
    x = xcx1;
    y = xcy1;
else
    x = xcx2;
    y = xcy2;
end

