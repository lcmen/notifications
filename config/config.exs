import Config

config :notifications, ecto_repos: [Notifications.Repo]
config :notifications, Notifications.Repo, migration_timestamps: [type: :timestamptz]

import_config "#{Mix.env()}.exs"
