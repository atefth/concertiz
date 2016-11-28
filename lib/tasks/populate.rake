namespace :populate do
  desc "Create Admin"
  task admin: :environment do
  	puts "Email Address: "
  	email = $stdin.gets.chomp

  	puts "First Name: "
  	first_name = $stdin.gets.chomp

  	puts "Last Name: "
  	last_name = $stdin.gets.chomp

    puts "Password"
    password = $stdin.gets.chomp

  	admin = User.new

  	admin.email = email
  	admin.f_name = first_name
  	admin.l_name = last_name
    admin.password = password

    admin.skip_confirmation!
  	admin.add_role "admin"
    admin.save
  end
end
