library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_caminho_de_dados is
end entity tb_caminho_de_dados;

architecture tb_arch of tb_caminho_de_dados is

    component caminho_de_dados is
        port (
            clock : in std_logic;
            S : in std_logic_vector(1 downto 0);
            
				V : in std_logic_vector(8 downto 0);
            V_count_rst : in std_logic;
            V_count_ld : in std_logic;
				V_count_out : inout std_logic_vector(8 downto 0);	
            
				Q : in std_logic_vector(4 downto 0);
            Q_count_rst : in std_logic;
            Q_count_ld : in std_logic;
				Q_count_out : inout std_logic_vector(4 downto 0);
            
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
	 
	 signal clock_tb : std_logic;
    signal S_tb : std_logic_vector(1 downto 0);
    
	 signal V_tb : std_logic_vector(8 downto 0);
    signal V_count_rst_tb : std_logic;
    signal V_count_ld_tb : std_logic;
	 signal V_count_out_tb : std_logic_vector(8 downto 0);	
    
	 signal Q_tb : std_logic_vector(4 downto 0);
    signal Q_count_rst_tb : std_logic;
    signal Q_count_ld_tb : std_logic;
	 signal Q_count_out_tb : std_logic_vector(4 downto 0);	
    
	 signal P_tb : std_logic_vector(8 downto 0);
    signal P_count_rst_tb : std_logic;
    signal P_count_ld_tb : std_logic;
    
	 signal T_tb : std_logic_vector(8 downto 0);
    signal T_count_rst_tb : std_logic;
    signal T_count_ld_tb : std_logic;
    
	 signal R_tb : std_logic_vector(1 downto 0);
    signal S_count_rst_tb : std_logic;
    signal S_count_ld_tb : std_logic;
    
	 signal P1_tb : std_logic_vector(3 downto 0);
    signal P2_tb : std_logic_vector(3 downto 0);
    signal P3_tb : std_logic_vector(3 downto 0);
    signal P4_tb : std_logic_vector(3 downto 0);
   
	 signal V_gt_P_tb : std_logic;
    signal Q_gt_zero_tb : std_logic;

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
	 
	 IN_caminho_de_dados: caminho_de_dados port map (
        clock => clock_tb,
        S => S_tb,
        
		  V => V_tb,
        V_count_rst => V_count_rst_tb,
        V_count_ld => V_count_ld_tb,
		  V_count_out => V_count_out_tb,
        
		  Q => Q_tb,
        Q_count_rst => Q_count_rst_tb,
        Q_count_ld => Q_count_ld_tb,
		  Q_count_out => Q_count_out_tb,
        
		  P => P_tb,
        P_count_rst => P_count_rst_tb,
        P_count_ld => P_count_ld_tb,
        
		  T => T_tb,
        T_count_rst => T_count_rst_tb,
        T_count_ld => T_count_ld_tb,
        
		  R => R_tb,
        S_count_rst => S_count_rst_tb,
        S_count_ld => S_count_ld_tb,
        
		  P1 => P1_tb,
        P2 => P2_tb,
        P3 => P3_tb,
        P4 => P4_tb,
        
		  V_gt_P => V_gt_P_tb,
        Q_gt_zero => Q_gt_zero_tb
    );
	 
    process
    begin
	 
	 P1_tb <= "0001";
	 P2_tb <= "0010";
	 P3_tb <= "0100";
	 P4_tb <= "1000";
	 S_tb <= "00";
	 
	 V_tb <= "100000000";
	 V_count_rst_tb <= '0';
	 V_count_ld_tb <= '1';
	 
	 Q_tb <= "00010";
	 Q_count_rst_tb <= '0';
	 Q_count_ld_tb <= '1';
	 
	 P_count_rst_tb <= '0';
	 P_count_ld_tb <= '0';
	 
	 T_count_rst_tb <= '0';
	 T_count_ld_tb <= '0';
	 
	 S_count_rst_tb <= '0';
	 S_count_ld_tb <= '1';
	    
    wait for 20 ns;
	 
	 P1_tb <= "0001";
	 P2_tb <= "0010";
	 P3_tb <= "0100";
	 P4_tb <= "1000";
	 S_tb <= "00";
	 
	 V_tb <= "100000000"; 
	 V_count_rst_tb <= '0';
	 V_count_ld_tb <= '0';
	 
	 Q_tb <= "00010";
	 Q_count_rst_tb <= '0';
	 Q_count_ld_tb <= '0';
	 
	 P_count_rst_tb <= '0';
	 P_count_ld_tb <= '1';
	 
	 T_count_rst_tb <= '0';
	 T_count_ld_tb <= '0';
	 
	 S_count_rst_tb <= '0';
	 S_count_ld_tb <= '0';
        
    wait for 40 ns;
	 
	 P1_tb <= "0001";
	 P2_tb <= "0010";
	 P3_tb <= "0100";
	 P4_tb <= "1000";
	 S_tb <= "00";
	 
	 V_tb <= "100000000";
	 V_count_rst_tb <= '0';
	 V_count_ld_tb <= '0';
	 
	 Q_tb <= "00010";
	 Q_count_rst_tb <= '0';
	 Q_count_ld_tb <= '0';
	 
	 P_count_rst_tb <= '0';
	 P_count_ld_tb <= '0';
	 
	 T_count_rst_tb <= '0';
	 T_count_ld_tb <= '1';
	 
	 S_count_rst_tb <= '0';
	 S_count_ld_tb <= '0';
        
    wait for 60 ns;
	
	 wait;
	 
	 end process;

end tb_arch;
