%Constants for BCH(255,239)
% N: Code word length
% K: Message length
N = 255;
K = 239;


%Message
rng('default')
X = randi([0 1],1,K);

C = BCH_encode(X);

noise = zeros(1,N);
rng('shuffle')
err_loc = randi(255,1,2);
noise(err_loc) = 1;
%Received information is code word with two errors
R = bitxor(C,noise);

dec_message = BCH_decode(R);

if isequal(dec_message,C)
    sprintf('Succesfully decoded.')
else
    sprintf('Could not decode (too many errors).')
end