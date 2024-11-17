library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX is
	Port(
		Din : in std_logic_vector(7 downto 0);		--wyjscie rejestru IN
		Ddb : in std_logic_vector(7 downto 0);		--wyjscie rejestru dla danych bezposrednich
		Dram : in std_logic_vector(7 downto 0);	--wyjscie pamieci RAM
		Dout : out std_logic_vector(7 downto 0);	--wyjscie MUX
		Adress : in std_logic_vector(1 downto 0)	--wejscia adresowe
		);
end MUX;

architecture Behavioral of MUX is

begin
		with Adress select						--opis dzialania MUX do wyjscia ukladu przypisany
		Dout<=   Din when "00",					--zostaje sygnal zgodny z adrsem
					Ddb when "01",
					Dram when "10",
					"00000000" when others;

end Behavioral;

