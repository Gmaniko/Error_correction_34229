--Author: Nikolai
-- Parallel-in Serial-out Shift Register
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity PISO_SR is
	port (
		clk : in std_logic;
		rst : in std_logic;
		D   : in std_logic_vector(16 downto 0);
		WS  : in std_logic;
		Q   : out std_logic
	);
end entity;

architecture PISO_SR_arch of PISO_SR is

	signal SR : std_logic_vector(16 downto 0);
	signal wsd : std_logic_vector(1 downto 0);
	
	begin
	
	
	process (clk,rst)
		begin
			if rst = '1' then
				SR <= (others => '0');
				wsd <= (others => '0');
			elsif rising_edge(clk) then
				wsd(1) <= wsd(0);
				wsd(0) <= WS;
				
				if wsd(1) = '0' then
					SR <= D;
				elsif wsd(1) = '1' then
					Q <= SR(16);
					for i in 1 to 16 loop
						SR(i) <= SR(i-1);
					end loop;
				end if;
			end if;
	end process;
	
end architecture;
		