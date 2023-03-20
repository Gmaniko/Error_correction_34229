N = 255;
K = 239;

%Message
rng('default')
X = randi([0 1],K);

%Encode
C = product_code_enc(X, N, K);

%Add noise
%rng('shuffle')
%p = linspace(0.00847,0.01257,12);
p = [0.00847 0.00879 0.00912 0.00946 0.00982 0.01019 0.01052 0.01095 0.01131 0.01175 0.01209 0.01258];
iter = 1:10;
BER = zeros(length(iter), length(p));
channel = zeros(1,length(p));

for j = 1:length(p)
    noise = rand(N) < p(j);
    R = bitxor(C,noise);
    channel(j) = sum(noise,'all')/(255^2);
    dec_message = R;
    for i = iter
        %fprintf('Number of errors: %d\n', sum(noise,'all'))
        dec_message = product_code_dec(dec_message, N);
        BER(i,j) = sum(bitxor(dec_message,C),'all')/(255^2);
    end
    fprintf('error probability: %f\n',p(j))
end


plotting_script