# This patches issues with Backbone js referencing the id field rather than Mongoid's _id field

module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      attrs["id"] = self.persisted? ? self._id : nil
      attrs
    end
  end
end