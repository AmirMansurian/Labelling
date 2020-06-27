function WriteToExcel (Original_Image, Labeled_Image, Path)

    NumberOfLabel = max(Labeled_Image(:));
    [row, col] = size(Original_Image);
    Area = uint16(zeros(NumberOfLabel, 1));
    AvgLightLevel = uint16(zeros(NumberOfLabel, 1));
    
    for i=1: 1: row
        for j=1: 1: col
            
            if Labeled_Image(i, j) ~= 0
                
               Area(Labeled_Image(i ,j), 1) = Area(Labeled_Image(i, j), 1) + 1;
               AvgLightLevel(Labeled_Image(i, j)) = AvgLightLevel(Labeled_Image(i, j)) + uint16(Original_Image(i, j));
                              
            end
            
        end
    end
    
    for i=1: 1: NumberOfLabel
        
        AvgLightLevel (i ,1) = AvgLightLevel (i ,1) / Area(i ,1);
        
    end

    Table = table (Area, AvgLightLevel);
    
    writetable (Table, Path, 'Sheet', 'Sheet1', 'Range', 'A1');

end