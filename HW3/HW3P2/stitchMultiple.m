function [img_res,H,num_inliers,residual] = stitchMultiple(images)
    image_order = stitchOrder(images)
    img_res = images{image_order(1)};
    
    for i = 2:length(image_order)
        [img_res,H,num_inliers,residual] = stitchAdjacent(images{image_order(i)},img_res);
            
        
    end
end

