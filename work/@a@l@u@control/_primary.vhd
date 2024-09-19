library verilog;
use verilog.vl_types.all;
entity ALUControl is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        funct7          : in     vl_logic_vector(31 downto 25);
        funct3          : in     vl_logic_vector(14 downto 12);
        ALUControl_out  : out    vl_logic_vector(3 downto 0)
    );
end ALUControl;
