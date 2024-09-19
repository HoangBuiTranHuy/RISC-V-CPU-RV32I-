library verilog;
use verilog.vl_types.all;
entity Instruction_mem is
    port(
        reset           : in     vl_logic;
        read_address    : in     vl_logic_vector(31 downto 0);
        instruction_out : out    vl_logic_vector(31 downto 0)
    );
end Instruction_mem;
