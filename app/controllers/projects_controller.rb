class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    #@back_button_switch = false

  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    create_array_of_hashes_users() 

    @submit_button_text = "Create project"

  end

  # GET /projects/1/edit
  def edit
    create_array_of_hashes_users()
    @submit_button_text = "Update project"
  end

  # POST /projects or /projects.json
  def create
    create_array_of_hashes_users()
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update    
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :time_frame_for_completion, :creation_date, :user_id, :creator_user_id)
    end

    # Populate drop down for new and edit methods
=begin
    def create_array_of_hashes_users 

      user_all = User.all 
      @user_array = []
      
      user_all.each do | record |
        user_hash = Hash.new
        user_hash["id"] = record.id
        user_hash["fullName"] = "#{record.first_name} #{record.last_name}"
        @user_array.push(user_hash)
      end

    end
=end

end
