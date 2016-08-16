defmodule Powers do

  import Kernel, except: [raise: 2]

@moduledoc """
Étude 4-3: Non-Tail Recursive Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Create a module named +Powers+ (no relation to Francis Gary Powers), and
write a function named +raise/2+ which takes parameters +x+  and +n+ and
returns the value of _x_^_n_^.

Here's the information you need to know to write the function:

* Any number to the power 0 equals 1.
* Any number to the power 1 is that number itself -- that stops the
  recursion.
* When +n+ is positive, +x^n^+ is equal to +x+ times +x^(n - 1)^+ --
  there's your recursion.
* When +n+ is negative, +x^n^+ is equal to +1.0 / x^-n^+

Note that this algorithm is _not_ tail recursive.
"""

def raise(_, 0), do: 1
def raise(x, 1), do: x
def raise(x, n) when n > 0, do: x * raise(x, n - 1)
def raise(x, n) when n < 0, do: 1 / raise(x, -n)

end
