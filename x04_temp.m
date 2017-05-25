cd 'C:\PredictiveAnalytics\mystuff\indus';
load('indus_database.mat');

% db.clean.ias =  [];
% tmp = unique(db.clean.indus_signoccs_full(:,{'Length','Signs'}));
% for i=1:size(tmp,1)
%     x.Length = tmp.Length(i);
%     x.Signs = tmp.Signs(i);
%     db.clean.ias = [db.clean.ias; x];
% end
% save('indus_database.mat','db');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Get IAS Left Neighbor
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lengths = unique([db.clean.ias(:).Length])';
storage = [];
try
    for i = 1:size(lengths,1)
        lngth = lengths(i);
        indxs = find([db.clean.ias(:).Length]' ==  lngth);
        for j=1:size(indxs,1)
            indx = indxs(j);
            seq = db.clean.ias(indx);
            for k = lngth+1:max(lengths)
                tmpSeqs = db.clean.ias( find([db.clean.ias(:).Length]' ==  k));
                bp = 1;
                tmpSeqs = tmpSeqs(~cellfun(@isempty,strfind([tmpSeqs(:).Signs]', seq.Signs)));
                for l=1:size(tmpSeqs,1)
                    l_nbrs = getLeftNeighbor(seq, tmpSeqs(l)); 
                    for n = 1:size(l_nbrs,1)
                        l_nbrs(n).Seq = seq.Signs;
                        l_nbrs(n).SeqLength = seq.Length;
                        l_nbrs(n).FullSeq = tmpSeqs(l).Signs;
                        l_nbrs(n).FullSeqLength = tmpSeqs(l).Length;
                        storage = [storage; l_nbrs(n)];
                    end
                end
            end
        end
    end
    bp = 1;
catch ME
    bp = 1;
    rethrow(ME);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Get IAS Right Neighbor
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lengths = unique([db.clean.ias(:).Length])';
storage = [];
try
    for i = 1:size(lengths,1)
        lngth = lengths(i);
        indxs = find([db.clean.ias(:).Length]' ==  lngth);
        for j=1:size(indxs,1)
            indx = indxs(j);
            seq = db.clean.ias(i);
            for k = lngth+1:max(lengths)
                tmpSeqs = db.clean.ias( find([db.clean.ias(:).Length]' ==  k));
                bp = 1;
                tmpSeqs = tmpSeqs(~cellfun(@isempty,strfind([tmpSeqs(:).Signs]', seq.Signs)));
                for l=1:size(tmpSeqs,1)
                    z = getRightNeighbor(seq, tmpSeqs(l));  
                    z.Seq = seq.Signs;
                    z.SeqLength = seq.Length;
                    storage = [storage; z];
                end
            end
        end
    end
    bp = 1;
catch ME
    bp = 1;
end


