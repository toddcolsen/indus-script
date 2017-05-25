cd 'C:\PredictiveAnalytics\svn\Playground\tolsen\mystuff\indus';

load('indus_database.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Positional Sign Counts
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FULL
tic
db.full.indus_signoccs  = unique(db.full.indus_signoccs_full(:,{'Id','Position','Length','Signs'}),'rows');
pos_sign_cnts = zeros(size(db.full.ids,1), 14, 14);
for i = 1:size(db.full.ids,1)
    sign = db.full.ids(i);
    indxs = strcmp(db.full.indus_signoccs_full.Id, db.full.ids(i));
    myApps = db.full.indus_signoccs_full(indxs,:);
    for j = 1:size(myApps,1)
        try
        pos_sign_cnts(str2num(char(sign)),myApps.Length(j),myApps.Position(j)+1) = pos_sign_cnts(str2num(char(sign)), myApps.Length(j),myApps.Position(j)+1)+1;
        catch ME
            bp + 1;
        end
    end    
%     realTitle = strcat({'Pos Sign Grid for '}, sign);
%     myFig = figure('Position',[10 10 1400 800]);
%     pcolor(flipud(squeeze(pos_sign_cnts(str2num(char(sign))+1,:,:))));
%     ylabel('Length');
%     xlabel('Position');
%     set(gca,'YTick',1:14)
%     set(gca,'YTickLabel',14:-1:1)
%     set(gca,'XTick',1:14);
%     set(gca,'XTickLabel',1:14);
%     title(realTitle);
%     F_SaveImg('.',realTitle,'png');
%    close(myFig);
end
db.full.pos_sign_cnts = pos_sign_cnts;
time = toc;
disp(strcat({'Full PosSignGrid took '},num2str(time),{' seconds'}));
%% CLEAN
tic
db.clean.indus_signoccs  = unique(db.clean.indus_signoccs_full(:,{'Id','Position','Length','Signs'}),'rows');
pos_sign_cnts = zeros(size(db.full.ids,1), 14, 14);
for i = 1:size(db.clean.ids,1)
    sign = db.clean.ids(i);
    indxs = strcmp(db.clean.indus_signoccs_full.Id, db.clean.ids(i));
    myApps = db.clean.indus_signoccs_full(indxs,:);
    for j = 1:size(myApps,1)
        try
        pos_sign_cnts(str2num(char(sign)),myApps.Length(j),myApps.Position(j)+1) = pos_sign_cnts(str2num(char(sign)), myApps.Length(j),myApps.Position(j)+1)+1;
        catch ME
            bp + 1;
        end
    end
    myFig = figure('Position',[10 10 1400 800]);
    pcolor(flipud(squeeze(pos_sign_cnts(str2num(char(sign)),:,:))));
    ylabel('Length');
    xlabel('Position');
    set(gca,'YTick',1:14)
    set(gca,'YTickLabel',14:-1:1)
    set(gca,'XTick',1:14);
    set(gca,'XTickLabel',1:14);
    realTitle = strcat({'Pos Sign Grid for '}, sign);
    title(realTitle);
    F_SaveImg('.',realTitle,'png');
    close(myFig);
end
db.clean.pos_sign_cnts = pos_sign_cnts;
time = toc;
disp(strcat({'Clean PosSignGrid took '},num2str(time),{' seconds'}));
save('indus_database','db');




