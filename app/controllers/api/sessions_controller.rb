module Api
	class SessionsController < ApplicationController
		def create
			user_password = params[:password]
	    user_email = params[:email]
	    @user = user_email.present? && User.find_by(email: user_email)

	    if @user.valid_password? user_password
	      sign_in @user, store: false
	      @key = ApiKey.create(user_id: @user.id, access_token: SecureRandom.hex)
	      @user.save
	      render "api/user.json.rabl"
	    else
	      render json: { errors: "Invalid email or password" }, status: 422
	    end
		end

		def destroy
		end
	end
end