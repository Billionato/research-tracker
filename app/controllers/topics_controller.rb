class TopicsController < ApplicationController
    
    before_action :set_topic, except: [:index, :new, :create]
    
    def index
        @topics = Topic.order("created_at DESC")
    end
    
    def show
    end
    
    #View for create
    def new
        @topic = Topic.new
    end
    
    def create
        @topic = Topic.new(topic_params)
        
        if @topic.save
            redirect_to topics_path
        else
            render 'new'
        end
    end
    
    #View for update
    def edit
    end
    
    def update
        if @topic.update(topic_params)
            redirect_to @topic, notice: "Successfully updated topic"
        else
            render 'edit'
        end
    end
    
    def destroy
        @topic.destroy
        redirect_to topics_path, notice: "Successfully deleted topic"
    end
    
    private
    
    def topic_params
        params.require(:topic).permit(:name, :description)
    end
    
    #Method to find a specific Topic using its ID
    def set_topic
        @topic = Topic.find(params[:id])
    end
    
end
