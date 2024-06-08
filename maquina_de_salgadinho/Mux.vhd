library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux is
	generic
	(
		DATA_WIDTH: natural := 4
	);
	
port(
	In0, In1, In2, In3 : in std_logic_vector((DATA_WIDTH-1) downto 0);
	S : in std_logic_vector(1 downto 0);
	Saida : out std_logic_vector((DATA_WIDTH-1) downto 0)
);

end entity Mux;

architecture main of Mux is
begin
    with S select
        Saida <= In0 when "00",
                 In1 when "01",
                 In2 when "10",
                 In3 when "11",
                 (others => '0') when others;
end main;