module alu(in1, in2, opcode, out);
    parameter BIT_WIDTH = 32;

    input   wire    [BIT_WIDTH-1:0]    in1,in2;
    input   wire    [3:0]              opcode;
    output  wire    [BIT_WIDTH-1:0]    out;

    //opcode definition (10)
    localparam ADD      = 4'b0000;  //Addition
    localparam SUB      = 4'b0001;  //Subtraction
    localparam SLT      = 4'b0010;  //Signed compare
    localparam SLTU     = 4'b0011;  //Unsigned compare
    localparam AND      = 4'b0100;  //bitwise logical operation
    localparam OR       = 4'b0101;  //bitwise logical operations
    localparam XOR      = 4'b0110;  //bitwise logical operations
    localparam SLL      = 4'b0111;  //logical left shift
    localparam SRL      = 4'b1000;  //logical right shift
    localparam SRA      = 4'b1001;  //arithmetic right shift

    always_comb begin
        case (opcode)
        ADD:    out = in1 + in2;
        SUB:    out = in2 - in1;
        SLT:    out = $signed(in1) < $signed(in2);    
        SLTU:   out = in1<in2;
        AND:    out = in1 & in2;
        OR:     out = in1 | in2;
        XOR:    out = in1 ^ in2;
        SLL:    out = in1 <<  in2[4:0];
        SRL:    out = in1 >>  in2[4:0];
        SRA:    out = in1 >>> in2[4:0];   //Shifts bits to the right and fills the vacated spots with the Sign Bit; preserves the negative or positive value
        default: out = 0;
        endcase
    end
endmodule