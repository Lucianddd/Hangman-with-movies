library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity COUNTER2bit is
	port(clk:in std_logic;
	Q:out std_logic_vector(1 downto 0)
	);		
	end entity;
	
architecture COUNTER2bit_ARCH of COUNTER2bit is

begin				 						   
	 
	process(clk)							   
	variable A:std_logic_vector(1 downto 0):="00"; 
	begin 
		if clk='1' and clk'EVENT then
			A:= A + '1';
		end if;
		Q<= A;	
	end process;
	
end architecture;