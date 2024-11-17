LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
	COMPONENT ALU
    PORT(
         A : IN  std_logic_vector;
         B : IN  std_logic_vector;
         Y : OUT  std_logic_vector;
         S : IN  std_logic_vector;
			STS : OUT std_logic_vector
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := "00000000";
   signal B : std_logic_vector(7 downto 0) := "00000000";
	signal S : std_logic_vector(5 downto 0) := "000000";



 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal STS : std_logic_vector(3 downto 0);
 
   constant period : time := 10 ns; 
 
BEGIN
 
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Y => Y,
          S => S,
			 STS => STS
        );

 stim_proc: process
   begin 
      wait for 50 ns;
     A<= "00000000";
	  B<= "00000000";
	  S<= "000000";
       
      wait for period;
	  A<= "00001000";
	  B<= "00001000";
	  S<= "001001";
	  
	   wait for period;
	  A<= "11111010";
	  B<= "00000000";
	  S<= "001111";
	  
	  wait for period;
	  A<= "11111010";
	  B<= "00000000";
	  S<= "011111";
	  
	  wait for period;
	  A<= "11111010";
	  B<= "00111100";
	  S<= "001100";

      wait;
  
   end process;

END;
