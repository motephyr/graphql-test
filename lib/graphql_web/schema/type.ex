defmodule GraphqlWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]


  object :user do
    field :id, :integer
    field :username, :string
    field :job_title, :string
    field :phones, list_of(:phone), resolve: dataloader(Graphql.Profile)
  end
  object :phone do
    field(:id, :integer)
    field(:phone_number, :string)
  end

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  connection node_type: :link


end