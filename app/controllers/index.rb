get '/' do
  # @user = User.find_by(id: session[:user_id])
  current_user
  erb :index
end
