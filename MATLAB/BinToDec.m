function S = BinToDec(V)
% Convert vector of binary values to a decimal number.
S = sum(pow2(find(flip(V))-1));

end