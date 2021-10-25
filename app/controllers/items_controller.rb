class ItemsController < ApplicationController

    before_action :get_item, only: [:show]
    before_action :get_list_item, only: [:edit, :update, :destroy]

    def index
        if params[:list_id]
            @items = List.find(params[:list_id]).items
        else
            @items = Item.all
        end
    end

    def new
        # @item = Item.new
        @list = List.find(params[:list_id])
        @item = @list.items.build
    end

    def create
        if params[:list_id]
            @list = List.find(params[:list_id])
            @item = @list.items.build(item_params)
            if @item.save
                redirect_to list_items_path(@list)
            else
                flash[:danger] = "Item was not saved, please try again"
                render :new
            end
        end
    end

    def edit
 
    end

    def update
        if @item.update(item_params)
            redirect_to list_items_path(@list)
        else
            flash[:danger] = "Item was not updated, please try again"
            render :edit
        end
    end

    def show
      
    end

    def destroy
        if @item.delete
            redirect_to list_items_path(@list)
        else
            flash[:danger] = "Item could not be deleted"
            # redirect_to(request.env['HTTP_REFERER'])
        end
    end

    def view_by_date
        if params[:date]
            @list = List.find(params[:list_id])
            @items = @list.items.for_date(params[:date])
        else
            flash[:danger] = "Sorry, something went wrong"
            redirect_to list_items_path(@list)
        end
    end


    private

    def get_item
        @item = Item.find(params[:id])
    end

    def get_list_item
        @list = List.find(params[:list_id])
        @item = @list.items.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:list_id, :name, :notes, :date, :completed)
    end
end
