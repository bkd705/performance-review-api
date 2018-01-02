defmodule Reviewster.Employee do
  use Reviewster.Web, :model

  @timestamps_opts [type: :utc_datetime, usec: true]
  @primary_key {:uuid, :binary_id, [autogenerate: true]}

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uuid, :first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
  end
end