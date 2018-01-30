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
        
        # Added respond_to block to make sure update works with both HTML edit form and Best-In_Place (bip) json
        respond_to do |format|
            if @project.update(project_params)
                format.html { redirect_to(@project, notice: "Successfully updated project #{@project.name}") }
                format.json { respond_with_bip(@project) }
            else
                format.html { render 'edit' }
                format.json { respond_with_bip(@project) }
            end
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