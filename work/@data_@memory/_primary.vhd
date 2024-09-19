library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        Writedata       : in     vl_logic_vector(31 downto 0);
        Data_out        : out    vl_logic_vector(31 downto 0)
    );
end Data_Memory;
