defmodule Notifications.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Supervisor.start_link(
      [
        Notifications.Repo,
        {Postgrex.Notifications, [{:name, Notifications.Listener}] ++ Notifications.Repo.config()}
      ],
      strategy: :one_for_one,
      name: Notifications.Supervisor
    )
  end
end
