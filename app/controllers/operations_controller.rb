class OperationsController < ApplicationController

    before_action :authenticate_user!

    
    def landing
        @projects = Project.all

    end

end