module Layoutable
  extend ActiveSupport::Concern

  module Layout
    extend ActiveSupport::Concern
    
    included do
      layout :layout_login
    end

    private
      def layout_login
        if action_name.eql?("edit") || action_name.eql?("update")
          "dashboard_users"
        else
          "authentication"
        end
      end
  end

  included do
    include Layout    
  end
end
