class Upload
  
  include Core::Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :file
  
  ## Validation ##
  
  validates_presence_of :title
  
  ## associations ##
  
  embedded_in :user, :inverse_of => :uploads
  
  ## fields ##
  
  field :title, :type => String
  field :category, :type => String
  field :is_public, :type => Boolean, :default => :false
  
  ## methods ##

  def image?
    self.file_content_type == 'image/png' || self.file_content_type == 'images/jpg'
  end

  def is_public?
    self.is_public
  end
  
end
