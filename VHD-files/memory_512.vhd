----------------------------------------------------------------------------------
-- Engineer: Geoff Natin 14318196
-- Create Date:    17:03:19 03/29/2016 
-- Module Name:    memory_512 - Behavioral 
-- Project Name: 	 CS2022 Computer Architecture 2016 Project 2
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity memory_512 is
    Port ( address : in  STD_LOGIC_VECTOR (15 downto 0);
           write_data : in  STD_LOGIC_VECTOR (15 downto 0);
			  Clk : in STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (15 downto 0));
end memory_512;

architecture Behavioral of memory_512 is

type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
-- define type, for memory arrays
signal snl : unsigned(15 downto 0);

begin
snl <= unsigned(address);
mem_process: process (address, write_data,Clk)
-- initialize data memory, X denotes hexadecimal number
variable data_mem : mem_array := (
					
--				PC 					Instructions					Pseudocode 								Codewords					Hex
--																														Opcode  DR  SA  SB

X"00DB", --0000					ADI R3, R3, #3					R3 = (0 + 3)  = 3						0000000 011 011 011 		00DB
X"0ADB", --0001					ADD R3, R3, R3					R3 = (3 + 3)  = 6						0000101 011 011 011 		0ADB
X"0121",	--0010					ADI R4, R4, #1					R4 = (0 + 1)  = 1						0000000 100 100 001		0121
X"0F24",	--0011					SR	 R4, R4, R4					R4 = (1 >> 1) = 0x8000				0000111 100 100 100		0F24
X"0ADB", --0100					ADD R3, R3, R3					R3 = (6 + 6)  = 12					0000101 011 011 011		0ADB
X"03D8", --0101					LD  R7, Memory[R3]			R7 = Memory[12] = 0x00FF			0000001 111 011 000		03D8
X"08D8", --0110					NOT R3, R3						R3 = (~12)	  = 0xFFF3				0000100 011 011 000		08D8
X"06D8", --0111		while		INC R3, R3					4x(R3 = R3 + 1)  = 0						0000011 011 011 000		06D8									
X"17C6", --1000					BNZ while																	0001011 111 000 110		17C6	
X"3A00", --1001		stop 		B stop																		0011101 000 000 000		3A00
X"0000", --										State now = [R3==0 R4==0x8000 R7==0xFF]
X"0000", --
X"00FF", --(Memory[12])
X"0000", --
X"0000", --
X"0000", --

X"0000", X"0000", X"0000",X"0000",		--x0010 - x001F
X"0000", X"0000", X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0020 - x002F
X"0000", X"0000", X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0030 - x003F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0040 - x004F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0050 - x005F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0060 - x006F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0070 - x007F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0080 - x008F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0090 - x009F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00A0 - x00AF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00A0 - x00AF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00B0 - x00BF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00C0 - x00CF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00D0 - x00DF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x00F0 - x00FF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0100 - x010F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0110 - x011F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0120 - x012F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0130 - x013F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0140 - x014F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0150 - x015F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0160 - x016F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0170 - x017F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0180 - x018F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x0190 - x019F
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01A0 - x01AF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01A0 - x01AF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01B0 - x01BF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01C0 - x01CF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01D0 - x01DF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000",

X"0000", X"0000", X"0000",X"0000",		--x01F0 - x01FF
X"0000", X"0000", X"0000",X"0000",
 X"0000", X"0000",X"0000",X"0000",
X"0000", X"0000", X"0000",X"0000"  );
variable addr:integer;

begin -- the following type conversion function is in std_logic_arith

snl <= unsigned(address);
addr:= to_integer(snl(6 downto 0));

if MemWrite ='1' then
data_mem(addr):= write_data;
end if;
read_data<=data_mem(addr);

end process;

end Behavioral;
