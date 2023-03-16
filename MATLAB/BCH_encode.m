function C = BCH_encode(X)

%Generator polynomial for BCH(255,239)
G = [1,0,1,1,0,1,1,1,1,0,1,1,0,0,0,1,1];

d = length(G) - 1;
%Initialize remainder
R = [X zeros(1,d)];
%Long division modulo 2
for i=1:length(X)
    if R(i) ~= 1
        continue
    end
    
    R(i:d+i) = bitxor(R(i:d+i),G);
end
%truncate
R = R(end-(d-1):end);

C = [X R];