library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------------------------------------------------

entity ALU is
	port(
		A, B : in std_logic_vector(7 downto 0);
		S : in std_logic_vector(5 downto 0);
		Y : out std_logic_vector(7 downto 0);
		STS : out std_logic_vector(3 downto 0)
		);	

end ALU;

--------------------------------------------------------------------------------------------------------

architecture Behavioral of ALU is
	
	signal UW : std_logic_vector(7 downto 0);		--uklad wyboru
	signal SUM : std_logic_vector(7 downto 0);	--wyjscie sumatora
	signal C : std_logic_vector(7 downto 0);		--we/wy przeniesienia
	signal WUL : std_logic_vector(31 downto 0);	--wyjscia ukladu logicznego
	signal WML : std_logic_vector(7 downto 0);	--wyjscie mux1 z ukladow logicznych
	signal SML : std_logic_vector(1 downto 0);	--we sterujace mux logiczny
	signal WM : std_logic_vector(7 downto 0);		--wy statniego mux
	signal SS : std_logic_vector(4 downto 0);		--sygnaly shift

----------------------------------------------------------------------------------------------------------

begin
		UW(0)<= (B(0) and S(0)) or ((not B(0)) and S(1));	--uklad wyboru
		UW(1)<= (B(1) and S(0)) or ((not B(1)) and S(1));
		UW(2)<= (B(2) and S(0)) or ((not B(2)) and S(1));
		UW(3)<= (B(3) and S(0)) or ((not B(3)) and S(1));
		UW(4)<= (B(4) and S(0)) or ((not B(4)) and S(1));
		UW(5)<= (B(5) and S(0)) or ((not B(5)) and S(1));
		UW(6)<= (B(6) and S(0)) or ((not B(6)) and S(1));
		UW(7)<= (B(7) and S(0)) or ((not B(7)) and S(1));
		
---------------------------------------------------------------------------------------------------------

		C(0)<= S(5);																			--S(5) wejscie przeniecienia
		SUM(0)<= (A(0) xor UW(0)) xor C(0);												-- sumatory
		C(1)<= (A(0) and UW(0)) or (UW(0) and C(0)) or (A(0) and C(0));
		
		SUM(1)<= (A(1) xor UW(1)) xor C(1);
		C(2)<= (A(1) and UW(1)) or (UW(1) and C(1)) or (A(1) and C(1));
		
		SUM(2)<= (A(2) xor UW(2)) xor C(2);
		C(3)<= (A(2) and UW(2)) or (UW(2) and C(2)) or (A(2) and C(2));
		
		SUM(3)<= (A(3) xor UW(3)) xor C(3);
		C(4)<= (A(3) and UW(3)) or (UW(3) and C(3)) or (A(3) and C(3));
		
		SUM(4)<= (A(4) xor UW(4)) xor C(4);
		C(5)<= (A(4) and UW(4)) or (UW(4) and C(4)) or (A(4) and C(4));
		
		SUM(5)<= (A(5) xor UW(5)) xor C(5);
		C(6)<= (A(5) and UW(5)) or (UW(5) and C(5)) or (A(5) and C(5));
		
		SUM(6)<= (A(6) xor UW(6)) xor C(6);
		C(7)<= (A(6) and UW(6)) or (UW(6) and C(6)) or (A(6) and C(6));
		
		SUM(7)<= (A(7) xor UW(7)) xor C(7);
		STS(3)<= (A(7) and UW(7)) or (UW(7) and C(7)) or (A(7) and C(7));		--STS(3) wyjscie przeniesienia
	
---------------------------------------------------------------------------------------------------------------------
	
		WUL(0)<=	A(0) and B(0);		--uklady logiczne
		WUL(1)<= A(0) or B(0);
		WUL(2)<= A(0) xor B(0);
		WUL(3)<= not A(0);
		
		WUL(4)<=	A(1) and B(1);
		WUL(5)<= A(1) or B(1);
		WUL(6)<= A(1) xor B(1);
		WUL(7)<= not A(1);
		
		WUL(8)<=	A(2) and B(2);
		WUL(9)<= A(2) or B(2);
		WUL(10)<= A(2) xor B(2);
		WUL(11)<= not A(2);
		
		WUL(12)<=	A(3) and B(3);
		WUL(13)<= A(3) or B(3);
		WUL(14)<= A(3) xor B(3);
		WUL(15)<= not A(3);
		
		WUL(16)<=	A(4) and B(4);
		WUL(17)<= A(4) or B(4);
		WUL(18)<= A(4) xor B(4);
		WUL(19)<= not A(4);
		
		WUL(20)<=	A(5) and B(5);
		WUL(21)<= A(5) or B(5);
		WUL(22)<= A(5) xor B(5);
		WUL(23)<= not A(5);
		
		WUL(24)<=	A(6) and B(6);
		WUL(25)<= A(6) or B(6);
		WUL(26)<= A(6) xor B(6);
		WUL(27)<= not A(6);
		
		WUL(28)<=	A(7) and B(7);
		WUL(29)<= A(7) or B(7);
		WUL(30)<= A(7) xor B(7);
		WUL(31)<= not A(7);

