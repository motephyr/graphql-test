defmodule GraphqlWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic


  object :user do
    field(:id, :integer)
    field(:username, :string)
    field(:job_title, :string)
    field(:phones, list_of(:phone)) do
      arg(:id, :integer)
      
      resolve(&GraphqlWeb.UserController.get_phones/3)
    end
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