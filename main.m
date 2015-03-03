global width height;

width = 640;
height = 480;

rgb_img = imread('../a/rgba2.png');
thresholded_on_color = threshold(rgb_img, 0.4);

depth_array = read_vdi('../a/vdia2');
depth_image = depth1(depth_array);
filtered_depth_image_high = threshold(depth_image, 0.9);
filtered_depth_image_low = threshold(depth_image, 0.75);

%imshow(filtered_depth_image_high);
imshow(thresholded_on_color);

%Guess the centroid based on the over-filtered image
[cx_h, cy_h, num_points] = avg_centroid(filtered_depth_image_high);

%Eliminate points too far away
filtered_depth_image_low_near_c = ...
    mask_points_outside_r(filtered_depth_image_low, cx_h, cy_h, 150);

%imshow(filtered_depth_image_low_near_c);

thresholded_on_depth_and_color = img_and(thresholded_on_color,...
    filtered_depth_image_low_near_c);

imshow(thresholded_on_depth_and_color);

[left_most, right_most, highest, lowest] = ...
    get_corners(filtered_depth_image_low, [cx, cy])



