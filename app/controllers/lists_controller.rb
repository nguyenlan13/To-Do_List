class ListsController < ApplicationController

    before_action :get_list, only: [:edit, :update, :show, :destroy]

    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            flash[:danger] = "List was not saved, please try again"
            render :new
        end
    end

    def edit

    end

    def update
        if @list.update(list_params)
            redirect_to list_path(@list)
        else
            flash[:danger] = "List was not updated, please try again"
            render :edit
        end
    end

    def show
        
    end

    def destroy
        # if @list.delete


    end

    private

    def get_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:title, :category)
    end
end
