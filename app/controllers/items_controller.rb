class ItemsController < ApplicationController
    
    before_action :set_subtopic_new, only: [:new, :create]
    before_action :set_subtopic_update, except: [:new, :create]
    before_action :set_item, except: [:new, :create]
    
    def index
    end
    
    def show
    end
    
    # View for create
    def new
        @item = @subtopic.items.build
    end
    
    def create
        @item = @subtopic.items.build(item_params)
        
        if @item.save
            redirect_to @item, notice: "Successfully added item"
        else
            render 'new'
        end
    end
    
    # View for update
    def edit
    end
    
    def update
        if @item.update_attributes(item_params)
            redirect_to @item, notice: "Successfully updated item"
        else
            render 'edit'
        end
    end
    
    def destroy
        @item.destroy
        redirect_to @subtopic, notice: "Successfully deleted item"
    end
    
    private
    
    def set_subtopic_new
        @subtopic = Subtopic.find(params[:subtopic_id])
    end
    
    def set_subtopic_update
        @item = Item.find(params[:id])
        @subtopic_id = @item.subtopic_id
        @subtopic = Subtopic.find(@subtopic_id)
    end
    
    def set_item
        @item = Item.find(params[:id])
    end
    
    def item_params
        params.require(:item).permit(:name, :url, :description)
    end
    
end
