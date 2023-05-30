function [dec_pattern, match] = BCH_decode_v2(R, pr, alpha, alphainv)

% Primitive polynomial of GF(256)
P = [1,0,0,0,1,1,1,0,1];

m = length(P) - 1;

N = length(R);

% Check parity bits for equality
pc = mod(sum(R),2);
if pc == pr
    match = true;
else
    match = false;
end

% Initialize syndromes
S1 = [zeros(1, m-1) R(1)];
S3 = [zeros(1, m-1) R(1)];

% Calculate  syndromes S1 and S3 by evaluating R as a polynomial in GF(2^8)
% , in the primitive element as R(alpha) for S1 and R(alpha^3) for S3.
for i = 2:N
    % (alpha * S1) + r_i
    u = S1(1);
    S1 = [S1(2:end) 0]; %shiftrow
    if u == 1 %if overflow
        S1 = bitxor(S1, P(2:end)); %then xor with primitive
    end
    S1 = bitxor(S1, [zeros(1, m-1) R(i)]);

    for j = 1:3
        u = S3(1);
        S3 = [S3(2:end) 0];
        if u == 1
            S3 = bitxor(S3, P(2:end));
        end
    end
    S3 = bitxor(S3, [zeros(1, m-1) R(i)]);
end

% If both syndromes are zero then R is a code word.
if ~any(S1) && ~any(S3)
    dec_pattern = zeros(1,N);
    return
end

% If one of the syndromes are zero then there are more than two errors X
% in the received sequence R. X

% If S1 is 0 then S1^3 is also zero => division by zero

if ~any(S1) % || ~any(S3)
    dec_pattern = ones(1,N);
    return
end

% S1 as exponent of primitive element to the third power
s1pow3 = mod(alphainv(BinToDec(S1))*3, 2^m - 1);

if any(S3)
    % S3 as exponent of primitive element
    s3pow1 = alphainv(BinToDec(S3));
    
    % Subtracting the exponents 
    s1pow3s3 = mod(s3pow1 - s1pow3, 2^m - 1);

    % add 1 to get 1 + S3/(S1^3)
    rat = bitxor(alpha(s1pow3s3+1,:), alpha(0+1,:));
else
    % alpha(s1pow3s3+1,:) = 0
    % => bitxor(alpha(s1pow3s3+1,:), alpha(0+1,:)) = alpha(0+1,:)
    rat = alpha(0+1,:);
end



%find y = x/S1
y = [];
if ~any(rat)
    y = [y 0];
end
for i = 1:N-1
    % Search for y^2 + y = 1 + S3/(S1^3)
    temp = bitxor(alpha(mod(2*i, 2^m - 1)+1,:), alpha(i+1,:));
    if temp == rat
        y = [y i];
    end
end
% x = y * S1
if any(S1)
    x = 255 - mod(y+alphainv(BinToDec(S1)), 2^m - 1);
else
    % x = y * S1 = 0
    x = 255;
end

% Use roots as error locations
dec_pattern = zeros(1,N);
dec_pattern(x) = 1;

