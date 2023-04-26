LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is
end entity;

architecture Decoder_arch of Decoder is

signal test : std_logic_vector(254 downto 0);
signal S1result : std_logic_vector(7 downto 0);
signal S3result : std_logic_vector(7 downto 0);

component Syndrome1Calc is
	port( 
		R  : in std_logic_vector(254 downto 0); 
		output : out std_logic_vector(7 downto 0)
	);
end component;

component Syndrome3Calc is
	port( 
		R  : in std_logic_vector(254 downto 0); 
		output : out std_logic_vector(7 downto 0)
	);
end component;

begin
	
test <= "111000110010101000000110100001100100000010000111110110111110000110110010101011100010001110000010010001100000000101101110000101000111010001110100011101010100001011100101101111001000101010001111101010100011011100011000101100001010111110110100100101110011011";
--01111011

DUT1 : Syndrome1Calc
	port map(
		R  => test,
		output => S1result
	);

DUT2 : Syndrome3Calc
	port map(
		R  => test,
		output => S3result
	);

end architecture;

