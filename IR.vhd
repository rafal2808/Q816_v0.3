library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR is
	Port(
		IRin : in std_logic_vector(4 downto 0);
		IRout : out std_logic_vector(4 downto 0);
		IRclk : in std_logic;
		IRclr : in std_logic
		);
end IR;

architecture Behavioral of IR is

begin
	process(IRclk, IRclr)
		begin
			if rising_edge(IRclk) then
				if IRclr='0' then
					IRout<=IRin;
				end if;
			end if;
			
			if IRclr='1' then
				IRout<= "00000";
			end if;
	end process;
end Behavioral;

