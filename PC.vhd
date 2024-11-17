library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-----------------------------------------------------------

entity PC is
	Port(
		PC_REG_H : in std_logic_vector(2 downto 0);	--we rejestru H
		PC_REG_L : in std_logic_vector(7 downto 0);	--we rejestru L
		PC_REG_Hclk : in std_logic;						--zegar rej. H
		PC_REG_Lclk : in std_logic;						--zegar rej. L
		PC_REG_Hclr : in std_logic;						--reset rej. H
		PC_REG_Lclr : in std_logic;						--reset rej. L	
		Cclk : in std_logic;									--zegar licznika
		Cclr : in std_logic;									--reset licznika
		Cload : in std_logic;								--zapisz dane do licznika
		PCout : out std_logic_vector(10 downto 0)		--wyjscie licznika programu
		);
end PC;

-----------------------------------------------------------

architecture Behavioral of PC is
	
	signal PC_REG : std_logic_vector(10 downto 0);	--16 bitowe wyjscie(polaczone wyjscia rejestrow L i H)
	signal Cout_s : std_logic_vector(10 downto 0);	--16 bitowe wyjscie licznika

begin
--------------------------------------------------------------
	process(PC_REG_Hclk, PC_REG_Hclr)			--rejestr PC_REG_H
	begin
		if rising_edge(PC_REG_Hclk) then			--zapis
			if PC_REG_Hclr='0' then
				PC_REG(10 downto 8)<= PC_REG_H;
			end if;
		end if;
		if PC_REG_Hclr='1' then						--reset
			PC_REG(10 downto 8)<= "000";
		end if;
	end process;
---------------------------------------------------------------				
	process(PC_REG_Lclk, PC_REG_Lclr)			--rejestr PC_REG_L
	begin
		if rising_edge(PC_REG_Lclk) then			--zapis
			if PC_REG_Lclr='0' then
				PC_REG(7 downto 0)<= PC_REG_L;
			end if;
		end if;
			if PC_REG_Lclr='1' then					--reset
			PC_REG(7 downto 0)<= "00000000";
		end if;
	end process;
------------------------------------------------------------------
	process(Cclk, Cclr, Cload, PC_REG)					--licznik
		begin
		if rising_edge(Cclk) then				--wartosc licznika +1
			if Cclr='0' then
				if Cload='0' then
				Cout_s<= Cout_s + 1;
				end if;
			end if;
		end if;
		
		if Cclr='1' then							--reset licznika
			Cout_s<= "00000000000";
		end if;
		
		if Cload='1' then							--zapis wartosci poczatkowej
			if Cclr='0' then
				Cout_s<= PC_REG;
			end if;
		end if;
	end process;
	
-----------------------------------------------------------------	
	
	PCout<=Cout_s;		--przypisanie wyjscia licznika do wyjscia ukladu
	
end Behavioral;

