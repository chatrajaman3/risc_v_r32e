`include "uvm_macros.svh"
`include "tb_pkg.svh"

module top;
    import uvm_pkg::*;
    import tb_pkg::*;

    //instantiate interfaces
    alu_if dut_alu_if();

    //instantiate DUT and connect to interfaces
    alu dut_alu(
        .in1(dut_alu_if.in1), 
        .in2(dut_alu_if.in2), 
        .opcode(dut_alu_if.opcode), 
        .out(dut_alu_if.out)
    );

    //config db
    initial begin
        uvm_config_db#(virtual alu_if)::set(null, "*", "dut_alu_vif", dut_alu_if);
    end

    //start test
    run_test("alu_test");

    //dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,top);
    end
endmodule