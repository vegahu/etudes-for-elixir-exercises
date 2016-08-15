defmodule Test do

# If you pass only one value it's assigned to the parameter that don't have a default value
    def sum( a \\ 3, b, c \\ 7) do
      a + b + c
    end
  end
