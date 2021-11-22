defmodule Notifications.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notifications" do
    field(:text, :string)
    timestamps(type: :utc_datetime)
  end

  def notify(text) do
    %__MODULE__{}
    |> changeset(%{"text" => text})
    |> Notifications.Repo.insert()
  end

  def changeset(%__MODULE__{} = struct, params) do
    struct
    |> cast(params, [:text])
    |> validate_required([:text])
    |> validate_length(:text, min: 3)
  end
end
