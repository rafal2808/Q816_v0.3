LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Logic_test IS
END Logic_test;
 
ARCHITECTURE behavior OF Logic_test IS 

    COMPONENT Logic
    PORT(
         LOGICin : IN  std_logic_vector(4 downto 0);
         LOGICclk : IN  std_logic;
         LOGICout : OUT  std_logic_vector(29 downto 0);
			LOGICsts : IN std_logic_vector(3 downto 0);	
			RESET : IN std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal LOGICin : std_logic_vector(4 downto 0) := (others => '0');
   signal LOGICclk : std_logic := '0';
	signal LOGICsts :  std_logic_vector(3 downto 0);
	signal RESET : std_logic;

 	--Outputs
   signal LOGICout : std_logic_vector(29 downto 0);

   constant period : time := 10 ns;
 
BEGIN

   uut: Logic PORT MAP (
          LOGICin => LOGICin,
          LOGICclk => LOGICclk,
          LOGICout => LOGICout,
			 LOGICsts => LOGICsts,
			 RESET => RESET
        );

   stim_proc: process
   begin	
		wait for 50 ns;
		RESET<= '0';
		wait for 50 ns;
		RESET<= '1';
		wait for 50 ns;
		RESET<= '0';
		
		
		wait for 50 ns;
		LOGICclk<= '0';
		LOGICin<= "01110";
		LOGICsts<="0000";
		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';

		wait for 50 ns;
		LOGICclk<= '0';

		wait for 50 ns;
		LOGICclk<= '1';
		wait;
   end process;

END;
