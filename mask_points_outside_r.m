function masked_img = mask_points_outside_r(img, cx, cy, r)
    global width height;
    masked_img = img;
    for x = 1:width
        for y = 1:height
            if norm([cx - x, cy - y]) > r
                masked_img(y,x) = 0;
            end
        end
    end
end

