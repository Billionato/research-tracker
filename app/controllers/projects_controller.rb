class ProjectsController < ApplicationController
    
    def index
        @projects = Project.order("created_at DESC")
    end
    
    def show
    end
    
    #View for the create method
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        @project.save
        
        redirect_to root_path
    end
    
    private
    
    def project_params
        params.require(:project).permit(:title, :description)
    end

end
