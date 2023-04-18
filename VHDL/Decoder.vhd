LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is
	port( 
		receivedInput   : in std_logic_vector(6 downto 0);
		correctedOutput : out std_logic_vector(6 downto 0)
	);
end entity;

architecture Decoder_arch of Decoder is

signal test = std_logic_vector(255 downto 0);

component Syndrome1Calc is
	port( 
		rIn  : in std_logic_vector(6 downto 0); 
		Sout : out std_logic_vector(2 downto 0)
	);
end component;

begin
	
test <= "110110011101101001111011111010100001101000110001110110001010101111100010101000100111101101001110100001010101110001011100010111000101000011101101000000001100010010000011100010001110101010011011000011111011011111000010000001001100001011000000101010011000111";

end architecture;
