library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity maquina_de_salgadinho is 
	port (
		I : in std_logic;
		S : in std_logic_vector(1 downto 0);
		clock : in std_logic;
		reset : in std_logic;
		F : out std_logic_vector(1 downto 0); 
		P1 : in std_logic_vector(3 downto 0);
		P2 : in std_logic_vector(3 downto 0);
		P3 : in std_logic_vector(3 downto 0);
		P4 : in std_logic_vector(3 downto 0);
		V : in std_logic_vector(8 downto 0);
		Q : in std_logic_vector(4 downto 0);
		P : out std_logic_vector(8 downto 0);
		T : out std_logic_vector(8 downto 0);
		Estado : out std_logic_vector(2 downto 0)
);
end maquina_de_salgadinho;

architecture rtl of maquina_de_salgadinho is
   
	signal V_count_rst : std_logic;
	signal V_count_ld : std_logic;
	signal Q_count_rst : std_logic; 
	signal Q_count_ld : std_logic;
	signal P_count_rst : std_logic;
	signal P_count_ld : std_logic; 
	signal T_count_rst : std_logic; 
	signal T_count_ld : std_logic; 
	signal V_gt_P : std_logic;  
	signal Q_gt_zero : std_logic;
	signal S_count_ld : std_logic;
	signal S_count_rst : std_logic;
	signal R : std_logic_vector(1 downto 0);

	component controladora is 
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
		
   end component;
	
	component caminho_de_dados is
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
	end component;
	
	begin
		IN_controladora : controladora port map (I, V_gt_P, Q_gt_zero, clock, reset, 
		V_count_rst, V_count_ld, Q_count_rst, Q_count_ld, P_count_rst, P_count_ld, T_count_rst,
		T_count_ld, F, R, S_count_rst, S_count_ld, Estado);
		
		IN_caminho_de_dados : caminho_de_dados port map (clock, S, V, V_count_rst, V_count_ld, Q,
		Q_count_rst, Q_count_ld, P, P_count_rst, P_count_ld, T, T_count_rst, T_count_ld, 
		R, S_count_rst, S_count_ld, P1, P2, P3, P4, V_gt_P, Q_gt_zero);
	end rtl;
	
