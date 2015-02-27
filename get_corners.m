function [left_most, right_most, highest, lowest] = get_corners( input_args )
%GET_CORNERS Summary of this function goes here
%   Detailed explanation goes here

    %[x, y]


    width = 640;
    height = 480;
    left_most = [width+1, 0];
    right_most = [-1, 0];

    highest = [0, height+1];
    lowest = [0, -1];
    
    for x = 1:width
        for y = 1:height
            
        end
    end

end

