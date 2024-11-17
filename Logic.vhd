library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Logic is
	Port(
		LOGICin : in std_logic_vector(4 downto 0);		--wejscie z IR
		LOGICclk : in std_logic;								--zegar
		LOGICout : out std_logic_vector(29 downto 0);	--wszystkie sygn sterujace
		LOGICsts : in std_logic_vector(3 downto 0);		--wejscie z rejestru sts
		RESET : in std_logic;									--ogolny sygnal reset
		LOGICram_e : out std_logic								--ram zezwolenie 
		);
end Logic;

architecture Structural of Logic is
----------------------------------------------------------
	signal Lclr : std_logic;								--2 bitowy licznik zerowanie
	signal Lout : std_logic_vector(1 downto 0);		--2 bitowy licznik wyjscie
	signal IRd : std_logic_vector(19 downto 0);		--wyjscie dekodera rozkazow
	signal LLd : std_logic_vector(2 downto 0);		--wyjscie 2 bitowego dekodera
-----------------------------------------------------------	
begin
----------------------------------------------------------
	process(LOGICclk, Lclr)						--2 bitowy licznik
		begin
			if rising_edge(LOGICclk) then		-- +1
				if Lclr='0' then
					Lout<= Lout +1;
				end if;
			end if;
		
			if Lclr='1' then						--zerowanie
				Lout<= "00";
			end if;
	end process;
-----------------------------------------------------------
	IRd(0)<=((LOGICin(1) nor LOGICin(2)) and (LOGICin(3) nor LOGICin(4))) and LOGICin(0);					--dekoder rozkazow rozkaz 2
	IRd(1)<=((LOGICin(0) nor LOGICin(2)) and (LOGICin(3) nor LOGICin(4))) and LOGICin(1);					--rozkaz 3
	IRd(2)<=(LOGICin(0) and LOGICin(1)) and ((LOGICin(2) nor LOGICin(3)) and (not(LOGICin(4))));			--rozkaz 4
	IRd(3)<=((LOGICin(1) nor LOGICin(0)) and (LOGICin(3) nor LOGICin(4))) and LOGICin(2);					--rozkaz 5
	IRd(4)<=(LOGICin(0) and LOGICin(2)) and ((LOGICin(1) nor LOGICin(3)) and (not(LOGICin(4))));			--rozkaz 6
	IRd(5)<=(LOGICin(1) and LOGICin(2)) and ((LOGICin(0) nor LOGICin(3)) and (not(LOGICin(4))));			--rozkaz 7
	IRd(6)<=((LOGICin(0) and LOGICin(1)) and LOGICin(2)) and (LOGICin(3) nor LOGICin(4));					--rozkaz 8
	IRd(7)<=((LOGICin(1) nor LOGICin(2)) and (LOGICin(0) nor LOGICin(4))) and LOGICin(3);					--rozkaz 9
	IRd(8)<=(LOGICin(0) and LOGICin(3)) and ((LOGICin(2) nor LOGICin(1)) and (not(LOGICin(4))));			--rozkaz 10
	IRd(9)<=(LOGICin(1) and LOGICin(3)) and ((LOGICin(2) nor LOGICin(0)) and (not(LOGICin(4))));			--rozkaz 11
	IRd(10)<=((LOGICin(0) and LOGICin(1)) and LOGICin(3)) and (LOGICin(2) nor LOGICin(4));					--rozkaz 12	
	IRd(11)<=(LOGICin(2) and LOGICin(3)) and ((LOGICin(1) nor LOGICin(0)) and (not(LOGICin(4))));		--rozkaz 13
	IRd(12)<=((LOGICin(0) and LOGICin(2)) and LOGICin(3)) and (LOGICin(1) nor LOGICin(4));					--rozkaz 14
	IRd(13)<=((LOGICin(1) and LOGICin(2)) and LOGICin(3)) and (LOGICin(0) nor LOGICin(4));					--rozkaz 15
	IRd(14)<=((((LOGICin(0) and LOGICin(1)) and (LOGICin(2))) and LOGICin(3)) and (not LOGICin(4)));	--rozkaz 16
	IRd(15)<=((LOGICin(1) nor LOGICin(2)) and (LOGICin(3) nor LOGICin(0))) and LOGICin(4);					--rozkaz 17
	IRd(16)<=(LOGICin(0) and LOGICin(4)) and ((LOGICin(2) nor LOGICin(3)) and (not(LOGICin(1))));		--rozkaz	18
	IRd(17)<=(LOGICin(1) and LOGICin(4)) and ((LOGICin(2) nor LOGICin(3)) and (not(LOGICin(0))));		--rozkaz 19
	IRd(18)<=((LOGICin(1) and LOGICin(0)) and LOGICin(4)) and (LOGICin(2) nor LOGICin(3));					--rozkaz 20
	IRd(19)<=(LOGICin(2) and LOGICin(4)) and ((LOGICin(1) nor LOGICin(3)) and (not(LOGICin(0))));		--rozkaz 21
