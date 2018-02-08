clear
clc

meanICI = [10, 30, 80]; %(ms)
randVect = zeros(3,(5*10)); % for saving data later
testVect = zeros(3, (5*10));


for i=1:3
    jitterVect = zeros(5*10);
    for j=1:length(jitterVect)
        k = j * 5;
        jitterVect(j) = mod(k, 25) + 5;
    end
    jitterVect = jitterVect(randperm(length(jitterVect)));
    randVect(i,:) = jitterVect;
    
    tracker = 1;
    
    for j=jitterVect
        disp("(" + tracker + "/50) Playing next sound...");
        pause(1);
    
        soundFile = zeros(1,10000);
        
        ici = meanICI(i);
        variability = (j / 100) * ici;
        
        interval = (ici-variability) + (2*variability)*rand(1,1);
        
        while interval < 10000
            soundFile(floor(interval)) = 1;
            interval = interval + (ici-variability) + (2*variability)*rand(1,1);
        end
        
        sound(soundFile, 10000);
        
        prompt = 'Enter 1 if aperiodic, 0 if periodic: ';
        testVect(i,tracker) = input(prompt);
        tracker = tracker + 1;
    end
    
end

data = zeros(4, 5);

for i=1:length(data)
    data(1,i) = i*5;
end

for i=1:3
    for j=1:length(testVect)
        data((i+1), (randVect(i,j)/5)) = data((i+1), (randVect(i,j)/5)) + testVect(i,j);
    end
end

for i=2:4
    for j=1:5
        data(i,j) = data(i,j) / 10;
    end
end

figure(1)
plot(data(1,:), data(2,:), '-o', 'Color', 'red')
hold on
plot(data(1,:), data(3,:), '-o', 'Color', 'green')
hold on
plot(data(1,:), data(4,:), '-o', 'Color', 'blue')
hold on
xlabel('Jitter (%)')
ylabel('Probability of aperiodic')
title('Aperiodic vs Jitter')
legend('10ms mean ICI','30ms mean ICI','80ms mean ICI')



