library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

------------------------------------------------------------

entity OUT_VGA is
	Port(
		VGAin : in std_logic_vector(7 downto 0);	--wejscie rejestru
		VGAclk : in std_logic;							--sygnal zegarowy
		VGAclr : in std_logic;							--sygnal zerujacy
		VGAout : out std_logic_vector(7 downto 0)	--wyjscie rejestru
		);

end OUT_VGA;

------------------------------------------------------------

architecture Behavioral of OUT_VGA is

	signal wy : std_logic_vector(7 downto 0);	--wyjscie wewnatrz

------------------------------------------------------------

begin
	process(VGAclk, VGAclr)
		begin
			if rising_edge (VGAclk) then
			if VGAclr='0' then	
				wy<= VGAin;
			end if;
			end if;
			if (VGAclr = '1') then
				wy<= "00000000";
			end if;
	end process;

	VGAout<=wy;		--przypisanie

end Behavioral;

