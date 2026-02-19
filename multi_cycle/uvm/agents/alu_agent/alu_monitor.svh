class alu_monitor extends uvm_component;
    `uvm_component_utils(alu_monitor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual alu_if dut_vif;

    uvm_analysis_port #(alu_transaction) monitor_analysis_port;

    function void build_phase(uvm_phase phase);
        monitor_analysis_port = new("monitor_analysis_port", this);

        if (! uvm_config_db #(virtual alu_if)::get(this, "", "dut_vif", dut_vif))begin
            `uvm_error(get_type_name(), "DUT_if NOT FOUND")
        end
    endfunction

    task run_phase (uvm_phase phase);
        alu_transaction monitor_tr;

        forever begin


            @(dut_vif.in1 or dut_vif.in2 or dut_vif.opcode);

            #1;

            monitor_tr = alu_transaction::type_id::create("monitor_tr");
            monitor_tr.in1      = dut_vif.in1;
            monitor_tr.in2      = dut_vif.in2;
            monitor_tr.opcode   = dut_vif.opcode;
            monitor_tr.out      = dut_vif.out;

            monitor_analysis_port.write(monitor_tr);
        end
    endtask
endclass