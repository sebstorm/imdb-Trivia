

require_relative('lib/filter.rb')
require ('sinatra')
require ('imdb')
require ('sinatra/reloader') if development?


get "/poster" do 
	erb(:poster)
end

post "/poster" do

	@word = params[:word]

	search = Imdb::Search.new(@word)
	movie = search.movies[0..14]

	fil = Filter.new
	fil.forage(movie)
	@pic = fil.cut

	erb(:display)
end