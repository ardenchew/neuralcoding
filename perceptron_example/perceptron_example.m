clear
clc

disp("Section 1...")
pause

in = load('ImageData.mat');
X = in.X;
Y = in.Y;
W = Y * pinv(X);

size(W) % question a

rank(W) % question b

figure(1)
% question c
Yprojected_1 = zeros((33*33), 10);
for i=1:10
   inputVector = X(:,i);
   Yprojected_1(:,i) = W * inputVector;
   m = reshape(Yprojected_1(:,i), 33, 33);
   subplot(2,5,i);
   imagesc(m)
   colormap(gray)
   axis off
end

pause
close all

figure(2)
% question d
Yprojected_2 = zeros((33*33), 10);
for i=1:10
    inputVector = X(:,i);
    %setting right half to grey
    inputVector = reshape(inputVector, 80, 112);
    for j=57:112
       inputVector(:,j) = zeros(80, 1);
    end
    
    % displaying input
    subplot(2,10,i)
    imagesc(inputVector)
    colormap(gray)
    axis off
    
    % resizing to generate output image
    inputVector = reshape(inputVector, 8960, 1);
    Yprojected_2(:,i) = W * inputVector;
    m = reshape(Yprojected_2(:,i), 33, 33);
    
    % displaying output
    subplot(2,10,(i+10))
    imagesc(m)
    colormap(gray)
    axis off
end

pause
close all

figure(3)
% question e
Yprojected_3 = zeros((33*33), 10);
for i=1:10
    inputVector = X(:,i);
    
    % setting randomized blanks
    randVector = randperm(8960, floor(8960 * 0.9));
    for j=randVector
        inputVector(j) = 0;
    end
    n = reshape(inputVector, 80, 112);
    
    % displaying input
    subplot(2,10,i)
    imagesc(n)
    colormap(gray)
    axis off
    
    % generating output
    Yprojected_3(:,i) = W * inputVector;
    m = reshape(Yprojected_3(:,i), 33, 33);
    
    % displaying output
    subplot(2,10,(i+10))
    imagesc(m)
    colormap(gray)
    axis off
end

pause
close all

disp("Section 2...")
pause

% question f
disp("W = X * X'")
clear W
W = X * pinv(X);

% question g
size(W)

% question h
rank(W)

figure(4)
%question i
Yprojected_4 = zeros((80*112), 10);
for i=1:10
    inputVector = X(:,i);
    Yprojected_4(:,i) = W * inputVector;
    m = reshape(Yprojected_4(:,i), 80, 112);
    subplot(2,5,i)
    imagesc(m)
    colormap(gray)
    axis off
end

pause
close all

figure(5)
% question d
Yprojected_5 = zeros((80*112), 10);
for i=1:10
    inputVector = X(:,i);
    %setting right half to grey
    inputVector = reshape(inputVector, 80, 112);
    for j=57:112
       inputVector(:,j) = zeros(80, 1);
    end
    
    % displaying input
    subplot(2,10,i)
    imagesc(inputVector)
    colormap(gray)
    axis off
    
    % resizing to generate output image
    inputVector = reshape(inputVector, 8960, 1);
    Yprojected_5(:,i) = W * inputVector;
    m = reshape(Yprojected_5(:,i), 80, 112);
    
    % displaying output
    subplot(2,10,(i+10))
    imagesc(m)
    colormap(gray)
    axis off
end

pause
close all

figure(6)
% question e
Yprojected_6 = zeros((80*112), 10);
for i=1:10
    inputVector = X(:,i);
    
    % setting randomized blanks
    randVector = randperm(8960, floor(8960 * 0.9));
    for j=randVector
        inputVector(j) = 0;
    end
    n = reshape(inputVector, 80, 112);
    
    % displaying input
    subplot(2,10,i);
    imagesc(n)
    colormap(gray)
    axis off
    
    % generating output
    Yprojected_6(:,i) = W * inputVector;
    m = reshape(Yprojected_6(:,i), 80, 112);
    
    % displaying output
    subplot(2,10,(i+10))
    imagesc(m)
    colormap(gray)
    axis off
end

pause
close all

