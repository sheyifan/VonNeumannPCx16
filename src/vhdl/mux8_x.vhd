library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_vhd_x is
    Port (
        S   : in    STD_LOGIC_VECTOR (2 downto 0);
        I7  : in    STD_LOGIC;
        I6  : in    STD_LOGIC;
        I5  : in    STD_LOGIC;
        I4  : in    STD_LOGIC;
        I3  : in    STD_LOGIC;
        I2  : in    STD_LOGIC;
        I1  : in    STD_LOGIC;
        I0  : in    STD_LOGIC;
        O   : out   STD_LOGIC
    );
end mux8_vhd_x;

architecture default of mux8_vhd_x is
    component mux_vhd_x is
        Port (
            S   : in    STD_LOGIC;
            D1  : in    STD_LOGIC;
            D0  : in    STD_LOGIC;
            O   : out   STD_LOGIC
        );
    end component;
    component mux4_vhd_x is
        Port (
            S   : in    STD_LOGIC_VECTOR (1 downto 0);
            I3  : in    STD_LOGIC;
            I2  : in    STD_LOGIC;
            I1  : in    STD_LOGIC;
            I0  : in    STD_LOGIC;
            O   : out   STD_LOGIC
        );
    end component;

    signal H: STD_LOGIC;
    signal L: STD_LOGIC;

begin
    get_high: mux4_vhd_x port map (S(1 downto 0), I7, I6, I5, I4, H);
    get_low : mux4_vhd_x port map (S(1 downto 0), I3, I2, I1, I0, L);
    last    : mux_vhd_x  port map (S(2), H, L, O);
end default;