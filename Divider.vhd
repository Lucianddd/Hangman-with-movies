
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 

entity divi is
	port (CLOCK:in std_logic;
	clk:out std_logic
	);
end entity;

architecture div of divi is
begin
	process(CLOCK)
		variable a:integer:=0;
	variable b:std_logic:='0';
	begin
	if(CLOCK='1' and CLOCK'EVENT)	then
		a:=a + 1; 
		end if;
	if a=200000 and b='0' then	 
		a:=0; b:='1';
	elsif a=200000 and b='1' then
		a:=0; b:='0';  
	end if;
	clk<=b;	
	
	end process;
end architecture;
