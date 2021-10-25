class ListsController < ApplicationController

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
        @list = List.find(params[:id])
    end

    def update
        @list = List.find(params[:id])
        if @list.update(list_params)
            redirect_to list_path(@list)
        else
            flash[:danger] = "List was not updated, please try again"
            render :edit
        end
    end

    def show
        @list = List.find(params[:id])
    end

    def destroy
        # if @item.delete


    end

    private

    def list_params
        params.require(:list).permit(:title, :category)
    end
end
