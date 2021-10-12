LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY maioria IS
    PORT ( 
        A, B, C, D, E, F : IN std_logic;
        Y          : OUT std_logic
    );
END maioria;

ARCHITECTURE arq_maioria OF maioria IS
    SIGNAL x0,x1,x2,x3,x4,x5 : std_logic;
BEGIN
	 x0<= ((A and B)and C) ;
    x1<= ((A and B)and C) ;
    x2<= ((A and B) and D);
    x3<= ((A and C) and D);
    x4<= ((A and D) and E);
	 x5<= ((A and D)and F) ;
    Y <=(x0) or (x1) or (x2) or (x3) or (x4) or (x5);

END arq_maioria;