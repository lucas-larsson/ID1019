defmodule Emulator do
  @moduledoc """
  Documentation for `Emulator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Emulator.hello()
      :world
  """
  def hello do
    :world
  end

  def run(code, mem, out) do
    reg = Register.new()
    run(0, code, mem, reg, out)

  end

  def run(pc, code, mem, reg, out) do
    next = Program.read(code, pc)

    case next do
      {:halt} ->
        Out.close(out)

      {:out, rs} ->
        a = Register.read(reg, rs)
        run(pc + 1, code, mem, reg, Out.put(out, a))

      {:add, rd, rs, rt} ->
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        reg = Register.write(reg, rd, a + b)
        run(pc + 1 , code, mem, reg, out)

      {:sub, rd, rs, rt} ->
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        reg = Register.write(reg, rd, a - b)
        run(pc + 1, code, mem, reg, out)

      {:addi, rd, rs, imm} ->
        a = Register.read(reg, rs)
        reg = Register.write(reg, rd, a + imm)
        run(pc + 1, code, mem, reg, out)

      {:beq, rs, rt, imm} ->
        a = Register.read(reg, rs)
        # IO.write(a)
        b = Register.read(reg, rt)
        # IO.write(b)
        cond do
          a == b ->
            pc = pc + imm
            run(pc, code, mem, reg, out)
          a != b -> pc = pc
          run(pc + 1, code, mem, reg, out)

        end

      {:bne, rs, rt, imm} ->
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        cond do
          a != b ->
            pc = pc + imm
            run(pc , code, mem, reg, out)
          a == b ->
            pc = pc
            run(pc + 1, code, mem, reg, out)

          end

      {:lw, rd, rs, imm} ->
        a = Register.read(reg, rs)
        addr = a + imm
        val = Memory.read(mem, addr)
        reg = Register.write(reg, rd, val)
        run(pc + 1, code, mem, reg, out)

      {:sw, rs, rt,  imm} ->
        vs = Register.read(reg, rs)
        vt = Register.read(reg, rt)
        addr = vt + imm
        mem = Memory.write(mem, addr,vs)
        run(pc + 1, code, mem, reg, out)

    end
  end

end
