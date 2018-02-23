class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]
    before_action :security_check, only: [:edit, :update, :destroy]
    before_action :set_user

    def index
        @lists = List.all
    end

    def show
    end

    def new
        @list = current_user.lists.build
    end

    def create
        @list = current_user.lists.build(list_params)
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
            redirect_to user_list_path(@list)
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
        params.require(:list).permit(:name, :description)
    end

    def set_list
        @list = List.find(params[:id])
    end

    def set_user
        @user = current_user.id
    end

    def security_check
        if user_signed_in?
            if current_user.id != @list.user_id
                redirect_to root_path
            end
        end
    end
end
