defmodule AskArea do

import Geom

@doc """
char_to_shape/1+::
  Given a character parameter (+R+, +T+, or +E+ in either upper or lower case),
  return an atom representing the specified shape (+:rectangle+,
  +:triangle+, +:ellipse+, or +:unknown+ if some other character is entered). Hint: use +String.first/1+ to get the first character of
  the user input, and use +String.upcase/1+ to make it upper case.
"""
  @spec char_to_shape(char()) :: atom()

  def char_to_shape(shape) do
    cond do
      String.upcase(shape) == "R" -> :rectangle
      String.upcase(shape) == "T" -> :triangle
      String.upcase(shape) == "E" -> :ellipse
      true -> :unknown
    end
  end

  @doc """


  +get_number/1+::
    Given a string as a prompt, displays the string
    +"Enter _prompt_ > "+ and returns the number that was input.
    This involves the following steps:

    * Use +String.strip/1+ to get rid of the trailing newline character
    * Use +string_to_integer/1+ to convert the string to a number.
"""
  @spec get_number(String.t()) :: number()

  def get_number(prompt) do
    IO.gets("Enter #{prompt}> ")
    |> String.strip
    |> String.to_integer
  end

  @doc """

  +get_dimensions/2+::
    Takes two prompts as its parameters (one for each dimension), and calls
    +get_number/1+ twice. Returns a tuple +{_n1_, _n2_}+ with the dimensions.
"""
  @spec get_dimensions(String.t(), String.t()) :: {number(), number()}

  def get_dimensions(prompt1, prompt2) do
    {get_number(prompt1), get_number(prompt2)}
  end

  @doc """

  +calculate/3+::
    Takes a shape (as an atom) and two dimensions as its parameters.
    If the shape is +:unknown+, or the first or second dimension isn't numeric,
    or either number is negative, the function displays an
    appropriate error message. Otherwise, the function calls
    +Geom.area/3+ to calculate the area of the shape.
  """

  @spec calculate(atom(), number(), number()) :: number()

  def calculate(shape, dim1, dim2) when (shape == :unknown), do: IO.puts("Unknown shape #{shape}")
  def calculate(shape, dim1, dim2) when  not is_number(dim1) and not is_number(dim2), do: IO.puts("Dimensions are not numeric")
  def calculate(shape, dim1, dim2) when  dim1 < 0 and dim2 < 0, do: IO.puts("Dimensions must be greater than 0")
  def calculate(shape, dim1, dim2), do: Geom.area(shape, dim1, dim2)



end
