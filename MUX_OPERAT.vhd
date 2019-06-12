
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX_OPERATION is
	port(SUM: in std_logic_vector(7 downto 0);
	SUB: in std_logic_vector(7 downto 0);  
	PROD: in std_logic_vector(7 downto 0);  	  
	DIV: in std_logic_vector(7 downto 0); 
	carry1:in std_logic; 
	carry2:in std_logic;
	SEL:in std_logic_vector(3 downto 0);
	Y:out std_logic_vector(8 downto 0)
	);	
end entity;

architecture MUX_OPERAtiON_ARCH of MUX_OPERATION is	   
begin
process(SUM,SUB,PROD,DIV,carry2,carry1,SEL)   
variable temp: std_logic_vector(7 downto 0);

begin	   			  

	
	  if(SEL="0000") then
     Y(8)<='0'; 
    Y(7 downto 0)<=temp;
    else
	Y(8)<='0'; 
	if SEL="0001" then
		Y(7 downto 0)<=SUM;Y(8)<=carry1; 
		temp:=SUM;
		end if;
	
	if SEL="0010" then
		Y(7 downto 0)<=SUB; 
		temp:=SUB;
	end if;	
	
	
	if SEL="0100" then
		Y(7 downto 0)<=PROD;Y(8)<=carry2; 
		temp:=PROD;
	end if;
	
	
	if SEL="1000" then
		Y(7 downto 0)<=DIV;
		temp:=DIV;
	end if;
	
	end if;
		
	
		
		
	--case SEL is 
	--	when "0001" => Y(7 downto 0)<=SUM;Y(8)<=carry1; temp:=SUM;
	--	when "0010" => Y(7 downto 0)<=SUB; temp:=SUB;
	--	when "0100" => Y(7 downto 0)<=PROD;Y(8)<=carry2; temp:=PROD;
	--	when "1000" => Y(7 downto 0)<=DIV; temp:=DIV;
	--	when others => Y(7 downto 0)<=temp;
	--end case;	
	
	   
end process;
end architecture;