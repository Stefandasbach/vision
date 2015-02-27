depth_array = read_vdi('../a/vdia1');
depth_image = depth1(depth_array);
filtered_depth_image = threshold(depth_image);

%[x, y]
left_most = [641, 0];
right_most = [-1, 0];

highest = [0, 481];
lowest = [0, -1];

imshow(filtered_depth_image)
