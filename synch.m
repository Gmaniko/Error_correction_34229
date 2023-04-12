StartPattern = [1 0 1 0 1 0];
rng('default')
NoiseBefore = randi([0 1],1,20);
NoiseAfter = randi([0 1],1,20);
Payload = randi([0 1],1,255);

msg = [NoiseBefore StartPattern Payload NoiseAfter]

for i=1:length(msg)
    if msg(i:i+5) == StartPattern
        r = msg(i+6:(i+6)+254);
        break;
    end
end

if r == Payload
    sprintf('synch OK.')
else
    sprintf('synk KO')
end