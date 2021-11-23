defmodule Notifications.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notifications" do
    field(:text, :string)
    timestamps(type: :utc_datetime)
  end

  def listen do
    with {:ok, ref} <- Notifications.Repo.listen("notification_added") do
      IO.puts("Listening with ref=#{inspect(ref)}")

      listen_for_notification()
    else
      error -> {:error, error}
    end
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

  defp listen_for_notification do
    receive do
      {:notification, pid, ref, "notification_added", payload} ->
        IO.puts("""
          Received notification_added from pid=#{inspect(pid)} with ref=#{inspect(ref)} payload=#{inspect(payload)}.
        """)

        listen_for_notification()
    end
  end
end
