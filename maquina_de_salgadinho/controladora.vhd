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
		
	   Estado : out std_logic_vector(2 downto 0)
			
	);
		
end controladora;

architecture arch of controladora is

type Estados is (
	inicio, espera, selecionar_quantidade,
	escolher_salgadinho, calculo_preco,
	esperar_dinheiro, calculo_troco, saida_salgadinho
);

signal Estado_atual : Estados;
signal proximo_Estado : Estados;
signal previous_reset : std_logic := '0';

begin

sequencial:
process (reset, clock) is
begin
	if (reset = '1' and Estado_atual /= calculo_troco and Estado_atual /= saida_salgadinho and previous_reset /= reset ) then
    Estado_atual <= inicio;
	elsif (rising_edge(clock)) then
		Estado_atual <= proximo_Estado; 
	end if;
end process;

combinacional:
process (Estado_atual,I,V_gt_P,Q_gt_zero) is
begin
	case Estado_atual is
	
	when inicio =>
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
		Estado<="000";
		proximo_Estado <= espera;
		
	when espera => 
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

		if(I='1') then
			proximo_Estado <= selecionar_quantidade;
		else
			proximo_Estado <= espera;
		end if;
		
		Estado<="001";
		
	when selecionar_quantidade =>
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
		
		if (Q_gt_zero = '1') then
			proximo_Estado<=escolher_salgadinho;
		else
			proximo_Estado<=selecionar_quantidade;
		end if;
		Estado<="010";
		
	when escolher_salgadinho =>
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
		Estado<="011";
		proximo_Estado<=calculo_preco;
		
	when calculo_preco =>
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
		Estado<="100";
		
		proximo_Estado<=esperar_dinheiro;
	
	when esperar_dinheiro =>
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
		
		if(V_gt_P='1') then
			proximo_Estado<=calculo_troco;
		else
			proximo_Estado<=esperar_dinheiro;
		end if;
		
		Estado<="101";
			
	when calculo_troco =>
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
		Estado<="110";
		proximo_Estado<=saida_salgadinho;

	when saida_salgadinho =>
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
		
		Estado<="111";
	
		proximo_Estado<=inicio;
		
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
		Estado<="000";
		proximo_Estado <= espera;
	end case;
	
	previous_reset <= reset;
	
end process;
end arch;
		