# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @all_ratings=Movie.all_ratings
  end
  def show
  	id=params[:id]
  	debugger
  	@movie=Movie.find(id)
  end
  def new
  end
  def create
  	@movie=Movie.create!(params[:movie])
  	flash[:notice]="#{@movie.title} was successfully created."
	redirect_to movies_path
  end
  def edit
  	@movie=Movie.find params[:id]
  end
  def update
  	@movie=Movie.find params[:id]
  	@movie.update_attributes!(params[:movie])
  	flash[:notice] = "#{@movie.title} was successfully updated"
  	respond_to do |client_wants|
  		client_wants.html {redirect_to movie_path(@movie)}
  		client_wants.xml {render :xml => movie.to_xml}
  	end
  end
  def destroy
  	@movie=Movie.find(params[:id])
  	@movie.destroy
  	flash[:notice] = "Movie '#{@movie.title}'deleted."
  	redirect_to movies_path
  end
  def search_tmdb
    # hardwire to simulate failure
    @movies = Movie.find_in_tmdb(params[:search_terms])
  end
end