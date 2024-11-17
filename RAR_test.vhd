LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RAR_test IS
END RAR_test;
 
ARCHITECTURE behavior OF RAR_test IS 

	COMPONENT RAR
    PORT(
         RARin : IN  std_logic_vector(7 downto 0);
         RARclk : IN  std_logic;
         RARclr : IN  std_logic;
         RARout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	--Inputs
   signal RARin : std_logic_vector(7 downto 0) := (others => '0');
   signal RARclk : std_logic := '0';
   signal RARclr : std_logic := '0';

	--Outputs
   signal RARout : std_logic_vector(7 downto 0);

	constant period : time := 10 ns;
 
BEGIN

   uut: RAR PORT MAP (
          RARin => RARin,
          RARclk => RARclk,
          RARclr => RARclr,
          RARout => RARout
        );

	-- Stimulus process
   stim_proc: process
   begin		
         
		wait for 50 ns;
		RARin<= "00000001";
	
      wait for 50 ns;
		RARclk<= '1';
		
		wait for 50 ns;
		RARclk<= '0';
		RARin<= "00100101";
		
		wait for 50 ns;
		RARclr<= '1';
		
		wait for 50 ns;
		RARclr<= '0';
		
		wait for 50 ns;
		RARclk<= '1';
		
		wait for 50 ns;
		RARclk<= '0';
		
		wait;
   end process;

END;