P = [1,0,0,0,1,1,1,0,1];

m = length(P) - 1;



rat = alpha(0+1,:);
y = [];
if isequal(rat, zeros(1, m))
    y = [y 0];
end
for i = 1:N-1
    % Search for y^2 + y = 1 + S3/(S1^3)
    temp = bitxor(alpha(mod(2*i, 2^m - 1)+1,:), alpha(i+1,:));
    if temp == rat
        y = [y i];
    end
end

x = 255 - mod(y+alphainv(BinToDec(S1),:), 2^m - 1);