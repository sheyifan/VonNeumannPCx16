library IEEE;
use IEEE.std_logic_1164.all;

entity and_vhd_x16 is
    Port (
        A: in   STD_LOGIC_VECTOR (15 downto 0);
        B: in   STD_LOGIC_VECTOR (15 downto 0);
        O: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end and_vhd_x16;

architecture default of and_vhd_x16 is
    component and_vhd_x is
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            Y: out  STD_LOGIC
        );
    end component;

begin
    and_0: and_vhd_x port map (A(0), B(0), O(0));
    and_1: and_vhd_x port map (A(1), B(1), O(1));
    and_2: and_vhd_x port map (A(2), B(2), O(2));
    and_3: and_vhd_x port map (A(3), B(3), O(3));
    and_4: and_vhd_x port map (A(4), B(4), O(4));
    and_5: and_vhd_x port map (A(5), B(5), O(5));
    and_6: and_vhd_x port map (A(6), B(6), O(6));
    and_7: and_vhd_x port map (A(7), B(7), O(7));
    and_8: and_vhd_x port map (A(8), B(8), O(8));
    and_9: and_vhd_x port map (A(9), B(9), O(9));
    and_10: and_vhd_x port map (A(10), B(10), O(10));
    and_11: and_vhd_x port map (A(11), B(11), O(11));
    and_12: and_vhd_x port map (A(12), B(12), O(12));
    and_13: and_vhd_x port map (A(13), B(13), O(13));
    and_14: and_vhd_x port map (A(14), B(14), O(14));
    and_15: and_vhd_x port map (A(15), B(15), O(15));
end default;