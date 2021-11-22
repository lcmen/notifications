defmodule Notifications.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :text, :string, null: false

      timestamps()
    end
  end
end
