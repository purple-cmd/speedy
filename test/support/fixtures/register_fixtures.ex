defmodule Speedy.RegisterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Speedy.Register` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        description: "some description",
        name: "some name",
        password: "some password"
      })
      |> Speedy.Register.create_user()

    user
  end
end
