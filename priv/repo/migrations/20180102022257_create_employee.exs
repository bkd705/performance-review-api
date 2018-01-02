defmodule Reviewster.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :email, :string

      timestamps()
    end
  end
end
