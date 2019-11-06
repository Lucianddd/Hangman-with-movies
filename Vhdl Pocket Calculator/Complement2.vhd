


	



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity COMPLEMENT_2 is
	port(A:in std_logic_vector(7 downto 0);
		Y:out std_logic_vector(7 downto 0)
	);
end entity;

architecture COMPLEMENT_2_ARCH of COMPLEMENT_2 is 

 
begin	
	process(A)
	variable temp : std_logic_vector(7 downto 0);
  begin
      temp:=A;
 
		e1:for i in 0 to 6 loop
		temp(i):= (A(i) xor A(7));	 
	end loop;
	temp:=temp+A(7);
	Y<=temp;   
	end process;
	end architecture;
