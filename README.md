# Notifications

## Development

1. Verify content of `config/dev.exs` file, and in case of configuration differences override it via `config/dev.local.exs`
2. Run `mix deps.get`
3. Create a database `mix ecto.create`
4. Run migrations: `mix ecto.migrate`
