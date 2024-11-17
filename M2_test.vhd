LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY M2_test IS
END M2_test;
 
ARCHITECTURE behavior OF M2_test IS 
 
	COMPONENT CORE_M2
    PORT(
         M2in : IN  std_logic_vector;
         M2ms : IN  std_logic_vector;
         M2out : OUT  std_logic_vector;
         M2Sout : OUT  std_logic_vector
        );
   END COMPONENT;
    

   --Inputs
   signal M2in : std_logic_vector(7 downto 0) := (others => '0');
   signal M2ms : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal M2out : std_logic_vector(7 downto 0);
   signal M2Sout : std_logic_vector(3 downto 0);

	constant period : time := 10 ns;
 
BEGIN
	uut: CORE_M2 PORT MAP (
          M2in => M2in,
          M2ms => M2ms,
          M2out => M2out,
          M2Sout => M2Sout
        );

	stim_proc: process
		begin 
      wait for 50 ns;
		M2in<= "00000000";
		M2ms<= "00000000";
		
      wait for period;
		M2in<= "00001000";
		M2ms<= "00001000";
		
		wait for period;
		M2in<= "00001000";
		M2ms<= "00000100";
		
		wait for period;
		M2in<= "00001001";
		M2ms<= "00000010";
		
		wait for period;
		M2in<= "00000000";
		M2ms<= "00000001";
		
		wait;
	end process;

END;
