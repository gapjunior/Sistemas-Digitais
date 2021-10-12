LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY display IS
    PORT ( 
        bits: IN std_logic_vector (3 downto 0);
        digitos: OUT std_logic_vector (6 downto 0)
    );
END display;

ARCHITECTURE dataflow OF display IS
BEGIN
    WITH bits SELECT --"GFEDCBA"
        digitos <= 	"1000000" WHEN "0000", --0 
                    "1111001" WHEN "0001", --1
                    "0100100" WHEN "0010", --2
                    "0110000" WHEN "0011", --3
                    "0011001" WHEN "0100", --4
                    "0010010" WHEN "0101", --5
                    "0000010" WHEN "0110", --6
                    "1111000" WHEN "0111", --7
                    "0000000" WHEN "1000", --8
                    "0010000" WHEN "1001", --9
                    "0001100" WHEN "1100", -- P
                    "1000010" WHEN "1101", -- G 1000010
                    "0111111" WHEN "1111", -- traço
                    "0000000" WHEN others;
END dataflow;
