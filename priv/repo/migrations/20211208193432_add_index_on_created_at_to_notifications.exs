defmodule Notifications.Repo.Migrations.AddIndexOnCreatedAtToNotifications do
  use Ecto.Migration

  @disable_ddl_transaction true

  def change do
    alter table(:notifications) do
      add :custom_id, :uuid
    end
    create index("notifications", [:inserted_at], concurrently: true)
  end
end
