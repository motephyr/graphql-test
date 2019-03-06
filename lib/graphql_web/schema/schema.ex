defmodule GraphqlWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :classic

  import_types(GraphqlWeb.Schema.Types)
  
  # query actions
  query do
    field :current_user, :user do
      resolve(fn 
        _, %{context: %{current_user: current_user}} ->
          GraphqlWeb.UserController.get(%{id: current_user.id} ,nil)
        _,_ -> 
          {:ok, nil}
      end)
    end
    field :user, type: :user do
      arg(:id, non_null(:integer))
      resolve(&GraphqlWeb.UserController.get/2)
    end
    field :users, type: list_of(:user) do
      resolve(&GraphqlWeb.UserController.list/2)
    end
    # field :all_links, non_null(list_of(non_null(:link)))
    
    connection field :links, node_type: :link do
      resolve(&GraphqlWeb.NewsResolver.all_links/2)
    end
  end
  # mutation actions
  mutation do
    field :create_user, type: :user do
      arg(:username, non_null(:string))
      arg(:job_title, :string)
      arg(:phones, list_of(:string))
      resolve(&GraphqlWeb.UserController.create/2)
    end

    field :update_user, type: :user do
      arg(:id, non_null(:integer))
      arg(:username, non_null(:string))
      arg(:job_title, :string)
      arg(:phones, list_of(:string))

      resolve(&GraphqlWeb.UserController.update/2)
    end

    field :delete_user, type: :user do
      arg(:id, non_null(:integer))

      resolve(&GraphqlWeb.UserController.delete/2)
    end

    field :create_link, type: :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)
  
      resolve &GraphqlWeb.NewsResolver.create_link/2
    end

  end
end