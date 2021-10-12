LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_regs IS
    PORT(
        clk     : in std_logic;
        sel     : in std_logic_vector (1 downto 0);
        B0      : in std_logic_vector (3 downto 0);
        S       : out std_logic_vector (3 downto 0)  
    );
END mux_regs;

ARCHITECTURE behavior OF mux_regs IS 
BEGIN

    WITH sel SELECT 
        S <=    B0 WHEN "00",
            "1100" WHEN "01", -- perdeu gera o P
            "1101" WHEN "10", -- granhou gera o G
                B0 WHEN OTHERS;

END behavior;