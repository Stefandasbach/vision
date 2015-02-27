depth_array = read_vdi('a/vdia2');
depth_image = depth1(depth_array);
filtered_depth_image = threshold(depth_image);

imshow(filtered_depth_image)
[left_most, right_most, highest, lowest] = get_corners(filtered_depth_image);
dist_left_right = norm(left_most - right_most)
dist_high_low = norm(highest - lowest)

corner_average = (left_most + right_most + highest + lowest)./4;


% corner_average
% 
% 
% left_most
% right_most
% highest
% lowest
