class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show

    @user_deactivate_text = "Deactivate User"

    if @user.deactivated && session[:is_admin]
      @user_deactivate_text = "Activate User"
    end

  end

  # GET /users/new
  def new
    @user = User.new
    @submit_user_button_text = "Create user"
  end

  # GET /users/1/edit
  def edit
    @submit_user_button_text = "Update user"
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    # @user.destroy

    if !@user.deactivated
      @user.deactivated = true
      @user.save

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully deactivated." }
        format.json { head :no_content }
      end
      after_sign_out_path_for(@user)
    end
    
    if @user.deactivated
      @user.deactivated = false
      @user.save

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully reactivated." }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :title, :department, :profile)
    end
end
