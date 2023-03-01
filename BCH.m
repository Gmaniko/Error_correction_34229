%variables
n = 256; %number of bits in codeword

%encode codeword
%c = zeros(1,255);
c = [1 0 0 0 0 0 1];
%add noise to received bits
p = 0.00;
n = rand(1,length(c)) < p;
r = xor(c,n);

%calculate syndrome
P8 = [1,0,0,0,1,1,1,0,1];
P3 = [1 0 1 1];
G = [1,0,1,1,0,1,1,1,1,0,1,1,0,0,0,1,1];
S1 = [zeros(1,2) r(end)];
S3 = [zeros(1,2) r(end)];
for i = length(r)-1:-1:1
    %S = mod(2*S + r(i),);
    for j = 1:3
        u = S3(1);
        S3 = [S3(2:end) 0];
        if u == 1
            S3 = bitxor(S3, P3(2:end));
        end
    end
    S3 = bitxor(S3, [zeros(1,length(S3)-1) r(i)]);

    u = S1(1);
    S1 = [S1(2:end) 0];
    if u == 1
        S1 = bitxor(S1,P3(2:end)); 
    end
    S1 = bitxor(S1, [zeros(1,length(S1)-1) r(i)]);
end





