function mbvq=MBVQ(Red,Green,Blue)
if( (Red+Green)>255)
           if((Green+Blue> 255))
               if((Red+Green+Blue)> 510)
                   mbvq= 'CMYW';
               else
                   mbvq= 'MYGC';
               end
            else
                   mbvq= 'RGMY';
           end
       else
           if(~((Green+Blue)>255))
               if(~((Red+Green+Blue)>255))
                   mbvq= 'KRGB';
               else
                   mbvq= 'RGBM';
               end
           else
               mbvq= 'CMGB';
           end
end

end