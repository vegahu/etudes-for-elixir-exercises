defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2013 by J. David Eisenberg.
  """

  @doc """
  Calculates the area of a shape, given the
  shape and two of the dimensions as a tuple.
  Returns the productof its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for
  an ellipse. Any invalid data returns zero.
  """
  
  def area({shape, dimension_1, dimension_2}), do: area(shape, dimension_1, dimension_2)

  defp area(:rectangle, length, width) when length >= 0 and width >= 0, do: length * width
  defp area(:triangle, base, height) when base >= 0 and height >= 0, do: base * height / 2
  defp area(:ellipse, major_radius, minor_radius) when major_radius >= 0 and minor_radius >= 0, do: :math.pi * major_radius * minor_radius
  defp area(_, _, _), do: 0
end
