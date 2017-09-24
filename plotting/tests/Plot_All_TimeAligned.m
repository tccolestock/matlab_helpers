clc; 
clear;

%% Load and clean/prep data
load('Results_SD_All.mat')
sdResults = Results_SD_All.Slip_Raw_FF(:,:);
load('Results_SU_All.mat')
suResults = Results_SU_All.Slip_Raw_FF(:,:);
load('Results_SR_All.mat')
srResults = Results_SR_All.Slip_Raw_FF(:,:);
load('Results_SL_All.mat')
slResults = Results_SL_All.Slip_Raw_FF(:,:);

baselineValue = 6;
frontPad = 10;
backPad = 20;

sdAligned = TimeAlign(sdResults, baselineValue, frontPad, backPad, true);
suAligned = TimeAlign(suResults, baselineValue, frontPad, backPad, true);
srAligned = TimeAlign(srResults, baselineValue, frontPad, backPad, true);
slAligned = TimeAlign(slResults, baselineValue, frontPad, backPad, true);

minRows = min([ ... 
    size(sdAligned, 1), ...
    size(suAligned, 1), ...
    size(srAligned, 1), ...
    size(slAligned, 1) ...
    ]);

frequency = 10; %Hz

timeArray = 0:1/frequency:(minRows/frequency) -(1/frequency);

%% Plot Slip-Down/South trials
figure
PlotTrials(sdAligned(1:minRows, :), timeArray);

xlim([0 13]);
ylim([0 7]);
ylabel({'Classes ID'},'FontSize',30,'FontWeight','bold','Color','k');
xlabel({'Time (Second)'},'FontSize',30,'FontWeight','bold','Color','k');
ax = gca;
ax.FontSize = 26;
ax.YTickLabel = [ {'', 'Slip South', 'Slip North', 'Slip East', 'Slip West', 'Touch','No Touch'} ];
%ax.XTickLabel = [ {'0', '5', '10', '15', '20', '25','30'} ];
% legend(plotList, 'Location', 'North', 'Orientation', 'Horizontal')
title({'Slip South'}, 'FontSize', 36);
grid on

%% Plot Slip-Up/North trials
figure 
PlotTrials(suAligned(1:minRows, :), timeArray);

xlim([0 13]);
ylim([0 7]);
ylabel({'Classes ID'},'FontSize',30,'FontWeight','bold','Color','k');
xlabel({'Time (Second)'},'FontSize',30,'FontWeight','bold','Color','k');
ax = gca;
ax.FontSize = 26;
ax.YTickLabel = [ {'', 'Slip South', 'Slip North', 'Slip East', 'Slip West', 'Touch','No Touch'} ];
%ax.XTickLabel = [ {'0', '5', '10', '15', '20', '25','30'} ];
% legend(plotList, 'Location', 'North', 'Orientation', 'Horizontal')
title({'Slip North'}, 'FontSize', 36);
grid on

%% Plot Slip-Right/East trials
figure
PlotTrials(srAligned(1:minRows, :), timeArray);

xlim([0 13]);
ylim([0 7]);
ylabel({'Classes ID'},'FontSize',30,'FontWeight','bold','Color','k');
xlabel({'Time (Second)'},'FontSize',30,'FontWeight','bold','Color','k');
ax = gca;
ax.FontSize = 26;
ax.YTickLabel = [ {'', 'Slip South', 'Slip North', 'Slip East', 'Slip West', 'Touch','No Touch'} ];
%ax.XTickLabel = [ {'0', '5', '10', '15', '20', '25','30'} ];
% legend(plotList, 'Location', 'North', 'Orientation', 'Horizontal')
title({'Slip East'}, 'FontSize', 36);
grid on

%% Plot Slip-Left/West trials
figure
PlotTrials(slAligned(1:minRows, :), timeArray);

xlim([0 13]);
ylim([0 7]);
ylabel({'Classes ID'},'FontSize',30,'FontWeight','bold','Color','k');
xlabel({'Time (Second)'},'FontSize',30,'FontWeight','bold','Color','k');
ax = gca;
ax.FontSize = 26;
ax.YTickLabel = [ {'', 'Slip South', 'Slip North', 'Slip East', 'Slip West', 'Touch','No Touch'} ];
%ax.XTickLabel = [ {'0', '5', '10', '15', '20', '25','30'} ];
% legend(plotList, 'Location', 'North', 'Orientation', 'Horizontal')
title({'Slip West'}, 'FontSize', 36);
grid on



