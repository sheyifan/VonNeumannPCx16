library IEEE;
use IEEE.std_logic_1164.all;

entity xor_vhd_x is
    Port (
        A: in   STD_LOGIC;
        B: in   STD_LOGIC;
        O: out  STD_LOGIC
    );
end xor_vhd_x;

architecture default of xor_vhd_x is
    component not_vhd_x
        Port (
            I: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;
    component and_vhd_x
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            Y: out  STD_LOGIC
        );
    end component;
    component or_vhd_x
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

    signal NOT_A: STD_LOGIC;
    signal NOT_B: STD_LOGIC;
    signal NOT_A_AND_B: STD_LOGIC;
    signal NOT_B_AND_A: STD_LOGIC;

begin
    reverse_a   : not_vhd_x port map (A, NOT_A);
    reverse_b   : not_vhd_x port map (B, NOT_B);
    and1        : and_vhd_x port map (NOT_A, B, NOT_A_AND_B);
    and2        : and_vhd_x port map (A, NOT_B, NOT_B_AND_A);
    last        : or_vhd_x  port map (NOT_A_AND_B, NOT_B_AND_A, O);
end default;