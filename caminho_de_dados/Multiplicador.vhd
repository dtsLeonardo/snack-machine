library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity Multiplicador is

generic
	(
		DATA_WIDTH: natural := 9
	);
	
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(4 downto 0);
		Mult : out std_logic_vector(8 downto 0)
	);

end entity;

architecture main of Multiplicador is 
	signal aux: unsigned (8 downto 0);

begin
	
	aux <= to_unsigned ((to_integer (unsigned (A)) *to_integer (unsigned (B))), 9); 
	Mult<= std_logic_vector(aux);

end architecture;