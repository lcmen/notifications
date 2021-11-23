defmodule Notifications.Repo.Migrations.CreateNotificationsTrigger do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE FUNCTION notify_notification_added() RETURNS TRIGGER AS $$
    DECLARE
    BEGIN
      PERFORM pg_notify('notification_added', CAST(NEW.id AS text));
      RETURN NEW;
    END
    $$ LANGUAGE plpgsql
    """

    execute """
    CREATE TRIGGER notification_added_trigger
    AFTER INSERT ON notifications
    FOR EACH ROW
    EXECUTE PROCEDURE notify_notification_added()
    """
  end

  def down do
    execute "DROP TRIGGER notification_added_trigger ON notifications"
    execute "DROP FUNCTION notify_notification_added"
  end
end
