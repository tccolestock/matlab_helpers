function outMatrix = TimeAlign(columnMatrix, zeroValue, frontPad, backPad, addPadding)

width = size(columnMatrix, 2);

firstZeroIndex = zeros(1, width);
lastZeroIndex = zeros(1, width);
startIndex = zeros(1, width);
endIndex = zeros(1, width);
indexDiff = zeros(1, width);

for i = 1:width
    tempArray = columnMatrix(:,i);
    
    firstZeroIndex(i) = find(tempArray < zeroValue, 1);
    startIndex(i) = firstZeroIndex(i) - frontPad;
    
    lastZeroIndex(i) = find(tempArray < 6, 1, 'Last');
    endIndex(i) = lastZeroIndex(i) + backPad;
    
    indexDiff(i) = endIndex(i) - startIndex(i);
end

indexDiffMax = max(indexDiff);
outMatrix = zeros(indexDiffMax, width);

for i = 1:width
    tempArray = columnMatrix(:, i);
    endIndex(i) = startIndex(i) + indexDiffMax;
    if length(tempArray) < endIndex(i)
        padNeeded = endIndex(i) - length(tempArray);
        for j = length(tempArray) +1 : length(tempArray) + padNeeded
            tempArray(j) = zeroValue;
        end
    end
    outMatrix(:, i) = tempArray(startIndex(i):endIndex(i) - 1, 1);
end



end