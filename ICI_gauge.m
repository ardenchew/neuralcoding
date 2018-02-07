clear
clc

%assigning randomization vector
randVect = zeros(1,100);
for i=1:length(randVect)
    randVect(i) = mod(i,10) + 1;
end
randVect = randVect(randperm(length(randVect)));

testVect = zeros(1,100); % for if I hear continuos or not
tracker = 1;

%playing the sounds
for i=randVect
    disp("(" + tracker + "/100) Playing next sound...");
    pause(1);
    
    f0 = i; % in Hz
    ICI = ceil((1 / f0) * 1000); % in msec
    soundFile = zeros(1,10000);
    for j=1:length(soundFile)
         if (mod(j,ICI) == 0)
             soundFile(j) = 1;
         end
    end
    sound(soundFile, 10000);

    prompt = 'Enter 1 if discrete, 0 if continuous: ';
    testVect(tracker) = input(prompt);
    tracker = tracker + 1;
end

%summing probabilities
overallProb = (sum(testVect)/100);
f0Prob = zeros(3,10);
for i=1:length(f0Prob)
    f0Prob(1,i) = i*10; %Hz
    f0Prob(2,i) = (1 / f0Prob(1,i)) * 1000; %msec
end

for i=1:length(randVect)
    f0Prob(3,randVect(i)) = f0Prob(3,randVect(i)) + testVect(i);
end

for i=1:length(f0Prob)
    f0Prob(3,i) = f0Prob(3,i) / 10;
end

figure(1)
scatter(f0Prob(2,:),f0Prob(3,:))
xlabel('ICI (msec)')
ylabel('Probability of discrete')
title('Discrete vs ICI')

figure(2)
scatter(f0Prob(1,:),f0Prob(3,:))
xlabel('Repetition rate, f0 (Hz)')
ylabel('Probability of discrete')
title('Discrete vs f0')
