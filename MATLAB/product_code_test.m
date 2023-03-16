N = 255;
K = 239;

%Message
rng('default')
X = randi([0 1],K);

%Encode
product_code_enc(X, N, K);

%Add noise
%rng('shuffle')
p = 0.0085:0.0005:0.0125;
BER = zeros(1,length(p));


for i = 1:length(p)-4
    noise = rand(N) < p(i);
    %fprintf('Number of errors: %d\n', sum(noise,'all'))
    R = bitxor(C,noise);
    
    
    dec_message = product_code_dec(R,1, N);
    
    
    if isequal(dec_message,C)
        disp('Succesfully decoded.')
    else
        disp('Could not decode (too many errors).')
    end
    
    BER(i) = sum(bitxor(dec_message,C),'all')/(255^2);
end

figure
semilogy(p,BER)
ylim([10^(-10) 10^(-2)])