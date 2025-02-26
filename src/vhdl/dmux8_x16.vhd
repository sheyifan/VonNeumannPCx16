library IEEE;
use IEEE.std_logic_1164.all;

entity dmux8_vhd_x16 is
    Port (
        S:  in   STD_LOGIC_VECTOR (2 downto 0);
        D:  in   STD_LOGIC_VECTOR (15 downto 0);
        O7: out  STD_LOGIC_VECTOR (15 downto 0);
        O6: out  STD_LOGIC_VECTOR (15 downto 0);
        O5: out  STD_LOGIC_VECTOR (15 downto 0);
        O4: out  STD_LOGIC_VECTOR (15 downto 0);
        O3: out  STD_LOGIC_VECTOR (15 downto 0);
        O2: out  STD_LOGIC_VECTOR (15 downto 0);
        O1: out  STD_LOGIC_VECTOR (15 downto 0);
        O0: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end dmux8_vhd_x16;

architecture default of dmux8_vhd_x16 is
    component dmux_vhd_x16 is
        Port (
            S:  in   STD_LOGIC;
            D:  in   STD_LOGIC_VECTOR (15 downto 0);
            O1: out  STD_LOGIC_VECTOR (15 downto 0);
            O0: out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    component dmux4_vhd_x16 is
        Port (
            S:  in   STD_LOGIC_VECTOR (1 downto 0);
            D:  in   STD_LOGIC_VECTOR (15 downto 0);
            O3: out  STD_LOGIC_VECTOR (15 downto 0);
            O2: out  STD_LOGIC_VECTOR (15 downto 0);
            O1: out  STD_LOGIC_VECTOR (15 downto 0);
            O0: out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal H: STD_LOGIC_VECTOR (15 downto 0);
    signal L: STD_LOGIC_VECTOR (15 downto 0);

begin
    locate      : dmux_vhd_x16 port map (S(2), D, H, L);
    output_high : dmux4_vhd_x16 port map (S(1 downto 0), H, O7, O6, O5, O4);
    output_low  : dmux4_vhd_x16 port map (S(1 downto 0), L, O3, O2, O1, O0);
end default;