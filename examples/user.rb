require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

#User

result = admin.user.get
puts "\nSelf\n"
puts JSON.pretty_generate(result)

result = admin.user.list
puts "\nList of Users\n"

users = result["Success"]

users.each do |user|
	puts "username: #{user['UserName']} roles: #{user['Roles']}"
end

first_user_id = users[0]["UserId"]

result = admin.user.get(first_user_id)
puts "\nSingle User\n"
puts JSON.pretty_generate(result)

username = "apicreated"
firstname = "Test Api"
lastname = "User"
email = "tuser@gmail.com"

result = admin.user.add(username,firstname,lastname,email)
puts "\nAdd User\n"
puts JSON.pretty_generate(result)

new_user_id = result["Success"]["UserId"]

result = admin.user.edit(new_user_id, {:UserName => Time.new.to_i, :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" })
puts "\nEdit User\n"
puts JSON.pretty_generate(result)