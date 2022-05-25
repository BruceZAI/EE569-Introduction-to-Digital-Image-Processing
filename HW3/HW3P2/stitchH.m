function result = stitchH(img_src, H, img_des)
    [~, XD, YD] = imtransform(img_src,maketform('projective',H'));

    XD_out=[min(1,XD(1)) max(size(img_des,2), XD(2))];
    YD_out=[min(1,YD(1)) max(size(img_des,1), YD(2))];

    result1 = imtransform(img_src, maketform('projective',H'),'XD',XD_out,'YD',YD_out);
        
    result2 = imtransform(img_des, maketform('affine',eye(3)),'XD',XD_out,'YD',YD_out);
        
    result = result1 + result2;
    overlap = (result1 > 0.0) & (result2 > 0.0);
    result_avg = (result1/2 + result2/2); 
    
    
    result(overlap) = result_avg(overlap);
end