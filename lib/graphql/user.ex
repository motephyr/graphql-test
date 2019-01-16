defmodule Graphql.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :job_title, :string
    field :username, :string
    has_many(:phones, Graphql.Profile.Phone, on_delete: :delete_all)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :job_title])
    |> validate_required([:username, :job_title])
    |> unique_constraint(:username)
  end
end
