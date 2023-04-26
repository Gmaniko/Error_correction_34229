N = 255;
K = 239;

%rng('default')
X = randi([0 1],1,K);

C = BCHE_encode(X);


noise = zeros(1,length(C));
rng('shuffle')
err_loc = randi(length(C),1,3);
noise(err_loc) = 1;
%Received information is code word with two errors
R = bitxor(C,noise);

dec_message = BCHE_decode(R);

if isequal(dec_message,C)
    sprintf('Succesfully decoded.')
else
    sprintf('Could not decode (too many errors).')
end