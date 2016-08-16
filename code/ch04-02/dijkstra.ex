defmodule Dijkstra do
#  To find the GCD of integers M and N:

#  * If M and N are equal, the result is M.
#  * If M is greater than N, the result is the GCD of M - N and N
#  * Otherwise M must be less than N, and the result is the GCD of M and N - M.


  def gcd(m, n) when is_integer(m) and is_integer(n) do
    cond do
      m == n -> m
      m > n -> gcd(m - n, n)
      m < n -> gcd(m, n - m)
    end
  end

end
