 library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity MAIN is
	port(CLOCK:in std_logic; 
	A:IN STD_LOGIC_VECTOR(7 downto 0);
	B:IN STD_LOGIC_VECTOR(7 downto 0);
	SEL:in std_logic_vector(3 downto 0);
	SEG_OUT1:out std_logic_vector(6 downto 0);
	LED:out std_logic_vector(7 downto 0); 
	R1:out std_logic_vector(3 downto 0)
	);		
	end entity;
	
architecture MAIN_ARCH of MAIN is  
signal SUM: std_logic_vector(7 downto 0);  
signal SUM1: std_logic_vector(7 downto 0); 
signal SUB: std_logic_vector(7 downto 0);
signal SUB1: std_logic_vector(7 downto 0);		
signal PROD: std_logic_vector(7 downto 0);
signal DIV: std_logic_vector(7 downto 0);
signal B_neg: std_logic_vector(7 downto 0);
signal B_negC: std_logic_vector(7 downto 0);
signal Y: std_logic_vector(8 downto 0);
signal DECODED:std_logic_vector(15 downto 0);
signal clk:std_logic; 
signal C2bit:std_logic_vector(1 downto 0); 
signal choice:std_logic_vector(3 downto 0);	
signal A1: STD_LOGIC_VECTOR(7 downto 0);
signal B1: STD_LOGIC_VECTOR(7 downto 0);
signal SEL1: STD_LOGIC_VECTOR(3 downto 0);
signal carry1:std_logic;
signal carry2:std_logic;		
signal carry3:std_logic;

component MUX_OPERATION is
	port(SUM: in std_logic_vector(7 downto 0);
	SUB: in std_logic_vector(7 downto 0);  
	PROD: in std_logic_vector(7 downto 0);  	  
	DIV: in std_logic_vector(7 downto 0); 
	carry1:in std_logic; 
	carry2:in std_logic;
	SEL:in std_logic_vector(3 downto 0);
	Y:out std_logic_vector(8 downto 0)
	);	
end component; 

component COMPLEMENT_2 is
	port(A:in std_logic_vector(7 downto 0);
		Y:out std_logic_vector(7 downto 0)
	);
end component;	 

component INV_COMPLEMENT_2 is
	port(A:in std_logic_vector(7 downto 0);
		Y:out std_logic_vector(7 downto 0)
	);
end component;

component rc_adder is
port ( a : in std_logic_vector(7 downto 0);
 b : in std_logic_vector(7 downto 0);
 cin : in std_logic;
 sum : out std_logic_vector(7 downto 0);
 cout : out std_logic);
end component;

component SUBSTRACTOR is
	port(A:in std_logic_vector(7downto 0);		  
	Y:out std_logic_vector(7 downto 0)
	);
end component;	

component BOOTH is
	port(A,B:in std_logic_vector(7 downto 0);
	Y:out std_logic_vector(7 downto 0);	  
	carry:out std_logic
	);		
end component;	

component DIVIDER is 
	port(A,B:in std_logic_vector(7 downto 0);
	L:out std_logic_vector(7 downto 0);
	Y:out std_logic_vector(7 downto 0);
	carry3:out std_logic;
	SEL:std_logic_vector(3 downto 0)
	);
end component;


component DECODER is
	port (A:IN STD_LOGIC_VECTOR(8 downto 0);
		carry:in std_logic;
		P:out std_logic_vector(15 downto 0)
	);
end 	component;

component divi is
	port (CLOCK:in std_logic;
	clk:out std_logic
	);
end component;

component register4 IS PORT(
    d   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLOCK:std_logic;
    q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
);
END component;

component COUNTER2bit is
	port(clk:in std_logic;
	Q:out std_logic_vector(1 downto 0)
	);		
end component;	 

component MUX is
	port( A:in std_logic_vector(15 downto 0);
	S:in std_logic_vector(1 downto 0);
	O:out std_logic_vector(3 downto 0)
	);
end component;

component DECODER_2 is
	port(A:in std_logic_vector(1 downto 0);
		R:out std_logic_vector(3 downto 0)
	);
end component;

component SEGMENT is
	port(BCD_IN:in std_logic_vector(3 downto 0);
	SEG_OUT:out std_logic_vector(6 downto 0)
	);
end component;
begin 
	et0:COMPLEMENT_2 port map(A,A1);
	et1:COMPLEMENT_2 port map(B,B1);	  
		et2: rc_adder port map(A1,B1,'0',SUM,carry1);  
	et3:INV_COMPLEMENT_2 port map(SUM,SUM1);
	et4:SUBSTRACTOR port map(B,B_neg);
	et5:COMPLEMENT_2 port map(B_neg,B_negC);
		et6:rc_adder port map(A1,B_negC,'0',SUB,open);
	et7:INV_COMPLEMENT_2 port map(SUB,SUB1);
		et8: BOOTH port map(A,B,PROD,carry2);
	et8_2:register4 port map(SEL,CLOCK,SEL1);
		et8_1: DIVIDER port map (A,B,LED,DIV,carry3,SEL1); 
	et9:MUX_OPERATION port map(SUM1,SUB1,PROD,DIV,carry1,carry2,SEL1,Y);
	et10: DECODER port map(Y,carry3,DECODED);
	et11: divi port map(CLOCK,clk);
	et12: COUNTER2bit port map(clk,C2bit);
	et13: MUX port map(DECODED,C2bit,choice); 
	
	et14: DECODER_2 port map(C2bit,R1);
	et15: SEGMENT port map(choice,SEG_OUT1);
	
end architecture;
