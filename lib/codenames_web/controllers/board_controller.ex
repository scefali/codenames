defmodule CodenamesWeb.BoardController do
  use CodenamesWeb, :controller

  def new(conn, params) do
    IO.puts(conn, params)
  end

  def index(conn, params) do
    IO.puts(params)
  end

  def create(conn, %{"seed" => seed}) do
    render(conn, "index.html", seed: seed)
  end
end
