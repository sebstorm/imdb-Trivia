require ('sinatra')
require ('sinatra/reloader') if development?
require ('imdb')



get "/poster" do 
	erb(:poster)
end

post "/poster" do

	@word = params[:word]

	search = Imdb::Search.new(@word)
	movie = search.movies[0..8]

	@posters = movie.map do |movie|
		movie.poster
	end


	erb(:display)
end