library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        reset           : in     vl_logic;
        BrLT            : in     vl_logic;
        BrEq            : in     vl_logic;
        BrUn            : out    vl_logic;
        PCsel           : out    vl_logic;
        inst            : in     vl_logic_vector(31 downto 0);
        OPcode          : in     vl_logic_vector(6 downto 0);
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end Control_Unit;
