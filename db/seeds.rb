puts 'Cleaning Database'
User.destroy_all
puts 'Database cleaned'

puts 'Creating Andrey user'
andrey = User.create!(email: ENV['GMAIL_USERNAME'], password: ENV['GMAIL_PASSWORD'], admin: true)
puts 'Finished Seeds'
