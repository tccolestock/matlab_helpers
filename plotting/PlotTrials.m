function PlotTrials(dataColumns, timeArray)

width = size(dataColumns, 2);
markers = {'+','o','*','.','x','s','d','^','v','>','<','p','h'};
styles = {'-', '--', ':', '-.'};
colors = {'b', 'r', 'g', 'k', 'm', 'y', 'c'};
plotList = zeros(1,width);

for i = 1:size(dataColumns, 2)
    % Make sure our unique markers/styles/colors are being access in bounds
    imarker = i;
    while imarker > size(markers, 2)
        imarker = imarker - size(markers, 2);
    end
    istyle = i;
    while istyle > size(styles, 2)
        istyle = istyle - size(styles, 2);
    end
    icolor = i;
    while icolor > size(colors, 2)
        icolor = icolor - size(colors, 2);
    end
    
    legendSpec = 'Trial %d';
    legendName = sprintf(legendSpec, i);
    p = line_fewer_markers(timeArray, dataColumns(:,i), 5+i, ...
        strcat(styles{istyle}, markers{imarker}, colors{icolor}), ...
        'Spacing', 'curve', ...
        'Linewidth', 2.5, 'DisplayName', legendName);
    %p = plot(timeArray, dataColumns(:, i), styles{ii}, 'LineWidth', 2, 'DisplayName', legendName);
    plotList(i) = p;
    hold on
    %plot(timeArray(i:width:end), dataColumns(i:width:end, i), markers{i}, 'DisplayName', 'none');
    
end

% xlim([0 13]);
% ylim([0 7]);
% 
% ylabel({'Classes ID'},'FontSize',30,'FontWeight','bold','Color','k');
% xlabel({'Time (Second)'},'FontSize',30,'FontWeight','bold','Color','k');
% 
% ax = gca;
% ax.FontSize = 26;
% 
% ax.YTickLabel = [ {'', 'Slip South', 'Slip North', 'Slip East', 'Slip West', 'Touch','No Touch'} ];
% %ax.XTickLabel = [ {'0', '5', '10', '15', '20', '25','30'} ];
% 
legend(plotList, 'Location', 'North', 'Orientation', 'Horizontal')
% %title(lgd, 'Trial No.')
% 
% grid on

end