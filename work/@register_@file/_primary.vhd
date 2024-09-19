library verilog;
use verilog.vl_types.all;
entity Register_File is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Rs1             : in     vl_logic_vector(4 downto 0);
        Rs2             : in     vl_logic_vector(4 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Write_data      : in     vl_logic_vector(31 downto 0);
        RegWrite        : in     vl_logic;
        Read_data1      : out    vl_logic_vector(31 downto 0);
        Read_data2      : out    vl_logic_vector(31 downto 0)
    );
end Register_File;
