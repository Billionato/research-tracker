class ProjectsController < ApplicationController
    
    before_action :set_project, except: [:index, :new, :create]
    
    def index
        @projects = Project.order("created_at DESC")
    end
    
    def show
    end
    
    # View for the create method
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        
        if @project.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    # View for the update method
    def edit
    end
    
    def update
        if @project.update(project_params)
            redirect_to root_path, notice: "Successfully updated Project"
        else
            render 'edit'
        end
    end
    
    def destroy
        @project.destroy
        redirect_to root_path, notice: "Successfully deleted move"
    end
    
    
    private
    
    # Method to find a specific Project using its ID
    def set_project
        @project = Project.find(params[:id])
    end
    
    def project_params
        params.require(:project).permit(:name, :description)
    end

end