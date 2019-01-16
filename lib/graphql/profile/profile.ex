defmodule Graphql.Profile do
  @moduledoc """
  The Profile context.
  """

  import Ecto.Query, warn: false
  alias Graphql.Repo

  alias Graphql.Profile.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Graphql.Profile.Phone

  @doc """
  Returns the list of phones.

  ## Examples

      iex> list_phones()
      [%Phone{}, ...]

  """
  def list_phones do
    Repo.all(Phone)
  end

  @doc """
  Gets a single phone.

  Raises `Ecto.NoResultsError` if the Phone does not exist.

  ## Examples

      iex> get_phone!(123)
      %Phone{}

      iex> get_phone!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phone!(id), do: Repo.get!(Phone, id)

  @doc """
  Creates a phone.

  ## Examples

      iex> create_phone(%{field: value})
      {:ok, %Phone{}}

      iex> create_phone(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phone(attrs \\ %{}) do
    %Phone{}
    |> Phone.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a phone.

  ## Examples

      iex> update_phone(phone, %{field: new_value})
      {:ok, %Phone{}}

      iex> update_phone(phone, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phone(%Phone{} = phone, attrs) do
    phone
    |> Phone.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Phone.

  ## Examples

      iex> delete_phone(phone)
      {:ok, %Phone{}}

      iex> delete_phone(phone)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phone(%Phone{} = phone) do
    Repo.delete(phone)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phone changes.

  ## Examples

      iex> change_phone(phone)
      %Ecto.Changeset{source: %Phone{}}

  """
  def change_phone(%Phone{} = phone) do
    Phone.changeset(phone, %{})
  end

  def get_phones_by_user_id_and_phone_id(user_id, phone_id) do
    Phone
    |> where([u], u.user_id == ^user_id and u.id == ^phone_id)
    |> Repo.all
  end

  def get_phones_by_user_id(user_id) do
    Phone
    |> where([u], u.user_id == ^user_id)
    |> Repo.all
  end
end
