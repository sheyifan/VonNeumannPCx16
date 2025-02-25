library IEEE;
use IEEE.std_logic_1164.all;

entity dmux4_vhd_x is
    Port (
        S   : in    STD_LOGIC_VECTOR (1 downto 0);
        I   : in    STD_LOGIC;
        O3  : out   STD_LOGIC;
        O2  : out   STD_LOGIC;
        O1  : out   STD_LOGIC;
        O0  : out   STD_LOGIC
    );
end dmux4_vhd_x;

architecture default of dmux4_vhd_x is
    component dmux_vhd_x is
        Port (
            S: in   STD_LOGIC;
            D: in   STD_LOGIC;
            O1: out  STD_LOGIC;
            O0: out  STD_LOGIC
        );
    end component;

    signal H: STD_LOGIC;
    signal L: STD_LOGIC;

begin
    locate      : dmux_vhd_x port map (S(1), I, H, L);
    output_high : dmux_vhd_x port map (S(0), H, O3, O2);
    output_low  : dmux_vhd_x port map (S(0), L, O1, O0);
end default;