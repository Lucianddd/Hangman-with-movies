library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;	

entity DIVIDER is 
	port(A,B:in std_logic_vector(7 downto 0);
	L:out std_logic_vector(7 downto 0);
	Y:out std_logic_vector(7 downto 0);	
	carry3:out std_logic;
	SEL:std_logic_vector(3 downto 0) 
	);
end entity;			   

architecture DIVIDER_ARCH of DIVIDER is
begin
	process(SEL)
	variable des,scz:std_logic_vector(6 downto 0);
	variable nr:std_logic_vector(7 downto 0);	
	variable nr2:std_logic_vector(14 downto 0);
	begin	 
		
		Y<="00000000";
		L<="00000000"; 		
		
		carry3<='0';
		if SEL="1000" then
		if (A(6 downto 0)>0 or A(6 downto 0)<0) and B(6 downto 0)=0 then   
			if A(7)=B(7) then
			Y(7)<='0';
		else
			Y(7)<='1';
		end if;
			carry3<='1';  
			else
			
		
		if (A(6 downto 0)>0 or A(6 downto 0)<0) and (B(6 downto 0)<0 or B(6 downto 0)>0)  then
		nr:=(others=>'0'); 
		des:=A(6 downto 0);
		scz:=B(6 downto 0);	
		for i in 0 to 200 loop
		  if des>=scz then
			des:=des-scz;
			nr:=nr+'1';
			end if;
		end loop;  
		if nr<10 then
		nr2:="0001010"*nr ;
		end if;	  
		if nr>9 then
		nr2:="000000000000000" ; 
		L<=nr;
		end if;
		
		nr2:=nr2+des;  	  
		
		
		Y<=nr2(7 downto 0); 
		
		if A(7)=B(7) then
			Y(7)<='0';
		else
			Y(7)<='1'; 
		end if;	  
		end if;	  
		end if;
		
		end if;
		end process;

end architecture;