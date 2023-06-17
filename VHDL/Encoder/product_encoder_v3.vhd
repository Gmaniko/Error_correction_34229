--Author: Nikolai
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder_v3 is
	port (
		clk : std_logic;
		rst : std_logic;
		X   : in  std_logic;
		C   : out std_logic_vector(255 downto 0)
	);
end entity;

architecture product_encoder_v3_arch of product_encoder_v3 is

	component bch_encoder_v2
		port(
			clk, rst : in std_logic;
			X  : in std_logic_vector(238 downto 0); 
			C  : out std_logic_vector(255 downto 0)
		);
	end component;
	
	
	signal state   : std_logic_vector(0 downto 0);
	signal cnt_in  : integer range 0 to 238;
	signal clk_cnt : integer range 0 to 243;
	signal row_cnt : integer range 0 to 238;
	signal col_cnt : integer range 0 to 238;
	signal X_row   : std_logic_vector(238 downto 0);
	signal X_col   : std_logic_vector(238 downto 0);
	signal out1    : std_logic_vector(255 downto 0);
	
	type MAT_type is array (0 to 238) of std_logic_vector(0 to 255);
	signal MAT1, MAT2 : MAT_type;

begin	

	bch_enc_row : bch_encoder_v2 port map(clk, rst, X_row, out1);
	bch_enc_col : bch_encoder_v2 port map(clk, rst, X_col, C);
	

	row_proc : process (clk,rst)
		begin
			if rst = '1' then
				state   <= "0";
				cnt_in  <= 0;
				clk_cnt <= 0;
				X_row <= (others => '0');
				X_col <= (others => '0');
				row_cnt <= 0;
				col_cnt <= 0;
			elsif rising_edge(clk) then
				X_row(238 - cnt_in) <= X;
				
				if cnt_in < 238 then
					cnt_in <= cnt_in + 1;
				else
					cnt_in <= 0;
					-- X_row <= (others => '0');
				end if;
				
				if state = "0" then
					X_col(238 - col_cnt) <= MAT2(col_cnt)(row_cnt);
				else
					X_col(238 - col_cnt) <= MAT1(col_cnt)(row_cnt);
				end if;
				
				if col_cnt < 238 then
					col_cnt <= col_cnt + 1;
				else
					col_cnt <= 0;
				end if;
				
				if clk_cnt < 243 then
					clk_cnt <= clk_cnt + 1;
				elsif clk_cnt = 243 then
					if state = "0" then
						MAT1(row_cnt) <= out1;
					else
						MAT2(row_cnt) <= out1;
					end if;
					if row_cnt = 238 then
						row_cnt <= 0;
						state <= state + 1;
						col_cnt <= 0;
					else
						row_cnt <= row_cnt + 1;
					end if;
					clk_cnt <= 5;
				end if;
				
			end if;
	end process;
	
	
end architecture;