% Author: Nikolai

% Visualizes performance of product code
figure
semilogy(p, channel, 'DisplayName',sprintf('Channel'), ...
    'Marker','.','LineWidth',1.5, 'MarkerSize',15, 'Color','black')
hold on
xlabel('p')
%xticklabels({'0.008','0.009','0.010','0.011','0.012','0.013'})
ylabel('BER')

xlim([0.006 0.013])
ylim([10^(-7) 10^(-1.5)])
semilogy(p,BER(1,:), 'DisplayName',sprintf('%d iteration',1), ...
    'Marker','.','LineWidth',1.5, 'MarkerSize',15)
for i = 2:iter(end)
    semilogy(p,BER(i,:), 'DisplayName',sprintf('%d iterations',i), ...
        'Marker','.','LineWidth',1.5, 'MarkerSize',15)
end
legend('Location','south')
%chH = get(gca,'Children');
%set(gca,'Children',flipud(chH))
grid on
hold off