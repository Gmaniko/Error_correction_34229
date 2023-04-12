clc
clear all
StartPattern = [1 0 1 0 1 0 1 0];
rng('default')
rand = randi([1 100],1,1);
NoiseBefore = randi([0 1],1,rand(1));
%NoiseAfter = randi([0 1],1,20);
%Payload = randi([0 1],1,255);

%noise
msg = [NoiseBefore];
%message to be appended
appndMsg = [StartPattern randi([0 1],1,255);];
                        %^^^Ensures each payload is random

for i=1:10
    msg = [msg, appndMsg];
end

check = 1;

for i = 1:length(msg)
    if msg(i:i+7) == StartPattern
        check = 1;
        for j = 2:5
            if (msg((i+(8+255)*j):(i+7+(8+255)*j))) == StartPattern
                check = check + 1;
                if check == 5
                    break;
                end
            end
        end
        if check == 5
            break;
        end
    end
end

if check == 5
    disp('check ok')
else
    disp('check not ok')
end
