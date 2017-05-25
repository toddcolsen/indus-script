cd 'C:\PredictiveAnalytics\svn\Playground\tolsen\mystuff\indus';

load('indus_database.mat');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Inscription Length Boxplot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

db.clean.indus_loc_lengths = unique(db.clean.indus_signoccs_full(:,{'Location','Length','Signs'}),'rows');
myFig = figure;
boxplot(db.clean.indus_loc_lengths.Length, db.clean.indus_loc_lengths.Location)
xlabel('Location');
ylabel('Inscription Length');
myTitle = 'length_boxplot_by_location';
title('Length BoxPlot by Location');
F_SaveImg('.',myTitle,'png');
close(myFig);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Inscription Length Histograms
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
tic;
 set(0,'defaultFigureVisible','off');
myFig = figure('Position',[10 10 1400 800]);
subplot(2,4,1);
hists(1) = histogram(db.clean.indus_loc_lengths.Length,1:15);
 realTitle = 'Hists of Lengths from All Sites';
    title(realTitle);
for i =1:size(db.clean.locations,1)
    indxs = strcmp(db.clean.indus_loc_lengths.Location, db.clean.locations(i));
    myLengths = db.clean.indus_loc_lengths.Length(indxs);
    p = i+1;
   subplot(2,4,p);
    hists(p) = histogram(myLengths,1:15);
    myTitle = strcat({'Histograms of Lengths from '},db.clean.locations(i));
    title(myTitle);
    xlabel('Length');    
    set(gca,'XTick',1:14)
    set(gca,'XTickLabels',1:14)
    ylabel('# of Inscriptions');
end
F_SaveImg('.',realTitle,'png');
    close(myFig);
time = toc;
disp(strcat({'Histograms took '},num2str(time),{' seconds'}));

% set(0,'defaultFigureVisible','off')
tic
myFig = figure('Position',[10 10 1400 800]);
subplot(2,4,1);
hists(1) = histogram(db.clean.indus_loc_lengths.Length,1:15,'Normalization','Probability');
 realTitle = 'Norm Hists of Lengths from All Sites';
    title(realTitle);
for i =1:size(db.clean.locations,1)
    indxs = strcmp(db.clean.indus_loc_lengths.Location, db.clean.locations(i));
    myLengths = db.clean.indus_loc_lengths.Length(indxs);
    p = i+1;
   subplot(2,4,p);
    hists(p) = histogram(myLengths,1:15,'Normalization','Probability');
    myTitle = strcat({'Norm. Hist of Lengths from '},db.clean.locations(i));
    title(myTitle);
    xlabel('Length');    
    set(gca,'XTick',1:14)
    set(gca,'XTickLabels',1:14)
    ylabel('# of Inscriptions');
end
F_SaveImg('.',realTitle,'png');
bp = 1;
time = toc;
disp(strcat({'Perc Histograms took '},num2str(time),{' seconds'}));
% dataTable = table((1:14).',hists(1).Values.', hists(2).Values.', hists(3).Values.', hists(4).Values.', hists(5).Values.', hists(6).Values.', hists(7).Values.',...
%     'VariableNames',[{'Count'};db.clean.locations].');

close(myFig);
    






