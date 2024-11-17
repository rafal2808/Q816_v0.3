library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------------------------------------------------

entity CORE_M2 is
	Port(
		M2in : in std_logic_vector(7 downto 0);		--wejscie danych
		M2ms : in std_logic_vector(7 downto 0);		--sygnal sterujacy CLR (A, B, C, STS) CLK (A, B, C, STS)
		M2out : out std_logic_vector(7 downto 0);		--wyjscie danych
		M2Sout : out std_logic_vector(3 downto 0)		--wyjscie rejestru STS
		);
		
end CORE_M2;

------------------------------------------------------------------------------------------------------

architecture Behavioral of CORE_M2 is

	signal Aout : std_logic_vector(7 downto 0);		--wyjscie rejestru A
	signal Bout : std_logic_vector(7 downto 0);		--wyjscie rejestru B
	signal Cout : std_logic_vector(5 downto 0);		--wyjscie rejestru C
	signal STSout : std_logic_vector(3 downto 0);	--wyjscie rejestru STS

------------------------------------------------------------------------------------------------------

	component ALU												--deklaracja ALU
		Port(
		A, B : in std_logic_vector(7 downto 0);
		S : in std_logic_vector(5 downto 0);
		Y : out std_logic_vector(7 downto 0);
		STS : out std_logic_vector(3 downto 0)
		);
	end component;

begin
	
	U1 : ALU														--przypisanie pinow
		Port map(
			A => Aout,
			B => Bout,
			S => Cout,
			Y => M2out,
			STS => STSout
		);
	
----------------------------------------------------------------------------	
	
	process(M2ms(3), M2ms(7))								--rejestr A
		begin
			if rising_edge(M2ms(3)) then					--zapis
			if M2ms(7)='0' then	
				Aout<= M2in;
			end if;
			end if;
			if M2ms(7)='1' then								--reset
				Aout<= "00000000";
			end if;
	end process;
	
------------------------------------------------------------------------------
	
	process(M2ms(2), M2ms(6))								--rejestr B
		begin
			if rising_edge(M2ms(2)) then					--zapis
			if M2ms(6)='0' then	
				Bout<= Aout;
			end if;
			end if;
			if M2ms(6)='1' then								--reset
				Bout<= "00000000";
			end if;
	end process;

------------------------------------------------------------------------------

	process(M2ms(1), M2ms(5))							--rejestr C
		begin
			if rising_edge(M2ms(1)) then				--zapis
			if M2ms(5)='0' then	
				Cout(0)<= Aout(0);
				Cout(1)<= Aout(1);
				Cout(2)<= Aout(2);
				Cout(3)<= Aout(3);
				Cout(4)<= Aout(4);
				Cout(5)<= Aout(5);
			end if;
			end if;
			if M2ms(5)='1' then							--reset
				Cout<= "000000";
			end if;
	end process;
	
--------------------------------------------------------------------------------

	process(M2ms(0), M2ms(4))								--rejestr STS
		begin
			if rising_edge(M2ms(0)) then					--zapis
			if M2ms(4)='0' then	
				M2Sout<= STSout;
			end if;
			end if;
			if M2ms(4)='1' then								--reset
				M2Sout<= "0000";
			end if;	
	end process;
	
--------------------------------------------------------------------------------	

end Behavioral;

