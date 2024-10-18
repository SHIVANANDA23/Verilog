# Roy Autosynthesys - Verilog Project

## File Hierarchy and Description

### `Basic/` (Basic digital logic components)
- `And.v` - A basic AND gate implementation in Verilog.
- `Binary_to_Grey.v` - Converts binary input to Grey code.
- `Carry Generator.v` - Generates carry bits for arithmetic operations.
- `Comparator_1bit.v` - Compares two 1-bit numbers.
- `Decoder.v` - A basic decoder circuit.
- `Encoder.v` - A basic encoder circuit.
- `Fulladder.v` - A full adder circuit for bitwise addition.
- `Fullsubtractor.v` - A full subtractor circuit for bitwise subtraction.
- `Gray_Binary.v` - Converts Grey code to binary.
- `Halfadder.v` - A half adder circuit.
- `Halfsubtractor.v` - A half subtractor circuit.
- `Nand.v` - A basic NAND gate implementation.
- `Nor.v` - A basic NOR gate implementation.
- `Or.v` - A basic OR gate implementation.
- `Ripple_Carry_Adder.v` - A ripple-carry adder implementation.
- `Xnor.v` - A basic XNOR gate implementation.
- `Xor.v` - A basic XOR gate implementation.
- `mux2x1.v` - A 2-to-1 multiplexer.

### `FSM/` (Finite State Machines)
- `mealy.v` - A Mealy state machine implementation.
- `mealy_0110.v` - A Mealy FSM to detect sequence `0110`.
- `moore_fsm.v` - A Moore state machine implementation.
- `seq_0101_detect.v` - Sequence detector for `0101` using FSM.

### `Memory Design/` (Memory components)
- `ram_3.v` - A 3-bit RAM module design.

### `Pipeline/` (Pipeline design modules)
- `pipeline1.v` - 3-Stage pipeline implementation.
- `pipeline2.v` - 4-Stage pipeline implementation.

### `Processor/` (Processor design)
- `Pipe_Mips32.v` - A MIPS 32-bit processor 5-Stage pipeline implementation.
- `Pipe_Mips32_Add.txt` - A text file with additional details about the MIPS processor.
- `Pipe_Mips32_Add_store.v` - A MIPS 32-bit processor Example of store functionality.
- `Pipe_Mips32_Factorial.v` - A MIPS processor implementation to compute factorial.

### `System Design/` (System-level components)
- `Multiplication_Data_Control.v` - A multiplication unit with data and control logic.
- `Pipe_Mips32_Add_store.v` - A MIPS processor with added store functionality (duplicated from the Processor directory).
- `gcd.v` - A system design for calculating the greatest common divisor (GCD).
