defmodule GraphqlWeb.NewsResolver do
  alias Graphql.News
  alias Absinthe.Relay
  alias Graphql.Repo
  require IEx

  def all_links(args, _info) do
    News.Link
    |> Relay.Connection.from_query(&Repo.all/1, args)
  end

  def create_link(args, _info) do
    case News.create_link(args) do
      {:ok, link} ->
        {:ok, link}
      _error ->
        {:error, "could not create link"}
    end
  end
end