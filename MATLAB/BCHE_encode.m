function C = BCHE_encode(X)

C = BCH_encode(X);
if mod(sum(C),2) == 0
    p = 0;
else
    p = 1;
end
C = [C, p];