class ListsController < ApplicationController
    before_action :set_list, only: [:edit, :update, :destroy]
    before_action :security_check, only: [:edit, :update, :destroy]

    def index
        @user = current_user
        @lists = @user.lists.all
    end

    def show
        @user = current_user
        @list = @user.lists.find(params[:id])
    end

    def new
        @user = current_user
        @list = @user.lists.build
    end

    def create
        @user = current_user
        @list = @user.lists.build(list_params)
        @list.user_id = current_user.id

        if @list.save
            redirect_to user_list_path(@user,@list)
        else
            render 'new'
        end
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @list.update(list_params)

        if @list.save
            redirect_to user_list_path(@user,@list)
        else
            render 'edit'
        end
    end

    def destroy
        @user = current_user
        @list.destroy
        redirect_to user_lists_path
    end

    private

    def list_params
        params.require(:list).permit(:name, :description, :user_id, movie_ids: [], movies_attributes: [:title, :synopsis, :mpaa_rating])
    end

    def set_list
        @list = List.find(params[:id])
    end

    def security_check
        if user_signed_in?
            if current_user.id != @list.user_id
                redirect_to root_path
            end
        end
    end
end
