# 4-Bit Arithmetic Logic Unit (ALU) in Verilog

A synthesizable 4-bit ALU designed in Verilog. This unit performs basic logical, arithmetic, and shift operations, and provides status flags (Zero and Overflow).

## Features
- **4-bit Data Width**: Operates on two 4-bit inputs (a and b).
- **8 Operations**: Selected via a 3-bit control signal (s).
- **Status Flags**:
  - `ZF` (Zero Flag): High if the output is `0000`.
  - `OF` (Overflow Flag): High if an arithmetic overflow occurs (2's complement).
- **Structural Design**: Utilizes an 8-to-1 Multiplexer for operation selection.

## Operation Table

| Select ($S$) | Operation | Description |
| :--- | :--- | :--- |
| 000 | AND | Bitwise a AND b |
| 001 | OR | Bitwise a OR b |
| 010 | XOR | Bitwise a XOR b |
| 011 | NOT | Bitwise Inversion of a |
| 100 | ADD | Binary Addition (a + b) |
| 101 | SUB | Binary Subtraction (a - b) |
| 110 | SHR A | Logical Right Shift a |
| 111 | SHR B | Logical Right Shift b |

## Files
- `ALU_4bit.v`: The main ALU module and the 8x1 MUX submodule.
- `ALU_4bit_tb.v`: A comprehensive testbench that simulates every possible input combination (2,048 test cases).

## How to Run
1. Use any Verilog simulator (ModelSim, Vivado, or Icarus Verilog).
2. Compile `ALU_4bit.v` and `ALU_4bit_tb.v`.
3. Run the simulation. The testbench will print the results to the console/transcript.

## Simulation Result Examples
`s=4 a=7 b=1 G=8 ZF=0 OF=1`  
*(Note: In this case, 7+1=8 causes an overflow in a 4-bit signed system because the result bit 3 changed from 0 to 1).*

`s=0 a=0 b=0 G=0 ZF=1 OF=0`  
*(Note: In this case, 0+0=0 causes an zero in a 4-bit signed system because the result bit is 0).*
