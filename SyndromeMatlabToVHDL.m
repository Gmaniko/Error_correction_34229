HS1 = zeros(255,8);
HS3 = zeros(255,8);
RV = zeros(255,255);
for i = 1:255
    RV(i,i) = 1;
end


for hej = 1:255
    R = RV(hej,:);
    %Primitive polynomial of GF(256)
    P = [1,0,0,0,1,1,1,0,1];
    %P = [1,0,1,1];
    m = length(P) - 1;
    N = length(R);
    
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
    
    HS1(hej,:) = S1;
    HS3(hej,:) = S3;
end

fileID = fopen('VHDL.txt','w');
%fprintf(fileID,'S1 = S1(1) xor R(1) & S1(2) & S1(3) & S1(4) & S1(5) xor R(1) & S1(6) xor R(1) & S1(7) xor R(1) & S1(8);\n');
for i = 1:255
s = "S1 = ";

if HS1(i,1) == 1
s = s + sprintf('(S1(0) xor R(%d)) & ', i-1);
else
s = s + "S1(0) & ";
end

if HS1(i,2) == 1
s = s + sprintf('(S1(1) xor R(%d)) & ', i-1);
else
s = s + "S1(1) & ";
end

if HS1(i,3) == 1
s = s + sprintf('(S1(2) xor R(%d)) & ', i-1);
else
s = s + "S1(2) & ";
end

if HS1(i,4) == 1
s = s + sprintf('(S1(3) xor R(%d)) & ', i-1);
else
s = s + "S1(3) & ";
end

if HS1(i,5) == 1
s = s + sprintf('(S1(4) xor R(%d)) & ', i-1);
else
s = s + "S1(4) & ";
end

if HS1(i,6) == 1
s = s + sprintf('(S1(5) xor R(%d)) & ', i-1);
else
s = s + "S1(5) & ";
end

if HS1(i,7) == 1
s = s + sprintf('(S1(6) xor R(%d)) & ', i-1);
else
s = s + "S1(6) & ";
end

if HS1(i,8) == 1
s = s + sprintf('(S1(7) xor R(%d)) & ', i-1);
else
s = s + "S1(7) & ";
end

s = s + ";\n";

fprintf(fileID,s);

end
fclose(fileID);