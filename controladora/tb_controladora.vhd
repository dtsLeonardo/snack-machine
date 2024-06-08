library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_controladora is
end entity tb_controladora;

architecture tb_arch of tb_controladora is

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
				
				Estado : in std_logic_vector(2 downto 0);
				proximo_Estado : out std_logic_vector(2 downto 0)
    );
    end component;
	 
	 signal I_tb : std_logic;
	 
	 signal V_gt_P_tb : std_logic;
    signal Q_gt_zero_tb : std_logic;
	 
	 signal clock_tb : std_logic;
	 signal reset_tb : std_logic;
	 
    
	 signal V_count_rst_tb : std_logic;
    signal V_count_ld_tb : std_logic;
	 
	 signal Q_count_rst_tb : std_logic;
    signal Q_count_ld_tb : std_logic;
	 
	 signal P_count_rst_tb : std_logic;
    signal P_count_ld_tb : std_logic;
    
	 signal T_count_rst_tb : std_logic;
    signal T_count_ld_tb : std_logic;
	 
	 signal F_tb : std_logic_vector(1 downto 0);
    
	 signal R_tb : std_logic_vector(1 downto 0);
	 signal S_count_rst_tb : std_logic;
    signal S_count_ld_tb : std_logic;
    
	 signal Estado_tb : std_logic_vector(2 downto 0);
	 signal proximo_Estado_tb : std_logic_vector(2 downto 0);

	 constant PERIOD : time := 10 ns;
	 constant DUTY_CYCLE : real := 0.5;
	 constant OFFSET : time := 5 ns;
	 
	 begin
	
	 PROCESS
	 BEGIN
		WAIT for OFFSET;
		CLOCK_LOOP: LOOP
			clock_tb <= '0';
			WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
			clock_tb <= '1';
			WAIT FOR (PERIOD * DUTY_CYCLE);
		END LOOP CLOCK_LOOP;
	 END PROCESS;
	 
	 IN_controladora: controladora port map (
        I => I_tb,
		  V_gt_P => V_gt_P_tb,
        Q_gt_zero => Q_gt_zero_tb,
		  
		  clock => clock_tb,
		  reset => reset_tb,
        
		  V_count_rst => V_count_rst_tb,
        V_count_ld => V_count_ld_tb,
		  
        Q_count_rst => Q_count_rst_tb,
        Q_count_ld => Q_count_ld_tb,
		  
		  P_count_rst => P_count_rst_tb,
        P_count_ld => P_count_ld_tb,
        
		  T_count_rst => T_count_rst_tb,
        T_count_ld => T_count_ld_tb,
		  
		  F => F_tb,
        
		  R => R_tb,
		  S_count_rst => S_count_rst_tb,
        S_count_ld => S_count_ld_tb,
		  
		  Estado => Estado_tb,
		  proximo_Estado => proximo_Estado_tb
    );
	 
    process
    begin
	 
	 Estado_tb <= "000";
    wait for 10 ns;
	 
	 Estado_tb <= "001";
	 I_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "001";
	 I_tb <= '0';
	 R_tb <= "00";
    wait for 10 ns;
	 
	 Estado_tb <= "010";
    Q_gt_zero_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "011";
	 R_tb <= "00";
    wait for 10 ns;
	 
	 Estado_tb <= "100";
    wait for 10 ns;
	 
	 Estado_tb <= "101";
	 V_gt_P_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "110";
	 reset_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "111";
	 reset_tb <= '0';
    wait for 10 ns;
	 
	 -------
	 
	 Estado_tb <= "000";
    wait for 10 ns;
	 
	 Estado_tb <= "001";
	 I_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "001";
	 I_tb <= '0';
	 R_tb <= "00";
    wait for 10 ns;
	 
	 Estado_tb <= "010";
    Q_gt_zero_tb <= '1';
	 reset_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "011";
	 R_tb <= "00";
    wait for 10 ns;
	 
	 Estado_tb <= "100";
    wait for 10 ns;
	 
	 Estado_tb <= "101";
	 V_gt_P_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "110";
	 reset_tb <= '1';
    wait for 10 ns;
	 
	 Estado_tb <= "111";
	 reset_tb <= '1';
    wait for 10 ns;
	 
	 wait;
	 
	 end process;

end tb_arch;
