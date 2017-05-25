function [rv] = getRightNeighbor(inSeq, outSeq)
    rv = [];
    inSigns = char(inSeq.Signs);
    outSigns = char(outSeq.Signs); 
    indx1 = strfind(outSigns,inSigns);
    if (isempty(indx1))
        return;
    end
    indx2 = indx1 + (inSeq.Length*4);
    pos = (indx1-1)/4 + inSeq.Length;
    rv.Signs = outSigns(indx2:(indx2+2));
    rv.Pos = pos;
    rv.Length = 1;
end