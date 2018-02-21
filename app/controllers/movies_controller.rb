class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index
        @movies = Movie.all
    end

    def show

    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def movie_params
        params.require(:movie).permit(:title, :synopsis, :mpaa_rating)
    end

    def set_movie
        @movie = Movie.find(params[:id])
    end
end
