N = 255;
K = 239;

%Message
rng('default')
X = randi([0 1],K);

%Encode
C = product_code_enc(X, N, K);

%Add noise
%rng('shuffle')
p = linspace(0.00847,0.01257,12);
iterations = 1:10;
BER = zeros(length(iterations), length(p));


for j = 1:length(p)
    noise = rand(N) < p(j);
    R = bitxor(C,noise);
    dec_message = R;
    for i = iterations
        %fprintf('Number of errors: %d\n', sum(noise,'all'))
        dec_message = product_code_dec(dec_message, N);
        BER(i,j) = sum(bitxor(dec_message,C),'all')/(255^2);
    end
    fprintf('error probability: %f\n',p(j))
end

plotting_script