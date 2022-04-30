defmodule Speedy.RegisterTest do
  use Speedy.DataCase

  alias Speedy.Register

  describe "users" do
    alias Speedy.Register.User

    import Speedy.RegisterFixtures

    @invalid_attrs %{age: nil, description: nil, name: nil, password: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Register.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Register.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, description: "some description", name: "some name", password: "some password"}

      assert {:ok, %User{} = user} = Register.create_user(valid_attrs)
      assert user.age == 42
      assert user.description == "some description"
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Register.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, description: "some updated description", name: "some updated name", password: "some updated password"}

      assert {:ok, %User{} = user} = Register.update_user(user, update_attrs)
      assert user.age == 43
      assert user.description == "some updated description"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Register.update_user(user, @invalid_attrs)
      assert user == Register.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Register.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Register.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Register.change_user(user)
    end
  end
end
