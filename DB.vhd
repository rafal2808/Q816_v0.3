library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DB is
	Port(
		DBin : in std_logic_vector(7 downto 0);
		DBout : out std_logic_vector(7 downto 0);
		DBclk : in std_logic;
		DBclr : in std_logic
		);
end DB;

architecture Behavioral of DB is

begin
	process(DBclk, DBclr)
		begin
			if rising_edge(DBclk) then
				if DBclr='0' then
					DBout<=DBin;
				end if;
			end if;
			
			if DBclr='1' then
				DBout<= "00000000";
			end if;
	end process;
end Behavioral;