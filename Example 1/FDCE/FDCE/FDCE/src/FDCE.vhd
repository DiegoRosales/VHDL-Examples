---------------------------------------------------------
-- Created by Diego Rosales
--
-- Last edited on October 6 / 2013
--
-- Description:
-- This is an example of a Flip Flop type D with Clear and Chip-Enable
-- This is targeted to a Xilinx Spartan 3E
-- For more Information go to 
-- http://produccionyelectronica.blogspot.mx/

library IEEE;
use IEEE.STD_LOGIC_1164.all;  

entity FDCE is
	generic (INIT :std_logic:='0');	 -- El Flip Flop inicia en 0
	port(CE, CLR, C, D: in std_logic;
	Q: out std_logic);
end FDCE;

architecture FDCE of FDCE is
signal temp: std_logic :=INIT;
begin
	process (CLR, C)
	begin
		if(CLR='1') then -- Clear asíncrono
			temp <='0';
		elsif(CE='1' and C' event and C='1') then -- Si hay una señal de reloj con flanco positivo, Q obtiene el valor de D
			temp <=D;
		end if;
	end process;
	Q<= temp;
end FDCE;
