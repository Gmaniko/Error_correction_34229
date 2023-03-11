%Generator polynomial
G = [1 0 1 1];
%Message
X = [1 0 0 1];

n = length(G) - 1;
%Initialize remainder
R = [X zeros(1,n)];
%Long division modulo 2
for i=1:length(R)
    if polyval(G,2) > polyval(R,2)
        break
    end
    if R(i) ~= 1
        continue
    end
    
    R(i:n+i) = bitxor(R(i:n+i),G);
    
end
%truncate
R = R(end-(n-1):end);

C = [X R];