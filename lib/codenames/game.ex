defmodule Codenames.Game do
  alias CodenamesWeb.Data

  defstruct(
    seed: 0,
    words: [],
    colors: [],
    revealed: MapSet.new(),
  )

  def randomize_list(list, seed) do
    :rand.seed(:exrop, seed)
    total = length(list)
    randomized = []
    randomized = for i <- 0..24 do
      index = Enum.random(0..(total - i))
      {item, list} = List.pop_at(list, index)
      item
    end
  end

  def get_random_words(seed) do 
    Data.get_all_words() |> randomize_list(seed)
  end

  def get_random_colors(seed) do
    colors = [:gray | List.duplicate(:beige, 7)]
    colors = Enum.concat(colors, List.duplicate(:red, 8))
    colors = Enum.concat(colors, List.duplicate(:blue, 9))
    randomize_list(colors, seed)
  end


  def new_game(seed) do
    %Codenames.Game{
      seed: seed,
      words: get_random_words(seed),
      colors: get_random_colors(seed)
    }
  end

  def tally(game) do 
    %{
      seed: game.seed,
      words: game.words,
      colors: game.colors
    }
  end
end