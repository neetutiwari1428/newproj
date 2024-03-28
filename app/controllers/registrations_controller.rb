class RegistrationsController < ApplicationController
	def index
		@users = User.all
		render json: @users, status: :ok
	end
	
	def sign_up
		@user = User.new(user_params)
		if @user.save
		render json: @user, status: :created
		else
		render json: { errors: @user.errors.full_messages },
						status: :unprocessable_entity
		end
	end

	def sign_in
		@user = User.find_by_email(params[:username])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
	end

	def sign_out
	end

	private

	def user_params
    params.permit(
  		 :username, :email, :password, :password_confirmation
    )
  end

	def login_params
    params.permit(:username, :password)
  end
end
