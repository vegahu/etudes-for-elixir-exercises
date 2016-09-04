defmodule NonFP do
@doc """
+generate_pockets/2+. This function has a character list consisting of
+T+ and +F+ for its first argument.
A +T+ in the list indicates that the tooth is present, and a
+F+ indicates a missing tooth. This will be a single quoted character list,
so you can treat it just as you would any other list. Remember to
refer to individual characters as +?T+ and +?F+.

The second argument is a floating point
number between 0 and 1.0 that indicates the probability that a tooth will be
a good tooth.

The result is a list of lists, one list per tooth. If a tooth is present, the sublist has six entries; if a tooth is absent, the sublist is +[0]+.
"""

  def generate_pockets(teeth_lst, good_tooth_prob) do
    generate_pockets(teeth_lst, good_tooth_prob, [])
  end

@doc """
+generate_pockets/3+::
  The first two arguments are the same as for +generate_pockets/2+; the
  third argument is the accumulated list. When the first argument is
  an empty list, the function yields the reverse of the accumulated list.
+
Hint: use pattern matching to figure out whether a tooth is present or not.
For a non-present tooth, add +[0]+ to the accumulated list; for a tooth
that is present, create a list of six numbers by calling +generate_tooth/1+
with the probability of a good tooth as its argument.
"""
  defp generate_pockets([], _good_tooth_prob, result), do: Enum.reverse(result)
  defp generate_pockets([ ?T | tail], good_tooth_prob, result), do:
    generate_pockets(tail, good_tooth_prob, [generate_tooth(good_tooth_prob) | result])
  defp generate_pockets([ ?F | tail], good_tooth_prob, result), do:
    generate_pockets(tail, good_tooth_prob, [[0] | result])
@doc """
+generate_tooth/1+::
  This function takes the probability of a good tooth as its argument and
  generates the list of numbers for a single tooth. It generates a
  random number between 0 and 1. If that number is less than the probability
  of a good tooth, it sets the "base depth" to 2, otherwise it sets the base depth to 3.
+
The function then calls +generate_tooth/3+ with the base depth, the
number 6, and an empty list as its arguments.
"""
  def generate_tooth(prob_good) do
    r = :random.uniform()
    if (r < prob_good) do
      base_depth = 2
    else
      base_depth = 3
    end
    generate_tooth(base_depth, 6, [])
  end

@doc """
+generate_tooth/3+::
  The first argument is the base depth, the second is the number of items
  left to generate, and the third argument is the accumulated list. When
  the number of items hits zero, the function is finished. Otherwise, it
  adds a random integer between -1 and 1 to the base depth,
  adds it to the accumulated list, and does a recursive call with
  one less item.
"""

  def generate_tooth(_base, 0, result), do: result

  def generate_tooth(base, n, result) do
    delta = :random.uniform(3) - 2  # result will be -1, 0, or 1
    generate_tooth(base, n - 1, [base + delta | result])
  end

  def test_pockets() do
    tlist = 'FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT'
    big_list = generate_pockets(tlist, 0.75)
    print_pockets(big_list)
  end

  def print_pockets([]), do: IO.puts("Finished.")

  def print_pockets([head | tail]) do
    IO.puts(inspect(head))
    print_pockets(tail)
  end

end
