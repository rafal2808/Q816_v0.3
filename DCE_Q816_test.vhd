LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY DCE_Q816_test IS
END DCE_Q816_test;
 
ARCHITECTURE behavior OF DCE_Q816_test IS 

 
    COMPONENT DCE_Q816
    PORT(
         CPUclk : IN  std_logic;
         CPUreset : IN  std_logic;
         CPUin : IN  std_logic_vector(7 downto 0);
         CPUout : OUT  std_logic_vector(7 downto 0);
         CPUvga : OUT  std_logic_vector(7 downto 0);
         CPUram_a : OUT  std_logic_vector(7 downto 0);
         CPUram_we : OUT  std_logic_vector(7 downto 0);
         CPUram_wy : IN  std_logic_vector(7 downto 0);
         CPUram_clk : OUT  std_logic;
			CPUram_e : out std_logic;
         CPUrom_a : OUT  std_logic_vector(15 downto 0);
         CPUrom_ir : IN  std_logic_vector(4 downto 0);
         CPUrom_db : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CPUclk : std_logic := '0';
   signal CPUreset : std_logic := '0';
   signal CPUin : std_logic_vector(7 downto 0) := (others => '0');
   signal CPUram_wy : std_logic_vector(7 downto 0) := (others => '0');
   signal CPUrom_ir : std_logic_vector(4 downto 0) := (others => '0');
   signal CPUrom_db : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal CPUout : std_logic_vector(7 downto 0);
   signal CPUvga : std_logic_vector(7 downto 0);
   signal CPUram_a : std_logic_vector(7 downto 0);
   signal CPUram_we : std_logic_vector(7 downto 0);
   signal CPUram_clk : std_logic;
	signal CPUram_e : std_logic;
   signal CPUrom_a : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant period : time := 10 ns;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DCE_Q816 PORT MAP (
          CPUclk => CPUclk,
          CPUreset => CPUreset,
          CPUin => CPUin,
          CPUout => CPUout,
          CPUvga => CPUvga,
          CPUram_a => CPUram_a,
          CPUram_we => CPUram_we,
          CPUram_wy => CPUram_wy,
          CPUram_clk => CPUram_clk,
			 CPUram_e => CPUram_e,
          CPUrom_a => CPUrom_a,
          CPUrom_ir => CPUrom_ir,
          CPUrom_db => CPUrom_db
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      CPUrom_ir<="01100";
		CPUin<="01001100";
		
		wait for 5 ns;
		CPUreset<= '0';
		wait for 5 ns;
		CPUreset<= '1';
		wait for 5 ns;
		CPUreset<= '0';
		wait for 75 ns;
		
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		
		CPUrom_ir<="00001";
		CPUin<="01001100";
		
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		
		CPUrom_ir<="01000";
		CPUin<="01001100";
		
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		
		CPUrom_ir<="01010";
		CPUin<="01001100";
		
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		
		CPUrom_ir<="10011";
		
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		
		--CPUrom_ir<="01001";
		
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
		CPUclk<='1';
		wait for 10 ns;
		CPUclk<='0';
		wait for 10 ns;
      wait;
   end process;

END;
