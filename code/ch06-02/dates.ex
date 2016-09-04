defmodule Dates do

@doc """
+date_parts/1+, which takes a string in ISO date format (+"yyyy-mm-dd"+) and returns a list of integers in the form +[yyyy, mm, dd]+. This function does not need to do any error checking.
"""

def date_parts(date) do
  date
  |> String.split(~r{-})
  |> Enum.map(&(String.to_integer(&1)))
end

@doc """
Given a string in ISO format (+"yyyy-mm-dd"+), it
returns the Julian date: the day of the year.
"""

def julian(date) do
  [year, month, day] = date_parts(date)
  days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  total = month_total(month, days_per_month, 0) + day
  if is_leap_year?(year) do
    total + 1
  else total

  end
end

defp month_total(1, _days_per_month, acc), do: acc
defp month_total(month, [head | tail], acc), do: month_total(month - 1, tail, acc + head)

defp is_leap_year?(year) do
  (rem(year,4) == 0 and rem(year,100) != 0)
  or (rem(year, 400) == 0)
end

end
