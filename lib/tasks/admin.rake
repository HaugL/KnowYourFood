task :default_admins do
	admins = []
	admins << a1 = {email: 'haug.lianne@gmail.com', password: 'test', password_confirmation: 'test'}
	admins.each do |a|
		entry = Admin.find_or_initialize_by_usernamename(a[:username])
		entry.update_attributes a
	end
end