------------------------------------------------------------------------------------------------------------------------
   LLd(0)<=(Lout(0) nor Lout(1));			--stan 0  dekode licznika 2 bitowego
	LLd(1)<=(Lout(1) and (not Lout(0)));	--stan 2
	LLd(2)<=(Lout(0) and Lout(1));			--stan 3
-----------------------------------------------------------------
	LOGICout(0)<= LLd(1) and IRd(11);				-- INclk
	LOGICout(1)<= RESET or (LLd(1) and IRd(19));	-- INclr
	LOGICout(2)<= IRd(1);								-- MUX 0
	LOGICout(3)<= IRd(2);								-- MUX 1
	LOGICout(4)<= LLd(2);
	LOGICout(5)<= LLd(1) and IRd(4);
	LOGICout(6)<= LLd(1) and IRd(3);
	LOGICout(7)<= LLd(1) and ((IRd(0) or IRd(1)) or IRd(2));
	LOGICout(8)<= RESET or (LLd(1) and IRd(19));
	LOGICout(9)<= RESET or (LLd(1) and IRd(19));
	LOGICout(10)<= RESET or (LLd(1) and IRd(19));
	LOGICout(11)<= RESET or (LLd(1) and (IRd(12) or IRd(19)));
	LOGICout(12)<= LLd(1) and IRd(5);									-- RARclk
	LOGICout(13)<= RESET or (LLd(1) and IRd(19));					-- RARclr
	LOGICout(14)<= LLd(1) and IRd(6);									-- RAMclk
	LOGICout(15)<= LLd(1) and IRd(10);									-- PC_REG_Hclk
	LOGICout(16)<= RESET or (LLd(1) and IRd(19));					-- PC_REG_Hclr
	LOGICout(17)<= LLd(1) and IRd(9);									-- PC_REG_Lclk
	LOGICout(18)<= RESET or (LLd(1) and IRd(19));					-- PC_REG_Lclr
	LOGICout(19)<= LLd(2);													-- Cclk
	LOGICout(20)<= RESET or (LLd(1) and IRd(19));					-- Cclr
	LOGICout(21)<= LLd(1) and ((((IRd(13) or (IRd(14) and LOGICsts(2)) or (IRd(15) and LOGICsts(3))) or (IRd(16) and LOGICsts(1))) or (IRd(17) and LOGICsts(0))) or (IRd(18) and (not LOGICsts(0))));	-- Cload
	LOGICout(22)<= LLd(1) and IRd(7);									-- OUTclk
	LOGICout(23)<= RESET or (LLd(1) and IRd(19));					-- OUTclr
	LOGICout(24)<= LLd(1) and IRd(8);									-- VGAclk
	LOGICout(25)<= RESET or (LLd(1) and IRd(19));					-- VGAclr
	LOGICout(26)<= LLd(0);													-- IRclk
	LOGICout(27)<=	RESET or (LLd(1) and IRd(19));					-- IRclr
	LOGICout(28)<= LLd(0);													-- DBclk
	LOGICout(29)<= RESET or (LLd(1) and IRd(19));					-- DBclr
	Lclr<= RESET or (LLd(1) and IRd(19));								-- 2 bit licznik clr
	LOGICram_e <= IRd(6);
----------------------------------------------------------------	
end Structural;

