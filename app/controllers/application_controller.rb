class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        #devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name,:title, :department, :profile)
        #devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:title, :department, :profile])
    end

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || operations_landing_path
    end

end
