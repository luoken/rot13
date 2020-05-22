defmodule Rot13TRBmark do
  use Bmark

  bmark :benchmark_10000_runs, runs: 10_000 do
    Rot13Recursive.convert("hello")
  end

  bmark :runner do
    Rot13Recursive.convert("hello")
  end
end
