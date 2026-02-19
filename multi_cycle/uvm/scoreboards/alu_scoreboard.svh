class alu_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(alu_scoreboard)

    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    uvm_analysis_imp #(alu_transaction, alu_scoreboard) analysis_export;

    int errors = 0;

    function void build_phase(uvm_phase phase);
        analysis_export = new("analysis_export", this);
    endfunction

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

    function void write(alu_transaction tr);

        logic signed [31:0] expected_output;

        case (tr.opcode)
            ADD:    expected_output =  tr.in1 +  tr.in2;
            SUB:    expected_output =  tr.in2 -  tr.in1;
            SLT:    expected_output =  $signed(tr.in1) <  $signed(tr.in2);    
            SLTU:   expected_output = tr.in1<tr.in2;
            AND:    expected_output = tr.in1 & tr.in2;
            OR:     expected_output = tr.in1 | tr.in2;
            XOR:    expected_output = tr.in1 ^ tr.in2;
            SLL:    expected_output = tr.in1 <<  tr.in2[4:0];
            SRL:    expected_output = tr.in1 >>  tr.in2[4:0];
            SRA:    expected_output = tr.in1 >>> tr.in2[4:0];
            default: ``uvm_error("SCB", "UNKNOWN OPCODE")
        endcase
        
        if (tr.out != expected_output) begin
            `uvm_error("SCB_FAIL", $sformatf("FAIL in1:%0d in2:%0d opcode:%b | EXPECTED:%0d ACTUAL:%0d", 
                tr.in1, tr.in2, tr.opcode, expected_output, $signed(tr.output)), UVM_LOW)
            errors++;
        end
        else begin
            `uvm_info("SCB_PASS", $sformatf("PASS in1:%0d in2:%0d, opcode:%b | EXPECTED:%0d ACTUAL:%0d", 
                tr.in1, tr.in2, tr.opcode, expected_output, $signed(tr.output)), UVM_LOW)
        end

    endfunction

    function void report_phase(uvm_phase phase);
        if (errors==0)
            `uvm_info("SCB", "===== ALL TESTS PASSED =====", UVM_LOW)
        else
            `uvm_error("SCB", $sformatf("===== TOTAL FAILED: %0d =====", errors))
    endfunction

endclass