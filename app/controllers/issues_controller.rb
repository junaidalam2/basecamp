class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1 or /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @issue.comments.build 
    create_array_of_hashes_users()
    create_array_of_hashes_projects()
  end

  # GET /issues/1/edit
  def edit
    create_array_of_hashes_users()
    create_array_of_hashes_projects()
  end

  # POST /issues or /issues.json
  def create
    create_array_of_hashes_users()
    create_array_of_hashes_projects()
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url, notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:project_id, :short_description, :detailed_description, :steps_to_reproduce, :status, :priority, :assigned_to, :resolution_date, :user_id, :contact_user_id, comments_attributes: [:comment, :issue_id, :user_id, :_destroy])
    end

end
