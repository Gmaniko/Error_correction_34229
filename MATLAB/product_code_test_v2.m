% Author: Nikolai

N = 255;
K = 239;
%Define primitive polynomial
PrimPoly = [1,0,0,0,1,1,1,0,1];
%Generate log/antilog tables
[alpha, alphainv] = logantilog(N, PrimPoly);


%Define bit error probability
p = linspace(0.0065,0.0125,15);
%Number of iterations
iter = 1:10;
%Number of simulation runs
runs = 100;

% Initialize bit error ratio
BER = zeros(length(iter), length(p));

% Initialize channel error ratio
channel = zeros(1,length(p));

for b = 1:runs
    fprintf('Iteration number : %d\n', b)

    % Generate random information bits
    X = randi([0 1],K);

    % Encode
    C = product_code_enc_v2(X);
    for j = 1:length(p)

        % Generate noise
        noise = rand(N+1) < p(j);
        fprintf('%d',nnz(noise));
        % "Received" code
        R = bitxor(C,noise);

        % Sum channel error ratios over all runs
        channel(j) = channel(j) + nnz(noise)/(256^2);

        % Iterative decoding
        dec_message = R;
        for i = iter
            % Decode
            dec_message = product_code_dec_v2(dec_message, alpha, alphainv);

            % Sum bit errror ratios over all runs
            BER(i,j) = BER(i,j) + nnz(bitxor(dec_message,C))/(256^2);
        end
        fprintf('error probability: %f\n',p(j))
    end
end
% Calculate average channel error ratio and bit error ratio
channel = channel ./ runs;
BER = BER ./ runs;

% Visualize performance with plot
plotting_script