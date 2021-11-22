import Config

config :notifications, Notifications.Repo,
  database: "notifications_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  posrt: "5432"

if File.exists?("dev.local.exs") do
  import_config "dev.local.exs"
end
