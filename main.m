global width height;

width = 640;
height = 480;

depth_array = read_vdi('../a/vdia8');
depth_image = depth1(depth_array);
thresholded_on_depth = threshold(depth_image, 0.75);

rgb_img = imread('../a/rgba8.png');
thresholded_on_color = threshold(rgb_img, 0.5);
thresholded_on_depth_and_color = img_and(thresholded_on_color, thresholded_on_depth);

imshow(thresholded_on_depth_and_color);

%%TODO use high threshold for general idea of where block is
%%then low for more precise
%%imshow(filtered_depth_image)
[left_most, right_most, highest, lowest] = get_corners(thresholded_on_depth);

corner_average = (left_most + right_most + highest + lowest)./4;
[cx, cy, num_points] = avg_centroid(thresholded_on_depth);
cx
cy
num_points

% left_most
% right_most
% highest
% lowest
