defmodule GraphqlWeb.UserController do

  alias Graphql.Profile

  def create(params, _info) do
    Profile.create_user(params)
  end

  def list(params, _info) do
    {:ok, Profile.list_users()}
  end

  def delete(%{id: id}, _info) do
    case Profile.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> user |> Profile.delete_user()
    end
  end

  def get(%{id: id}, _info) do
    case Profile.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def update(params, _info) do
    id = params.id

    case Profile.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> user |> Profile.update_user(params)
    end
  end
  def get_phones(%Profile.User{} = user, %{id: phone_id}, _info) do
    id = user.id
    {:ok, Profile.get_phones_by_user_id_and_phone_id(id, phone_id)
          |> List.wrap()
    }
  end
  def get_phones(%Profile.User{} = user, params, _info) do
    id = user.id
    {:ok, Profile.get_phones_by_user_id(id)}
  end
end