defmodule Notifications.Repo do
  use Ecto.Repo, otp_app: :notifications, adapter: Ecto.Adapters.Postgres

  def listen(channel) do
    with {:ok, ref} <- Postgrex.Notifications.listen(Notifications.Listener, channel) do
      {:ok, ref}
    end
  end
end
