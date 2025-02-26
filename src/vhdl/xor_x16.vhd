library IEEE;
use IEEE.std_logic_1164.all;

entity xor_vhd_x16 is
    Port (
        A: in   STD_LOGIC_VECTOR (15 downto 0);
        B: in   STD_LOGIC_VECTOR (15 downto 0);
        O: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end xor_vhd_x16;

architecture default of xor_vhd_x16 is
    component xor_vhd_x is
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

begin
    xor_1: xor_vhd_x port map (A(1), B(1), O(1));
    xor_0: xor_vhd_x port map (A(0), B(0), O(0));
    xor_2: xor_vhd_x port map (A(2), B(2), O(2));
    xor_3: xor_vhd_x port map (A(3), B(3), O(3));
    xor_4: xor_vhd_x port map (A(4), B(4), O(4));
    xor_5: xor_vhd_x port map (A(5), B(5), O(5));
    xor_6: xor_vhd_x port map (A(6), B(6), O(6));
    xor_7: xor_vhd_x port map (A(7), B(7), O(7));
    xor_8: xor_vhd_x port map (A(8), B(8), O(8));
    xor_9: xor_vhd_x port map (A(9), B(9), O(9));
    xor_10: xor_vhd_x port map (A(10), B(10), O(10));
    xor_11: xor_vhd_x port map (A(11), B(11), O(11));
    xor_12: xor_vhd_x port map (A(12), B(12), O(12));
    xor_13: xor_vhd_x port map (A(13), B(13), O(13));
    xor_14: xor_vhd_x port map (A(14), B(14), O(14));
    xor_15: xor_vhd_x port map (A(15), B(15), O(15));
end default;