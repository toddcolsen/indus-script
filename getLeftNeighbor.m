function [rv] = getLeftNeighbor(inSeq, outSeq)
    try
        rv = [];
        inSigns = char(inSeq.Signs);
        outSigns = char(outSeq.Signs); 
        indxs = strfind(outSigns,inSigns);
        if (isempty(indxs))
            return;
        end
        for i=1:size(indxs,2)
            indx1 = indxs(i);
            if (indx1 < 4)
                continue;
            end
            indx2 = indx1 - 4;
            pos = (indx2-1)/4;
            x.Signs = outSigns(indx2:(indx2 + 2));
            x.Pos = pos;
            x.Length = 1;
            rv = [rv; x];
        end
    catch ME
        bp = 1;
        rethrow(ME);
    end

end