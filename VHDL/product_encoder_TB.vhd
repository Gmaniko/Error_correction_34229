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
	
	component product_encoder
		port(
			clk : std_logic;
			rst : std_logic;
			X   : in std_logic_vector(238 downto 0); 
			C   : out std_logic_vector(255 downto 0)
		);
	end component;
	
	signal clk_TB : std_logic;
  signal rst_TB : std_logic;
	signal clk_cnt : integer range 0 to 495;
	signal X_TB : std_logic_vector(238 downto 0);
	signal C_TB : std_logic_vector(255 downto 0);
	
begin
	
	
	DUT : product_encoder port map (clk_TB, rst_TB, X_TB, C_TB);
	
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
			
			rst_TB <= '1';
			wait for 20 ns;
			while clk_cnt < 494 loop
				rst_TB <= '0';
				if not endfile(Fin) then --Reads input
					readline(Fin, current_read_line);
					read(current_read_line, X_var);
					X_TB <= X_var;
				end if;
				
				if clk_cnt > 238 then --Writes output
					write(current_write_line, C_TB);
					writeline(Fout, current_write_line);
				end if;
				
				wait for 20 ns;
				clk_cnt <= clk_cnt + 1;
			end loop;
			
			wait;
	end process;
	
end architecture;