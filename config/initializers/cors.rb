Rails.application.configure do
	config.middleware.insert_before 0, Rack::Cors do
		allow do
			origins 'localhost:3000'
			resource '*', headers: :any, methods: [:get, :post]
			resource 'vicopo.selfbuild.fr', headers: :any, methods: :any
		end
	end
end
