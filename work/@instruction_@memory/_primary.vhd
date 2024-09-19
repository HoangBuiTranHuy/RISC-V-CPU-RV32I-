library verilog;
use verilog.vl_types.all;
entity Instruction_Memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        read_address    : in     vl_logic_vector(31 downto 0);
        Instruction_out : out    vl_logic_vector(31 downto 0)
    );
end Instruction_Memory;
