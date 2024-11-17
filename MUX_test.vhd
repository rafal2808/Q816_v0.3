LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_test IS
END MUX_test;
 
ARCHITECTURE behavior OF MUX_test IS 

 
    COMPONENT MUX
    PORT(
         Din : IN  std_logic_vector(7 downto 0);
         Ddb : IN  std_logic_vector(7 downto 0);
         Dram : IN  std_logic_vector(7 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0);
         Adress : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
	--Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Ddb : std_logic_vector(7 downto 0) := (others => '0');
   signal Dram : std_logic_vector(7 downto 0) := (others => '0');
   signal Adress : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);
 
	constant period : time := 10 ns;
 
BEGIN
 
   uut: MUX PORT MAP (
          Din => Din,
          Ddb => Ddb,
          Dram => Dram,
          Dout => Dout,
          Adress => Adress
        );

	stim_proc: process
   begin		
	wait for 50 ns;
		Din<= "00001001";
		Ddb<= "01010101";
		Dram<= "11110001";
	
      wait for 50 ns;
		Adress<= "00";
		
		wait for 50 ns;
		Adress<= "01";
		
		wait for 50 ns;
		Adress<= "10";
		
		wait for 50 ns;
		Adress<= "11";
		wait;
   end process;

END;
