
	library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SEGMENT is
	port(BCD_IN:in std_logic_vector(3 downto 0);
	SEG_OUT:out std_logic_vector(6 downto 0)
	);
end entity;

architecture SEGMENT_ARCH of SEGMENT is

begin
	with BCD_IN select SEG_OUT <=
	"1000000" when "0000",	-- 0
	"1111001" when "0001",	-- 1
	"0100100" when "0010",	-- 2
	"0110000" when "0011",	-- 3
	"0011001" when "0100",	-- 4
	"0010010" when "0101",	-- 5
	"0000010" when "0110",	-- 6
	"1111000" when "0111",	-- 7
	"0000000" when "1000",	-- 8
	"0010000" when "1001",	-- 9
	"0111111" when "1111",	-- '-'
	"1111111" when "1110",	-- stins
	"0000110" when "1010", 	-- E
	"1001111" when "1011", 	-- I
	"0101011" when "1100",	-- n  
	"0001110" when "1101",	-- F 
	"0000100" when others;

end architecture;	   
