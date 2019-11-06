library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




library ieee;
use ieee.std_logic_1164.all;

entity full_adder_con is

  port (
    a, b, c : in  std_logic;            -- inputs
    sum, ca : out std_logic);           -- sum & carry

end full_adder_con;

architecture beh of full_adder_con is

begin  -- beh

      sum <= '0' when a = '0' and b = '0' and c ='0' else
             '1' when a = '0' and b = '0' and c ='1' else
             '1' when a = '0' and b = '1' and c ='0' else
             '0' when a = '0' and b = '1' and c ='1' else
             '1' when a = '1' and b = '0' and c ='0' else
             '0' when a = '1' and b = '0' and c ='1' else
             '0' when a = '1' and b = '1' and c ='0' else
             '1' when a = '1' and b = '1' and c ='1' else
             'X';
     ca   <= '0' when a = '0' and b = '0' and c ='0' else
             '0' when a = '0' and b = '0' and c ='1' else
             '0' when a = '0' and b = '1' and c ='0' else
             '1' when a = '0' and b = '1' and c ='1' else
             '0' when a = '1' and b = '0' and c ='0' else
             '1' when a = '1' and b = '0' and c ='1' else
             '1' when a = '1' and b = '1' and c ='0' else
             '1' when a = '1' and b = '1' and c ='1' else
             'X';

end beh;

library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity rc_adder is
port ( a : in std_logic_vector(7 downto 0);
 b : in std_logic_vector(7 downto 0);
 cin : in std_logic;					
 sum : out std_logic_vector(7 downto 0);
 cout : out std_logic);
end rc_adder;

architecture structural of rc_adder is

component full_adder_con is
  port (
    a, b, c : in  std_logic;            -- inputs
    sum, ca : out std_logic);           -- sum & carry
end component;
signal carry : std_logic_vector(6 downto 0);

begin

U1 : full_adder_con port map (a(0),b(0),cin,sum(0),carry(0));
U2 : for i in 1 to 5 generate
U3 : full_adder_con port map (a(i),b(i),carry(i-1),sum(i),carry(i));
end generate;												   
U4 : full_adder_con port map (a(6),b(6),carry(5),sum(6),carry(6));
U5 : full_adder_con port map (a(7),b(7),carry(6),sum(7),open);
process(A,B)  
variable var1: std_logic_vector(9 downto 0);
variable var2: std_logic_vector(9 downto 0);
variable var3: std_logic_vector(9 downto 0);


begin	
	cout<='0';
	for i in 9 downto 0 loop	 
		var1(i):='0';
		var2(i):='0';
		var3(i):='0';
		end loop;
	var1(6 downto 0):=a(6 downto 0); 
	var2(6 downto 0):=b(6 downto 0);
	var3:= var1+var2;
if A(7)='0' and B(7)='0' then
if var3 > 127 then
	cout<='1';
	else 
	cout<='0';
	end if;	 
	end if;
if var3(7)='1' then
	if(not var3(6 downto 0)-'1')>126 then
		cout<='1';
	end if;
end if;


end process; 

end structural;	 

