LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY topo IS 
    PORT(
        SW :      in std_logic_vector (9 downto 0);
        KEY:      in std_logic_vector (1 downto 0);
        CLOCK_50: in std_logic;

        G_LED : out std_logic_vector (4 downto 0);
        HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0); 
        HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0)
    );
END ENTITY;

ARCHITECTURE principal_stru of topo is

    -- Declaração dos componentes
    component decod IS
	PORT ( bits:    in  std_logic_vector (9 downto 0);
	    enable:  in std_logic;
		digitos: out std_logic_vector (3 downto 0) );
    END component;

    component maioria IS
    PORT ( 
        A, B, C, D, E, F: IN std_logic;
        Y          : OUT std_logic
    );
    END component;

    component mux_regs IS
    PORT( clk     : in std_logic;
        sel     : in std_logic_vector (1 downto 0);
        B0      : in std_logic_vector (3 downto 0);
        S       : out std_logic_vector (3 downto 0)  );
    END component;

    component comparador IS 
    PORT( clk    : in std_logic;
        chaves : in std_logic_vector(9 downto 0);
        inicio : out std_logic;
        l0,l1,l2: out std_logic;
        l3,l4,l5: out std_logic;
        --certo  : out std_logic;
        errado : out std_logic_vector(2 downto 0);
        dois, tres, cinco, nove : out std_logic;
        zero, um,quatro,seis, sete, oito: out std_logic);
    END component;

    component state_machine IS
    PORT( clk          : in std_logic;
        start, reset : in std_logic;
        D0, D1, D2, D3   : in std_logic_vector (3 downto 0);
        --igual        : in std_logic ;
        dif          : in std_logic_vector(2 downto 0);
        rst          : out std_logic;
        --erros        : out std_logic_vector(2 downto 0);
        libera       : out std_logic;
        venceu       : out std_logic;
        perdeu       : out std_logic);
    END component;

    component  reg_saida IS
	PORT ( clk : in std_logic;  
        d: in  std_logic_vector (3 downto 0);
        load : in std_logic;  reset : in std_logic;     
        q: out std_logic_vector (3 downto 0));
    END component ;

    component display IS
    PORT ( bits: IN std_logic_vector (3 downto 0);
        digitos: OUT std_logic_vector (6 downto 0));
    END component;

    component codif_LED IS
    PORT(x0,x1,x2,x3,x4,x5 : in std_logic;--num_erros : in std_logic_vector(1 downto 0);
        erros_out : out std_logic_vector(4 downto 0));
    END component;

    component  reg_desl IS
	PORT ( clk : in std_logic; reset: std_logic;  
        load : in std_logic; d  : in  std_logic_vector (2 downto 0);   
        q: out std_logic_vector (2 downto 0));
    END component ;
    
    component ganho IS
    PORT ( 
        x0,x1,x2,x3 : in std_logic;--_vector(3 downto 0);
        erro : in std_logic;
        Y          : out std_logic
    );
    END component;


    --Declaração dos sinais internos
    SIGNAL entrada                  : std_logic_vector (9 downto 0);
    SIGNAL  sel_mux           :std_logic_vector(1 downto 0);
    SIGNAL mux_out                  : std_logic_vector (3 downto 0);
    
    SIGNAL S0, S1, S2, S3, S4, S5   : std_logic_vector (3 downto 0);
    SIGNAL SLED ,wrong                    : std_logic_vector (2 downto 0);
    SIGNAL right, load ,load0   ,reset_reg          : std_logic;
    SIGNAL victory, defeat ,comecou   ,won      : std_logic;
    SIGNAL rst_ALL    , mt_erro              : std_logic;
    SIGNAL l0,l1,l2, l3,l4,l5       : std_logic;
    SIGNAL n0,n1,n4,n6,n8,n9       : std_logic:='0';
    SIGNAL n2,n3,n5,n7       : std_logic:='0';
                        
BEGIN

    entrada <= SW(9 downto 0);
    --wrong<= "00";
    
    compara: comparador port map(CLOCK_50,entrada,comecou ,l0,l1,l2, l3,l4,l5,SLED,n0,n1,n4,n6,n8,n9,n2,n3,n5,n7); --right
	 
	 machine: state_machine port map (CLOCK_50,comecou,KEY(0),S0, S1, S2, S3, S4, S5,wrong,rst_ALL,load, won, defeat);
    
    --codifica : codif_LED port map(wrong,SLED);
    codifica2: codif_LED port map (entrada(0), entrada(1), entrada(4), entrada(6), entrada(7), entrada(8),G_LED);
    majerros: maioria port map(entrada(0), entrada(1), entrada(4), entrada(6), entrada(7), entrada(8), mt_erro);

    ver_ganho: ganho port map(entrada(5), entrada(9), entrada(2), entrada(3), mt_erro,victory);

    sel_mux<= victory & mt_erro;
    mux: mux_regs port map (CLOCK_50, sel_mux,"0100", mux_out);
    
    load0 <= (entrada(3) and (not mt_erro)) or (mt_erro and (not victory  ));
    --load0 <= ((not entrada(4)) and mt_erro and (not victory)) or (victory and entrada(4) and (not mt_erro)) or (entrada(4) and (not victory) and (not mt_erro)) or (entrada(4) and mt_erro and (not victory));
    
    reset_reg<= rst_ALL or (victory or mt_erro);
    
    reg0: reg_saida port map (CLOCK_50, mux_out, load0,rst_ALL ,S0);
    reg1: reg_saida port map (CLOCK_50, "0101", entrada(5), reset_reg,S1);
    reg2: reg_saida port map (CLOCK_50, "1001", entrada(9), reset_reg,S2);
    reg3: reg_saida port map (CLOCK_50, "0010", entrada(2), reset_reg,S3);
    reg4: reg_saida port map (CLOCK_50, "0000", entrada(0), reset_reg,S4);
    reg5: reg_saida port map (CLOCK_50, "0000", entrada(0), reset_reg,S5);

    decod_hex0: display port map (S0, HEX0);
    decod_hex1: display port map (S1, HEX1);
    decod_hex2: display port map (S2, HEX2);
    decod_hex3: display port map (S3, HEX3);
    decod_hex4: display port map (S4, HEX4);
    decod_hex5: display port map (S5, HEX5);

    --G_LED<= SLED;

END principal_stru;