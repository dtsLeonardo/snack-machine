library ieee;
use ieee.std_logic_1164. all; 
use ieee.numeric_std.all;

entity Subtrator is
	generic
	(
		DATA_WIDTH: natural := 9
	);
	
	port
	(
		A : in std_logic_vector((DATA_WIDTH-1) downto 0);
		B : in std_logic_vector((DATA_WIDTH-1) downto 0);
		Sub : out std_logic_vector((DATA_WIDTH-1) downto 0)
);

end entity;

architecture rtl of Subtrator is

begin
	Sub <= std_logic_vector(unsigned (A) - unsigned (B));
end rtl;