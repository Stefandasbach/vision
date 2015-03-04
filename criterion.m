function score = criterion(pos)
%CRITERION Summary of this function goes here
%   Detailed explanation goes here
    global image_for_opt width height;

    x = pos(1);
    y = pos(2);
    theta = pos(3);

    [tr, br, bl, tl] = corners_from_pos(x, y, theta);
    x_coords_corners = [tr(1), br(1), bl(1), tl(1)];
    y_coords_corners = [tr(2), br(2), bl(2), tl(2)];

    min_x = round(min(x_coords_corners));
    min_y = round(min(y_coords_corners));
    max_x = round(max(x_coords_corners));
    max_y = round(max(y_coords_corners));

    score = 0;
    all_x = min_x:max_x;
    all_y = min_y:max_y;
    [xq, yq] = meshgrid(all_x, all_y);

    in = inpolygon(xq, yq, x_coords_corners, y_coords_corners);
    x_in = xq(in);
    y_in = yq(in);
    
    points_in_rect = [x_in y_in];
    %Iterate over each row, which is a point
    [m, n] = size(points_in_rect);
    for i = 1:m
        x = points_in_rect(i,1);
        y = points_in_rect(i,2);
        if(x > 0 && x <= width && y > 0 && y <= height)
            score = score - image_for_opt(y, x);
        end
    end    
end

