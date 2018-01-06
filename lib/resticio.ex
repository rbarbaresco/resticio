defmodule Resticio do
  use Route
  @moduledoc """
  Documentation for Resticio.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Resticio.hello
      :world

  """
  def hello do
    :world
  end

  require EEx
  EEx.function_from_file :defp, :template_show_user, "templates/show_user.eex", [:user_id]
  def route("GET", ["users", user_id], conn) do
    page_contents = template_show_user user_id
    conn
    |> Plug.Conn.put_resp_content_type("text/html")
    |> Plug.Conn.send_resp(200, page_contents)
  end

  def route("POST", ["users"], conn) do
    
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry :/!")
  end
end

defmodule WebsiteRouter do
  use Router

  @user_router_options Resticio.init([])
  def route("GET", ["users" | path], conn) do
    Resticio.call(conn, @user_router_options)
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry :/!")
  end
end