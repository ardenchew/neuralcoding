clear;
clc;

load('S.mat');

%%
%1A

% initial state
s1 = S(:,1);
randord = randperm(length(s1));
randord = randord(1:(length(s1)/5));
for i=randord
    s1(i) = -s1(i);
end

N = 1600;
W = (1/N)*(S*S');
du_dt = -s1 + W*sign(s1);

for i=1:length(du_dt)
    while (abs(du_dt(i)) >= 0.0001)
        s1n = eulerupdate(W,s1);
        s1 = s1n;
        du_dt = -s1n + W*(sign(s1n));
    end
end

final = sign(s1n);
orig = S(:,1);

fprintf("%i pixels corrupted \n", sum(final ~= orig));

figure
subplot(1,2,1)
imagesc(reshape(orig,40,40))
colormap(gray)
title('Original Image')
subplot(1,2,2)
imagesc(reshape(final,40,40))
colormap(gray)
title('Final Image')

pause;
close all;
%%
%1B

s1 = -S(:,1);

N = 1600;
W = (1/N)*(S*S');
du_dt = -s1 + W*sign(s1);

for i=1:length(du_dt)
    while (abs(du_dt(i)) >= 0.0001)
        s1n = eulerupdate(W,s1);
        s1 = s1n;
        du_dt = -s1n + W*(sign(s1n));
    end
end

final = sign(s1n);
orig = S(:,1);

fprintf("%i pixels corrupted \n", sum(final ~= orig));

figure
subplot(1,2,1)
imagesc(reshape(orig,40,40))
colormap(gray)
title('Original Image')
subplot(1,2,2)
imagesc(reshape(final,40,40))
colormap(gray)
title('Final Image')

pause;
close all;
%%
%1C

figure
for emp=1:6
    
    s1 = (2*randi([0 1], 1600, 1))-1; %(either 1 or -1)
    N = 1600;
    W=(1/N)*(S*S');
    du_dt = -s1 + W*sign(s1);

    for i=1:length(du_dt)
        while (abs(du_dt(i)) >= 0.0001)
            s1n = eulerupdate(W,s1);
            s1 = s1n;
            du_dt = -s1n + W*(sign(s1n));
        end
    end
    
    final = sign(s1n);
    
    subplot(2,3,emp)
    imagesc(reshape(s1,40,40))
    colormap(gray)
    
    title(['Output ', num2str(emp)])   
    
end
pause;
close all;

%%
%1D

N = 1600;
W = (1/N)*(S*S');

W_mod = reshape(W,1600*1600,1);
randord = randperm(length(W_mod));
randord = randord(1:(length(W_mod)/2));
for i=randord
   W_mod(i) = 0; 
end

W = reshape(W_mod,1600,1600);

s1 = S(:,5);
du_dt = -s1 + W*sign(s1);

for i=1:length(du_dt)
    while (abs(du_dt(i)) >= 0.0001)
        s1n = eulerupdate(W,s1);
        s1 = s1n;
        du_dt = -s1n + W*(sign(s1n));
    end
end

final = sign(s1n);
orig = S(:,5);

fprintf("%i pixels corrupted \n", sum(final ~= orig));

figure
subplot(1,2,1)
imagesc(reshape(orig,40,40))
colormap(gray)
title('Original Image')
subplot(1,2,2)
imagesc(reshape(final,40,40))
colormap(gray)
title('Final Image')

pause;
close all;
