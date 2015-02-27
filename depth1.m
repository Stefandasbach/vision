function image = depth1( depth_array )
% convert depth array into an RGB image suitable for imshow()

% assume width is 640 by 480
width = 640;
height = 480;
size(depth_array)

% allocate image
% images have the reverse indexing
image( height, width, 3 ) = 0;

max_depth = 0;
min_depth = 1e20;
for i = 1:width
 for j = 1:height 
  if ( depth_array( i, j ) > max_depth )
   max_depth = depth_array( i, j );
  end
  if ( depth_array( i, j ) > 0 && depth_array( i, j ) < min_depth )
   min_depth = depth_array( i, j );
  end
 end
end

min_depth
max_depth

for i = 1:width
 for j = 1:height 
  if ( depth_array( i, j ) == 0 )
   image( j, i, 1 ) = 0;
   image( j, i, 2 ) = 0;
   image( j, i, 3 ) = 0;
  else
   value = 1.0 - (depth_array( i, j ) - min_depth)/(max_depth - min_depth);
   image( j, i, 1 ) = value;
   image( j, i, 2 ) = value;
   image( j, i, 3 ) = value;
  end
 end
end

end
