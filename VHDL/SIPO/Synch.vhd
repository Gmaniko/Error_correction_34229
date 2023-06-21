LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Synch is
	port( 
		input  : in std_logic;
		clock  : in std_logic;
		output : out std_logic_vector(254 downto 0)
	);
end entity;

architecture Synch_arch of Synch is

signal StartPattern : std_logic_vector (31 downto 0) := "00011010110011011101110000011101"; --  (1ACDDC1D in hex)

signal padd_pre : std_logic_vector (2 downto 0) := "000";
signal current : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal padd_post : std_logic_vector (2 downto 0) := "000";
signal tmp : std_logic_vector (37 downto 0) := "00000000000000000000000000000000000000";
signal output_tmp : std_logic_vector (254 downto 0);
signal memory : std_logic_vector (289 downto 0);
signal synch_state : std_logic;
signal synch_regained : std_logic;
signal output_state : std_logic;
signal testFound : std_logic := '0';
signal testSig : integer := 0;
signal testSig2 : integer := 0;
signal testSig3 : integer := 0;

type oldPos_arr is array (0 to 4) of integer;
type check_arr is array (0 to 4) of integer;


signal total : integer := 0;
signal arrPos : integer := 0;
signal memSize : integer := 5;
signal oldPos : oldPos_arr := (0, 0, 0, 0, 0);
signal check : check_arr := (0, 0, 0, 0, 0);
--signal current : current_arr := ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
signal mem : integer := 0;
signal found : integer := -1;
--signal new_v : integer := 1;
signal missed : integer := 0;
signal bitErr : integer := 0;
signal tries : integer := 0;
signal restart : integer := 0;
signal number : integer := 0;
signal neededIndex : integer := 0;


begin

PatternMatchState : process(clock,input)

	variable new_v : integer := 1;
	variable testVar : integer := 0;
	variable testVar2 : integer := 0;
	variable testVar3 : integer := 0;
	--variable reportInt : integer := 0;
	--variable StartPatternInt : integer := 0;

begin
	if rising_edge(clock) then

		testSig <= testVar;
		testSig2 <= testVar2;
		testSig3 <= testVar3;
		
		if found /= -1 then
			neededIndex <= arrPos - oldPos(found);
		end if;
		
		

		if current = StartPattern then
			testFound <= '1';
			number <= number + 1;
		else
			testFound <= '0';
		end if;
		if arrPos > 31 then
			if input = 'U' then
				padd_post <= current(0) & padd_post(2 downto 1);
				current <= padd_pre(0) & current(31 downto 1);
				padd_pre <= '0' & padd_pre(2 downto 1);
			else
				padd_post <= current(0) & padd_post(2 downto 1);
				current <= padd_pre(0) & current(31 downto 1);
				padd_pre <= input & padd_pre(2 downto 1);
			end if;
		
		else
			if input = 'U' then
				current <= '0' & current(31 downto 1);
			else
				current <= input & current(31 downto 1);
			end if;
			
		end if;
		
		memory <= input & memory(289 downto 1);
		
		-- searching for synchronisation
		
		if found = -1 then

			synch_state <= '0';
			
			if restart = 1 then 
			
				mem <= 0;
				
			end if;
			
			if current = StartPattern then

				if total = 0 then 
	
					oldPos(0) <= arrPos;
					check(0) <= 1;
					mem <= 1;
					
				else
				
					l_memory : for i in 0 to mem-1 loop
					
						testVar := 1;
						
						if arrPos = oldPos(i) + 287 then
						
							testVar2 := 1;
							
							check(i) <= check(i) + 1;
							oldPos(i) <= arrPos;
							new_v := 0;
							
							if check(i) >= 5 then
							
								found <= i;
								
							end if;
							
						end if;
						
					end loop l_memory;
					
				end if;

	
				--total <= total + 1;
	
				if new_v = 1 then
					if mem /= memSize - 1 then
						
						mem <= mem + 1;
						oldPos(mem) <= arrPos;
						check(mem) <= check(mem) + 1;
						
						testVar3 := testVar3 + 1;
						
					end if;
				end if;
				
				--report 
				--"new_v=" & integer'image(new_v) & 
				--"; arrPos=" & integer'image(arrPos) & 
				--"; testVar=" & integer'image(testVar) &
				--"; testVar2=" & integer'image(testVar2) &
				--"; oldPos(0)=" & integer'image(oldPos(0)) &
				--"; total=" & integer'image(total);

				total <= total + 1;
				testVar2 := 0;
				testVar := 0;
				new_v := 1;
			end if;
			
		-- synchronised
		else			
			restart <= 0;
			
			synch_regained <= '0';
			
			if arrPos = oldPos(found) + 287 then
			
				if current = StartPattern then
				
					check(found) <= check(found) + 1;
					
				else
				
					missed <= missed + 1;
					synch_state <= '0';
					
				end if;
				
				if check(found) < 5 then
				
					tries <= tries + 1;
					
					if tries = 5 then
					
						found <= -1;
						restart <= 1;
						
					end if;
				end if;
				
				if restart = 0 then
				
					if check(found) = 5 and bitErr /= 0 then
					
						synch_state <= '1';
						synch_regained <= '1';
						bitErr <= 0;
						missed <= 0;
						tries <= 0;
						
					elsif check(found) >= 5 and missed = 0 then
						synch_state <= '1';
					end if;
		
					--oldPos(found) <= arrPos;
					
					if missed = 5 then
					
						synch_regained <= '0';
					
						--tries <= 0;
						
						tmp <= padd_pre(2 downto 0) & current(31 downto 0) & padd_post(2 downto 0);
						
						l_bitShift : for j in -3 to 3 loop
							report "loop, j=" & integer'image(j);
							if tmp(34+j downto 3+j) = StartPattern and synch_regained = '0' then
								
								oldPos(found) <= oldPos(found) + j;
								bitErr <= j;
								synch_regained <= '1';
								synch_state <= '1';
								current <= tmp(34+j downto 3+j);
								
							end if;	
						end loop l_bitShift;
						
						missed <= 0;
						check(found) <= 0;
						
					end if;

					if synch_state = '1' and synch_regained <= '0' then
						--reportInt := to_integer(unsigned(memory(286 downto 255)));
						--StartPatternInt := to_integer(unsigned(StartPattern(31 downto 0)));
						--report "output state test: arrPos=" & integer'image(arrPos) & "; output_tmp= " & integer'image(reportInt) & "; StartPattern=" & integer'image(StartPatternInt);
						if memory(286 downto 255) = StartPattern then
							--report "test";
							output_state <= '1';
							output_tmp <= memory(254 downto 0);
						--else
							--output_state <= '0';
						end if;
					end if;
				end if;
				oldPos(found) <= arrPos + bitErr;

			elsif output_state = '1' then
				output_state <= '0';
			end if;
		end if;
		
		arrPos <= arrPos + 1;
	
	end if;
end process;

SIPOprocess : process(clock,input)
begin
	if rising_edge(clock) then
		if output_state = '1' then
			output <= output_tmp;
			--output_state <= '0';
		end if;
	end if;
end process;
end architecture;
