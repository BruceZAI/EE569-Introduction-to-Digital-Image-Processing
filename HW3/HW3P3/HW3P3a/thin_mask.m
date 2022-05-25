function G2 = thin_mask(G, iter)
if nargin==1
    iter = Inf;
end
[patterns1, patterns2] = generate_patterns2();


height = size(G,1);
width = size(G,2);
n_pattern1 = size(patterns1,3);
n_pattern2 = size(patterns2,3);
go_on = 1;

kkk = 1;
while kkk < iter
    kkk = kkk + 1;
    if go_on == 0
        break
    end
    go_on = 0;
    GM = zeros(size(G));
    indices = [];
    for i=1:height
    for j=1:width
        if G(i,j)==0
            continue
        end
        m = 0;
        for p=1:n_pattern1
            m = match(G, i, j, patterns1(:,:,p));
            if m==1
                % if match, set center to 1
                GM(i,j) = 1;
                indices = [indices;[i,j]];%record points been masked
                break
            end
        end
    end
    end

G2 = G;


for ind = 1:size(indices,1)
    i=indices(ind,1);
    j=indices(ind,2);
        if GM(i,j)==0
            continue
        end
        m = 0;
        for p=1:n_pattern2
            m = match(GM, i, j, patterns2(:,:,p));
            if m==1
                break
            end
        end
        % if not match, set it to 0
        if m == 0
            G2(i,j) = 0;
            go_on = 1;
        end
end
G = G2;
end


end

