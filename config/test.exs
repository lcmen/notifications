import Config

config :notifications, Notifications.Repo,
  database: "notifications_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  posrt: "5432"

if File.exists?("test.local.exs") do
  import_config "test.local.exs"
end
