defmodule CodenamesWeb.BoardController do
  use CodenamesWeb, :controller
  alias Codenames.Game
  import Plug.Conn

  # def new(conn, params) do
  #   IO.puts(conn, params)

  # end

  # def index(conn, params) do
  #   IO.puts(params)
  # end

  def create(conn, %{"seed" => raw_seed}) do
    {seed, ""} = Integer.parse(raw_seed)
    game = Game.new_game(seed)
    tally = Game.tally(game)

    conn
      |> put_session(:game, game)
      |> render("index.html", seed: raw_seed, tally: tally)
  end
end
