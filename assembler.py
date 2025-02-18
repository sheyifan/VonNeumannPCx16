import os
import re
import sys
from typing import Dict, List, Optional


class Assembler:
    LABEL_PATTERN = r"[A-Za-z0-9_]+"

    def __init__(self):
        self.program: str
        self.symbol_table: Dict[str, int]

    def __preprocess(self):
        """
        Remove blank lines and comments
        """
        _program = ''
        instructions = self.program.splitlines()
        for instruction in instructions:
            instruction = instruction.strip()
            if instruction.startswith('//') or instruction == '':
                # Remove comments lines and blank lines
                pass
            elif match := re.match(r"(.*)//.*", instruction):
                # Remove inline comments
                instruction = match.group(1).strip()
                _program += instruction + '\n'
            else:
                _program += instruction + '\n'
        self.program = _program
    
    def __resolve_symbol_references(self):
        """
        Scan symbol references, translate them into address, and store the
        symbol to address mapping relations into symbol table.
        Symbol references are pseudo instructions which should be ignored at the
        compile stage.
        """
        self.symbol_table: Dict[str, int] = {}
        # Pre-defined variables
        self.symbol_table['R0'] = 0
        self.symbol_table['R1'] = 1
        self.symbol_table['R2'] = 2
        self.symbol_table['R3'] = 3
        self.symbol_table['R4'] = 4
        self.symbol_table['R5'] = 5
        self.symbol_table['R6'] = 6
        self.symbol_table['R7'] = 7
        self.symbol_table['R8'] = 8
        self.symbol_table['R9'] = 9
        self.symbol_table['R10'] = 10
        self.symbol_table['R11'] = 11
        self.symbol_table['R12'] = 12
        self.symbol_table['R13'] = 13
        self.symbol_table['R14'] = 14
        self.symbol_table['R15'] = 15

        _program = ''
        real_instruction_count = 0      # Count instructions, ignore pseudo ones
        asm_instructions = self.program.splitlines()
        for asm_instruction in asm_instructions:
            if match := re.match(fr"^\(({Assembler.LABEL_PATTERN})\)$", 
                                 asm_instruction):
                # Symbol reference, pseudo instruction
                symbol_name: str = match.group(1)
                if symbol_name not in self.symbol_table:
                    self.symbol_table[symbol_name] = real_instruction_count
                else:
                    print(f"Symbol reference name occupied: '${symbol_name}'.",
                          file=sys.stderr)
                    sys.exit(1)
            else:
                real_instruction_count += 1
                _program += asm_instruction + '\n'
        self.program = _program
        
    
    def compile(self, source_filepath: str) -> List[int]:
        """
        Translate assembly code to machine code
        """
        with open(source_filepath, 'r') as source:
            # Assembly program consists several instructions
            self.program = source.read()
        self.__preprocess()
        self.__resolve_symbol_references()

        def compile_c_assembly_instruction(instruction: str) -> int:
            c_asm_pattern = r"^(?:(.*?)\s*=\s*)?(.*?)\s*(?:;\s*(.*?))?$"
            match = re.match(c_asm_pattern, instruction)
            if not match:
                print(f"Can not compile c instruction: '{instruction}'")
                sys.exit(1)
            destination: Optional[str] = match.group(1)
            computation: str = match.group(2)
            jump: Optional[str] = match.group(3)
            # Normalize
            if destination:
                destination = ''.join(sorted(destination))
            computation = re.sub(r'\s', '', computation)    # Remove spaces
            
            def get_destination_bits() -> int:
                if destination is None:
                    destination_bits = 0b000
                elif destination == 'A':
                    destination_bits = 0b100
                elif destination == 'D':
                    destination_bits = 0b010
                elif destination == 'M':
                    destination_bits = 0b001
                elif destination == 'AD':
                    destination_bits = 0b110
                elif destination == 'DM':
                    destination_bits = 0b011
                elif destination == 'AM':
                    destination_bits = 0b101
                elif destination == 'ADM':
                    destination_bits = 0b111
                else:
                    print(f"Destination not recognized: '${destination}'.",
                            file=sys.stderr)
                    sys.exit(1)
                return destination_bits
            
            def get_jump_bits() -> int:
                if jump is None:
                    jump_bits = 0b000
                elif jump == 'JLT':
                    jump_bits = 0b100
                elif jump == 'JEQ':
                    jump_bits = 0b010
                elif jump == 'JGT':
                    jump_bits = 0b001
                elif jump == 'JLE':
                    jump_bits = 0b110
                elif jump == 'JGE':
                    jump_bits = 0b011
                elif jump == 'JNE':
                    jump_bits = 0b101
                elif jump == 'JMP':
                    jump_bits = 0b111
                else:
                    print(f"Jump flag not recognized: '${jump}'.",
                            file=sys.stderr)
                    sys.exit(1)
                return jump_bits

            def get_computation_bits() -> int:
                if computation in ['A+D', 'D+A']:
                    computation_bits = 0b0010000
                elif computation in ['M+D', 'D+M']:
                    computation_bits = 0b1010000
                elif computation == 'D-A':
                    computation_bits = 0b0011000
                elif computation == 'D-M':
                    computation_bits = 0b1011000
                elif computation == 'A-D':
                    computation_bits = 0b0011001
                elif computation == 'M-D':
                    computation_bits = 0b1011001
                elif computation == 'D+1':
                    computation_bits = 0b0010100
                elif computation == 'A+1':
                    computation_bits = 0b0010101
                elif computation == 'M+1':
                    computation_bits = 0b1010101
                elif computation == 'D-1':
                    computation_bits = 0b0011100
                elif computation == 'A-1':
                    computation_bits = 0b0011101
                elif computation == 'M-1':
                    computation_bits = 0b1011101
                elif computation == '-D':
                    computation_bits = 0b0011011
                elif computation == '-A':
                    computation_bits = 0b0011010
                elif computation == '-M':
                    computation_bits = 0b1011010
                elif computation == '-1':
                    computation_bits = 0b0011110
                elif computation == '1':
                    computation_bits = 0b0010110
                elif computation == 'D':
                    computation_bits = 0b0010011
                elif computation == 'A':
                    computation_bits = 0b0010010
                elif computation == 'M':
                    computation_bits = 0b1010010
                elif computation in ['A&D', 'D&A']:
                    computation_bits = 0b0000000
                elif computation in ['M&D', 'D&M']:
                    computation_bits = 0b1000000
                elif computation in ['A|D', 'D|A']:
                    computation_bits = 0b0000100
                elif computation in ['M|D', 'D|M']:
                    computation_bits = 0b1000100
                elif computation == '~D':
                    computation_bits = 0b0001100
                elif computation == '~A':
                    computation_bits = 0b0001101
                elif computation == '~M':
                    computation_bits = 0b1001101
                elif computation == '0':
                    computation_bits = 0b0000010
                else:
                    print(f"Computation not recognized: '{computation}'.",
                            file=sys.stderr)
                    sys.exit(1)
                return computation_bits
            
            jump_bits = get_jump_bits()
            destination_bits = get_destination_bits()
            computation_bits = get_computation_bits()
            machine_instruction = \
                jump_bits + \
                (destination_bits << 3) + \
                (computation_bits << 6) + \
                (1 << 15)   # C instruction flag
            return machine_instruction

        # Store variable sequentially from address 16 in RAM
        variable_count = 16
        asm_instructions = self.program.splitlines()
        machine_instructions: List[int] = []
        for asm_instruction in asm_instructions:
            if match := re.match(r"^@(\d+)$",
                                asm_instruction):
                # A instruction with immediate value 
                value = int(match.group(1))
                value &= 0x7FFF  # Truncate lower 15 bits
                machine_instruction = value
                machine_instructions.append(machine_instruction)
            elif match := re.match(fr"^@({Assembler.LABEL_PATTERN})$",
                                asm_instruction):   # A instruction
                variable_name: str = match.group(1)
                if variable_name not in self.symbol_table:  # Variable declare
                    self.symbol_table[variable_name] = variable_count
                    variable_address = variable_count
                    variable_count += 1
                else:   # Variable reference
                    variable_address = self.symbol_table[variable_name]
                
                variable_address &= 0x7FFF  # Truncate lower 15 bits
                machine_instruction = variable_address  # Pad zeros to head
                machine_instructions.append(machine_instruction)
            else:   # C instruction
                machine_instruction = \
                    compile_c_assembly_instruction(asm_instruction)
                machine_instructions.append(machine_instruction)
        return machine_instructions


if __name__ == '__main__':
    source_filepath = sys.argv[1]
    assembler = Assembler()
    machine_instructions = assembler.compile(source_filepath)
    
    output_directory = os.path.dirname(source_filepath)
    output_filename = os.path.basename(source_filepath)
    output_filename, _ = os.path.splitext(output_filename)
    output_filepath = os.path.join(output_directory, output_filename + ".rom")
    with open(output_filepath, 'wb') as output_bin_file:
        for machine_instruction in machine_instructions:
            output_bin_file.write(machine_instruction.to_bytes(2, 'little'))
