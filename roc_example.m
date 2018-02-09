clear
clc

clickTrains = zeros(3,2);
clickTrains(1,:) = [7.5,12.5]; %A
clickTrains(2,:) = [10,14]; %B.1
clickTrains(3,:) = [11,15]; %B.2


beta = 6:15;

% falseAlarmsB = zeros(1,length(beta));
% hitsB = zeros(1,length(beta));
% falseAlarmsC = zeros(1,length(beta));
% hitsC = zeros(1,length(beta));
data = zeros(3, length(beta));

for i=1:3
    idx = 1;
    for j=beta
        if j < clickTrains(i,1)
            data(i,idx) = 1.0;
        elseif j > clickTrains(i,2)
            data(i,idx) = 0.0;
        else
            data(i,idx) = (clickTrains(i,2)-j)/(clickTrains(i,2)-clickTrains(i,1));
        end
        idx = idx + 1;
    end
end

figure(1)
plot(data(1,:),data(2,:),'-o','Color','red')
hold on
plot(data(1,:),data(3,:),'-o','Color','green')
hold on
legend('Click train B = [10,14]', 'Click train B = [11,15]')
xlabel('Probability False Alarm')
ylabel('Probability hit')
title('ROC Curves')
