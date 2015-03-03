function new_img = combine_color_depth(color_img_bw, depth_img, depth_thresh )
%COMBINE_COLOR_DEPTH 
%   color_img_bw should be black and white, depth_img should be
%   the original depth image

global width height

new_img = color_img_bw;
for x = 1:width
    for y = 1:height
        if((depth_img(y,x) > 0) && (depth_img(y,x) < depth_thresh))
            new_img(y,x) = 0;
        end
    end
end
end

