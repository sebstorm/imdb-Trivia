
require('imdb')


class Filter



	def forage(movie)
		@poster_movies =[]
		movie.each do |movie|
			if movie.poster != nil
				@poster_movies.push(movie)
			end
		end
	end

	def cut
		@nine = @poster_movies[0..8]
		@posters = @nine.map do |movie|
			movie.poster
		end
	end
end


