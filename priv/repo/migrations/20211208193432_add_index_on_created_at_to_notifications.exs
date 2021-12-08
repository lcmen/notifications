defmodule Notifications.Repo.Migrations.AddIndexOnCreatedAtToNotifications do
  use Ecto.Migration

  @disable_migration_lock true
  @disable_ddl_transaction true

  def change do
    try do
      repo().query!("SELECT pg_advisory_lock(123)")
      create index("notifications", [:inserted_at], concurrently: true)
    after
      repo().query!("SELECT pg_advisory_unlock(123)")
    end
  end
end
