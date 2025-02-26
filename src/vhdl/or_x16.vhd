library IEEE;
use IEEE.std_logic_1164.all;

entity or_vhd_x16 is
    Port (
        A: in   STD_LOGIC_VECTOR (15 downto 0);
        B: in   STD_LOGIC_VECTOR (15 downto 0);
        O: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end or_vhd_x16;

architecture default of or_vhd_x16 is
    component or_vhd_x is
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

begin
    or_0: or_vhd_x port map (A(0), B(0), O(0));
    or_1: or_vhd_x port map (A(1), B(1), O(1));
    or_2: or_vhd_x port map (A(2), B(2), O(2));
    or_3: or_vhd_x port map (A(3), B(3), O(3));
    or_4: or_vhd_x port map (A(4), B(4), O(4));
    or_5: or_vhd_x port map (A(5), B(5), O(5));
    or_6: or_vhd_x port map (A(6), B(6), O(6));
    or_7: or_vhd_x port map (A(7), B(7), O(7));
    or_8: or_vhd_x port map (A(8), B(8), O(8));
    or_9: or_vhd_x port map (A(9), B(9), O(9));
    or_10: or_vhd_x port map (A(10), B(10), O(10));
    or_11: or_vhd_x port map (A(11), B(11), O(11));
    or_12: or_vhd_x port map (A(12), B(12), O(12));
    or_13: or_vhd_x port map (A(13), B(13), O(13));
    or_14: or_vhd_x port map (A(14), B(14), O(14));
    or_15: or_vhd_x port map (A(15), B(15), O(15));
end default;