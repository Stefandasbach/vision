function [ quadrant ] = getQuadrant( img )
%GETQUADRANT Summary of this function goes here
%   Detailed explanation goes here
    height = 480;    
    quadrant = [-1, height+1];
    
    quadrant = get_rough_corners(img)
end

