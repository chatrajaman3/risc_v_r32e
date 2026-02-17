# File Hierarchy
## rtl/
Contains hardware description of DUT.

## tb/
tb_top.sv instantiates DUT and interfaces for UVM.

Also contains additional simple tb's if needed.

## uvm/

### uvm/agents/
Agents have their own folder since they are a REUSABLE verification component.

The Agent contains:
- Driver
- Monitor
- Sequencer
- Transaction

Each Agent has its own subfolder as modules like ALU/regfile have DIFFERENT interfaces

### uvm/env/

Environment connects agents together. Env contains integration logic instead of reusable interface logic.

### uvm/sequences/

Sequences generate stimulus.
Separated as they are NOT part of the agent. Similar sequences can be used in multiple agents.

### uvm/tests/

Tests decide:
- Which environment to build
- Which sequences to run
- What configuration to use

Each test = one simulation scenario.

Example:  
alu_test → builds alu_env  
regfile_test → builds regfile_env  
soc_test → builds soc_env  

You select test using:  
+UVM_TESTNAME=alu_test


This is the cleanest way to control what runs.

## Base Classes
A base class exists to:
- Hold common functionality
- Avoid duplicated code
- Allow polymorphism
- Make extensions clean

If you don’t have shared behavior, you don’t need a base class.

You only create base_driver / base_sequencer / base_agent when you have multiple similar agents that share behavior.

You do NOT need base classes when:
- You have one agent
- Your agents are unrelated
- There is no shared logic

