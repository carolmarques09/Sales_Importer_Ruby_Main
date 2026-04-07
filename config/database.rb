require "active_record"
require "yaml"

env = ENV["RACK_ENV"] || "development"

# Load DB config
config_file = File.join(__dir__, "database.yml")
config = YAML.safe_load(File.read(config_file), aliases: true)

# Connect to DB
ActiveRecord::Base.establish_connection(config[env])