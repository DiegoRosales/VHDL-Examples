---------------------------------------------------------
-- Created by Diego Rosales
--
-- Last edited on October 10 / 2013
--
-- Description:
-- This is an example of a 1 bit counter (frequency divider)
-- This is targeted to a Xilinx Spartan 3E
-- For more Information go to 
-- http://produccionyelectronica.blogspot.mx/
library IEEE;
use IEEE.std_logic_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity contador_1bit is
	port(
	CK1: in std_logic;	-- Reloj de entrada	(50MHz)
	CK2: out std_logic	-- Reloj de salida (25MHz)
	);
end contador_1bit;

architecture contador_1bit of contador_1bit is

signal notQ, temp_Q: std_logic; -- Crea las señales a utilizar
begin
	
	bit0: FDCE generic map ('0') -- Comienza en 0
	port map (C=>CK1, D=>notQ, Q=>temp_Q, CE=>'1', CLR=>'0'); -- Asigna los pines  
	
	notQ<=not temp_Q; -- Niega la salida del FDCE y la regresa a la entrada
	CK2<=temp_Q; -- Asigna la salida
	
end architecture;
