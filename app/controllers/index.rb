get '/' do
  erb :index
end

get '/create_user' do
  erb :create
end

get '/team' do
  erb :team
end

get '/logout' do
  session[:id] = nil
  erb :index
end

post '/create_user' do
  @user = Users.create(params[:create_user])
  session[:id] = @user[:id]
  redirect to ('/')
end

get "/login" do
  p @email = params[:user][:email]
  @user = Users.find_by_email(@email)
  if @user.try(:authenticate, params[:user][:password])
    session[:id] = @user[:id]
    erb :team
  else
    erb :fail_auth
  end
end
