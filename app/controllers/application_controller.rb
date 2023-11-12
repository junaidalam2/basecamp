class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        #devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:title, :department, :profile, :deactivated])
    end

    def after_sign_in_path_for(resource)

        if !@user.deactivated
            session[:current_user_id] = @user.id
            stored_location_for(resource) || operations_landing_path
        else
            flash[:notice] = "User has previously deactivated. Please contact your system administrator." 
            after_sign_out_path_for(resource)
        end
    end

    def after_sign_out_path_for(resource)
       session.clear
       root_path
    end

    private
    def create_array_of_hashes_users

        user_all = User.all
        @user_array = []
        
        user_all.each do | record |
            user_hash = Hash.new
            user_hash["id"] = record.id
            user_hash["full_name"] = "#{record.first_name} #{record.last_name}"
            @user_array.push(user_hash)
        end
  
    end

    def create_array_of_hashes_projects

        project_all = Project.all 
        @project_array = []
        
        project_all.each do | record |
            project_hash = Hash.new
            project_hash["id"] = record.id
            project_hash["name"] = record.name
            @project_array.push(project_hash)
        end

    end

end
