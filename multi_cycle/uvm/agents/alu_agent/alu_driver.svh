//take transactions and convert into signals(pin wiggles)
class alu_driver extends uvm_driver;

    `uvm_component_utils(alu_driver);

    virtual alu_if dut_vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if ( !uvm_condfig_db#(virtual alu_if)::get(this, "", "dut_vif", dut_vif)) begin
            `uvm_error("", "uvm_config_db::get failed");
        end
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);

            dut_vif.in1 = req.in1;
            dut_vif.in2 = req.in2;
            dut_vif.opcode = req.opcode;

            #5;

            seq_item_port.item_done();
        end
    endtask

endclass
