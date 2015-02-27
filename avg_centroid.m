function [cx,cy, num_points] = avg_centroid(depth_img)
%%depth_img should be a black and white depth image

    global width height;

    cx = 0;
    cy = 0;
    num_points = 0;
    for x = 1:width
        for y = 1:height
            if(depth_img(y,x) > 0)
                num_points = num_points + 1;
                cx = cx + x;
                cy = cy + y;
            end
        end
    end
    if(num_points > 0)
        cx = cx / num_points;
        cy = cy / num_points;
    end
end