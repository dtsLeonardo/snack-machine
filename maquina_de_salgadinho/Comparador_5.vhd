library ieee;
use ieee.std_logic_1164. all; 
use ieee.numeric_std.all;

entity Comparador_5 is
  generic (
    N : integer := 5
  );

  port(
    A : in std_logic_vector(N-1 downto 0);
	 B : in std_logic_vector(N-1 downto 0);
    maior : out std_logic
  );

end Comparador_5;

architecture main of Comparador_5 is 
signal A_temp : unsigned (N-1 downto 0); 
signal B_temp : unsigned (N-1 downto 0); 

begin
   A_temp <= unsigned (A);
   B_temp <= unsigned (B);
   maior <= '1' when (A_temp > B_temp) else '0';
end main ;