function output_img = img_and(img1, img2)
%IMG_AND Summary of this function goes here
%   Detailed explanation goes here
    global width height;
    
    output_img(height,width) = 0;
    
    for x = 1:width
        for y = 1:height
            if(img1(y,x) > 0 && img2(y,x) > 0)
                output_img(y,x) = 1;
            else
                output_img(y,x) = 0;
            end
        end
    end

end

