class Upload
  
  include Core::Mongoid::Document
  include Mongoid::Paperclip
  
  CATEGORY = %w(document design contract file).map {|type| type.camelize}.sort
  
  has_mongoid_attached_file :file,
    :storage => :s3,
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :bucket => ENV['S3_BUCKET'],
      :path => ":attachment/:id/:filename"
    
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
  
  # Returns true if a file upload is an image
  #
  # @param 
  # @return [Boolean]

  def image?
    self.file_content_type == 'image/png' || self.file_content_type == 'image/jpeg'
  end
    
  ## methods ##
  
  # Returns the Amazon S3 URL for an upload
  #
  # @param 
  # @return [String] the url to the file upload on Amazon S3
  
  def s3_url
    "https://s3.amazonaws.com/#{ENV['S3_BUCKET']}"
  end
  
  # Returns true if an upload is to be shared 
  #
  # @param 
  # @return [Boolean]

  def is_public?
    self.is_public
  end
  
  # Returns the full path to a download so that it can be shared
  #
  # @param 
  # @return [String]

  def path
    self.file.to_s
  end
end