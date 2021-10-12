LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


ENTITY ganho IS
    PORT ( 
        x0,x1,x2,x3 : in std_logic;
        erro : in std_logic;
        Y          : out std_logic
    );
END ganho;

architecture    arqganho of ganho is
begin
    process (x0,x1,x2,x3,erro)
    begin
        if ((x0='1') and (x1='1') and (x2='1') and (x3='1') and erro='0' ) then
            Y<='1';
        else
            Y<='0';
        end if;
    
    
    
       
    end process;
    
end architecture;
