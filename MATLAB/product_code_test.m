%Author: Nikolai
N = 255;
K = 239;

% Generate tables
PrimPoly = [1,0,0,0,1,1,1,0,1];
[alpha, alphainv] = logantilog(N, PrimPoly);


p = linspace(0.0065,0.0125,15);
iter = 1:10;
BER = zeros(length(iter), length(p));
channel = zeros(1,length(p));
for b = 1:100
    fprintf('Iteration number : %d\n', b)
    % Generate K^2 information bit
    X = randi([0 1],K);
    % Encode
    C = product_code_enc(X);
    for j = 1:length(p)
        % Generate noise
        noise = zeros(255);
        noise(randperm(255^2,round(p(j)*255^2))) = 1;
        R = bitxor(C,noise);
        channel(j) = channel(j) + sum(noise,'all')/(255^2);
        dec_message = R;
        for i = iter
            % Decode
            dec_message = product_code_dec(dec_message, alpha, alphainv);
            BER(i,j) = BER(i,j) + sum(bitxor(dec_message,C),'all')/(255^2);
        end
        fprintf('error probability: %f\n',p(j))
    end
end
channel = channel ./ 100;
BER = BER ./ 100;
plotting_script