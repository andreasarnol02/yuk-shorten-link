module Authenticable
  extend ActiveSupport::Concern

  module Authentication
    extend ActiveSupport::Concern
    
    included do
      before_action :authenticate_js
    end

    private
      def authenticate_js
        render 'errors/login' if current_user.nil? && request.xhr?          
      end
  end

  included do
    include Authentication
  end
end
