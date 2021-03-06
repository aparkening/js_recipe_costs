class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  # # Create session
  # def create
  #   # user = User.find_by(name: params[:name])
  #   # if user && user.authenticate(params[:password])
  #   #   session[:user_id] = user.id
  #   #   # redirect_to user_path(@user)
  #   #   render json: {userID: user.id}, set_cookie: 'test', status: 200
  #   # else
  #   #   render json: { message: 'User error' }, status: 401
  #   # end
  # end

  # # Log user out
  # def destroy
  #   session.clear
  #   render json: {message: 'Logged Out'}, status: 200
  # end

  # Google Oauth Login
  def googleAuth
    # Get access tokens from the google server; find or create user
    user = User.find_or_create_by_omniauth(auth)

    # Access_token is used to authenticate request made from the rails application to the google server
    # user.google_token = auth.credentials.token
    
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    # refresh_token = auth.credentials.refresh_token
    # user.google_refresh_token = refresh_token if refresh_token.present?

    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Credentials don't work. Please try again."
      redirect_to login_path
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end



  # def csrf_token
  #   if request.headers["X-HANDSHAKE-TOKEN"] == ENV['X-HANDSHAKE-TOKEN']
  #       token = form_authenticity_token
  #       session[:csrf] = token
  #       render json: JSON.generate({csrfToken: token, logged_in: logged_in?})
  #   else
  #       render json: JSON.generate({errors: "handshake failed"})
  #   end
  # end


  def auth
    request.env['omniauth.auth']
  end

end