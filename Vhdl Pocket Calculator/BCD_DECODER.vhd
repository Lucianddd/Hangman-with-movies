
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;  

entity DECODER is
	port (A:IN STD_LOGIC_VECTOR(8 downto 0);
		carry:in std_logic;
		P:out std_logic_vector(15 downto 0)
	);
end entity;

architecture DECODER_ARCH of DECODER is	 
begin	   
		   
	process(A) 
		variable z:STD_logic_vector(24 downto 0);
	begin	   	 
	if(carry='1') then
		if(A(7)='1') then
			P<="1111101111001101";	
		else
			P<="1110101111001101";
		end if;
		else
		
	if A(8)='1' then
		P<="1010101010101010";	 
		else

		for i in 0 to 24 loop
			z(i) :='0';
		end loop;
		z(10 downto 4) := A(6 downto 0);
		for i in 0 to 3 loop
			if z(11 downto 8)>4 then
				z(11 downto 8):= z(11 downto 8) + 3;
			end if;
			if z(15 downto 12)>4 then
				z(15 downto 12):=z(15 downto 12) + 3;
			end if;
			z(20 downto 1):=z(19 downto 0);
		end loop;		   
		
		
		if(a(7)='1')then
		z(23 downto 20):="1111";	 
		end if;	
		if(a(7)='0')then
		z(23 downto 20):="1110";	 										
		end if;
		P <= z(23 downto 8);
		
		end if;
		end if;
	end process;
end architecture;
