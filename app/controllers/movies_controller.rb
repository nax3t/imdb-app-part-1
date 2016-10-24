class MoviesController < ApplicationController
  # before_action :find_movie, only: [:show, :destroy]
  
  def index
  end
  
  def search
  	base_url = 'http://www.omdbapi.com/?s='
  	search_term = params[:q]
  	end_point = base_url + search_term

  	response = RestClient.get(end_point)
  	data = JSON.parse(response.body)

  	@movies = data["Search"]
  	if @movies
  		render :search
  	else
  		flash[:alert] = "Sorry, your search came back empty, please try again."
			redirect_to root_path
		end
  end
  
  def details  
  	imdb_id = params[:imdb_id]
  	base_url = "http://www.omdbapi.com/?i="
  	end_point = base_url + imdb_id + '&plot=full'

  	response = RestClient.get(end_point)

  	@movie_info = JSON.parse(response.body)
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
    # def find_movie
    #     @movie = Movie.find(params[:id])
    # end

    def movie_params
        params.require(:movie).permit(:title, :year, :plot, :imdb_id)
    end
end