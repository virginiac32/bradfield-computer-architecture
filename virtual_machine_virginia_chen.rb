# ADDRESSES = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13]

LOAD_WORD = 0x01
STORE_WORD = 0x02
ADD = 0x03
SUBTRACT = 0x04
HALT = 0xff
GEN_REG_1 = 0x01
GEN_REG_2 = 0x02
PC = 0x00

# do all additions/subtractions get stored in register 1?


def virtual_computer(memory)
  registers = [0, 0, 0]

  until memory[registers[PC]] == HALT
    case memory[registers[PC]]
    when LOAD_WORD
      registers[PC] += 1
      register = registers[memory[registers[PC]]]
      registers[PC] += 1
      value = memory[registers[PC]]
      registers[PC] += 1
      registers[register] = value
    when STORE_WORD
      registers[PC] += 1
      register = registers[memory[registers[PC]]]
      registers[PC] += 1
      address = memory[registers[PC]]
      registers[PC] += 1
      memory[address] = registers[register]
    when ADD
      registers[PC] += 1
      value_1 = registers[memory[registers[PC]]]
      registers[PC] += 1
      value_2 = registers[memory[registers[PC]]]
      registers[PC] += 1
      memory[address] = registers[register]
      registers[GEN_REG_1] = value_1 + value_2
    when SUBTRACT
      registers[PC] += 1
      value_1 = registers[memory[registers[PC]]]
      registers[PC] += 1
      value_2 = registers[memory[registers[PC]]]
      registers[PC] += 1
      memory[address] = registers[register]
      registers[GEN_REG_1] = value_1 - value_2
    end
  end
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
