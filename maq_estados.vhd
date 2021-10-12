LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.STD_LOGIC_ARITH.ALL;
    USE IEEE.NUMERIC_STD.ALL;
    
ENTITY state_machine IS
    PORT(
        clk          : in std_logic;
        start, reset : in std_logic;
        D0, D1, D2, D3  : in std_logic_vector (3 downto 0); 
        --igual        : in std_logic ;
        dif          : in std_logic_vector(4 downto 0);
        rst          : out std_logic;
        --erros        : out std_logic_vector(2 downto 0);
        libera       : out std_logic;
        venceu       : out std_logic;
        perdeu       : out std_logic
    );
END state_machine;


ARCHITECTURE behavioral OF state_machine IS
    TYPE states IS (S0, S1, S2,S3,S4,S5);
    SIGNAL EA, PE: states;    -- estado atual, prox estado

BEGIN 

    P1: PROCESS(clk, reset)
    BEGIN 
        -- reset assincrono
        IF reset = '0' THEN
            EA <= S0;
            --rst<='1';
        ELSIF rising_edge(clk) THEN
            -- a cada ciclo de clock, o proximo estado (PE) se torna o estado atual (EA)
            EA <= PE;
        END IF;
    END PROCESS;

    -- processo combinatório
    P2: PROCESS( reset, EA, start)
        variable acertos,cont_erros : integer:=0;--
    BEGIN
        venceu<='0'; perdeu<='0';
        acertos:=0; cont_erros:=0;
        PE<= EA; 
        
        CASE EA is
            WHEN S0 => 
                venceu<='0'; perdeu<='0'; rst <='1';
                PE <= S1;
                
            WHEN S1 =>
               IF ((D0="0011") or (D1="0010") or (D2="1001") or (D3="0101")) THEN
                    rst<='0';
                    libera<='1';
                    venceu<='0';
                    perdeu <= '0';
						  acertos:= acertos +1;
						  PE<=S2;
                    
                ELSIF (dif/="00000") THEN
                    cont_erros:=cont_erros +1;
                    
                    PE <= S1;
					 END IF;
            WHEN S2 => 
                IF ((D0="0011") or (D1="0010") or (D2="1001") or (D3="0101")) THEN
                    rst<='0';
                    libera<='1';
                    venceu<='0';
                    perdeu <= '0';
                    acertos:= acertos+1 ;
                    PE <= S3;
                ELSIF (dif/="00000") THEN
                    cont_erros:=cont_erros +1;
                    
                    PE <= S3;
                END IF;
				
				WHEN S3 => 
                IF ((D0="0011") or (D1="0010") or (D2="1001") or (D3="0101")) THEN
                    rst<='0';
                    libera<='1';
                    venceu<='0';
                    perdeu <= '0';
                    acertos:= acertos+1 ;
                    PE <= S4;
                ELSIF (dif/="00000") THEN
                    cont_erros:=cont_erros +1;
                    
                    PE <= S4;
                END IF;
					 
				WHEN S4 => 
                IF ((D0="0011") and (D1="0010") and (D2="1001") and (D3="0101")) THEN
                    rst<='1';
                    libera<='1';
                    venceu<='1';
                    perdeu <= '0';
                    acertos:= acertos+1 ;
                    PE <= S0;
                ELSIF (dif/="00000") THEN
                    cont_erros:=cont_erros +1;
                    
                    PE <= S4;
                END IF;
					
					 IF ((dif="00000")) THEN
						 rst<='1';
                   libera<='1';
                   venceu<='0';
                   perdeu <= '1';
						 PE<=S5;
					END IF;
        END CASE;
    END PROCESS;
END behavioral ;    