# RISC-V R32E

Implementation of a 5-stage pipeline RISC-V RV32E processor. This project was made to explore industrial design of processors from rtl to verification, validation and finally tapeout using open-source silicon tools.

## Architecture/Features:
- 16 general-purpose registers (x0-x15), where x0 is a dedicated zero register
- Additional pc register to how address of current instruction
- Core instruction formats (R/I/S/U) that are 32 bits in length
- 5-stage pipeline (end-goal)

## Supported Instructions:
| Instruction | Description | UVM tested? (Y/N) |
|---|---|---|
| ADD   |  |    |
| ADDI  |  |    |
| AND   |  |    |
| ANDI  |  |    |
| BEQ   |  |    |
| BGE   |  |    |
| BGEU  |  |    |
| BLT   |  |    |
| BLTU  |  |    |
| BNE   |  |    |
| JAL   |  |    |
| JALR  |  |    |
| LB    |  |    |
| LBU   |  |    |
| LH    |  |    |
| LHU   |  |    |
| LW    |  |    |
| OR    |  |    |
| ORI   |  |    |
| SB    |  |    |
| SH    |  |    |
| SLL   |  |    |
| SLT   |  |    |
| SLTU  |  |    |
| SRA   |  |    |
| SRL   |  |    |
| SUB   |  |    |
| SW    |  |    |
| XOR   |  |    |
| XORI  |  |    |

## Modules in Development:
- [ ] ALU
- [ ] Regfile
- [ ] RAM
- [ ] Program Counter
- [ ] Instruction Memory
- [ ] Control Unit (FSM)

## Verification test plan for each module:
- [ ] ALU
- [ ] Regfile
- [ ] RAM
- [ ] Program Counter
- [ ] Instruction Memory
- [x] Control Unit (FSM)

## 5 Stage Pipeline
- FETCH (F)
- DECODE (D)
- EXECUTE (X)
- MEMORY (M)
- WRITE BACK (WB)

Resources:
https://docs.riscv.org/reference/isa/unpriv/intro.html
