library verilog;
use verilog.vl_types.all;
entity Immediate_Generator is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(6 downto 0);
        immOut          : out    vl_logic_vector(31 downto 0)
    );
end Immediate_Generator;
