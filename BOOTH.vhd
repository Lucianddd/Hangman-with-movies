library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BOOTH is
	port(A,B:in std_logic_vector(7 downto 0);
	Y:out std_logic_vector(7 downto 0);	  
	carry:out std_logic
	);		
end entity;

architecture BOOTH_ARCH of BOOTH is
begin	  
	
	process(A,B)	
	variable br,nbr:std_logic_vector(7 downto 0);
	variable mul: std_logic_vector(15 downto 0);
	variable qn1:std_logic;
	begin		
		carry<='0';
		mul(15 downto 8):=(others=>'0');  
		mul(7 downto 0):=A;
		br:=B;
		nbr:=(not B)+'1';	
		qn1:='0';
		
		loop1: for i in 7 downto 0 loop
			if(mul(0)='0' and qn1='0') then
				qn1:=mul(0);
				mul(14 downto 0):= mul(15 downto 1); 
			elsif (mul(0)='0' and qn1='1') then
				mul(15 downto 8):=mul (15 downto 8) +br;
				qn1:=mul(0);
				mul(14 downto 0):= mul(15 downto 1);
			elsif(mul(0)='1' and qn1='0') then
				mul(15 downto 8):=mul (15 downto 8) +nbr;
				qn1:=mul(0);
				mul(14 downto 0):= mul(15 downto 1);
			elsif(mul(0)='1' and qn1='1') then
				qn1:=mul(0);
				mul(14 downto 0):= mul(15 downto 1);
			end if;
			end loop loop1;
			if(A(6 downto 0)*B(6 downto 0) >127) then
				carry<='1';
			else 
				carry<='0';
			end if;
			Y(6 downto 0)<=mul(6 downto 0);
			y(7)<=mul(15);
			
			
		end process;
			
	end architecture;