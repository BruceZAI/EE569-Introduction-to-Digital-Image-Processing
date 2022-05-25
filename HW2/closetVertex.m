function v = closetVertex(mbvq, R,G,B)



% No.1 for CMYW
    if (mbvq == 'CMYW')
        vertex = 'white';
        if (B < 127)
            if (B <= R)
                if (B <= G)
                    vertex = 'yellow';
                end
            end
        end
        if (G < 127)
            if (G <= B)
                if (G <= R)
                    vertex = 'magenta';
                end
            end
        end
        if (R < 127)
            if (R <= B)
                if (R <= G)
                    vertex = 'cyan';
                end
            end
        end
    end


% No.2 for MYGC
    if (mbvq == 'MYGC')
        vertex = 'magenta'; 
        if (G >= B)
            if (R >= B)
                if (R >= 127)
                    vertex = 'yellow';
                else
                    vertex = 'green';
                end
            end
        end
        if (G >= R)
            if (B >= R)
                if (B >= 127)
                    vertex = 'cyan'; 
                else
                    vertex = 'green';
                end
            end
        end
    end


% No.3 for RGMY
    if (mbvq == 'RGMY')
        if (B > 127)
            if (R > 127)
                if (B >= G)
                    vertex = 'magenta';
                else
                    vertex = 'yellow';
                end
            else
                if (G > B + R)
                    vertex = 'green';
                else 
                    vertex = 'magenta';
                end
            end
        else
            if (R >= 127)
                if (G >= 127)
                    vertex = 'yellow';
                else
                    vertex = 'red';
                end
            else
                if (R >= G)
                    vertex = 'red';
                else
                    vertex = 'green';
                end
            end
        end
    end


% No.4 for KRGB
    if (mbvq == 'KRGB')
        vertex = 'black';
        if (B > 127)
            if (B >= R)
                if (B >= G)
                    vertex = 'blue';
                end
            end
        end
        if (G > 127)
            if (G >= B)
                if (G >= R)
                    vertex = 'green';
                end
            end
        end
        if (R > 127)
            if (R >= B)
                if (R >= G)
                    vertex = 'red';
                end
            end
        end
    end


% No.5 for RGBM
    if (mbvq == 'RGBM')
        vertex = 'green';
        if (R > G)
            if (R >= B)
                if (B < 127)
                    vertex = 'red';
                else
                    vertex = 'magenta';
                end
            end
        end
        if (B > G)
            if (B >= R)
                if (R < 127)
                    vertex = 'blue';
                else
                    vertex = 'magenta';
                end
            end
        end
    end


% No.6 for CMGB
    if (mbvq == 'CMGB')
        if (B > 127)
            if ( R > 127)
                if (G >= R)
                    vertex = 'cyan';
                else
                    vertex = 'magenta';
                end
            else
                if (G > 127)
                    vertex = 'cyan';
                else
                    vertex = 'blue';
                end
            end
        else
            if ( R > 127)
                if (R - G + B >= 127)
                    vertex = 'magenta';
                else
                    vertex = 'green';
                end
            else
                if (G >= B)
                    vertex = 'green';
                else
                    vertex = 'blue';
                end
            end
        end
    end
    if isequal(vertex,'white')
           v(1,1,1:3)=255;
    elseif isequal(vertex,'yellow')
           v(1,1,1)=255;v(1,1,2)=255;v(1,1,3)=0; %v(1,1,1)=0;v(1,1,2)=0;v(1,1,3)=255-Blue;
    elseif isequal(vertex,'cyan')
           v(1,1,1)=0;v(1,1,2)=255;v(1,1,3)=255;%v(1,1,1)=255-Red;v(1,1,2)=0;v(1,1,3)=0;
    elseif isequal(vertex,'green')
           v(1,1,1)=0;v(1,1,2)=255;v(1,1,3)=0;
    elseif isequal(vertex,'red')  
           v(1,1,1)=255;v(1,1,2)=0;v(1,1,3)=0;
    elseif isequal(vertex,'blue')
           v(1,1,1)=0;v(1,1,2)=0;v(1,1,3)=255;
    elseif isequal(vertex,'magenta')
           v(1,1,1)=255;v(1,1,2)=0;v(1,1,3)=255;%v(1,1,1)=0;v(1,1,2)=255-Green;v(1,1,3)=0;
    else
           v(1,1,1)=0;v(1,1,2)=0;v(1,1,3)=0;
    end

end %function