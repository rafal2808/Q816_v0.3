LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PC_test IS
END PC_test;
 
ARCHITECTURE behavior OF PC_test IS 
 
    COMPONENT PC
    PORT(
         PC_REG_H : IN  std_logic_vector(7 downto 0);
         PC_REG_L : IN  std_logic_vector(7 downto 0);
         PC_REG_Hclk : IN  std_logic;
         PC_REG_Lclk : IN  std_logic;
         PC_REG_Hclr : IN  std_logic;
         PC_REG_Lclr : IN  std_logic;
         Cclk : IN  std_logic;
         Cclr : IN  std_logic;
         Cload : IN  std_logic;
         PCout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	--Inputs
   signal PC_REG_H : std_logic_vector(7 downto 0) := (others => '0');
   signal PC_REG_L : std_logic_vector(7 downto 0) := (others => '0');
   signal PC_REG_Hclk : std_logic := '0';
   signal PC_REG_Lclk : std_logic := '0';
   signal PC_REG_Hclr : std_logic := '0';
   signal PC_REG_Lclr : std_logic := '0';
   signal Cclk : std_logic := '0';
   signal Cclr : std_logic := '0';
   signal Cload : std_logic := '0';

 	--Outputs
   signal PCout : std_logic_vector(15 downto 0);

	constant period : time := 10 ns;
 
BEGIN

   uut: PC PORT MAP (
          PC_REG_H => PC_REG_H,
          PC_REG_L => PC_REG_L,
          PC_REG_Hclk => PC_REG_Hclk,
          PC_REG_Lclk => PC_REG_Lclk,
          PC_REG_Hclr => PC_REG_Hclr,
          PC_REG_Lclr => PC_REG_Lclr,
          Cclk => Cclk,
          Cclr => Cclr,
          Cload => Cload,
          PCout => PCout
        );


   stim_proc: process
   begin		
	wait for 50 ns;
		PC_REG_H<= "11111111";
		PC_REG_L<= "11111111";
	
      wait for 50 ns;
		PC_REG_Lclk<='1';
		PC_REG_Hclk<='1';
		
      wait for 50 ns;
		PC_REG_Lclk<='0';
		PC_REG_Hclk<='0';
		
		wait for 50 ns;
		Cclr<='1';
		wait for 50 ns;
		Cclr<='0';
		
		wait for 50 ns;
		Cclk<='1';
		wait for 50 ns;
		Cclk<='0';
		wait for 50 ns;
		Cclk<='1';
		wait for 50 ns;
		Cclk<='0';
		
		wait for 50 ns;
		Cload<='1';
		wait for 50 ns;
		Cload<='0';
		
		wait for 50 ns;
		Cclk<='1';
		wait for 50 ns;
		Cclk<='0';
		wait for 50 ns;
		Cclk<='1';
		wait for 50 ns;
		Cclk<='0';
		
		wait for 50 ns;
		Cclk<='1';
		Cclr<='1';
		Cload<='1';
		wait;
   end process;

END;
