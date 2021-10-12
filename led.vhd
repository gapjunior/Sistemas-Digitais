LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    
ENTITY codif_LED IS
    PORT(
        x0,x1,x2,x3,x4,x5 : in std_logic;
        --num_erros : in std_logic_vector(1 downto 0);
        erros_out : out std_logic_vector(4 downto 0)
    );
END codif_LED;

ARCHITECTURE arq_codif OF codif_LED IS
    SIGNAL aux, error: std_logic_vector(1 downto 0);
BEGIN
process (x0,x1,x2,x3,x4,x5)
begin

        IF (x0='0' and x1='0' and x2='0'and x3='0' and x4='0' and x5 = '0') THEN
            erros_out<="11111";
            
        ELSIF ((x0='1' and x1='0' and x2='0'and x3='0' and x4='0' and x5 = '0') or (x0='0' and x1='1' and x2='0'and x3='0' and x4='0' and x5 = '0') or(x0='0' and x1='0' and x2='1'and x3='0' and x4='0' and x5 = '0') or(x0='0' and x1='0' and x2='0'and x3='1' and x4='0' and x5 = '0') or (x0='0' and x1='0' and x2='0'and x3='0' and x4='1' and x5 = '0') or (x0='0' and x1='0' and x2='0'and x3='0' and x4='0' and x5 = '1'))THEN
            erros_out<="01111"; 
		  
		       
       ELSIF ((x0='1' and x1='1' and x2='0'and x3='0' and x4='0' and x5 = '0') or (x0='1' and x1='0' and x2='1'and x3='0' and x4='0' and x5 = '0') or(x0='1' and x1='0' and x2='0'and x3='1' and x4='0' and x5 = '0') or(x0='1' and x1='0' and x2='0'and x3='0' and x4='1' and x5 = '0') or (x0='1' and x1='0' and x2='0'and x3='0' and x4='0' and x5 = '1') or (x0='0' and x1='1' and x2='1'and x3='0' and x4='0' and x5 = '0') or (x0='0' and x1='1' and x2='0'and x3='1' and x4='0' and x5 = '0')or(x0='1' and x1='0' and x2='0'and x3='0' and x4='1' and x5 = '0')or(x0='0' and x1='1' and x2='0'and x3='0' and x4='0' and x5 = '1')or(x0='0' and x1='0' and x2='1'and x3='1' and x4='0' and x5 = '0')or(x0='0' and x1='0' and x2='1'and x3='0' and x4='1' and x5 = '0')or(x0='0' and x1='0' and x2='1'and x3='0' and x4='0' and x5 = '1')or(x0='0' and x1='0' and x2='0'and x3='1' and x4='1' and x5 = '0')or(x0='0' and x1='0' and x2='0'and x3='1' and x4='0' and x5 = '1')or(x0='0' and x1='0' and x2='0'and x3='0' and x4='1' and x5 = '1'))THEN
            erros_out<="00111"; 
		      
        	       
       ELSIF ((x0='1' and x1='1' and x2='1'and x3='0' and x4='0' and x5 = '0') or (x0='1' and x1='1' and x2='0'and x3='1' and x4='0' and x5 = '0') or(x0='1' and x1='1' and x2='0'and x3='0' and x4='1' and x5 = '0') or(x0='1' and x1='1' and x2='0'and x3='0' and x4='0' and x5 = '1') or (x0='1' and x1='0' and x2='1'and x3='1' and x4='0' and x5 = '0') or (x0='1' and x1='0' and x2='1'and x3='0' and x4='1' and x5 = '0') or(x0='1' and x1='0' and x2='1'and x3='0' and x4='0' and x5 = '1')or(x0='1' and x1='0' and x2='0'and x3='1' and x4='1' and x5 = '0')or(x0='1' and x1='0' and x2='0'and x3='1' and x4='0' and x5 = '1')or(x0='1' and x1='0' and x2='0'and x3='0' and x4='1' and x5 = '1')or(x0='0' and x1='1' and x2='1'and x3='1' and x4='0' and x5 = '0')or(x0='0' and x1='1' and x2='1'and x3='0' and x4='1' and x5 = '0')or(x0='0' and x1='1' and x2='1'and x3='0' and x4='0' and x5 = '1')or(x0='0' and x1='1' and x2='0'and x3='1' and x4='1' and x5 = '0')or(x0='0' and x1='1' and x2='0'and x3='1' and x4='0' and x5 = '1')or(x0='0' and x1='1' and x2='0'and x3='0' and x4='1' and x5 = '1')or(x0='0' and x1='0' and x2='1'and x3='1' and x4='1' and x5 = '0')or(x0='0' and x1='0' and x2='1'and x3='1' and x4='0' and x5 = '1')or(x0='0' and x1='0' and x2='1'and x3='0' and x4='1' and x5 = '1')or(x0='0' and x1='0' and x2='0'and x3='1' and x4='1' and x5 = '1'))THEN
            erros_out<="00011"; 

        ELSIF ((x0='1' and x1='1' and x2='1'and x3='1' and x4='0' and x5 = '0') or (x0='1' and x1='1' and x2='1'and x3='0' and x4='1' and x5 = '0') or(x0='1' and x1='1' and x2='1'and x3='0' and x4='0' and x5 = '1') or(x0='1' and x1='1' and x2='0'and x3='1' and x4='1' and x5 = '0') or (x0='1' and x1='1' and x2='0'and x3='1' and x4='0' and x5 = '1') or (x0='1' and x1='1' and x2='0'and x3='0' and x4='1' and x5 = '1') or (x0='0' and x1='1' and x2='1'and x3='1' and x4='1' and x5 = '0')or(x0='0' and x1='1' and x2='1'and x3='1' and x4='0' and x5 = '1')or(x0='0' and x1='0' and x2='1'and x3='1' and x4='1' and x5 = '1'))THEN
            erros_out<="00001"; 
        ELSE 
            erros_out<="00000";
        END IF;
            
    --IF(num_erros="00") THEN 
    --    erros_out<= "111";
    --ELSIF(num_erros="01") THEN 
    --    erros_out<="011";
    --ELSIF(num_erros="10") THEN 
    --    erros_out<="001";
    --ELSE erros_out<= "000";
    --END IF;
end process;
   
END arq_codif;