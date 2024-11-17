LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY OUT_REG_test IS
END OUT_REG_test;
 
ARCHITECTURE behavior OF OUT_REG_test IS 

	COMPONENT OUT_REG
    PORT(
         OUTin : IN  std_logic_vector(7 downto 0);
         OUTclk : IN  std_logic;
         OUTclr : IN  std_logic;
         OUTout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	--Inputs
   signal OUTin : std_logic_vector(7 downto 0) := (others => '0');
   signal OUTclk : std_logic := '0';
   signal OUTclr : std_logic := '0';

	--Outputs
   signal OUTout : std_logic_vector(7 downto 0);

	constant period : time := 10 ns;
 
BEGIN

   uut: OUT_REG PORT MAP (
          OUTin => OUTin,
          OUTclk => OUTclk,
          OUTclr => OUTclr,
          OUTout => OUTout
        );

	-- Stimulus process
   stim_proc: process
   begin		
         
		wait for 50 ns;
		OUTin<= "00000001";
	
      wait for 50 ns;
		OUTclk<= '1';
		
		wait for 50 ns;
		OUTclk<= '0';
		OUTin<= "00100101";
		
		wait for 50 ns;
		OUTclr<= '1';
		OUTclk<= '1';
		
		wait for 50 ns;
		OUTclr<= '0';
		OUTclk<= '0';
		
		wait for 50 ns;
		OUTclk<= '1';
		
		wait for 50 ns;
		OUTclk<= '0';
		
		wait;
   end process;

END;
