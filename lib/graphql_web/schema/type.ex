defmodule GraphqlWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :integer)
    field(:username, :string)
    field(:job_title, :string)
    field(:phones, list_of(:phone)) do
      arg(:id, :integer)
      
      resolve(&GraphqlWeb.Controller.UserController.get_phones/3)
    end
  end
  object :phone do
    field(:id, :integer)
    field(:phone_number, :string)
  end
end