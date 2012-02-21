class Upload
  
  include Core::Mongoid::Document
  include Mongoid::Paperclip
  
  CATEGORY = %w(document design contract file).map {|type| type.camelize}.sort
  
  has_mongoid_attached_file :file
  
  ## Validation ##
  
  validates_presence_of :title
  validates_attachment_presence :file
  
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
  
  # Returns the full path to a download so that it can be shared
  def path
    self.file.to_s
  end

end
