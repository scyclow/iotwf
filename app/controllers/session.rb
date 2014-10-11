enable :sessions

get '/user/new' do
	redirect '/user' if logged_in?
	erb :"user/new"
end

get '/user/login' do 
	redirect '/user' if logged_in?
	erb :"user/login"
end

post '/login' do
	@user = User.find_by(username: params[:username])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/user'
	else
		@error = "Invalid username or password"
	erb :"user/login"
	end
	
end

get '/user' do 
	# if session[:user_id]
		# @user = User.find(session[:user_id])
	if current_user
		erb :"user/user"
	else
		erb :index# '/'
	end
end

post '/user' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect '/user'
	else
		@errors = @user.errors.full_messages
		@user = nil
		erb  :"/user/new"
	end
end

delete '/user' do
	session[:user_id] = nil
	redirect '/'
end
