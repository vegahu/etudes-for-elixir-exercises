defmodule Dates do

@doc """
+date_parts/1+, which takes a string in ISO date format
(+"yyyy-mm-dd"+) and
returns a list of integers in the form
+[yyyy, mm, dd]+. This function does not need to do any error checking.
"""

def date_parts(date) do
  date
  |> String.split(~r{-})
  |> Enum.map(&(String.to_integer(&1)))
end



end
