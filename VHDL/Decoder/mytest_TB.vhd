LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity mytest_TB is
end entity;


architecture mytest_TB_Arch of mytest_TB is


component mytest is
	port (
		CLOCK_50  : in std_logic;
		LEDR	:	out std_logic_vector(7 downto 0) --OK/KO
	);
end component;

signal Clock, ok : std_logic;
signal ledr	: std_logic_vector(7 downto 0);
constant clk_period: time:=10 ns;

begin

CLOCK_PROGRESS : process
	begin
		Clock<='0';
		wait for clk_period/2;
		Clock<='1';
		wait for clk_period/2;
end process;



dut : mytest
	port map(
		CLOCK_50  => Clock,
		LEDR	=> ledr	
	);

end architecture;

	