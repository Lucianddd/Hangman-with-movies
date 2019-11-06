
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;  

entity MUX is
	port( A:in std_logic_vector(15 downto 0);
	S:in std_logic_vector(1 downto 0);
	O:out std_logic_vector(3 downto 0)
	);
end entity;																		

architecture MUX_ARCH of MUX is	

begin	  
	
	process(S,A)	
	begin
	if (S="00") then
		O<=A(3 downto 0);	
	end if;	
	if S="01" then
		O<=A(7 downto 4);		
		end if;	
	if S="10" then
		O<=A(11 downto 8);	   
		end if;	
	if S="11" then
		O<=A(15 downto 12); 
	
	end if;	
	
	
	
	end process;
	
	end architecture;
