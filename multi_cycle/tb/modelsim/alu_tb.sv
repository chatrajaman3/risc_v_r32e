module alu_tb();
    //BIT WIDTH
    parameter BIT_WIDTH = 32;

    //inputs
    reg    clk
    reg    [BIT_WIDTH-1:0]    in1,in2;
    reg    [3:0]              opcode;

    //outputs
    reg    [BIT_WIDTH-1:0]    out;

    //instantiate DUT
    alu #(.BIT_WIDTH(BIT_WIDTH)) dut (.clk(clk), .in1(in1), .in2(in2), .opcode(opcode), .out(out));

    



endmodule