get '/' do
  erb :index
end

get '/create_user' do
  erb :create
end

get '/team' do
  if current_user
    erb :team 
  else
    @error = "Error: Please Log in to View Your Homepage"
    erb :index
  end
end

get '/logout' do
  session.clear
  erb :index
end

get "/login" do
  @email = params[:user][:email]
  @user = User.find_by_email(@email)
  if @user.try(:authenticate, params[:user][:password])
    session[:id] = @user[:id]
    erb :team
  else
     @error = "Error: Incorrect Email or Password"
    erb :index
  end
end

get '/create_player' do
  erb :create_player
end

post '/create_player' do
  player = Player.create(params[:create_player])
  player.update_attributes(user_id: session[:id])
  redirect to('/team')
end


post '/create_user' do
  @user = User.create(params[:create_user])
  session[:id] = @user[:id]
  redirect to ('/')
end


