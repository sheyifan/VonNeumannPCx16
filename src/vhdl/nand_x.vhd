library IEEE;
use IEEE.std_logic_1164.all;

entity nand_vhd_x is
    Port (
        A: in   STD_LOGIC;
        B: in   STD_LOGIC;
        Y: out  STD_LOGIC
    );
end nand_vhd_x;

architecture default of nand_vhd_x is
begin
    Y <= not (A and B);
end default;
