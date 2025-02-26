library IEEE;
use IEEE.std_logic_1164.all;

entity dmux_vhd_x16 is
    Port (
        S:  in   STD_LOGIC;
        D:  in   STD_LOGIC_VECTOR (15 downto 0);
        O1: out  STD_LOGIC_VECTOR (15 downto 0);
        O0: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end dmux_vhd_x16;

architecture default of dmux_vhd_x16 is
    component dmux_vhd_x is
        Port (
            S:  in   STD_LOGIC;
            D:  in   STD_LOGIC;
            O1: out  STD_LOGIC;
            O0: out  STD_LOGIC
        );
    end component;

begin
    dmux_0: dmux_vhd_x port map (S, D(0), O1(0), O0(0));
    dmux_1: dmux_vhd_x port map (S, D(1), O1(1), O0(1));
    dmux_2: dmux_vhd_x port map (S, D(2), O1(2), O0(2));
    dmux_3: dmux_vhd_x port map (S, D(3), O1(3), O0(3));
    dmux_4: dmux_vhd_x port map (S, D(4), O1(4), O0(4));
    dmux_5: dmux_vhd_x port map (S, D(5), O1(5), O0(5));
    dmux_6: dmux_vhd_x port map (S, D(6), O1(6), O0(6));
    dmux_7: dmux_vhd_x port map (S, D(7), O1(7), O0(7));
    dmux_8: dmux_vhd_x port map (S, D(8), O1(8), O0(8));
    dmux_9: dmux_vhd_x port map (S, D(9), O1(9), O0(9));
    dmux_10: dmux_vhd_x port map (S, D(10), O1(10), O0(10));
    dmux_11: dmux_vhd_x port map (S, D(11), O1(11), O0(11));
    dmux_12: dmux_vhd_x port map (S, D(12), O1(12), O0(12));
    dmux_13: dmux_vhd_x port map (S, D(13), O1(13), O0(13));
    dmux_14: dmux_vhd_x port map (S, D(14), O1(14), O0(14));
    dmux_15: dmux_vhd_x port map (S, D(15), O1(15), O0(15));
end default;