library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity bch_encoder_test is
end entity;


architecture arch of bch_encoder_test is

	signal X_test : std_logic_vector(238 downto 0);
	signal C_test : std_logic_vector(255 downto 0);
	
	component bch_encoder is
		port( 
			X  : in std_logic_vector(238 downto 0); 
			C : out std_logic_vector(255 downto 0)
		);
	end component;
	
	begin
	
	
	DUT : bch_encoder port map (X_test, C_test);
	
	STIMULUS : process
	
		file Fout : TEXT open WRITE_MODE is "enc_test_result.txt";
		variable current_line : line;
		begin
		
			X_test <= "10000011110111000110110101111010101010001010000101101100000010111010000100100110100001110100111001011010001111001010001010101100100001101010111011111000010101110110110010100110010100011100011101011110001000001000101110110110110000011001101";
			wait for 125 ns;
			write(current_line, C_test);
			writeline(OUTPUT, current_line);
			wait;
	end process;
	
end architecture;