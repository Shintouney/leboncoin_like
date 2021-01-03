module Features
	module SessionHelper

		def sign_in(email, password)
			visit new_user_session_path
			fill_in "user_email", with: email
			fill_in "user_password", with: password
			click_on "connexion_log"
		end

	end
end
