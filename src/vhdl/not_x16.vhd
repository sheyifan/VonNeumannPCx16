library IEEE;
use IEEE.std_logic_1164.all;

entity not_vhd_x16 is
    Port (
        I: in   STD_LOGIC_VECTOR (15 downto 0);
        O: out  STD_LOGIC_VECTOR (15 downto 0)
    );
end not_vhd_x16;

architecture default of not_vhd_x16 is
    component not_vhd_x is
        Port (
            I: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

    -- signal NOT_0: STD_LOGIC;
    -- signal NOT_1: STD_LOGIC;
    -- signal NOT_2: STD_LOGIC;
    -- signal NOT_3: STD_LOGIC;
    -- signal NOT_4: STD_LOGIC;
    -- signal NOT_5: STD_LOGIC;
    -- signal NOT_6: STD_LOGIC;
    -- signal NOT_7: STD_LOGIC;
    -- signal NOT_8: STD_LOGIC;
    -- signal NOT_9: STD_LOGIC;
    -- signal NOT_10: STD_LOGIC;
    -- signal NOT_11: STD_LOGIC;
    -- signal NOT_12: STD_LOGIC;
    -- signal NOT_13: STD_LOGIC;
    -- signal NOT_14: STD_LOGIC;
    -- signal NOT_15: STD_LOGIC;

begin
    reverse_0: not_vhd_x port map (I(0), O(0));
    reverse_1: not_vhd_x port map (I(1), O(1));
    reverse_2: not_vhd_x port map (I(2), O(2));
    reverse_3: not_vhd_x port map (I(3), O(3));
    reverse_4: not_vhd_x port map (I(4), O(4));
    reverse_5: not_vhd_x port map (I(5), O(5));
    reverse_6: not_vhd_x port map (I(6), O(6));
    reverse_7: not_vhd_x port map (I(7), O(7));
    reverse_8: not_vhd_x port map (I(8), O(8));
    reverse_9: not_vhd_x port map (I(9), O(9));
    reverse_10: not_vhd_x port map (I(10), O(10));
    reverse_11: not_vhd_x port map (I(11), O(11));
    reverse_12: not_vhd_x port map (I(12), O(12));
    reverse_13: not_vhd_x port map (I(13), O(13));
    reverse_14: not_vhd_x port map (I(14), O(14));
    reverse_15: not_vhd_x port map (I(15), O(15));
end default;