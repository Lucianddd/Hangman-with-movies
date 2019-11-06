library ieee;  
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FA1 is
	port(A,B,CIN:in bit;
	COUT,S:out bit);
end entity;

architecture ADDER1 of FA1 is
begin
	S<=A xor B xor CIN;
	COUT<= (A and B) or (CIN and (A xor B));
end architecture;   	

entity FAN is
	generic(N:natural:=4);
	port(A,B:in bit_vector(N-1 downto 0);
	S:out bit_vector(N-1 downto 0);
	CIN:in bit;
	COUT:out bit);
end entity;

architecture ADDER_N of FAN is
component FA1 is
	port(A,B,CIN:in bit;
	COUT,S:out bit);
end	component;

signal Int:bit_vector (0 to N-2);

begin
	Et1: for i in 0 to N-1 generate
		Et2:if i=0 generate
			Et3: FA1 port map(A(i),B(i),CIN,Int(i),S(i));
		end generate;
		Et3: if i>0 and i<N-1 generate
			Et5:FA1 port map (A(i),B(i),Int(i-1),Int(i),S(i));
		end generate;
		Et6: if i=N-1 generate
			Et7:Fa1 port map (A(i),B(i),Int(i-1),COUT,S(i));
		end generate;
	end generate;
	end architecture;
