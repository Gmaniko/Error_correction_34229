N = 255;
K = 239;

%Message
rng('default')
X = randi([0 1],K);

%Encode
C = product_code_enc(X, N, K);

%Add noise
%rng('shuffle')
p = 0.0085:0.0005:0.0125;
iterations = 1:2;
BER = zeros(length(iterations),length(p));

for i = iterations
    for j = 1:length(p)
        noise = rand(N) < p(j);
        %fprintf('Number of errors: %d\n', sum(noise,'all'))
        R = bitxor(C,noise);
        
        
        dec_message = product_code_dec(R, i, N);
        
        
%         if isequal(dec_message,C)
%             disp('Succesfully decoded.')
%         else
%             disp('Could not decode (too many errors).')
%         end
        
        BER(i,j) = sum(bitxor(dec_message,C),'all')/(255^2);
    end
    disp('iteration done.')
end
figure
semilogy(p,BER(1,:))
hold on
for i = 2:10
    semilogy(p,BER(i,:))
end
hold off
ylim([10^(-10) 10^(-2)])