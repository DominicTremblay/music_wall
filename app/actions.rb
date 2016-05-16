# Homepage (Root path)
get '/' do
  erb :index
end


get '/songs' do
  @songs = Song.all
  erb :songs
end

get '/albums' do
  @albums = Album.all
  erb :albums
end

get '/new' do
  erb :new
end


post '/songs' do
  @song = Song.new(
    name:   params[:name],
    artist: params[:artist],
    likes:  params[:likes]
  )
  if @songs.save
    redirect '/songs'
  else
    erb :'/new'
  end
end

