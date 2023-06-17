--Author: Nikolai
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity product_encoder_TB is
end entity;


architecture arch of product_encoder_TB is
	
	component product_encoder_v3
		port(
			clk : std_logic;
			rst : std_logic;
			X   : in std_logic; 
			C   : out std_logic_vector(255 downto 0)
		);
	end component;
	
	signal clk_TB : std_logic;
  signal rst_TB : std_logic;
	signal clk_cnt : std_logic_vector(3 downto 0);
	signal X_TB : std_logic;
	signal C_TB : std_logic_vector(255 downto 0);
	constant test_data : std_logic_vector(15 downto 0) := "1111001000111001";
	
begin
	
	
	DUT : product_encoder_v3 port map (clk_TB, rst_TB, X_TB, C_TB);
	
	CLKPROC : process
  begin
    clk_TB <= '0';
    wait for 10 ns;
    clk_TB <= '1';
    wait for 10 ns;
  end process;
	
	STIMULUS : process
	
		file Fin  : TEXT open READ_MODE is "enc_test.txt";
		file Fout : TEXT open WRITE_MODE is "enc_test_result.txt";
		variable current_read_line : line;
		variable current_write_line : line;
		variable X_var : std_logic_vector(238 downto 0);
		begin
			clk_cnt <= "0000";
			rst_TB <= '1';
			wait for 20 ns;
			rst_TB <= '0';
			loop
				X_TB <= test_data(15-To_integer(unsigned(clk_cnt)));
				clk_cnt <= clk_cnt + 1;
				wait for 20 ns;
			end loop;
			wait;
	end process;
	
end architecture;