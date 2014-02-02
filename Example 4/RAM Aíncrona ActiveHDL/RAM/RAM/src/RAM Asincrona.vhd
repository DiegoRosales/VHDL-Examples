---------------------------------------------------------
-- Created by Diego Rosales
--
-- Last edited on October 27 / 2013
--
-- Description:
-- This is an example of an Asynchronous LUT based RAM
-- This is targeted to a Xilinx Spartan 3E
-- For more Information go to 
-- http://produccionyelectronica.blogspot.mx/2013/10/bloques-logicos-utiles-en-vhdl-4-ram.html

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity asinc is
	generic(
	-- 3 bits de dirección para 8 posibles direcciones
	-- 3 address bits for 8 different locations
	DIR_ANCHO: integer:=3; 
		
	-- 8 bits de datos
	DATO_ANCHO: integer:=8 
	);
	
	port(
	CK: in std_logic;
	-- Dirección a leer/escribir
	-- Read/Write
	dir: in std_logic_vector(DIR_ANCHO-1 downto 0);
	-- Dato a guardar
	-- Data in
	dato: in std_logic_vector(DATO_ANCHO-1 downto 0);
	-- Señal para indicar que queremos escribir
	-- Chip Enable
	escribir: in std_logic;
	-- Lectura de la memoria
	-- Memory read output
	salida: out std_logic_vector(DATO_ANCHO-1 downto 0)
	);
	
end asinc;



architecture asinc of asinc is

-- Declaramos un nuevo tipo de dato
-- Este tipo contiene 8 bits de datos por 8 registros
-- RAM type (2^n-1)
type tipo_ram is array (2**DIR_ANCHO-1 downto 0) of std_logic_vector (DATO_ANCHO-1 downto 0);

-- Declaramos una variable de nuestro tipo nuevo
signal ram: tipo_ram;  

begin
	process(CK)
	begin
		if rising_edge(CK) then
			if escribir = '1' then 
				-- Guarda el dato en la dirección indicada
				ram(to_integer(unsigned(dir))) <= dato;
			end if;
		end if;	    
	end process;	
	
	-- Lee el dato almacenado en la dirección indicada
	salida <= ram(to_integer(unsigned(dir)));
end asinc;	
