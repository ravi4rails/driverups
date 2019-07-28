module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :verify_admin
    
    private
      
      def verify_admin
        redirect_to root_url, alert: "You are not authorized to access this page" unless current_user.try(:admin?)
      end

      def current_ability
        @current_ability ||= AdminAbility.new(current_user)
      end

  end
end