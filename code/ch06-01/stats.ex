defmodule Stats do
  def minimum([head | tail]) do
    minimum(tail, head)
  end

  def minimum([], min), do: min
  def minimum([head | tail], min) when head < min, do: minimum(tail, head)
  def minimum([_head | tail], min), do: minimum(tail, min)

  def maximum([head | tail]) do
    maximum(tail, head)
  end

  def maximum([], max), do: max
  def maximum([head | tail], max) when head > max, do: maximum(tail, head)
  def maximum([_head | tail], max), do: maximum(tail, max)


  def range(lst) do
    [minimum(lst), maximum(lst)]
  end


end
