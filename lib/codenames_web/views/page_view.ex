defmodule CodenamesWeb.PageView do
  use CodenamesWeb, :view
  alias CodenamesWeb.Data
  alias Kernel

  def create_board() do
    words = Data.get_all_words()
    total = length(words)
    board = []
    for i <- 0..25 do
      index = Enum.random(0..(total - i))
      {word, words} = List.pop_at(words, index)
      board = [word | board]
    end
  end
  

  def get_word(i, j) do 
    board = create_board()
    Enum.at(board, i * 5 + j)
  end
end
