

fileID = fopen('VHDL.txt','w');
s = "type ROM_type is array (0 to 254) of std_logic_vector(7 downto 0);\n";
fprintf(fileID,s);
s = "constant ROM_alpha : ROM_type := ( "
fprintf(fileID,s);
for i = 1:255
    stemp = "";
    for j=1:8
        stemp = stemp + alpha(i,j);
    end

    s = ""+ (i-1) + ' => "' + stemp + '",\n';
    fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);

s="\n\n\n";
fprintf(fileID,s);
s = "type ROM_type2 is array (0 to 254) of integer;\n";
fprintf(fileID,s);
s = "constant ROM_alphaInv : ROM_type2 := ( "
fprintf(fileID,s);
for i = 1:255
     s = ""+ (i-1) + ' => ' + alphainv(i) + ',\n';
     fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);

fclose(fileID);

%Remember to remove last comma , from VHDL    error -> ,);
