defmodule Speedy.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password, :string
      add :age, :integer
      add :description, :string

      timestamps()
    end
  end
end
