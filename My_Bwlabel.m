function out = My_Bwlabel (Image)
    
    I = uint8(Image*255);
    [row, col] = size(I);
    out = uint8(zeros(row, col));
    H = fspecial ('Average', [29 29]);
    K = imfilter (I, H);
    L = uint8(zeros(row, col));
    for i=1: 1: row
        for j=1: 1: col
            
            if I(i, j) >= K(i, j)
                
               L(i, j) = 255; 
                
            end
            
        end
    end
    
    imshow(L);
  
    level = multithresh(Image, 2);
    J = im2bw(Image, level(1));
    J(1, : ) = 0;
    J = uint8(J*255);
    [row, col] = size(J);
    
    
    for i=1: 1: row
        for j=1: 1: col
            
            if J(i, j) == 255 && L(i, j) == 255
                
               out(i, j) = 255; 
                
            end
            
        end
    end
    
    imshow(out);
  
    counter = uint8(0);
    X = zeros(1, row*col);
    Y = zeros(1, row*col);
    top = uint16(0);

    
    for i=1: 1: row
        for j=1: 1: col
            
            if out(i, j) == 255
                
                counter = counter + 1;
                top = top + 1;
                X(top) = i;
                Y(top) = j;
                
                while top ~= 0
                    
                    x = X(top);
                    y = Y(top);
                    top = top - 1;
                    out(x, y) = counter;
                    
                    for m = x - 1: 1: x + 1
                        for n = y - 1: 1: y + 1
                            if m>0 && m<= row && n>0 && n<=col
                                if out (m, n) == 255

                                    top = top + 1;
                                    X(top) = m;
                                    Y(top) = n;

                                end  
                            end
                        end
                    end 
                end 
            end
        end
    end   
end