function dec_message = BCH_decode(R)

%Primitive polynomial of GF(256)
P = [1,0,0,0,1,1,1,0,1];
m = length(P) - 1;
N = length(R);

S1 = [zeros(1, m-1) R(1)];
S3 = [zeros(1, m-1) R(1)];
% Calculate  syndromes S1 and S3 by evaluating R as a polynomial in GF(256)
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

% Calculate log-table that returns an element of the Galois field
% given the exponent of the primitive element.
alpha = zeros(N, m);
alpha(1,:) = [zeros(1, m-1) 1];
for i =2:N
    u = alpha(i-1,1);
    alpha(i,:) = [alpha(i-1,2:end) 0];
    if u ==1
        alpha(i,:) = bitxor(alpha(i,:), P(2:end));
    end
end

% Calculate antilog-table that returns the exponent of the primitive element
% given element of the Galois field.
alphainv = zeros(N,1);
for i = 1:N
    alphainv(polyval(alpha(i,:),2)) = i-1;
end

% If both syndromes are zero then R is a code word.
if ~any(S1) && ~any(S3)
    error('No errors were found.')
end

% If one of the syndromes are zero then there are more than two errors
% in the received sequence R. 
if ~any(S1) || ~any(S3)
    error('Cannot be decoded (One of the syndromes equal 0).')
end

% S1 as exponent of primitive element to the third power
s1pow3 = mod(alphainv(polyval(S1, 2))*3, 2^m - 1);
% S3 as exponent of primitive element
s3pow1 = alphainv(polyval(S3, 2));

%if S1^3 is equal to S3 then R is a code word.
if s1pow3 == s3pow1
    error('No errors were found.')
end

% Subtracting the exponents 
s1pow3s3 = mod(s3pow1 - s1pow3, 2^m - 1);

% add 1 to get 1 + S3/(S1^3)
rat = bitxor(alpha(s1pow3s3+1,:), alpha(0+1,:));


%find y = x/S1
y = [];
if isequal(rat, zeros(1, m))
    y = [y 0];
end
for i = 1:N-1
    temp = bitxor(alpha(mod(2*i, 2^m - 1)+1,:), alpha(i+1,:));
    if temp == rat
        y = [y i];
    end
end
% x = y * S1
x = 255 - mod(y+alphainv(polyval(S1,2),:), 2^m - 1);

% Use roots as error locations
dec_pattern = zeros(1,N);
dec_pattern(x) = 1;

dec_message = bitxor(dec_pattern, R);
