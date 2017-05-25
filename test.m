


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Inscription Length Boxplot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
boxplot(indus_signoccs.Length, indus_signoccs.Location)
xlabel('Location');
ylabel('Inscription Length');
myTitle = 'length_boxplot_by_location';
title('Length BoxPlot by Location');
F_SaveImg('.',myTitle,'png');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Inscription Length Histograms
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
locations = unique(indus_signoccs.Location);
% set(0,'defaultFigureVisible','off')
myfig = figure('Position',[10 10 1400 800]);
subplot(2,4,1);
hists(1) = histogram(indus_signoccs.Length,1:15);
 realTitle = 'Hists of Lengths from All Sites';
    title(realTitle);
for i =1:size(locations,1)
    indxs = strcmp(indus_signoccs.Location, locations(i));
    myLengths = indus_signoccs.Length(indxs);
    p = i+1;
   subplot(2,4,p);
    hists(p) = histogram(myLengths,1:15);
    myTitle = strcat({'Histograms of Lengths from '},locations(i));
    title(myTitle);
    xlabel('Length');    
    set(gca,'XTick',1:14)
    set(gca,'XTickLabels',1:14)
    ylabel('# of Inscriptions');
end
F_SaveImg('.',realTitle,'png');


% set(0,'defaultFigureVisible','off')
myfig = figure('Position',[10 10 1400 800]);
subplot(2,4,1);
hists(1) = histogram(indus_signoccs.Length,1:15,'Normalization','Probability');
 realTitle = 'Norm Hists of Lengths from All Sites';
    title(realTitle);
for i =1:size(locations,1)
    indxs = strcmp(indus_signoccs.Location, locations(i));
    myLengths = indus_signoccs.Length(indxs);
    p = i+1;
   subplot(2,4,p);
    hists(p) = histogram(myLengths,1:15,'Normalization','Probability');
    myTitle = strcat({'Norm. Hist of Lengths from '},locations(i));
    title(myTitle);
    xlabel('Length');    
    set(gca,'XTick',1:14)
    set(gca,'XTickLabels',1:14)
    ylabel('# of Inscriptions');
end
F_SaveImg('.',realTitle,'png');


% set(0,'defaultFigureVisible','off')
% for i =1:size(locations,1)
%     indxs = strcmp(indus_signoccs.Location, locations(i));
%     myLengths = indus_signoccs.Length(indxs);
%     figure;
%     hists(i) = histogram(myLengths,1:15);
%     myTitle = strcat({'Histograms of Lengths from '},locations(i));
%     title(myTitle);
%     xlabel('Length');    
%     set(gca,'XTick',1:14)
%     set(gca,'XTickLabels',1:14)
%     ylabel('# of Inscriptions');
%     F_SaveImg('.',myTitle,'png');
% end
bp = 1;
dataTable = table((1:14).',hists(1).Values.', hists(2).Values.', hists(3).Values.', hists(4).Values.', hists(5).Values.', hists(6).Values.', hists(7).Values.',...
    'VariableNames',[{'Count'};locations].');
x = hists(1);
bp=  1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Positional Sign Counts
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lengths = 1:14;
for i = 1:size(length,1)
end


