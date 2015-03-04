function out_img = make_bw( img )
%MAKE_BW Summary of this function goes here
%   Detailed explanation goes here
    global width height;
    out_img = img;
    for x = 1:width
        for y = 1:height
            if(img(y,x) > 0)
                out_img(y,x) = 1;
            else
                out_img(y,x) = 0;
            end
        end
    end

end

