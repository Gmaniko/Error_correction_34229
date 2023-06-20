LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity Syndrome1Calc8bitPipe is
port( 
 clock : in std_logic;
 input : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
end entity;
 architecture Syndrome1Calc8bitPipe_arch of Syndrome1Calc8bitPipe is


component Syndrome1Calc8bitPipe1 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe2 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe3 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe4 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe5 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe6 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe7 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe8 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe9 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe10 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe11 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe12 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe13 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe14 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe15 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe16 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe17 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe18 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe19 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe20 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe21 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe22 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe23 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe24 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe25 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe26 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe27 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe28 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe29 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe30 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe31 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
component Syndrome1Calc8bitPipe32 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
 end component;
signal u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12, u13, u14, u15, u16, u17, u18, u19, u20, u21, u22, u23, u24, u25, u26, u27, u28, u29, u30, u31, u32 : std_logic_vector(7 downto 0);
signal t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32 : std_logic_vector(7 downto 0);

signal counter : integer range 1 to 32;

begin


process(clock, u32)
begin
if (clock'event and clock = '1') then
output <= u1  + u2 + u3 + u4 + u5 + u6 + u7 + u8 + u9 + u10 + u11 + u12 + u13 + u14 + u15 + u16 + u17 + u18 + u19 + u20 + u21 + u22 + u23 + u24 + u25 + u26 + u27 + u28 + u29 + u30 + u31 + u32;
end if;
end process;


process(clock, input)
begin
if (clock'event and clock = '1') then
if (counter = 32) then
	counter <= 1;
	t32 <= input;
else
	counter <= counter + 1;
	
	if (counter = 1) then
		t1 <= input;
	end if;
	if (counter = 2) then
		t2 <= input;
	end if;
	if (counter = 3) then
		t3 <= input;
	end if;
	if (counter = 4) then
		t4 <= input;
	end if;
	if (counter = 5) then
		t5 <= input;
	end if;
	if (counter = 6) then
		t6 <= input;
	end if;
	if (counter = 7) then
		t7 <= input;
	end if;
	if (counter = 8) then
		t8 <= input;
	end if;
	if (counter = 9) then
		t9 <= input;
	end if;
	if (counter = 10) then
		t10 <= input;
	end if;
	if (counter = 11) then
		t11 <= input;
	end if;
	if (counter = 12) then
		t12 <= input;
	end if;
	if (counter = 13) then
		t13 <= input;
	end if;
	if (counter = 14) then
		t14 <= input;
	end if;
	if (counter = 15) then
		t15 <= input;
	end if;
	if (counter = 16) then
		t16 <= input;
	end if;
	if (counter = 17) then
		t17 <= input;
	end if;
	if (counter = 18) then
		t18 <= input;
	end if;
	if (counter = 19) then
		t19 <= input;
	end if;
	if (counter = 20) then
		t20 <= input;
	end if;
	if (counter = 21) then
		t21 <= input;
	end if;
	if (counter = 22) then
		t22 <= input;
	end if;
	if (counter = 23) then
		t23 <= input;
	end if;
	if (counter = 24) then
		t24 <= input;
	end if;
	if (counter = 25) then
		t25 <= input;
	end if;
	if (counter = 26) then
		t26 <= input;
	end if;
	if (counter = 27) then
		t27 <= input;
	end if;
	if (counter = 28) then
		t28 <= input;
	end if;
	if (counter = 29) then
		t29 <= input;
	end if;
	if (counter = 30) then
		t30 <= input;
	end if;
	if (counter = 31) then
		t31 <= input;
	end if;

end if;
end if;


end process;

dut1 : Syndrome1Calc8bitPipe1
port map(
R => t1,
output => u1
);
dut2 : Syndrome1Calc8bitPipe2
port map(
R => t2,
output => u2
);
dut3 : Syndrome1Calc8bitPipe3
port map(
R => t3,
output => u3
);
dut4 : Syndrome1Calc8bitPipe4
port map(
R => t4,
output => u4
);
dut5 : Syndrome1Calc8bitPipe5
port map(
R => t5,
output => u5
);
dut6 : Syndrome1Calc8bitPipe6
port map(
R => t6,
output => u6
);
dut7 : Syndrome1Calc8bitPipe7
port map(
R => t7,
output => u7
);
dut8 : Syndrome1Calc8bitPipe8
port map(
R => t8,
output => u8
);
dut9 : Syndrome1Calc8bitPipe9
port map(
R => t9,
output => u9
);
dut10 : Syndrome1Calc8bitPipe10
port map(
R => t10,
output => u10
);
dut11 : Syndrome1Calc8bitPipe11
port map(
R => t11,
output => u11
);
dut12 : Syndrome1Calc8bitPipe12
port map(
R => t12,
output => u12
);
dut13 : Syndrome1Calc8bitPipe13
port map(
R => t13,
output => u13
);
dut14 : Syndrome1Calc8bitPipe14
port map(
R => t14,
output => u14
);
dut15 : Syndrome1Calc8bitPipe15
port map(
R => t15,
output => u15
);
dut16 : Syndrome1Calc8bitPipe16
port map(
R => t16,
output => u16
);
dut17 : Syndrome1Calc8bitPipe17
port map(
R => t17,
output => u17
);
dut18 : Syndrome1Calc8bitPipe18
port map(
R => t18,
output => u18
);
dut19 : Syndrome1Calc8bitPipe19
port map(
R => t19,
output => u19
);
dut20 : Syndrome1Calc8bitPipe20
port map(
R => t20,
output => u20
);
dut21 : Syndrome1Calc8bitPipe21
port map(
R => t21,
output => u21
);
dut22 : Syndrome1Calc8bitPipe22
port map(
R => t22,
output => u22
);
dut23 : Syndrome1Calc8bitPipe23
port map(
R => t23,
output => u23
);
dut24 : Syndrome1Calc8bitPipe24
port map(
R => t24,
output => u24
);
dut25 : Syndrome1Calc8bitPipe25
port map(
R => t25,
output => u25
);
dut26 : Syndrome1Calc8bitPipe26
port map(
R => t26,
output => u26
);
dut27 : Syndrome1Calc8bitPipe27
port map(
R => t27,
output => u27
);
dut28 : Syndrome1Calc8bitPipe28
port map(
R => t28,
output => u28
);
dut29 : Syndrome1Calc8bitPipe29
port map(
R => t29,
output => u29
);
dut30 : Syndrome1Calc8bitPipe30
port map(
R => t30,
output => u30
);
dut31 : Syndrome1Calc8bitPipe31
port map(
R => t31,
output => u31
);
dut32 : Syndrome1Calc8bitPipe32
port map(
R => t32,
output => u32
);
end architecture;

