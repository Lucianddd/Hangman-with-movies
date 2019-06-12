library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SUBSTRACTOR is
	port(A:in std_logic_vector(7downto 0);		  
	Y:out std_logic_vector(7 downto 0)
	);
end entity;							  

architecture SUBSTRACTOR_ARCH of SUBSTRACTOR is	  

begin 
	process(A)
	variable temp:std_logic;
	begin
	Y<=A;
	temp:=not A(7);
	Y(7)<=temp;
	end process;
	end architecture;
	