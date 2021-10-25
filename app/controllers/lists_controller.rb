class ListsController < ApplicationController
    def index
        @item = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        # if params[:list_id]
            @item = Item.new(item_params)
            if @item.save
                redirect_to item_path(@item)
            else
                flash[:danger] = "Item was not saved, please try again"
                render :new
            end
        # end
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to item_path(@item)
        else
            flash[:danger] = "Item was not updated, please try again"
            render :edit
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def destroy
        # if @item.delete


    end

    def view_by_date

    end


    private

    def item_params
        params.require(:item).permit(:list_id, :name, :notes, :due_date, :completed)
    end
end
