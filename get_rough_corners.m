function [left_most, right_most, highest, lowest] = get_rough_corners(image)
% image should be a black and white image where the black pixels are 
% "far" and white ones are "close"
    width = 640;
    height = 480;
    left_most = [width+1, 0];
    right_most = [-1, 0];

    highest = [0, height+1];
    lowest = [0, -1];
    for x = 1:width
        for y = 1:height
            if(image(y,x) > 0)
                if(x < left_most(1))
                    left_most = [x, y];
                end
                if(x > right_most(1))
                    right_most = [x, y];
                end
                if(y < highest(2))
                    highest = [x, y];
                end
                if(y > lowest(2))
                    lowest = [x,y];
                end
            end

        end
    end 
end

