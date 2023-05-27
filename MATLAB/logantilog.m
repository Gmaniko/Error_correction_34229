function [alpha, alphainv] = logantilog(N, P)
% Generates log/antilog tables.

m = length(P) - 1;

% Calculate log-table that returns an element of the Galois field
% given the exponent of the primitive element.
alpha = zeros(N, m);
alpha(1,:) = [zeros(1, m-1) 1];
for i = 2:N
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
    alphainv(BinToDec(alpha(i,:))) = i-1;
end