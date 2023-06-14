LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Synch_TB is
end entity;

architecture Synch_TB_arch of Synch_TB is

component Synch is
	port( 
		input  : in std_logic;
		clock  : in std_logic;
		output : out std_logic_vector(254 downto 0)
	);
end component;

signal Clock,bitstream : std_logic;
constant clk_period: time:=2 ns;
signal test : std_logic_vector(555 downto 0);
signal testhead : integer;
signal result : std_logic_vector(254 downto 0);

--Start Pattern:  0110 0101

begin

test <= "0000000000100001000100000000000110010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101100101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

CLOCK_PROGRESS : process
	begin
		Clock<='0';
		wait for clk_period/2;
		Clock<='1';
		wait for clk_period/2;
end process;

inserter : process(Clock)
begin
if (Clock'event and Clock='1') then
	if (testhead > 555 or testhead < 0) then
		testhead <= 555;
	else
		bitstream <= test(testhead);
		testhead <= testhead -1;
	end if;
end if;
end process;

dut : Synch
	port map(
		input  => bitstream,
		clock  => Clock,
		output => result
	);


end architecture;


