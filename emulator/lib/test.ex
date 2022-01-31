defmodule Test do

  def test() do
    code = Program.assemble(demo())
    mem = Memory.new([])
    out = Out.new()
    Emulator.run(code, mem, out)
  end

  def demo() do
    IO.write('Registers 0 - 6 values are printed in the folwing order:

    ')

    [{:addi, 0, 4, 678},    # $0 <- $4 + 678
     {:out, 0},             # out $0
     {:addi, 1, 0, 1},      # $1 <- $0 + 1
     {:out, 1},             # out $1
     {:addi, 2, 1, 1},      # $2 <- 1 + 1
     {:out, 2},             # out $2
     {:add, 3, 1, 2},       # $3 <- $1 + $2
     {:out, 3},             # out $3
     {:sw, 2, 3, 1},        # mem[3 + 1] <- $2
     {:out, 4},             # out $4
     {:lw, 4, 1, 3},        # $4 <- mem[3 + 1]
     {:out, 4},             # out $4
     {:add, 5, 3, 2},       # $5 <- $3 + $2
     {:out, 5},             # out $5
     {:sub, 6, 5, 4},       # $6 <- $5 - $4
     {:out, 6},             # out $6
     {:bne, 4, 0, -3},      # branch if not equal
     {:halt}]
  end



end
