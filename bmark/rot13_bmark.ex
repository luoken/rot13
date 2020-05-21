defmodule Rot13Bmark do
  use Bmark

  bmark :benchmark_10000_runs, runs: 10_000 do
    Rot13.convert("hello")
  end

  bmark :runner do
    Rot13.convert("hello")
  end
end
