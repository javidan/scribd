require "yaml"

namespace :db do
  desc "Run migrations"

  task :create, [:version] do
  
  end

  task :migrate, [:version] do |t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]

    config = YAML.load_file("./config/#{ENV['RACK_ENV'] || "development"}.yaml")

   

    Sequel.connect(config["db"]["connection_string"]) do |db|
      Sequel::Migrator.run(db, "./migrations", target: version)
    end
  end
end