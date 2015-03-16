function new_img_array = get_greenness(img)
    new_img_array(480, 640) = 0;
    max_val = 0;
    green_weight = 2;
    
    for x = 1:480 
     for y = 1:640
        
      greenness = green_weight*single(img(x,y,2)) - single(img(x,y,1)) ... 
          - single(img(x,y,3));
      new_img_array(x, y) = greenness;
      if (new_img_array( x, y ) > max_val )
       max_val =  new_img_array(x, y);
      end
     end
    end
    
    for x = 1:480
     for y = 1:640
       new_img_array(x, y) = (new_img_array(x, y)/max_val);
     end
    end
end

