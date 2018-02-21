class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
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

    def list_params
        params.require(list).permit(:name, :description)
    end

    def set_list
        @list = List.find(params[:id])
    end
end
