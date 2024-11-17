library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DCE_Q816 is
	Port(
		CPUclk : in std_logic;
		CPUreset : in std_logic;
		CPUin : in std_logic_vector(7 downto 0);
		CPUout : out std_logic_vector(7 downto 0);
		CPUvga : out std_logic_vector(7 downto 0);
		CPUram_a : out std_logic_vector(7 downto 0);
		CPUram_we : out std_logic_vector(7 downto 0);
		CPUram_wy : in std_logic_vector(7 downto 0);
		CPUram_clk : out std_logic;
		CPUrom_a : out std_logic_vector(10 downto 0);
		CPUrom_ir : in std_logic_vector(4 downto 0);
		CPUrom_db : in std_logic_vector(7 downto 0)
		);
end DCE_Q816;  

architecture Behavioral of DCE_Q816 is 
-------------------------------------------------------------------	
	component CORE_M2												
		Port(
		M2in : in std_logic_vector(7 downto 0);		--wejscie danych
		M2ms : in std_logic_vector(7 downto 0);		--sygnal sterujacy CLR (A, B, C, STS) CLK (A, B, C, STS)
		M2out : out std_logic_vector(7 downto 0);		--wyjscie danych
		M2Sout : out std_logic_vector(3 downto 0)		--wyjscie rejestru STS
		);
	end component;
-------------------------------------------------------------------
	component DB
		Port(
		DBin : in std_logic_vector(7 downto 0);
		DBout : out std_logic_vector(7 downto 0);
		DBclk : in std_logic;
		DBclr : in std_logic
		);
	end component;
--------------------------------------------------------------------
	component IN_REG
		Port(
		INin : in std_logic_vector(7 downto 0);
		INclk : in std_logic;
		INclr : in std_logic;
		INout_s : out std_logic_vector(7 downto 0)
		);
	end component;
--------------------------------------------------------------------
	component IR
		Port(
		IRin : in std_logic_vector(4 downto 0);
		IRout : out std_logic_vector(4 downto 0);
		IRclk : in std_logic;
		IRclr : in std_logic
		);
	end component;
--------------------------------------------------------------------
	component Logic
		Port(
		LOGICin : in std_logic_vector(4 downto 0);		--wejscie z IR
		LOGICclk : in std_logic;								--zegar
		LOGICout : out std_logic_vector(29 downto 0);	--wszystkie sygn sterujace
		LOGICsts : in std_logic_vector(3 downto 0);		--wejscie z rejestru sts
		RESET : in std_logic;									--ogolny sygnal reset
		LOGICram_e : out std_logic
		);
	end component;
--------------------------------------------------------------------
	component MUX
		Port(
		Din : in std_logic_vector(7 downto 0);		--wyjscie rejestru IN
		Ddb : in std_logic_vector(7 downto 0);		--wyjscie rejestru dla danych bezposrednich
		Dram : in std_logic_vector(7 downto 0);	--wyjscie pamieci RAM
		Dout : out std_logic_vector(7 downto 0);	--wyjscie MUX
		Adress : in std_logic_vector(1 downto 0)	--wejscia adresowe
		);
	end component;
--------------------------------------------------------------------
	component OUT_REG
		Port(
		OUTin : in std_logic_vector(7 downto 0);	--wejscie rejestru
		OUTclk : in std_logic;							--sygnal zegarowy
		OUTclr : in std_logic;							--sygnal zerujacy
		OUTout : out std_logic_vector(7 downto 0)	--wyjscie rejestru
		);
	end component;
--------------------------------------------------------------------
	component OUT_VGA
		Port(
		VGAin : in std_logic_vector(7 downto 0);	--wejscie rejestru
		VGAclk : in std_logic;							--sygnal zegarowy
		VGAclr : in std_logic;							--sygnal zerujacy
		VGAout : out std_logic_vector(7 downto 0)	--wyjscie rejestru
		);
	end component;
--------------------------------------------------------------------
	component PC
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
	end component;
--------------------------------------------------------------------
	component RAR
		Port(
		RARin : in std_logic_vector(7 downto 0);
		RARclk : in std_logic;
		RARclr : in std_logic;
		RARout : out std_logic_vector(7 downto 0)
		);
	end component;
--------------------------------------------------------------------
	signal bus1 : std_logic_vector(7 downto 0);
	signal S1 : std_logic_vector(7 downto 0);
	signal S2 : std_logic_vector(29 downto 0);
	signal S3 : std_logic_vector(7 downto 0);
	signal S4 : std_logic_vector(7 downto 0);
	signal S5 : std_logic_vector(4 downto 0);
	signal S6 : std_logic_vector(3 downto 0);
	signal CPUreset1 : std_logic;
	signal CPUclk1 : std_logic_vector(22 downto 0);
	signal CPUram_e : std_logic;
begin

	CPUreset1<= (not CPUreset);
	
	U1 : CORE_M2														--przypisanie pinow
		Port map(
			M2in => S1,
			M2ms => S2(11 downto 4),
			M2out => bus1,
			M2Sout => S6
		);
		
	U2 : DB
		Port map(
			DBin => CPUrom_db,
			DBout => S3,
			DBclk => S2(28),
			DBclr => S2(29)
		);
		
	U3 : IN_REG
		Port map(
			INin => CPUin,
			INclk => S2(0),
			INclr => S2(1),
			INout_s => S4
		);
	
	U4 : IR
		Port map(
			IRin => CPUrom_ir,
			IRout => S5,
			IRclk => S2(26),
			IRclr => S2(27)
		);
	
	U5 : Logic
		Port map(
			LOGICin => S5,
			LOGICclk => CPUclk1(22),
			LOGICout => S2,
			LOGICsts => S6,
			RESET => CPUreset1,
			LOGICram_e => CPUram_e
		);
		
	U6 : MUX
		Port map(
			Din => S4,
			Ddb => S3,
			Dram => CPUram_wy,
			Dout => S1,
			Adress => S2(3 downto 2) 
		);
	
	U7	: OUT_REG
		Port map(
			OUTin => bus1,
			OUTclk => S2(22),
			OUTclr => S2(23),
			OUTout => CPUout
		);
		
	U8 : OUT_VGA
		Port map(
			VGAin => bus1,
			VGAclk => S2(24),
			VGAclr => S2(25),
			VGAout => CPUvga
		);
		
	U9 : PC
		Port map(
			PC_REG_H => bus1(2 downto 0),
			PC_REG_L => bus1,
			PC_REG_Hclk => S2(15),
			PC_REG_Lclk => S2(17),
			PC_REG_Hclr => S2(16),
			PC_REG_Lclr => S2(18),
			Cclk => S2(19),
			Cclr => S2(20),
			Cload => S2(21),
			PCout => CPUrom_a
		);

	U10 : RAR
		Port map(
		RARin => bus1,
		RARclk => S2(12),
		RARclr => S2(13),
		RARout => CPUram_a
		);
		

	CPUram_clk<= (not S2(14));
	
	Process(CPUram_e)
		begin
			if CPUram_e='1' then
				CPUram_we<=bus1;
			end if;
			if CPUram_e='0' then
				CPUram_we<= "ZZZZZZZZ";
			end if;
	end process;
	
	Process(CPUclk)
		begin
			if rising_edge(CPUclk) then
				CPUclk1<= CPUclk1 +1;
			end if;
	end process;
	
end Behavioral;

