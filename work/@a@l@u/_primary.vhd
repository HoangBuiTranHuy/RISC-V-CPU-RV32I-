library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUControl_in   : in     vl_logic_vector(3 downto 0);
        ALU_result      : out    vl_logic_vector(31 downto 0)
    );
end ALU;
