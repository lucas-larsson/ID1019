defmodule Test do

  def test() do
    code = Program.assemble(demo())
    mem = Memory.new([])
    out = Out.new()
    Emulator.run(code, mem, out)
  end

  def demo() do
    IO.write('
    Registers 0 - 6 values are printed in the follwing order:

    [$0, $1, $2, $3, $4, $4, $5, $6, $12, $18, $18, $18, $18]
    [0, 1, 2, 3, 0, 2, 5, 3, 18, 20, 18, 16, 16, 14]

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
     {:addi, 12, 2, 16},    # $12 <- $2 + 16
     {:out, 12},            # out $12
     {:addi, 18, 2, 18},    # $18 <- $2 + 18
     {:out, 18},            # out $18
     {:sub, 18, 18, 2},     # $18 <- $18 - 2
     {:out, 18},            # out $18
     {:beq, 18, 12, -2},    # branch if equal
     {:out, 18},            # out $18
     {:sub, 18, 18, 2},
     {:out, 18},
     {:halt}]
  end



end
