library IEEE;
use IEEE.std_logic_1164.all;

entity dmux4_vhd_x16 is
    Port (
        S:  in   STD_LOGIC_VECTOR (1 downto 0);
        D:  in   STD_LOGIC_VECTOR (15 downto 0);
        O3: out  STD_LOGIC_VECTOR (15 downto 0);
        O2: out  STD_LOGIC_VECTOR (15 downto 0);
        O1: out  STD_LOGIC_VECTOR (15 downto 0);
        O0: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end dmux4_vhd_x16;

architecture default of dmux4_vhd_x16 is
    component dmux_vhd_x16 is
        Port (
            S:  in   STD_LOGIC;
            D:  in   STD_LOGIC_VECTOR (15 downto 0);
            O1: out  STD_LOGIC_VECTOR (15 downto 0);
            O0: out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal H: STD_LOGIC_VECTOR (15 downto 0);
    signal L: STD_LOGIC_VECTOR (15 downto 0);

begin
    locate      : dmux_vhd_x16 port map (S(1), D, H, L);
    output_high : dmux_vhd_x16 port map (S(0), H, O3, O2);
    output_low  : dmux_vhd_x16 port map (S(0), L, O1, O0);
end default;