defmodule GuessingGame do

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    newLow = min(high, mid(low, high) + 1)
    guess(newLow, high)
  end

  def smaller(low, high) do
    newHigh = max(low, mid(low, high) - 1)
    guess(low, newHigh)
  end

  def guess(high, low) when high > low, do: guess(low, high)

  def guess(low, high) do
    answer = IO.gets("hmmm... Maybe you're thinking of #{mid(low, high)}? \n")

    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number"

      _ ->
        IO.puts(~s{Type "bigger" or "smaller" or "yes"})
        guess(low, high)
    end
  end
end
