defmodule Graphql.ProfileTest do
  use Graphql.DataCase

  alias Graphql.Profile

  describe "users" do
    alias Graphql.Profile.User

    @valid_attrs %{job_title: "some job_title", username: "some username"}
    @update_attrs %{job_title: "some updated job_title", username: "some updated username"}
    @invalid_attrs %{job_title: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Profile.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Profile.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Profile.create_user(@valid_attrs)
      assert user.job_title == "some job_title"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Profile.update_user(user, @update_attrs)
      assert user.job_title == "some updated job_title"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_user(user, @invalid_attrs)
      assert user == Profile.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Profile.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Profile.change_user(user)
    end
  end

  describe "phones" do
    alias Graphql.Profile.Phone

    @valid_attrs %{phone_number: "some phone_number"}
    @update_attrs %{phone_number: "some updated phone_number"}
    @invalid_attrs %{phone_number: nil}

    def phone_fixture(attrs \\ %{}) do
      {:ok, phone} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_phone()

      phone
    end

    test "list_phones/0 returns all phones" do
      phone = phone_fixture()
      assert Profile.list_phones() == [phone]
    end

    test "get_phone!/1 returns the phone with given id" do
      phone = phone_fixture()
      assert Profile.get_phone!(phone.id) == phone
    end

    test "create_phone/1 with valid data creates a phone" do
      assert {:ok, %Phone{} = phone} = Profile.create_phone(@valid_attrs)
      assert phone.phone_number == "some phone_number"
    end

    test "create_phone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_phone(@invalid_attrs)
    end

    test "update_phone/2 with valid data updates the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{} = phone} = Profile.update_phone(phone, @update_attrs)
      assert phone.phone_number == "some updated phone_number"
    end

    test "update_phone/2 with invalid data returns error changeset" do
      phone = phone_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_phone(phone, @invalid_attrs)
      assert phone == Profile.get_phone!(phone.id)
    end

    test "delete_phone/1 deletes the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{}} = Profile.delete_phone(phone)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_phone!(phone.id) end
    end

    test "change_phone/1 returns a phone changeset" do
      phone = phone_fixture()
      assert %Ecto.Changeset{} = Profile.change_phone(phone)
    end
  end
end
