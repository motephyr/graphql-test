defmodule Graphql.Profile.Phone do
  use Ecto.Schema
  import Ecto.Changeset


  schema "phones" do
    field :phone_number, :string
    belongs_to(:user, Graphql.Profile.User)

    timestamps()
  end

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, [:phone_number])
    |> validate_required([:phone_number])
  end
end
