library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

------------------------------------------------------------

entity OUT_REG is
	Port(
		OUTin : in std_logic_vector(7 downto 0);	--wejscie rejestru
		OUTclk : in std_logic;							--sygnal zegarowy
		OUTclr : in std_logic;							--sygnal zerujacy
		OUTout : out std_logic_vector(7 downto 0)	--wyjscie rejestru
		);

end OUT_REG;

------------------------------------------------------------

architecture Behavioral of OUT_REG is

	signal wy : std_logic_vector(7 downto 0);	--wyjscie wewnatrz

------------------------------------------------------------

begin
	process(OUTclr, OUTclk)
		begin
			if rising_edge (OUTclk) then
			if (OUTclr = '0') then
			wy<= OUTin;
			end if;
			end if;
			if (OUTclr = '1') then
			wy<= "00000000";
			end if;
	end process;

	OUTout<=wy;		--przypisanie

end Behavioral;

