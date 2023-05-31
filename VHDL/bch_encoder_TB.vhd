library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity bch_encoder_TB is
end entity;


architecture arch of bch_encoder_TB is

	component bch_encoder
		port(
			clk, rst : in std_logic;
			X  : in std_logic_vector(238 downto 0); 
			C : out std_logic_vector(255 downto 0)
		);
	end component;
	
	
	signal clk_TB : std_logic;
  signal rst_TB : std_logic;
	signal X_TB : std_logic_vector(238 downto 0);
	signal C_TB : std_logic_vector(255 downto 0);
	signal C_temp : std_logic_vector(255 downto 0);
	signal ok_cnt : integer range 0 to 239;
	signal clk_cnt : integer range 0 to 239;
	
	begin
	
	
	DUT : bch_encoder port map (clk_TB, rst_TB, X_TB, C_TB);
	
	CLKPROC : process
  begin
    clk_TB <= '0';
    wait for 10 ns;
    clk_TB <= '1';
    wait for 10 ns;
  end process;
	
	STIMULUS : process
	
		file X_data : TEXT open READ_MODE is "bch_enc_test_X.txt";
		file C_data : TEXT open READ_MODE IS "bch_enc_test_C.txt";
		variable current_X_line : line;
		variable current_C_line : line;
		variable current_write_line : line;
		variable X_var : std_logic_vector(238 downto 0);
		variable C_var : std_logic_vector(255 downto 0);
		begin
		
			while clk_cnt < 238 loop
				if not endfile(X_data) then
					readline(X_data, current_X_line);
					read(current_X_line, X_var);
					X_TB <= X_var;
				end if;
				if not endfile(C_data) then
					readline(C_data, current_C_line);
					read(current_C_line, C_var);
					C_temp <= C_var;
				end if;

				wait for 20 ns;
				
				clk_cnt <= clk_cnt + 1;
				write(current_write_line, string'("Calc: "));
				write(current_write_line, C_TB);
				writeline(OUTPUT,current_write_line);
				write(current_write_line, string'("Data: "));
				write(current_write_line, C_temp);
				writeline(OUTPUT,current_write_line);
				if C_temp = C_TB then
						ok_cnt <= ok_cnt + 1;
				end if;
			end loop;
			
			wait for 20 ns;
			write(current_write_line, string'("Correctly encoded messages: "));
			write(current_write_line, ok_cnt);
			writeline(OUTPUT, current_write_line);
			wait;
	end process;
	
end architecture;