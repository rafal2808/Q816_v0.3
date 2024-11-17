LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IN_REG_test IS
END IN_REG_test;
 
ARCHITECTURE behavior OF IN_REG_test IS 

	COMPONENT IN_REG
    PORT(
         INin : IN  std_logic_vector(7 downto 0);
         INclk : IN  std_logic;
         INclr : IN  std_logic;
         INout_s : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	--Inputs
   signal INin : std_logic_vector(7 downto 0) := (others => '0');
   signal INclk : std_logic := '0';
   signal INclr : std_logic := '0';

	--Outputs
   signal INout_s : std_logic_vector(7 downto 0);

	constant period : time := 10 ns;
 
BEGIN

   uut: IN_REG PORT MAP (
          INin => INin,
          INclk => INclk,
          INclr => INclr,
          INout_s => INout_s
        );

	-- Stimulus process
   stim_proc: process
   begin		
         
		wait for 50 ns;
		INin<= "00000001";
	
      wait for 50 ns;
		INclk<= '1';
		
		wait for 50 ns;
		INclk<= '0';
		INin<= "00100101";
		
		wait for 50 ns;
		INclr<= '1';
		INclk<= '1';
		
		wait for 50 ns;
		INclr<= '0';
		INclk<= '0';
		
		wait for 50 ns;
		INclk<= '1';
		
		wait for 50 ns;
		INclk<= '0';
		
		wait for 50 ns;
		INclr<= '1';
		
		wait for 50 ns;
		INclr<= '0';
		
		wait;
   end process;

END;