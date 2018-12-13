LOAD_WORD = 0x01
STORE_WORD = 0x02
ADD = 0x03
SUBTRACT = 0x04
HALT = 0xff
GEN_REG_1 = 0x01
GEN_REG_2 = 0x02
PC = 0x00

def virtual_computer(memory)
  registers = [0x0000, 0x0000, 0x0000]

  until memory[registers[PC]] == HALT
    case memory[registers[PC]]
    when LOAD_WORD
      registers[PC] += 1
      register_address = memory[registers[PC]]
      registers[PC] += 1
      memory_address = memory[registers[PC]]
      value = memory[memory_address] + (memory[memory_address+1])*256
      registers[PC] += 1
      registers[register_address] = value
    when STORE_WORD
      registers[PC] += 1
      register_value = registers[memory[registers[PC]]]
      registers[PC] += 1
      memory_address = memory[registers[PC]]
      registers[PC] += 1
      memory[memory_address] = register_value % 256
      memory[memory_address+1] = register_value / 256
    when ADD
      registers[PC] += 1
      register_address = memory[registers[PC]]
      value_1 = registers[memory[registers[PC]]]
      registers[PC] += 1
      value_2 = registers[memory[registers[PC]]]
      registers[PC] += 1
      registers[register_address] = value_1 + value_2
    when SUBTRACT
      registers[PC] += 1
      register_address = memory[registers[PC]]
      value_1 = registers[memory[registers[PC]]]
      registers[PC] += 1
      value_2 = registers[memory[registers[PC]]]
      registers[PC] += 1
      registers[register_address] = value_1 - value_2
    end
  end

  p memory
end

# tests

memory = [
  0x01, 0x01, 0x10,
  0x01, 0x02, 0x12,
  0x03, 0x01, 0x02,
  0x02, 0x01, 0x0e,
  0xff,
  0x00,
  0x00, 0x00,
  0xa1, 0x14,
  0x0c, 0x00
]

memory2 = [
 1,1,0x10, # 0x00: load A 0x10
 1,2,0x12, # 0x03: load B 0x12
 3,1,2,    # 0x06: add A B
 2,1,0x0e, # 0x09: store A 0x0E
 0xFF,     # 0x0C: halt
 0,        # 0x0D: <<unused>>
 0,0,      # 0x0E: output
 2,0,      # 0x10: input X = 2
 3,0       # 0x12: input Y = 3
]

virtual_computer(memory)
