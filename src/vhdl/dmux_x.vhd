library IEEE;
use IEEE.std_logic_1164.all;

entity dmux_vhd_x is
    Port (
        S: in   STD_LOGIC;
        D: in   STD_LOGIC;
        O1: out  STD_LOGIC;
        O0: out  STD_LOGIC
    );
end dmux_vhd_x;

architecture default of dmux_vhd_x is
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

    signal NOT_SELECT: STD_LOGIC;

begin
    reverse_s : not_vhd_x port map (S, NOT_SELECT);
    low_bit   : and_vhd_x port map (NOT_SELECT, D, O0);
    high_bit  : and_vhd_x port map (S, D, O1);
end default;