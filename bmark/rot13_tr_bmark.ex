defmodule Rot13TRBmark do
  use Bmark

  bmark :benchmark_10000_runs, runs: 10_000 do
    Rot13.convert_tr("hello", "")
  end

  bmark :runner do
    Rot13.convert_tr("hello", "")
  end
end
