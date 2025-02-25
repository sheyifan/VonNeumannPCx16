library IEEE;
use IEEE.std_logic_1164.all;

entity and_vhd_x is
    Port (
        A: in   STD_LOGIC;
        B: in   STD_LOGIC;
        Y: out  STD_LOGIC
    );
end and_vhd_x;

architecture default of and_vhd_x is
    component nand_vhd_x
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            Y: out  STD_LOGIC
        );
    end component;
    component not_vhd_x
        Port (
            I: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

    signal NAND_O: STD_LOGIC;
    
begin
    connection1: nand_vhd_x port map (A, B, NAND_O);
    connection2: not_vhd_x port map (NAND_O, Y);
end default;
