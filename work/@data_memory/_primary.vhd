library verilog;
use verilog.vl_types.all;
entity Data_memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        Address         : in     vl_logic_vector(31 downto 0);
        Write_data      : in     vl_logic_vector(31 downto 0);
        Read_data       : out    vl_logic_vector(31 downto 0)
    );
end Data_memory;
