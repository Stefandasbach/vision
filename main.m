global width height;

width = 640;
height = 480;

depth_array = read_vdi('../a/vdia8');
depth_image = depth1(depth_array);
thresholded_on_depth = threshold(depth_image, 0.75);

rgb_img = imread('../a/rgba2.png');
thresholded_on_color = threshold(rgb_img, 0.5);
thresholded_on_depth_and_color = img_and(thresholded_on_color, thresholded_on_depth);

imshow(thresholded_on_depth_and_color);

depth_array = read_vdi('../a/vdia2');
depth_image = depth1(depth_array);
filtered_depth_image_high = threshold(depth_image, 0.9);
filtered_depth_image_low = threshold(depth_image, 0.8);

%imshow(filtered_depth_image_high);
imshow(filtered_depth_image_low);

corner_average = (left_most + right_most + highest + lowest)./4;
[cx, cy, num_points] = avg_centroid(thresholded_on_depth);
%[left_most, right_most, highest, lowest] = get_corners(filtered_depth_image);

%corner_average = (left_most + right_most + highest + lowest)./4;
[cx, cy, num_points] = avg_centroid(filtered_depth_image_high);
[left_most, right_most, highest, lowest] = get_corners(filtered_depth_image_low, [cx, cy])



