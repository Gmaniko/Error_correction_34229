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
			en  : std_logic;
			X   : in std_logic; 
			C   : out std_logic_vector(255 downto 0)
		);
	end component;
	
	signal clk_TB : std_logic;
	signal rst_TB : std_logic;
	signal clk_cnt : integer range 0 to 14;
	signal en_cnt  : integer range 0 to 261;
	signal X_TB : std_logic;
	signal en_TB : std_logic;
	signal C_TB : std_logic_vector(255 downto 0);
	constant test_data : std_logic_vector(14 downto 0) := "111001000111001";
	
begin
	
	
	DUT : product_encoder_v3 port map (clk_TB, rst_TB, en_TB, X_TB, C_TB);
	
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
			clk_cnt <= 0;
			rst_TB <= '1';
			wait for 20 ns;
			rst_TB <= '0';
			en_TB <= '1';
			loop
				if en_TB <= '1' then
					X_TB <= test_data(14-clk_cnt);
					if clk_cnt < 14 then
						clk_cnt <= clk_cnt + 1;
					else
						clk_cnt <= 0;
					end if;
					
				else
					X_TB <= '0';
				end if;
				
				
				if en_cnt < 259 then
					en_cnt <= en_cnt + 1;
					if en_cnt >= 239 then
						en_TB <= '0';
					end if;
						
				else
					en_TB <= '1';
					en_cnt <= 0;
				end if;
				wait for 20 ns;
			end loop;
			wait;
	end process;
	
end architecture;