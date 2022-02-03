defmodule Tree do

  def new_tree() do :nil end
  # ls = [16,32,64,128,256,512,1024,2*1024,4*1024,8*1024]

  def tree_insert(e, :nil) do {:leaf, e} end
  def tree_insert(e, {:leaf, h}=right) when e < h do {:node, e, :nil, right} end
  def tree_insert(e, {:leaf, _}=left)  do {:node, e, left, :nil} end
  def tree_insert(e, {:node, h, left, right}) when e < h do {:node, h, tree_insert(e, left), right} end
  def tree_insert(e, {:node, h, left, right}) do {:node, h, left, tree_insert(e, right)} end

end
