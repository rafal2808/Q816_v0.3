library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IN_REG is
	Port(
		INin : in std_logic_vector(7 downto 0);
		INclk : in std_logic;
		INclr : in std_logic;
		INout_s : out std_logic_vector(7 downto 0)
		);
end IN_REG;

architecture Behavioral of IN_REG is

begin
	process(INclk, INclr)
		begin
			if rising_edge(INclk) then
				if INclr='0' then
					INout_s<=INin;
			end if;
			end if;
			if INclr= '1' then
				INout_s<= "00000000";
			end if;
	end process;
	


end Behavioral;