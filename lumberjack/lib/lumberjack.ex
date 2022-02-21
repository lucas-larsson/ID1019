defmodule Lumberjack do
  @moduledoc """
  Documentation for `Lumberjack`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lumberjack.hello()
      :world

  """
  def hello do
    :world
  end
  def split(seq) do split(seq, 0, [], []) end

    def split([], l, left, right) do
        [{left, right, l}]
    end
    def split([s|rest], l, left, right) do
        split(rest, l+s, [s|left], right) ++ split(rest, l+s, left, [s|right])
    end


    def cost([]) do 0 end
    def cost([h]) do {0, h} end
    def cost(seq) do cost(seq, 0, [], []) end

    def cost([], l, left, right) do
        {cl, tl} = cost(left)
        {cr, tr} = cost(right)
        {cl+cr+l, {tl, tr}}
    end
    def cost([s], l, [], right) do
        {cr, tr} = cost(right)
        {cr+l+s, {s, tr}}
    end
    def cost([s], l, left, []) do
        {cl, tl} = cost(left)
        {cl+l+s, {s, tl}}
    end


    def cost([s|rest], l, left, right) do
        {costl, tl} = cost(rest, l+s, [s|left], right)
        {costr, tr} = cost(rest, l+s, left, [s|right])

        if costl < costr do
            {costl, tl}
        else
            {costr, tr}
        end
    end

    def cost2([]) do {0, :na} end
    def cost2(seq) do
        {cost, tree, _} = cost2(Enum.sort(seq), Memo.new())
        {cost, tree}
    end
    def cost2([s], mem) do {0, s, mem} end
    def cost2([s|rest]=seq, mem) do
        {c, t, mem} = cost2(rest, s, [s], [], mem)
        {c, t, Memo.add(mem, seq, {c, t})}
    end
    def cost2([], l, left, right, mem) do
        {cl, tl, mem} = check(Enum.reverse(left), mem)
        {cr, tr, mem} = check(Enum.reverse(right), mem)
        {cr+cl+l, {tl, tr}, mem}
    end
    def cost2([s], l, left, [], mem) do
        {c, t, mem} = check(Enum.reverse(left), mem)
        {c+s+l, {t, s}, mem}
    end
    def cost2([s], l, [], right, mem) do
        {c, t, mem} = check(Enum.reverse(right), mem)
        {c+s+l, {t, s}, mem}
    end

    def cost2([s|rest], l, left, right, mem) do
        {cl, tl, mem} = cost2(rest, l+s, [s|left], right, mem)
        {cr, tr, mem} = cost2(rest, l+s, left, [s|right], mem)
        if cl < cr do
            {cl, tl, mem}
        else
            {cr, tr, mem}
        end
    end

    def check(seq, mem) do
        case Memo.lookup(mem, seq) do
            nil ->
                cost2(seq, mem)
            {c, t} ->
                {c, t, mem}
        end
    end

    def bench(n) do
        for i <- 1..n do
            {t,_} = :timer.tc(fn() -> cost2(Enum.to_list(1..i)) end)
            IO.puts(" n = #{i}\t t = #{t} us")
        end
    end
end
