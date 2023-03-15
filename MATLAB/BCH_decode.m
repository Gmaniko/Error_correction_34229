%variables
%n = 255; %number of bits in codeword

%encode codeword
%c = zeros(1,255);
%c = [0 0 0 0 0 0 0];
%c = [0 0 0 0 0 1 0];
c = C;
%add noise to received bits
p = 0.00;
n = rand(1,length(c)) < p;
r = xor(c,n);

%calculate syndrome
P = [1,0,0,0,1,1,1,0,1];
%P = [1 0 1 1];
G = [1,0,1,1,0,1,1,1,1,0,1,1,0,0,0,1,1];
S1 = [zeros(1,length(P)-2) r(1)];
S3 = [zeros(1,length(P)-2) r(1)];
%Calculate  syndromes S1 and S3

for i = 2:length(r)
    %S = mod(2*S + r(i),);
    for j = 1:3
        u = S3(1);
        S3 = [S3(2:end) 0];
        if u == 1
            S3 = bitxor(S3, P(2:end));
        end
    end
    S3 = bitxor(S3, [zeros(1,length(S3)-1) r(i)]);

    % (alpha * S1) + r_i
    u = S1(1);
    S1 = [S1(2:end) 0]; %shiftrow
    if u == 1 %if overflow
        S1 = bitxor(S1,P(2:end)); %then xor with primitive
    end
    S1 = bitxor(S1, [zeros(1,length(S1)-1) r(i)]);
end



%Calculate table that returns polynomial given alpha power + 1
alpha = zeros(length(r),length(P)-1);
a = [zeros(1,length(P)-2) 1];
for i = 1:length(r)
    alpha(i,:) = a;
    u = a(1);
    a = [a(2:end) 0];
    if u == 1
        a = bitxor(a,P(2:end));
    end
end

%Calculate table that returns alphapower given polynomial as integer
alphainv = zeros(length(r),1);
for i = 1:length(r)
    alphainv(polyval(alpha(i,:),2)) = i-1;
end

if ~any(S1) && ~any(S3)
    error('No errors were found.')
end

if ~any(S1) || ~any(S3)
    error('Cannot be decoded (One or more syndromes equal 0).')
end

%S1 to the third power in terms of alpha
s1pow3 = mod(alphainv(polyval(S1,2))*3,2^(length(P)-1) - 1);
%S3 in terms of alpha
s3pow1 = alphainv(polyval(S3,2));

if s1pow3 == s3pow1
    error('No errors were found.')
end

%s1pow3 divided by s3pow1 in terms of alpha
s1pow3s3 = mod(s3pow1 - s1pow3,2^(length(P)-1) - 1);
%add 1 in terms of polynomials

rat = bitxor(alpha(s1pow3s3+1,:), alpha(0+1,:));


%find y = x/S1
y = [];
if isequal(rat,zeros(1,length(P)-1))
    y = [y 0];
end
for i = 1:length(r)-1
    temp = bitxor(alpha(mod(2*i,2^(length(P)-1) - 1)+1,:),alpha(i+1,:));
    if temp == rat
        y = [y i];
    end
end
% x = y * S1
x = mod(y+alphainv(polyval(S1,2),:),2^(length(P)-1) - 1);
