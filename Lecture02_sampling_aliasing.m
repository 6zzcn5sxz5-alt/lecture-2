% Lecture 02: sampling and aliasing of a 10 Hz vibration signal.
clear; close all; clc;
f0 = 10; duration = 1; dt = 1/10000;
t = 0:dt:duration;
x = sin(2*pi*f0*t);
fsList = [15 20 25 50 100];

fig = figure('Color','w');
plot(t,x,'b','LineWidth',1.3); grid on;
xlabel('Time (s)'); ylabel('Amplitude');
title('Original 10 Hz sine wave (1 second)');
xlim([0 duration]); ylim([-1.15 1.15]);
exportgraphics(fig,'original_signal.png','Resolution',180);

for k = 1:numel(fsList)
    fs = fsList(k);
    ts = 0:1/fs:duration;
    xs = sin(2*pi*f0*ts); % Evaluate the analog model at exact sample times.
    fig = figure('Color','w');
    plot(t,x,'b','LineWidth',1.2,'DisplayName','Original 10 Hz signal');
    hold on;
    stem(ts,xs,'r','filled','LineWidth',1,'MarkerSize',4, ...
         'DisplayName',sprintf('Samples at %d Hz',fs));
    grid on; xlim([0 duration]); ylim([-1.15 1.15]);
    xlabel('Time (s)'); ylabel('Amplitude');
    title(sprintf('10 Hz signal sampled at %d Hz',fs));
    legend('Location','northeast');
    exportgraphics(fig,sprintf('sampling_%dHz.png',fs),'Resolution',180);
end
