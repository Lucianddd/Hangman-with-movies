LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL; 

ENTITY register4 IS PORT(
    d   : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	CLOCK:in std_logic;
    q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
);
END register4;

ARCHITECTURE description OF register4 is

BEGIN
    process(CLOCK)
    begin
        if rising_edge(CLOCK) and d>0 then
                q <= d;
        end if;
    end process;
END description;