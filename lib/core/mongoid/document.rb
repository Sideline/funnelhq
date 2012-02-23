module Core
  module Mongoid
    # Extentions for Mongoid
    module Document
      extend ActiveSupport::Concern
      included do
        include ::Mongoid::Document
        include ::Mongoid::Timestamps
      end
    end
  end
end