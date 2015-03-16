global width height block_w block_h image_for_opt;
%angle should be from x-axis to side without x
%block is about 70 bt 250 px

width = 640;
height = 480;

block_w = 250;
block_h = 70;

rgb_img = imread('../a/rgba1.png');

greenness_img = get_greenness(rgb_img);
imshow(greenness_img);

depth_array = read_vdi('../a/vdia1');
depth_image = depth1(depth_array);
filtered_depth_image_high = threshold(depth_image, 0.9);
depth_thresh = 0.8;
filtered_depth_image_low = threshold(depth_image, depth_thresh);

%imshow(thresholded_on_color);

%Guess the centroid based on the filtered image
over_filtered = threshold(rgb_img, 0.7);
thresholded_on_color = threshold(rgb_img, 0.45);
[cx_h, cy_h, num_points] = avg_centroid(over_filtered);
%imshow(filtered_depth_image_high);

%Eliminate points too far away
r = 220;
depth_far_from_c_masked = ...
    mask_points_outside_r(depth_image, cx_h, cy_h, r);
color_far_from_c_masked = ...
    mask_points_outside_r(thresholded_on_color, cx_h, cy_h, r);


color_far_from_c_masked_bw = make_bw(color_far_from_c_masked);
%imshow(color_far_from_c_masked_bw);

% We want to move a rectangle around and maximize the sum of the
% intensitities of pixels within the rectangle
options = optimset('Display','iter','MaxFunEvals',1000000,'Algorithm','sqp');
%Initial guess is horizontal, with the
p0 = [cx_h, cy_h, 0];
lb = [block_h/2, block_h/2, -pi];
ub = [width - block_h/2, height - block_h/2, pi];
image_for_opt = color_far_from_c_masked_bw;
nonlin_cons = @(x) [0, 0];
[opt_pos,fval,exitflag] = fmincon(@criterion,p0,[],[],[],[],lb,ub);%nonlin_cons,options);
best_pos = opt_pos;
best_fval = fval;
for i = 1:30
   max_jump = 20;
   p0(1) = p0(1) - max_jump + 2*max_jump*rand(1);
   p0(2) = p0(2) - max_jump + 2*max_jump*rand(1);
   p0(3) = -pi + 2*pi*rand(1);
   [opt_pos,fval,exitflag] = fmincon(@criterion,p0,[],[],[],[],lb,ub);
   opt_pos
   if(fval < best_fval)
       best_fval = fval;
       best_pos = opt_pos;
   end
end

best_fval
best_pos

% 
% thresholded_on_depth_and_color = combine_color_depth(color_far_from_c_mas ked,...
%     depth_far_from_c_masked, depth_thresh);
% 
% %imshow(thresholded_on_depth_and_color);
% 
% [left_most, right_most, highest, lowest] = ...
%     get_corners(filtered_depth_image_low, [cx, cy]);



