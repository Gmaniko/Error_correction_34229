LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Synch is
	port( 
		input  : in std_logic_vector(524 downto 0); --takes two inputs at a time
		output : out std_logic_vector(254 downto 0)
	);
end entity;

architecture Synch_arch of Synch is

--Start Pattern:  01100101
signal PatternMatchCnt,start : integer;
signal head1,tail2 : integer; --head look for start pattern
signal tempmsg1, tempmsg2part1, tempmsg2part2 : std_logic_vector(254 downto 0);

begin

MatchPattern : process(input)
begin
	if (input(head1 downto head1-7) = "01100101") then
		PatternMatchCnt <= PatternMatchCnt + 1; --Found Match
		tempmsg1 <= input(head1-8 downto head1-8-254); --prep to output foundmsg
		if (input(head1-8-254-1 downto head1-8-254-8) = "01100101") then --Found first part of second msg
			tempmsg2part1(head1-8-254-9 downto 0) <= input(head1-8-254-9 downto 0); --prep second msg
			tail2 <= 524-(524-(head1-8-254-9));
		end if;
		tempmsg2part2(524 downto tail2) <= input(524 downto tail2);
	else
		PatternMatchCnt <= 0; -- No Match
		if (head1 > 254+8) then --Move head
			head1 <= head1-1;
		else
			head1 <= 524;
		end if;
	end if;
end process;

outputter : process -- så skal den output 2 for hver input
begin
output <= tempmsg2part1 xor tempmsg2part2;
wait for 1 ns;
output <= tempmsg1;
end process;

end architecture;


