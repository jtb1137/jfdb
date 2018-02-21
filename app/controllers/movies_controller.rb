class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index
        @movies = Movie.all
    end

    def show
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)

        if @movie.save
            redirect_to movie_path(@movie)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render 'new'
        end
    end

    def destroy
        @movie.destroy
        redirect_to root_path
    end

    private
    def movie_params
        params.require(:movie).permit(:title, :synopsis, :mpaa_rating)
    end

    def set_movie
        @movie = Movie.find(params[:id])
    end
end
