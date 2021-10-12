LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_saida IS
	PORT (
        clk            : in std_logic;  
        d:    in  std_logic_vector (3 downto 0);
        --d0,d1,d2,d3,d4,d5:    in  std_logic_vector (3 downto 0);
        load   : in std_logic;    
        reset          : in std_logic;    
        q: out std_logic_vector (3 downto 0)
		--q0,q1,q2,q3,q4,q5: out std_logic_vector (3 downto 0)
	);
END reg_saida;

ARCHITECTURE Behavior OF reg_saida IS
--SIGNAL ld : std_logic;
BEGIN
    --ld<=load;
    PROCESS ( reset, clk, load )
    BEGIN
        IF (reset = '1') THEN
            q <= "1111" ; --load<='0';
        ELSIF (rising_edge(clk) AND load='1') THEN 
            q <= d ;
            --ld<='0';
        END IF ;
    END PROCESS ;
END Behavior ;