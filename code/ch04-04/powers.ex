defmodule Powers do

  import Kernel, except: [raise: 2, raise: 3]

@moduledoc """
Étude 4-4: Tail Recursion with an Accumulator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Practice the "accumulator trick."
Rewrite the +raise/2+ function for +n+ greater than zero so that it
calls a helper function +raise/3+  This new function has +x+, +n+, and
an +accumulator+ as its parameters.

Your +raise/2+ function will return 1 when +n+ is equal to 0,
and will return +1.0 / raise(x, -n)+ when +n+ is less than zero.

When +n+ is greater than zero, +raise/2+ will
call +raise/3+ with arguments +x+, +n+, and 1 as the +accumulator+.
ERRATA, Se tiene que pasar x como acumulador

The +raise/3+ function will return the
+accumulator+ when +n+ equals 0 (this will stop the recursion).

Otherwise, recursively call +raise/3+ with +x+, +n - 1+,
and +x+ times the +accumulator+ as its arguments.

The +raise/3+ function _is_ tail recursive.
"""

  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n > 0, do: raise(x, n - 1, x)
  def raise(x, n) when n < 0, do: 1 / raise(x, -n)

  def raise(_, 0, acc), do: acc
  def raise(x, n, acc), do: raise(x, n-1, x * acc)



end
