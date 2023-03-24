figure
semilogy(p(3:end-2), channel(3:end-2), 'DisplayName',sprintf('Channel'), ...
    'Marker','.','LineWidth',1.5, 'MarkerSize',15)
hold on
xlabel('p')
%xticklabels({'0.008','0.009','0.010','0.011','0.012','0.013'})
ylabel('BER')

xlim([0.008 0.013])
ylim([10^(-10) 10^(-1)])
semilogy(p(3:end-2),BER(1,3:end-2), 'DisplayName',sprintf('%d iteration',1), ...
    'Marker','.','LineWidth',1.5, 'MarkerSize',15)
for i = 2:iter(end)
    semilogy(p(3:end-2),BER(i,3:end-2), 'DisplayName',sprintf('%d iterations',i), ...
        'Marker','.','LineWidth',1.5, 'MarkerSize',15)
end
legend('Location','south')
grid on
hold off