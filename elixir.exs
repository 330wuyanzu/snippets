@doc """
常用代码片段收集
"""
defmodule Snippet do
@doc """
随机数相关
"""
defmodule Random do
  ## 随机 非负 整数
  def random_nnint(bits) do
    seed = ["1","2","3","4","5","6","7","8","9"]
    pipe = &(&1 |> Enum.shuffle |> Enum.random)
    case bits do
      0 -> raise ArgumentError, message: "位数必须至少一位"
      1 -> pipe.(["0"|seed])
      _ -> [pipe.(seed) | (for _ <- 2..bits, do: pipe.(["0"|seed]))]|>List.to_string
    end
  end
  ## 随机 正 整数
  def random_zint(bits) do
    seed = ["1","2","3","4","5","6","7","8","9"]
    pipe = &(&1 |> Enum.shuffle |> Enum.random)
    case bits do
      0 -> raise ArgumentError, message: "位数必须至少一位"
      1 -> pipe.(seed)
      _ -> [pipe.(seed) | (for _ <- 2..bits, do: pipe.(["0"|seed]))]|>List.to_string
    end
  end
  ## 随机 非正 整数
  def random_nzint(bits) do
    seed = ["1","2","3","4","5","6","7","8","9"]
    pipe = &(&1 |> Enum.shuffle |> Enum.random)
    case bits do
      0 -> raise ArgumentError, message: "位数必须至少一位"
      1 -> "-"<>pipe.(["0"|seed])
      _ -> ["-"<>pipe.(seed) | (for _ <- 2..bits, do: pipe.(["0"|seed]))]|>List.to_string
    end
  end
  ## 随机 负 整数
  def random_nint(bits) do
    seed = ["1","2","3","4","5","6","7","8","9"]
    pipe = &(&1 |> Enum.shuffle |> Enum.random)
    case bits do
      0 -> raise ArgumentError, message: "位数必须至少一位"
      1 -> "-"<>pipe.(seed)
      _ -> ["-"<>pipe.(seed) | (for _ <- 2..bits, do: pipe.(["0"|seed]))]|>List.to_string
    end
  end
  ## 随机 整数
  def random_int(bits) do
    seed = ["1","2","3","4","5","6","7","8","9"]
    pipe = &(&1 |> Enum.shuffle |> Enum.random)
    num = case bits do
      0 -> raise ArgumentError, message: "位数必须至少一位"
      1 -> pipe.(["0"|seed])
      _ -> [pipe.(seed) | (for _ <- 2..bits, do: pipe.(["0"|seed]))]|>List.to_string
    end
    symb = ["+","-"]
    case pipe.(symb) do
      "+" -> num
      "-" -> "-"<>num
    end
  end
  ## 随机码
  def random_code(bits) do
    seed = ["0","1","2","3","4","5","6","7","8","9"]
    (for _ <- 1..bits, do: seed |> Enum.shuffle |> Enum.random)|>List.to_string
  end
  ## 体彩大乐透
  def luck(rr \\ []) do
    num = random_code(2)
    inum = String.to_integer(num)
    count = length(rr)
    case {count<5, count<7} do
      {true, _} -> case {0 < inum, inum < 36} do
                     {true, true} -> luck([num | rr])
                     {_,_} -> luck(rr)
                   end
      {false, true} -> case {0 < inum, inum < 13} do
                         {true, true} -> luck([num | rr])
                         {_,_} -> luck(rr)
                       end
      {_, false} -> :lists.reverse(rr)
    end
  end
end

end
