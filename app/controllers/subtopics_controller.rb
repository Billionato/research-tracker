class SubtopicsController < ApplicationController
    
    before_action :set_topic_new, only: [:new, :create]
    before_action :set_topic_update, except: [:new, :create]
    before_action :set_subtopic, except: [:new, :create]
    
    def index
    end
    
    def show
    end
    
    # View for create
    def new
        @subtopic = @topic.subtopics.build
    end
    
    def create
        @subtopic = @topic.subtopics.build(subtopic_params)
        
        if @subtopic.save
            redirect_to @topic, notice: "Successfully created topic"
        else
            render 'new'
        end
    end
    
    # View for update
    def edit
    end
    
    def update
        if @subtopic.update_attributes(subtopic_params)
            redirect_to @topic, notice: "Successfully update subtopic"
        else
            render 'edit'
        end
    end
    
    def destroy
        @subtopic.destroy
        redirect_to @topic, notice: "Successfully deleted subtopic"
    end
    
    private
    
    def set_topic_new
        @topic = Topic.find(params[:topic_id])
    end
    
    def set_topic_update
        @subtopic = Subtopic.find(params[:id])
        @topic_id = @subtopic.topic_id
        @topic = Topic.find(@topic_id)
    end
    
    def set_subtopic
        @subtopic = Subtopic.find(params[:id])
    end
    
    def subtopic_params
        params.require(:subtopic).permit(:name, :description)
    end
end
