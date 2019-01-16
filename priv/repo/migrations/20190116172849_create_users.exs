defmodule Graphql.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :job_title, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
