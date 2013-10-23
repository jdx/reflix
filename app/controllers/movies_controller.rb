class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to "/movies/#{@movie.id}"
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def search
    @term = params[:movie][:term]
    @movies = Movie.where('title LIKE ?', "%#{@term}%")
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :year_released)
  end
end