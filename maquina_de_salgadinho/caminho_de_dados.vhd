library ieee;
use ieee.std_logic_1164. all; use ieee.numeric_std.all;
use ieee.std_logic_textio.all; use std.textio.all;
use ieee.numeric_std.all;

entity caminho_de_dados is
	port ( 
		clock : in std_logic;
		
		S : in std_logic_vector(1 downto 0);
		
		V : in std_logic_vector(8 downto 0); 
		V_count_rst : in std_logic;
	   V_count_ld : in std_logic; 
		
		Q : in std_logic_vector(4 downto 0);
		Q_count_rst : in std_logic;
		Q_count_ld : in std_logic;
		
		P : out std_logic_vector(8 downto 0);
		P_count_rst : in std_logic;
		P_count_ld : in std_logic;
		
		T : out std_logic_vector(8 downto 0);
		T_count_rst : in std_logic;
		T_count_ld : in std_logic;
		
      R : out std_logic_vector(1 downto 0);
		S_count_rst : in std_logic;
		S_count_ld : in std_logic;	
		
      P1 : in std_logic_vector(3 downto 0); 
      P2 : in std_logic_vector(3 downto 0);
		P3 : in std_logic_vector(3 downto 0); 
      P4 : in std_logic_vector(3 downto 0);
		
		V_gt_P : out std_logic;
		Q_gt_zero : out std_logic
);
end caminho_de_dados;

architecture union of caminho_de_dados is

	component Comparador_9 is 
		port(
			A: in std_logic_vector(8 downto 0);
			B: in std_logic_vector(8 downto 0); 
			maior : out std_logic
	);
	end component;

	component Comparador_5 is 
	port (
			A : in std_logic_vector(4 downto 0); 
			B : in std_logic_vector(4 downto 0); 
			maior : out std_logic
	);
	end component;

	component Multiplicador is
	port ( 
			A : in std_logic_vector(3 downto 0);
			B : in std_logic_vector(4 downto 0);
			Mult : out std_logic_vector(8 downto 0)
	);
	end component;

	component Mux is
	port (
			In0, In1, In2, In3 : in std_logic_vector(3 downto 0);
			S : in std_logic_vector(1 downto 0);
			Saida : out std_logic_vector(3 downto 0)
	);
	end component;

	component Registrador_2 is
	port ( 
			clk : in std_logic;
			rst : in std_logic;
			ld : in std_logic;
			D : in std_logic_vector(1 downto 0);
			Q : out std_logic_vector(1 downto 0)
	);
	end component;
	
	component Registrador_5 is
	port ( 
			clk : in std_logic;
			rst : in std_logic;
			ld : in std_logic;
			D : in std_logic_vector(4 downto 0);
			Q : out std_logic_vector(4 downto 0)
	);
	end component;

	component Registrador_9 is
	port ( 
			clk : in std_logic;
			rst : in std_logic;
			ld : in std_logic;
			D : in std_logic_vector(8 downto 0);
			Q : out std_logic_vector(8 downto 0)
	);
	end component;

	component Subtrator is
	port (
		A : in std_logic_vector(8 downto 0);
		B : in std_logic_vector(8 downto 0);
		Sub : out std_logic_vector(8 downto 0) 
	);
	end component;

	signal V_count_out : std_logic_vector(8 downto 0);
	signal P_count_out : std_logic_vector(8 downto 0);
	signal Q_count_out : std_logic_vector(4 downto 0);
	signal S_count_out : std_logic_vector(1 downto 0);
	signal Mux_out : std_logic_vector(3 downto 0);
	signal Multiplicador_out: std_logic_vector(8 downto 0);
	signal Subtrator_out : std_logic_vector(8 downto 0);
	
	begin

	IN_Registrador_2_S : Registrador_2 port map (clock, S_count_rst, S_count_ld,S,S_count_out); 
	
	IN_Mux : Mux port map (P1, P2, P3, P4, S_count_out, Mux_out);
	
	IN_Registrador_9_V : Registrador_9 port map (clock, V_count_rst, V_count_ld,V,V_count_out); 
	IN_Registrador_5_Q : Registrador_5 port map (clock, Q_count_rst, Q_count_ld,Q, Q_count_out);
	
	IN_Multiplicador : Multiplicador port map (Mux_out, Q_count_out, Multiplicador_out);
	
	IN_Registrador_9_P : Registrador_9 port map (clock, P_count_rst, P_count_ld, Multiplicador_out, P_count_out); 
	IN_Registrador_9_T : Registrador_9 port map (clock, T_count_rst, T_count_ld, Subtrator_out, T); 
	
	IN_Subtrator : Subtrator port map (V_count_out, P_count_out, Subtrator_out);
	
	IN_Comparador_9 : Comparador_9 port map (V_count_out,P_count_out, V_gt_P);
	IN_Comparador_5 : Comparador_5 port map (Q_count_out, "00000",Q_gt_zero); 
	
	P <= P_count_out;
	R <= S_count_out;
	
end union;