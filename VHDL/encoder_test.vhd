library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity encoder_test is
end entity;


architecture arch of encoder_test is

	signal X_test : std_logic_vector(238 downto 0);
	signal C_test : std_logic_vector(254 downto 0);
	
	component Encoder is
		port( 
			X  : in std_logic_vector(238 downto 0); 
			C : out std_logic_vector(254 downto 0)
		);
	end component;
	
	begin
	
	
	DUT : Encoder port map (X_test, C_test);
	
	STIMULUS : process
	
		file Fout : TEXT open WRITE_MODE is "enc_test_result.txt";
		variable current_line : line;
		begin
		
			X_test <= "01111010111101001100100101111011011101001011000001000000011000101101110111111001000001111001110001111011100110100011000110110110100001111100111011100100010110000001101111011110101100011001000001000011100000010001100010001000011101010001100";
			wait for 125 ns;
			write(current_line, C_test);
			writeline(OUTPUT, current_line);
			wait;
	end process;
	
end architecture;