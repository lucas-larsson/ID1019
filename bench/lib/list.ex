defmodule List do

  def new_list() do [] end

  # ls = [16,32,64,128,256,512,1024,2*1024,4*1024,8*1024]

  def list_insert(e, []) do [e] end
  def list_insert(e, [h|t]) when e <= h do [e, h|t] end
  def list_insert(e, [h|t]) do [ h|list_insert(e,t)] end



end
