--Author: Nikolai
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder_v3 is
	port (
		clk : in std_logic;
		rst : in std_logic;
		en  : in std_logic;
		X   : in  std_logic;
		C   : out std_logic_vector(255 downto 0)
	);
end entity;

architecture product_encoder_v3_arch of product_encoder_v3 is

	component bch_encoder_v2
		port(
			clk, rst : in std_logic;
			X  : in std_logic_vector(238 downto 0); 
			P  : out std_logic_vector(16 downto 0)
		);
	end component;
	
	component PISO_SR 
		port (
			clk : in std_logic;
			rst : in std_logic;
			D   : in std_logic_vector(16 downto 0);
			WS  : in std_logic;
			Q   : out std_logic
		);
	end component;
	
	
	signal state   : std_logic_vector(0 downto 0);
	signal cnt_in  : integer range 0 to 238;
	signal clk_cnt : integer range 0 to 260;
	signal row_cnt : integer range 0 to 238;
	signal col_cnt : integer range 0 to 238;
	signal X_row   : std_logic_vector(238 downto 0);
	signal X_col   : std_logic_vector(238 downto 0);
	signal P_out   : std_logic_vector(16 downto 0);
	signal out1    : std_logic_vector(16 downto 0);
	
	signal ws : std_logic;
	signal p  : std_logic;
	
	signal RAM0, RAM1 : std_logic_vector(0 to 61183);
	-- type RAM_type is array (0 to 61183) of std_logic;
	-- signal RAM0, RAM1 : RAM_type;
	
begin	

	ws <= not en;
	C <= X_col & P_out;
	
	
	bch_enc_row : bch_encoder_v2 port map(clk, rst, X_row, out1);
	bch_enc_col : bch_encoder_v2 port map(clk, rst, X_col, P_out);
	
	piso_sr0 : PISO_SR port map(clk, rst, out1, ws, p);

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
				if en = '1' then
					X_row(238 - cnt_in) <= X;
					
					if cnt_in < 238 then
						cnt_in <= cnt_in + 1;
						-- ws <= '0';
					else
						cnt_in <= 0;
						-- ws <= '1';
					end if;
					
					if state = "0" then
						X_col(238 - col_cnt) <= RAM1(256*col_cnt + row_cnt);
						
						RAM0(256*row_cnt + col_cnt) <= X;
					else
						X_col(238 - col_cnt) <= RAM0(256*col_cnt + row_cnt);
						
						RAM1(256*row_cnt + col_cnt) <= X;
					end if;
				
					if col_cnt < 238 then
						col_cnt <= col_cnt + 1;
					else
						col_cnt <= 0;
						
					end if;
				end if;
				
				
				if clk_cnt < 259 then
					clk_cnt <= clk_cnt + 1;

					if clk_cnt > 241 then
						if state = "0" then
							RAM0(256*row_cnt + (clk_cnt-3)) <= p;
						elsif state = "1" then
							RAM1(256*row_cnt + (clk_cnt-3)) <= p;
						end if;
					end if;
				else
					if row_cnt = 238 then
						row_cnt <= 0;
						state <= state + 1;
						col_cnt <= 0;
					else
						row_cnt <= row_cnt + 1;
					end if;
					clk_cnt <= 0;
					cnt_in <= 0;
					col_cnt <= 0;
				end if;
				
			end if;
	end process;
	
	
end architecture;