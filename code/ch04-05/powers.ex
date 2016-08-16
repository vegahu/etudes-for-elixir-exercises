defmodule Powers do

  import Kernel, except: [raise: 2, raise: 3]

@moduledoc """
tude 4-5: Recursion with a Helper Function
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In this exercise, you will add a function +nth_root/2+ to the
+Powers+ module. This new function finds the
__n__th root of a number, where _n_ is an integer.
For example, +nth_root(36, 2)+ will calculate
the square root of 36, and +nth_root(1.728, 3)+ will return the cube
root of 1.728.

The algorithm used here is the Newton-Raphson method for calculating
roots. (See http://en.wikipedia.org/wiki/Newton%27s_method for details).

You will need a helper function +nth_root/3+, whose parameters
are +x+, +n+, and an approximation to the result, which we
will call +a+. +nth_root/3+ works as follows:

* Calculate +f+ as +(a^n^ - x)+
* Calculate +f_prime+ as +n * a^(n - 1)^+
* Calculate your next approximation (call it +next+) as +a - f / f_prime+
* Calculate the change in value (call it +change+) as the absolute value of +next - a+
* If the +change+ is
less than some limit (say, 1.0e-8), stop the recursion and return
+next+; that's as close to the root as you are going to get.
* Otherwise, call the +nth_root/3+ function again with
+x+, +n+, and +next+ as its arguments.

For your first approximation, use +x / 2.0+. Thus, your +nth_root/2+ function
will simply be this:

+nth_root(x, n) -> nth_root(x, n, x / 2.0)+

Use +IO.puts+ to show each new approximation as you
calculate it. If your argument name is +estimate+, you would do something like this:

"""

  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n > 0, do: raise(x, n - 1, x)
  def raise(x, n) when n < 0, do: 1 / raise(x, -n)

  def raise(_, 0, acc), do: acc
  def raise(x, n, acc), do: raise(x, n-1, x * acc)

  def nth_root(x, n) when is_integer(n), do: nth_root(x, n, x / 2)

  def nth_root(x, n, a) do
    f = raise(a, n) - x
    f_prime = n * raise(a, n - 1)
    next = a - f / f_prime
    change = abs(next - a)
    if change < 1.0e-8 do next
    else nth_root(x, n, next)
  end

  end
end
