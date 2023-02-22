%encode codeword
codeword = zeros(1,256);

%add noise to recived bits
recivedBits = codeword; % + noise

%calculate syndrome

S = recivedBits;
n = 256; % or use length function

for i = n-2:-1:0
    S = alpha*S xor r(i)
end


