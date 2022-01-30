defmodule Program do

  def assemble(prog) do
    {:code, List.to_tuple(prog)}
  end

  def read({:code, code}, pc) do
    elem(code, pc)
  end

end
