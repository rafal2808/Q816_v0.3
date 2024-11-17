library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAR is
	Port(
		RARin : in std_logic_vector(7 downto 0);
		RARclk : in std_logic;
		RARclr : in std_logic;
		RARout : out std_logic_vector(7 downto 0)
		);
end RAR;

architecture Behavioral of RAR is
	
begin
	process(RARclk, RARclr)
		begin
			if rising_edge(RARclk) then
				if RARclr='0' then
					RARout<=RARin;
			end if;
			end if;
			if RARclr= '1' then
				RARout<= "00000000";
			end if;
	end process;


end Behavioral;

