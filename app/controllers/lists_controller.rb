class ListsController < ApplicationController
    before_action :set_list, only: [:edit, :update, :destroy]
    before_action :security_check, only: [:edit, :update, :destroy]
    before_action :set_user, only: [:index, :show]
    before_action :set_current_user, only: [:new, :create, :edit, :update, :destroy]

    def index
        @lists = List.all
    end

    def show
        @list = @user.lists.find(params[:id])
    end

    def new
        @list = @user.lists.build
    end

    def create
        @list = @user.lists.build(list_params)
        @list.user_id = current_user.id

        if @list.save
            redirect_to user_list_path(@user,@list)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @list.update(list_params)

        if @list.save
            redirect_to user_list_path(@user,@list)
        else
            render 'edit'
        end
    end

    def destroy
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

    def set_current_user
        @user = current_user
    end

    def set_user
        @user = User.find(params[:user_id])
    end

    def security_check
        if user_signed_in?
            if current_user.id != @list.user_id
                redirect_to root_path
            end
        end
    end
end