-----------------------------------------------------------------------------------------------------------
		
		process(A,B)				--komparator
		begin
			STS(0)<= '0';
			STS(1)<= '0';
			STS(2)<= '0';
			if (A < B) then
				STS(0)<= '1';
			elsif (A > B) then
				STS(1)<= '1';
			elsif (A = B) then
				STS(2)<= '1';
			end if;
		end process;

-------------------------------------------------------------------------------------------------------------------
		
		SML(0)<= S(0);						--multipleksery logiczne
		SML(1)<= S(1);
		
		with SML select
		WML(0)<= WUL(0) when "00",
					WUL(1) when "01",
					WUL(2) when "10",
					WUL(3) when "11",
					'0' when others;
		with SML select			
		WML(1)<= WUL(4) when "00",
					WUL(5) when "01",
					WUL(6) when "10",
					WUL(7) when "11",
					'0' when others;
		with SML select
		WML(2)<= WUL(8) when "00",
					WUL(9) when "01",
					WUL(10) when "10",
					WUL(11) when "11",
					'0' when others;
		with SML select
		WML(3)<= WUL(12) when "00",
					WUL(13) when "01",
					WUL(14) when "10",
					WUL(15) when "11",
					'0' when others;
		with SML select			
		WML(4)<= WUL(16) when "00",
					WUL(17) when "01",
					WUL(18) when "10",
					WUL(19) when "11",
					'0' when others;
		with SML select
		WML(5)<= WUL(20) when "00",
					WUL(21) when "01",
					WUL(22) when "10",
					WUL(23) when "11",
					'0' when others;
		with SML select			
		WML(6)<= WUL(24) when "00",
					WUL(25) when "01",
					WUL(26) when "10",
					WUL(27) when "11",
					'0' when others;
		with SML select			
		WML(7)<= WUL(28) when "00",
					WUL(29) when "01",
					WUL(30) when "10",
					WUL(31) when "11",
					'0' when others;
	
-------------------------------------------------------------------------------------------------------------------
	
		WM(0)<= WML(0) when (S(2) = '1') else SUM(0);	--ostatni mux
		WM(1)<= WML(1) when (S(2) = '1') else SUM(1);
		WM(2)<= WML(2) when (S(2) = '1') else SUM(2);
		WM(3)<= WML(3) when (S(2) = '1') else SUM(3);
		WM(4)<= WML(4) when (S(2) = '1') else SUM(4);
		WM(5)<= WML(5) when (S(2) = '1') else SUM(5);
		WM(6)<= WML(6) when (S(2) = '1') else SUM(6);
		WM(7)<= WML(7) when (S(2) = '1') else SUM(7);

------------------------------------------------------------------------------------------------------------------
		
		
		SS(0)<= (not S(3)) and (not S(4));		--decoder 2 to 4 left
		SS(1)<= S(3) and (not S(4));				--no shift
		SS(2)<= (not S(3)) and S(4);				
		SS(3)<= S(3) and S(4);
		
		SS(4)<= SS(2) or SS(3);						--right
		
------------------------------------------------------------------------------------------------------------------

		Y(0)<= (WM(0) and SS(1)) or (WM(1) and SS(4));									--uklad przeniesien
		Y(1)<= (WM(0) and SS(0)) or (WM(1) and SS(1)) or (WM(2) and SS(4));
		Y(2)<= (WM(1) and SS(0)) or (WM(2) and SS(1)) or (WM(3) and SS(4));
		Y(3)<= (WM(2) and SS(0)) or (WM(3) and SS(1)) or (WM(4) and SS(4));
		Y(4)<= (WM(3) and SS(0)) or (WM(4) and SS(1)) or (WM(5) and SS(4));
		Y(5)<= (WM(4) and SS(0)) or (WM(5) and SS(1)) or (WM(6) and SS(4));
		Y(6)<= (WM(5) and SS(0)) or (WM(6) and SS(1)) or (WM(7) and SS(4));
		Y(7)<= (WM(6) and SS(0)) or (WM(7) and SS(1));

end Behavioral;

