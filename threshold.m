function thresholded_array = threshold(img)
% intensity = sqrt( R*R + G*G + B*B )
% the single() subroutine is an artifact of how imread() works
    thresholded_array( 480, 640 ) = 0;
    max_val = 0;
    
    for x = 1:480 
     for y = 1:640
      thresholded_array( x, y ) = single(img(x,y,1))*single(img(x,y,1)) ...
                      + single(img(x,y,2))*single(img(x,y,2)) ...
                      + single(img(x,y,3))*single(img(x,y,3));
      if ( thresholded_array( x, y ) > max_val )
       max_val = thresholded_array( x, y );
      end
     end
    end

    % normalize so biggest intensity is one
    for x = 1:480
     for y = 1:640
      thresholded_array( x, y ) = sqrt( thresholded_array( x, y )/max_val );
     end
    end

    %imshow( thresholded_array )
    %plot(thresholded_array(:,320))
    %plot(thresholded_array(240,:))

    threshold_level = 0.9;
    % set everything below threshold to be black
    for x = 1:480
     for y = 1:640
      if ( thresholded_array( x, y ) < threshold_level )
       thresholded_array( x, y ) = 0;
      end
     end
    end
    
end

