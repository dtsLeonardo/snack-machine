library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all; 
use std.textio.all;
use ieee.numeric_std. all;

entity tb_maquina_de_salgadinho is
end tb_maquina_de_salgadinho;

architecture rtl of tb_maquina_de_salgadinho is
	component maquina_de_salgadinho is
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
	end component;

	signal clk : std_logic;
	signal rst : std_logic;

	constant PERIOD : time := 10 ns;
	constant DUTY_CYCLE : real := 0.5;
	constant OFFSET : time := 5 ns;

	signal i : std_logic;
	signal s : std_logic_vector(1 downto 0);
	signal f : std_logic_vector(1 downto 0);
	signal p1 : std_logic_vector(3 downto 0);
	signal p2 : std_logic_vector(3 downto 0);
	signal p3 : std_logic_vector(3 downto 0);
	signal p4 : std_logic_vector(3 downto 0);
	signal v : std_logic_vector(8 downto 0);
	signal q : std_logic_vector(4 downto 0);
	signal p : std_logic_vector(8 downto 0);
	signal t : std_logic_vector(8 downto 0);
	signal estado : std_logic_vector(2 downto 0);
	
	begin
	
	PROCESS
	BEGIN
		WAIT for OFFSET;
		CLOCK_LOOP: LOOP
			clk <= '0';
			WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
			clk <= '1';
			WAIT FOR (PERIOD * DUTY_CYCLE);
		END LOOP CLOCK_LOOP;
	END PROCESS;
		
	IN_maquina_de_salgadinho: maquina_de_salgadinho port map(i, s, clk, rst, f, p1, p2, p3, p4, v, q, p, t, estado);
	 
	p1 <= "0001";
	p2 <= "0010";
	p3 <= "0011";
	p4 <= "0101";
	q <= "01010";
	
	v <= "100000000";
	
	rst<='0',
	'1' after 35 ns, 
	'0' after 500 ns, 
	'1' after 1280 ns, 
	'0' after 1500 ns, 
	'1' after 1900 ns;
	
	s<="00", 
	"01" after 75 ns, 
	"10" after 165 ns, 
	"11" after 370 ns; 
	
	i<='0',
	'1' after 30 ns, 
	'0' after 50 ns, 
	'1' after 130 ns, 
	'0' after 150 ns, 
	'1' after 230 ns, 
	'0' after 250 ns,
	'1' after 330 ns, 
	'0' after 400 ns,
	'1' after 450 ns;
end rtl;
	
	
	
	
	