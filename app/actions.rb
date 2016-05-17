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

