//alu interface
module alu_if();
    parameter   BIT_WIDTH = 32;

    //inputs
    logic       [BIT_WIDTH-1:0]    in1,in2;
    logic       [3:0]              opcode;

    //outputs
    logic       [BIT_WIDTH-1:0]    out;
endmodule

//regfile interface
module regfile_if();
    parameter   BIT_WIDTH = 32;

    //inputs
    logic       clk;
    logic       [BIT_WIDTH-1:0] in;

    //outputs
    logic       [BIT_WIDTH-1:0] out;
endmodule