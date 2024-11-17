library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------

entity OUT is
	Port(
		OUTin : in std_logic_vector(7 downto 0);	--wejscie rejestru
		OUTclk : in std_logic;							--sygnal zegarowy
		OUTclr : in std_logic;							--sygnal zerujacy
		OUYout : out std_logic_vector(7 downto 0)	--wyjscie rejestru
		);

end OUT;

------------------------------------------------------------

architecture Behavioral of OUT is

	--signal we : std_logic_vector(7 downto 0);

begin
	process(OUTclk, OUTclr)
		begin
			if rising_edge (OUTclk) then
			OUTout<= OUTin;
			if OUTclt= '1' then
			OUTout<= "00000000";
			end if;
			end if;
	end process;

end Behavioral;

