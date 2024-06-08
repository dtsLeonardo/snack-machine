library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity controladora is
	port (
		I  : in std_logic;
		
		V_gt_P : in std_logic; 
		Q_gt_zero : in std_logic; 
		
		clock : in std_logic; 
		reset : in std_logic;
		
		V_count_rst : out std_logic;
		V_count_ld : out std_logic;
		
		Q_count_rst : out std_logic;
		Q_count_ld : out std_logic;
		
		P_count_rst : out std_logic;
		P_count_ld : out std_logic;
		
		T_count_rst : out std_logic;
		T_count_ld : out std_logic;
		
		F : out std_logic_vector(1 downto 0); 
		
		R : in std_logic_vector(1 downto 0);
		S_count_rst : out std_logic;
		S_count_ld : out std_logic;
		
	   Estado : in std_logic_vector(2 downto 0);
		proximo_Estado : out std_logic_vector(2 downto 0)
);
		
end controladora;

architecture arch of controladora is

signal previous_reset : std_logic := '0';

begin


combinacional:
process (Estado,I,V_gt_P,Q_gt_zero) is
begin
	case Estado is
	
	when "000" =>
		V_count_rst <= '1';
		V_count_ld <= '0';
		Q_count_rst <= '1';
		Q_count_ld <= '0';
		P_count_rst <= '1';
		P_count_ld <= '0';
		T_count_rst <= '1';
		T_count_ld <= '0';
		S_count_rst <='1';
		S_count_ld <='0';
		F <="00";
		
		if (reset = '1' and previous_reset /= reset) then
			proximo_Estado <= "000";
		else
			proximo_Estado <= "001";
		end if;
		
	when "001" => 
		V_count_rst <= '0';
		V_count_ld <= '0';
		Q_count_rst <= '0';
		Q_count_ld <= '0';
		P_count_rst <= '0';
		P_count_ld <= '0';
		T_count_rst <= '0';
		T_count_ld <= '0';
		S_count_rst <='0';
		S_count_ld <='0';
		F <="00";

		if (reset = '1' and previous_reset /= reset) then
			proximo_Estado <= "000";
		elsif (I='1') then
			proximo_Estado <= "010";
		else
			proximo_Estado <= "001";
		end if;
		
	when "010" =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld <='1';
		P_count_rst <='0';
		P_count_ld <='0';
		T_count_rst <='0';
		T_count_ld <='0';
		S_count_rst <='0';
		S_count_ld <='0';
		F <="00";
		
		if (reset = '1' and previous_reset /= reset) then
			proximo_Estado <= "000";
		elsif (Q_gt_zero = '1') then
			proximo_Estado <= "011";
		else
			proximo_Estado <= "010";
		end if;
		
	when "011" =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld <='0';
		P_count_rst <='0';
		P_count_ld <='0';
		T_count_rst <='0';
		T_count_ld <='0';
		S_count_rst <='0';
		S_count_ld <='1'; 
		F <="00";
		
		if (reset = '1' and previous_reset /= reset) then
			proximo_Estado <= "000";
		else
			proximo_Estado <= "100";
		end if;
		
	when "100" =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld<='0';
		P_count_rst <='0';
		P_count_ld<='1';
		T_count_rst <='0';
		T_count_ld<='0';
		S_count_rst <='0';
		S_count_ld <='0';
		F <="00";
		
		if (reset = '1') then
			proximo_Estado <= "000";
		else
			proximo_Estado <= "101";
		end if;
		
	when "101" =>
		V_count_rst <='0';
		V_count_ld <='1';
		Q_count_rst <='0';
		Q_count_ld <='0';
		P_count_rst <='0';
		P_count_ld <='0';
		T_count_rst <='0';
		T_count_ld<='0';
		S_count_rst <='0';
		S_count_ld <='0';
		F <="00";
		
		if (reset = '1' and previous_reset /= reset) then
			proximo_Estado <= "000";
		elsif (V_gt_P='1') then
			proximo_Estado <= "110";
		else
			proximo_Estado <= "101";
		end if;
			
	when "110" =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld<='0';
		P_count_rst <='0';
		P_count_ld<='0';
		T_count_rst <='0';
		T_count_ld<='1';
		S_count_rst <='0';
		S_count_ld <='0';
		F <= "00";
		proximo_Estado<="111";

	when "111" =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld <='0';
		P_count_rst <='0';
		P_count_ld <='0';
		T_count_rst <='0';
		T_count_ld <='0';
		S_count_rst <='0';
		S_count_ld <='0';
		
		if (R="00") then
			F <="00";
		end if;
		
		if (R="01") then
			F <="01";
		end if;
		
		if (R="10") then
			F <="10";
		end if;
		
		if (R="11") then
			F <="11";
		end if;
			
		proximo_Estado<="000";
		
	when others =>
		V_count_rst <='0';
		V_count_ld <='0';
		Q_count_rst <='0';
		Q_count_ld <='0';
		P_count_rst <='0';
		P_count_ld <='0';
		T_count_rst <= '0';
		T_count_ld <= '0';
		S_count_rst <='0';
		S_count_ld <='0';
		F <= "00";
		
		proximo_Estado <= "000";
	end case;
	
	previous_reset <= reset;
	
end process;
end arch;
		