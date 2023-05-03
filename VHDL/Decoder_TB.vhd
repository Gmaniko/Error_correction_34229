LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

LIBRARY STD;
USE STD.textio.all;

entity Decoder_TB is
end entity;

architecture Decoder_TB_arch of Decoder_TB is

component Decoder is
		port(  
		clock  : in std_logic;
		input  : std_logic_vector(254 downto 0);
		output : out std_logic_vector(7 downto 0)
		);
end component;

--TB clock
signal Clock : std_logic;
constant clk_period: time:=10 ns;
signal result : std_logic_vector(7 downto 0);
signal test  : std_logic_vector(254 downto 0);

type ROM_type is array (0 to 0) of std_logic_vector(254 downto 0);
constant ROM_R : ROM_type := ( 
0 => "111000110010101000000110100001100100000010000111110110111110000110110010101011100010001110000010010001100000000101101110000101000111010001110100011101010100001011100101101111001000101010001111101010100011011100011000101100001010111110110100100101110011011"
);


begin

CLOCK_PROGRESS : process
	begin
		Clock<='0';
		wait for clk_period/2;
		Clock<='1';
		wait for clk_period/2;
end process;

tester : process (Clock)
begin
test <= ROM_R(0);

end process;


dut : Decoder
	port map(
		clock  => Clock,
		input	=> test,
		output => result
	);

end architecture;
