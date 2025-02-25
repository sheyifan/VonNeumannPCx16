library IEEE;
use IEEE.std_logic_1164.all;

entity or_vhd_x is
    Port (
        A: in   STD_LOGIC;
        B: in   STD_LOGIC;
        O: out  STD_LOGIC
    );
end or_vhd_x;

architecture default of or_vhd_x is
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

    signal NOT_A: STD_LOGIC;
    signal NOT_B: STD_LOGIC;

begin
    reverse_a   : not_vhd_x port map (A, NOT_A);
    reverse_b   : not_vhd_x port map (B, NOT_B);
    nand_ab     : nand_vhd_x port map (NOT_A, NOT_B, O);
end default;