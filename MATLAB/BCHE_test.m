N = 255;
K = 239;

%Define primitive polynomial
PrimPoly = [1,0,0,0,1,1,1,0,1];
%Generate log/antilog tables
[alpha, alphainv] = logantilog(N, PrimPoly);

% Generate random information bits
X = randi([0 1],1,K);

% Encode
C = BCHE_encode(X);

% Number of errors
err_n = 2;
% Generate noise
noise = zeros(1,length(C));
noise(randperm(length(C),err_n)) = 1;

% Received information is code word with err_n errors
R = bitxor(C,noise);

% Decode
dec_message = BCHE_decode(R,alpha, alphainv);

if isequal(dec_message,C)
    sprintf('Succesfully decoded.')
else
    sprintf('Could not decode (too many errors).')
end