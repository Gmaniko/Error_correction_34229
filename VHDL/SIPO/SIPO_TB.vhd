--SIPO Test Bench
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity SIPO_TB is
end entity;

architecture SIPO_TB_arch of SIPO_TB is

component SIPO is
	port
	( 
		clk  : in std_logic;
		input  : in std_logic;
		output : out std_logic_vector(31 downto 0)
	);
end component;

signal Clk,bitstream : std_logic := '0';
constant clk_period: time:=2 ns;
signal test : std_logic_vector(555 downto 0);
signal testhead : integer := 555;
signal count : integer := 0;
signal result : std_logic_vector(31 downto 0);

--Start Pattern:  0110 0101

begin
--count <= 0;
test <= "0000000000100001000100000000000110010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101100101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

CLK_PROGRESS : process
	begin
		Clk <= '0';
		wait for clk_period / 2;
		Clk <= '1';
		wait for clk_period / 2;
end process;

inserter : process(Clk)
begin
--count <= 0;
if rising_edge(clk) then
	--if (testhead > 555 or testhead < 0) then
		--testhead <= 555;
	--else
		--bitstream <= test(testhead);
		--testhead <= testhead - 1;
		count <= count + 1;
		bitstream <= test(testhead-count);
	--end if;
end if;
end process;

SIPO_instance : SIPO
	port map
	(
		input  => bitstream,
		clk  => Clk,
		output => result
	);

end architecture;