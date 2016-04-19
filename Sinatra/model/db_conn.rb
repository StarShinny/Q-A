require 'active_record'
require 'logger'
require_relative '../config_loader'

db_config = Config_loader::CONFIG['db_config']
puts "Connecting to #{db_config['adapter']}..."
ActiveRecord::Base.establish_connection(db_config)
puts "Connection Established."
if db_config['log'] == 1
    ActiveRecord::Base.logger = Logger.new(File.open('db.log', 'a'))
    puts "Making logged configuration.."
end