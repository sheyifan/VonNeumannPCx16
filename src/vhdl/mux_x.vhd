library IEEE;
use IEEE.std_logic_1164.all;

entity mux_vhd_x is
    Port (
        S   : in    STD_LOGIC;
        D1  : in    STD_LOGIC;
        D0  : in    STD_LOGIC;
        O   : out   STD_LOGIC
    );
end mux_vhd_x;

architecture default of mux_vhd_x is
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

    signal NOT_SELECT        : STD_LOGIC;
    signal NOT_SELECT_AND_D0 : STD_LOGIC;
    signal SELECT_AND_D1     : STD_LOGIC;

begin
    reverse_s : not_vhd_x port map (S, NOT_SELECT);
    data0     : and_vhd_x port map (NOT_SELECT, D0, NOT_SELECT_AND_D0);
    data1     : and_vhd_x port map (S, D1, SELECT_AND_D1);
    last      : or_vhd_x  port map (NOT_SELECT_AND_D0, SELECT_AND_D1, O);
end default;