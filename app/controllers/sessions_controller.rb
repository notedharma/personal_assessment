class SessionsController < ApplicationController
  # ensures that we aren't requiring the user to be logged in for the new and create methods
  skip_before_action :require_valid_user!

  def new
  end

  def create
    reset_session
    # find user by email
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = root_url
      @notice = "User created. Please confirm or edit details"
    end
    @user = User.find_by(email: user.email)

      if @user
        session[:user_id] = @user.id
        flash[:success] = 'Welcome back!'
        redirect_to root_path
      else
        flash[:error] = 'Invalid email or password'
        redirect_to login_path
      end
  end


private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
