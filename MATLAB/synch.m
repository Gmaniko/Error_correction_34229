clc
clear all
StartPattern = [0 1 1 0 0 1 0 1];
rng('default')
rand = randi([1 100],1,1);
NoiseBefore = randi([0 1],1,rand(1));
%NoiseAfter = randi([0 1],1,20);
%Payload = randi([0 1],1,255);

%noise
msg = [NoiseBefore];
%message to be appended
%appndMsg = [StartPattern randi([0 1],1,255);];
                        %^^^Ensures each payload is random
rndArr = [0];
while length(rndArr) < 500
    rndSeq = randi([10, 20], 1, 1);
    rndArr = [rndArr, [zeros(1, rndSeq(1)), [1]]];
end
rndArr = [rndArr, zeros(1, 500-length(rndArr))];
    
for i=1:500
    fault = randi([0 6],1,1);
    while fault == 3
        fault = randi([0 6],1,1);
    end
    if rndArr(i) == 1;
        msg = [msg, [StartPattern randi([0 1],1,252+(fault));]];
    else
        msg = [msg, [StartPattern randi([0 1],1,255);]];
    end  
end

total = 0;
arrPos = 1;
memSize = 5;
oldPos = zeros(1, memSize);
check  = zeros(1, memSize);
mem = 0;
found = 0;
new = 1;
missed = 0;
bitErr = 0;
tries = 0;
restart = 0;

while arrPos < (length(msg)-7)
    
    %First time searching for sync
    if found == 0;
        if restart == 1
            mem = 0;
        end
        if msg(arrPos:arrPos+7) == StartPattern

            if total == 0; 

                oldPos(1) = arrPos;
                check(1) = check(1) + 1;
                mem = 1;
            else
                for i = 1:mem
                
                    if arrPos == oldPos(i) + 263
                    
                        check(i) = check(i) + 1;
                        oldPos(i) = arrPos;
                        new = 0;
                        if check(i) == 5
                            found = i;
                            disp('found pattern')
                        end
                    end
                end
    
                if new == 1;
                    if mem == memSize
                        disp('memory full')
                    else
                        mem = mem + 1;
                        oldPos(mem) = arrPos;
                        check(mem) = check(mem) + 1;
                    end
                end
            end
            new = 1;
            total = total + 1;
        end 
          
    %Synchronised
    else
        restart = 0;
        if arrPos == oldPos(found) + 263
            if msg(arrPos:arrPos+7) == StartPattern
                %disp('Sequence detected')
                check(found) = check(found) + 1;
            else
                missed = missed + 1;
                fprintf("Sequence missed %d \n", missed)
            end
            
            if check(found) < 5
                tries = tries + 1;
                if tries == 5
                    found = 0;
                    disp(['Unable to regain pattern by adjusting for ' ...
                        'bitshift. Restarting synchronisation.'])
                    restart = 1;
                end

            end
            if restart == 0
                if (check == 5) & (bitErr ~= 0)
                    disp('Pattern regained.')
                    bitErr = 0;
                    missed = 0;
                    tries = 0;
                end
    
                oldPos(found) = arrPos;
                if missed == 5
                    disp(['Pattern lost. Trying to correct for bits ' ...
                        'lost/gained...'])
                    tries = 0;
                    for i = -3:3
                        if msg(arrPos+i:arrPos+7+i) == StartPattern
                            
                            oldPos(found) = arrPos + i;
    
                            strL = "lost";
                            strG = "gained";
                            str = "";
                            if i < 0
                                str = strL;
                            elseif i > 0
                                str = strG;
                            end
                            fprintf("Probable %d bit(s) %s\n", abs(i), str)
                            bitErr = i;
                            break;
                        end
                    end
                    missed = 0;
                    check(found) = 0;
                end
            end
        end
    end
    arrPos = arrPos + 1;
end