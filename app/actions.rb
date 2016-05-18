# Homepage (Root path)
get '/' do
  erb :index
end


get '/songs' do
  @songs = Song.all
  erb :songs
end

get '/new' do
  @song = Song.new
  erb :new
end

get '/newuser' do
  erb :newuser
end

get '/login' do
  erb :login
end

post '/songs' do
  @song = Song.new(
    name:   params[:name],
    artist: params[:artist],
    likes:  params[:likes]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'/new'
  end
end

helpers do
  def current_user
    User.find(session[:id]) if session[:id]
  end
end

post "/login" do
  @user = User.find_by_email(params[:email])
  if @user && @user.try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect "/songs"
  else
    @error = "Wrong email/password"
    erb :newuser
  end
end

post "/register" do
  @user = User.find_by_email(params[:email])
  if @user
    @error = "Email already exists"
    erb :newuser
  else
    @user = User.create(email: params[:email], password: params[:password])
    redirect "/songs"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

