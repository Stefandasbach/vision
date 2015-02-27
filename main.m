global width height;

width = 640;
height = 480;

depth_array = read_vdi('a/vdia2');
depth_image = depth1(depth_array);
filtered_depth_image_high = threshold(depth_image, 0.9);
filtered_depth_image_low = threshold(depth_image, 0.8);

%imshow(filtered_depth_image_high);
imshow(filtered_depth_image_low);

%%TODO use high threshold for general idea of where block is
%%then low for more precise
%%imshow(filtered_depth_image)
%[left_most, right_most, highest, lowest] = get_corners(filtered_depth_image);

%corner_average = (left_most + right_most + highest + lowest)./4;
[cx, cy, num_points] = avg_centroid(filtered_depth_image_high);
[left_most, right_most, highest, lowest] = get_corners(filtered_depth_image_low, [cx, cy])
left_most
right_most
highest
lowest

