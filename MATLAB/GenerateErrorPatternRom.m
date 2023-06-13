fileID = fopen('VHDL.txt','w');
s = "type ROM_type is array (0 to 254) of std_logic_vector(254 downto 0);\n";
fprintf(fileID,s);
s = "constant ROM_alpha : ROM_type := ( ";
fprintf(fileID,s);

bruh = eye(255);

for i = 1:255
    
    dude = "";
    for j = 1:255
        dude = dude + bruh(256-i,j); 
    end

    s = ""+ (i) + ' => "' + dude + '",\n';
    fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);

fclose(fileID);