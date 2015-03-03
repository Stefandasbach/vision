global width height;
%angle should be from x-axis to side without x
%block is about 70px by 250 px

width = 640;
height = 480;

rgb_img = imread('../a/rgba4.png');


depth_array = read_vdi('../a/vdia4');
depth_image = depth1(depth_array);
filtered_depth_image_high = threshold(depth_image, 0.8);
depth_thresh = 0.8;
filtered_depth_image_low = threshold(depth_image, depth_thresh);

%imshow(thresholded_on_color);

%Guess the centroid based on the over-filtered image
[cx_h, cy_h, num_points] = avg_centroid(filtered_depth_image_high);

%Eliminate points too far away
r = 180;
depth_far_from_c_masked = ...
    mask_points_outside_r(depth_image, cx_h, cy_h, r);
thresholded_on_color = threshold(rgb_img, 0.5);
color_far_from_c_masked = ...
    mask_points_outside_r(thresholded_on_color, cx_h, cy_h, r);


imshow(color_far_from_c_masked);

thresholded_on_depth_and_color = combine_color_depth(color_far_from_c_masked,...
    depth_far_from_c_masked, depth_thresh);

%imshow(thresholded_on_depth_and_color);

[left_most, right_most, highest, lowest] = ...
    get_corners(filtered_depth_image_low, [cx, cy]);



