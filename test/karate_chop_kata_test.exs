defmodule KarateChopKata.Chop do
  @spec find(integer, list(integer)) :: integer
  def find(target, list), do: find(target, list, 0)
  def find(_, [], _), do: -1
  def find(target, [target|_rest], num), do: num
  def find(target, [_other], _), do: -1
  def find(target, list, num) do
    length = Enum.count(list)
    first_half_length = div(length, 2)
    first_half = Enum.take(list, first_half_length)
    second_half = Enum.drop(list, first_half_length)
    cond do
      target < hd(second_half) -> find(target, first_half, num)
      true -> find(target, second_half, num+first_half_length)
    end
  end
end

defmodule KarateChopKataTest do
  use ExUnit.Case
  alias KarateChopKata.Chop

  @sorted_list [1,3,5,6,9]

  test "the samples from codekata.com" do
    assert -1 == Chop.find(3, [])
    assert -1 == Chop.find(3, [1])
    assert  0 == Chop.find(1, [1])
    #
    assert  0 == Chop.find(1, [1, 3, 5])
    assert  1 == Chop.find(3, [1, 3, 5])
    assert  2 == Chop.find(5, [1, 3, 5])
    assert -1 == Chop.find(0, [1, 3, 5])
    assert -1 == Chop.find(2, [1, 3, 5])
    assert -1 == Chop.find(4, [1, 3, 5])
    assert -1 == Chop.find(6, [1, 3, 5])
    #
    assert  0 == Chop.find(1, [1, 3, 5, 7])
    assert  1 == Chop.find(3, [1, 3, 5, 7])
    assert  2 == Chop.find(5, [1, 3, 5, 7])
    assert  3 == Chop.find(7, [1, 3, 5, 7])
    assert -1 == Chop.find(0, [1, 3, 5, 7])
    assert -1 == Chop.find(2, [1, 3, 5, 7])
    assert -1 == Chop.find(4, [1, 3, 5, 7])
    assert -1 == Chop.find(6, [1, 3, 5, 7])
    assert -1 == Chop.find(8, [1, 3, 5, 7])
  end
end
