library IEEE;
use IEEE.std_logic_1164.all;

entity dmux8_vhd_x is
    Port (
        S   : in  STD_LOGIC_VECTOR (2 downto 0);
        I   : in  STD_LOGIC;
        O7  : out STD_LOGIC;
        O6  : out STD_LOGIC;
        O5  : out STD_LOGIC;
        O4  : out STD_LOGIC;
        O3  : out STD_LOGIC;
        O2  : out STD_LOGIC;
        O1  : out STD_LOGIC;
        O0  : out STD_LOGIC
    );
end dmux8_vhd_x;

architecture default of dmux8_vhd_x is
    component dmux_vhd_x is
        Port (
            S: in   STD_LOGIC;
            D: in   STD_LOGIC;
            O1: out  STD_LOGIC;
            O0: out  STD_LOGIC
        );
    end component;
    component dmux4_vhd_x is
        Port (
            S   : in    STD_LOGIC_VECTOR (1 downto 0);
            I   : in    STD_LOGIC;
            O3  : out   STD_LOGIC;
            O2  : out   STD_LOGIC;
            O1  : out   STD_LOGIC;
            O0  : out   STD_LOGIC
        );
    end component;

    signal H: STD_LOGIC;
    signal L: STD_LOGIC;
    
begin
    locate      : dmux_vhd_x port map (S(2), I, H, L);
    output_high : dmux4_vhd_x port map (S(1 downto 0), H, O7, O6, O5, O4);
    output_low  : dmux4_vhd_x port map (S(1 downto 0), L, O3, O2, O1, O0);
end architecture default;