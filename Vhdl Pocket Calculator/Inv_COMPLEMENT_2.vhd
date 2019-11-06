library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity INV_COMPLEMENT_2 is
	port(A:in std_logic_vector(7 downto 0);
		Y:out std_logic_vector(7 downto 0)
	);
end entity;

architecture INV_COMPLEMENT_2_ARCH of INV_COMPLEMENT_2 is 

 
begin	
	process(A)
	variable temp : std_logic_vector(7 downto 0);
  begin
      temp:=A;

 	  temp:=temp-A(7);
		e1:for i in 0 to 6 loop
		temp(i):= (temp(i) xor A(7));	 
	end loop;
	
	Y<=temp;   
	end process;
	end architecture;
