class RegistrationsController < Devise::RegistrationsController
	layout "home"
	def new
		raise
		super
	end

	def create
		super
	end

	def update
		super
	end
end
