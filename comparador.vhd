LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.STD_LOGIC_ARITH.ALL;
    
ENTITY comparador IS
    PORT(
        clk    : in std_logic;
        chaves : in std_logic_vector(9 downto 0);
        inicio : out std_logic;
        l0,l1,l2: out std_logic;
        l3,l4,l5: out std_logic;
        --certo  : out std_logic;
        errado : out std_logic_vector(4 downto 0);
        cinco,nove,dois,tres : out std_logic;
        zero,um,quatro,seis,sete,oito: out std_logic
    );
END comparador;

ARCHITECTURE arq_comp OF comparador IS
    --signal digitos: std_logic_vector:="000000";
BEGIN

    process (clk)
        variable cont : integer;
    begin
        IF ((clk 'EVENT) and (clk ='1')) THEN 
            --zero   <= chaves(0);
            --um     <= chaves(1);
            --dois   <= chaves(2);
            --tres   <= chaves(3);
            --quatro <= chaves(4);
            --cinco  <= chaves(5);
            --seis   <= chaves(6);
            --sete   <= chaves(7);
            --oito   <= chaves(8);
            --nove   <= chaves(9);
            
            --E1<= dois; E2<=tres; E3<= cinco; E4<= sete;
            
            IF ((chaves(0) xor chaves(1) xor chaves(2) xor chaves(3) xor chaves(4) xor chaves(5) xor chaves(6) xor chaves(7) xor chaves(8) xor chaves(9))='1') THEN
                inicio<= '1';
            END IF;
            
            IF (((chaves(0) xor chaves(1) xor chaves(4) xor chaves(6) xor chaves(7) xor chaves(8)))='0') THEN
                errado<="11111";
            ELSIF ((chaves(0) xor chaves(1) xor chaves(4) xor chaves(6) xor chaves(7) xor chaves(8))='1') THEN
                errado<="01111"; 

            ELSIF (((chaves(0) and chaves(1)) or (chaves(0) and chaves(4)) or (chaves(0) and chaves(6)) or (chaves(0) and chaves(7)) or (chaves(0) and chaves(8)) or (chaves(1) and chaves(4)) or (chaves(1) and chaves(6))or (chaves(1) and chaves(7))or (chaves(1) and chaves(8))or (chaves(4) and chaves(6))or (chaves(4) and chaves(7))or (chaves(4) and chaves(8))or (chaves(6) and chaves(7))or (chaves(6) and chaves(8))or (chaves(7) and chaves(8)))= '1') THEN
                errado<="00111";
					 
            ELSIF (((chaves(0) and chaves(1)and chaves(4)) or (chaves(0) and chaves(1)and chaves(6)) or (chaves(0) and chaves(1)and chaves(7)) or (chaves(0) and chaves(1)and chaves(8)) or (chaves(0) and chaves(4)and chaves(6)) or (chaves(0) and chaves(4)and chaves(7)) or (chaves(0) and chaves(4)and chaves(8))or (chaves(0) and chaves(6)and chaves(7))or (chaves(0) and chaves(6)and chaves(8))or (chaves(0) and chaves(7)and chaves(8))or (chaves(1) and chaves(4)and chaves(6))or (chaves(1) and chaves(4)and chaves(7))or (chaves(1) and chaves(4)and chaves(8))or (chaves(1) and chaves(6)and chaves(7))or (chaves(1) and chaves(6)and chaves(8))or (chaves(4) and chaves(6)and chaves(7))or (chaves(4) and chaves(6)and chaves(8))or (chaves(4) and chaves(7)and chaves(8))or (chaves(6) and chaves(7)and chaves(8)))='1') THEN
                errado<="00011";
					 
				ELSIF (((chaves(0) and chaves(1)and chaves(4) and chaves(6)) or (chaves(0) and chaves(1)and chaves(4)and chaves(7)) or (chaves(0) and chaves(1)and chaves(4)and chaves(8)) or (chaves(0) and chaves(4)and chaves(6)and chaves(7)) or (chaves(0) and chaves(4)and chaves(6)and chaves(8)) or (chaves(0) and chaves(6)and chaves(7)and chaves(8)) or (chaves(1) and chaves(4)and chaves(6)and chaves(8))or (chaves(1) and chaves(4)and chaves(7)and chaves(8))or (chaves(1) and chaves(6)and chaves(7)and chaves(8))or (chaves(4) and chaves(6)and chaves(7)and chaves(8)))='1') THEN
                errado<="00001";	 
				 Else errado <= "00000";
            END IF;
            
            l0<='0';l1<='0';l2<='0';l3<='0';
            
            IF chaves(5)= '1' THEN 
                cinco<= '1';
            ELSE cinco <= '0';
            END IF;
            IF chaves(9)= '1' THEN 
                nove<= '1';
            ELSE nove <= '0';
            END IF;
            IF chaves(2)= '1' THEN 
                dois<= '1';
            ELSE dois <= '0';
            END IF;
            IF chaves(3)= '1' THEN 
                tres<= '1';
            ELSE tres <= '0';
            END IF;
      END IF;
        --certo<= cont;   
    END process;  
END arq_comp;