library IEEE;
use IEEE.STD_LOGIC_1164.all; 

library UNISIM;
use UNISIM.vcomponents.all;

entity FDCE_Xilinx is
	port(
	CK, D, CE, CLR: in std_logic;
	Q: out std_logic
	);
end FDCE_Xilinx;


architecture FDCE_Xilinx of FDCE_Xilinx is
begin

	FlipFlop: FDCE generic map('0') -- Comienza en 0
	port map (C=>CK, D=>D, CE=>CE, CLR=>CLR, Q=>Q);

end FDCE_Xilinx;
