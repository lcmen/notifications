defmodule Notifications.Migration do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Migration

      @disable_migration_lock true
      @disable_ddl_transaction true

      def lock_for_migrate(migration) do
        try do
          execute("SELECT pg_try_advisory_lock(#{advisory_name()})")
          migration.()
        after
          execute("SELECT pg_advisory_unlock(#{advisory_name()})")
        end
      end

      defp advisory_name() do
        :erlang.phash2("ecto_#{repo()}")
      end
    end
  end
end
