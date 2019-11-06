				

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity DECODER_2 is
	port(A:in std_logic_vector(1 downto 0);
		R:out std_logic_vector(3 downto 0)
	);
end entity;

architecture DECODER_2_ARH of DECODER_2 is 

begin  		 
	process(A)	
	begin
		if A="00" then
			R<="1110";
		end if;
		if A="01" then
			R<="1101";
		end if;
		if A="10" then
			R<="1011";
		end if;
		if A="11" then
			R<="0111";
		end if;
		
	
	end process;
	
	end architecture;
	
