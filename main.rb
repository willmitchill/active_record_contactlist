require 'active_record'
require 'pg'
require 'colorize'
require_relative 'contact'
require_relative 'application'
require 'pry'


# Establish a connection to the database
#(requires internet since it's on heroku!)
# Note: You'll want to put in your own heroku creds


puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd8fulbl6ut0782',
  username: 'gybauticarmnoe',
  password: '8O1odP8DBvUPokNsm30wxHPxf-',
  host: 'ec2-54-197-241-64.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)


puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."


puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

if !ActiveRecord::Base.connection.table_exists? 'contacts'
  ActiveRecord::Schema.define do
    drop_table :contacts
      create_table :contacts do |c|
      c.column :first_name, :string
      c.column :last_name, :string
      c.column :email, :string
      c.timestamps
    end
  end
end

puts "Setup DONE"


Application.new.run
