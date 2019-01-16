defmodule Graphql.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :phone_number, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:phones, [:user_id])
  end
end
