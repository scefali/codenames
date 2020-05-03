defmodule CodenamesWeb.BoardView do
  use CodenamesWeb, :view
  alias CodenamesWeb.Data
  alias Kernel
  import Plug.Conn



  def get_word(conn, i, j) do
    tally = conn |> get_session(:game)
    Enum.at(tally.words, i * 5 + j)
  end

  def get_class(conn, i, j) do
    tally = get_session(conn, :game)
    color = Enum.at(tally.colors, i * 5 + j)
    # IO.puts(color)
    # color
    ""
  end
end
