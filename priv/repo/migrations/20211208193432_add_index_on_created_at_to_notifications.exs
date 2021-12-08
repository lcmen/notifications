defmodule Notifications.Repo.Migrations.AddIndexOnCreatedAtToNotifications do
  use Notifications.Migration

  def up do
    lock_for_migrate(fn ->
      create index("notifications", [:inserted_at], concurrently: true)
    end)
  end

  def down do
    lock_for_migrate(fn ->
      drop index("notifications", [:inserted_at], concurrently: true)
    end)
  end
end
