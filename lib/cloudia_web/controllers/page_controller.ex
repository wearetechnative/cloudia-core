defmodule CloudiaWeb.PageController do
  use CloudiaWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
