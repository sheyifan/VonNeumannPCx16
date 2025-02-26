library IEEE;
use IEEE.std_logic_1164.all;

entity mux_hdl_x16 is
    Port (
        S:  in  STD_LOGIC;
        D1: in  STD_LOGIC_VECTOR (15 downto 0);
        D0: in  STD_LOGIC_VECTOR (15 downto 0);
        O:  out STD_LOGIC_VECTOR (15 downto 0)
    );
end mux_hdl_x16;

architecture default of mux_hdl_x16 is
    component mux_vhd_x is
        Port (
            S   : in    STD_LOGIC;
            D1  : in    STD_LOGIC;
            D0  : in    STD_LOGIC;
            O   : out   STD_LOGIC
        );
    end component;

begin
    mux_0: mux_vhd_x port map (S, D1(0), D0(0), O(0));
    mux_1: mux_vhd_x port map (S, D1(1), D0(1), O(1));
    mux_2: mux_vhd_x port map (S, D1(2), D0(2), O(2));
    mux_3: mux_vhd_x port map (S, D1(3), D0(3), O(3));
    mux_4: mux_vhd_x port map (S, D1(4), D0(4), O(4));
    mux_5: mux_vhd_x port map (S, D1(5), D0(5), O(5));
    mux_6: mux_vhd_x port map (S, D1(6), D0(6), O(6));
    mux_7: mux_vhd_x port map (S, D1(7), D0(7), O(7));
    mux_8: mux_vhd_x port map (S, D1(8), D0(8), O(8));
    mux_9: mux_vhd_x port map (S, D1(9), D0(9), O(9));
    mux_10: mux_vhd_x port map (S, D1(10), D0(10), O(10));
    mux_11: mux_vhd_x port map (S, D1(11), D0(11), O(11));
    mux_12: mux_vhd_x port map (S, D1(12), D0(12), O(12));
    mux_13: mux_vhd_x port map (S, D1(13), D0(13), O(13));
    mux_14: mux_vhd_x port map (S, D1(14), D0(14), O(14));
    mux_15: mux_vhd_x port map (S, D1(15), D0(15), O(15));
end default;